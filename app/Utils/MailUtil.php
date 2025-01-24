<?php

namespace App\Utils;

use App\Models\Boleto;
use App\Models\Cliente;
use App\Models\ContaReceber;
use App\Models\Empresa;
use App\Models\Nfe;
use App\Models\User;
use NFePHP\DA\NFe\Danfe;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

class MailUtil
{
    protected $mail;

    public function __construct()
    {
        $this->mail = new PHPMailer(true);
    }

    protected function configureMail($usuario)
    {
        try {
            // Configurações do servidor de email
            $this->mail->isSMTP();
            $this->mail->Host = $usuario->host_email;
            $this->mail->SMTPAuth = true;
            $this->mail->Username = $usuario->envio_email;
            $this->mail->Password = $usuario->senha_email;
            $this->mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
            $this->mail->Port = 465;

            // Configurações do remetente
            $this->mail->setFrom($usuario->envio_email, $usuario->nome_email);

            // Debugging
            //$this->mail->SMTPDebug = SMTP::DEBUG_SERVER;
        } catch (Exception $e) {
            return $e->getMessage();
        }
    }

    public function enviarEmailTeste($idUsuario)
    {
        $usuario = User::findOrFail($idUsuario);
        $this->configureMail($usuario);

        try {
            // Destinatários
            $this->mail->addAddress('totalsigcomercial@gmail.com', 'Desenvolvimento Meu SIG');

            // Conteúdo do email
            $this->mail->isHTML(true);
            $this->mail->Subject = 'Envio de teste';
            $this->mail->Body = 'Este é um email de teste';

            return $this->mail->send();
        } catch (Exception $e) {
            return $this->mail->ErrorInfo;
        }
    }

    public function enviarEmailNFe($idUsuario, $idNota)
    {
        $erro = 0;
        $usuario = User::findOrFail($idUsuario);
        $nota = Nfe::findOrFail($idNota);
        $empresa = Empresa::findOrFail($nota->empresa_id);

        if (empty($usuario->host_email)) {
            $erro = 1;
            $this->handleError('Não foi configurado email no usuário. Verifique o cadastro do usuário');
            return false;
        }

        $this->configureMail($usuario);
        $cliente = Cliente::findOrFail($nota->cliente_id);

        if (!$cliente->email) {
            $erro = 1;
            $this->handleError('Cliente sem email configurado. Verifique o cadastro do cliente');
            return false;
        }

        $this->gerarDanfe($idNota);
        $pdfPath = public_path('danfe/' . $nota->chave . '.pdf');
        $xmlPath = public_path('xml_nfe/' . $nota->chave . '.xml');

        $subject = 'Envio de NFe referente a nota: ' . $nota->numero . '/ ' . $nota->numero_serie;
        $body = 'Segue em anexo o PDF e o XML da NFe: ' . $nota->numero . ' / ' . $nota->numero_serie . '.';
        $body .= '<br>Emitida em ' . __data_pt($nota->data_emissao_saida, false);
        $body .= '<br>Empresa: ' . $empresa->nome;
        $body .= '<br>CNPJ: ' . $empresa->cpf_cnpj;
        $body .= '<br><br><br>Atenciosamente ' . $usuario->name;
        $body .= '<br>E-mail enviado automaticamente pelo sistema Meu SIG - visite o nosso site: www.meusig.com.br';

        if ($erro == 1) {
            return false;
        } else {
            $this->sendEmail($cliente->email, $subject, $body, $pdfPath, $xmlPath);
            return true;
        }
    }

    public function enviarEmailBoletos($idUsuario, $idBoleto)
    {

        $erro = 0;
        $usuario = User::findOrFail($idUsuario);
        $contaReceber = ContaReceber::findOrFail($idBoleto);
        $boleto = Boleto::where('conta_receber_id', $contaReceber->id)->first();
        if ($contaReceber->nfe_id){
            $nota = Nfe::findOrFail($contaReceber->nfe_id);
        }
        $empresa = Empresa::findOrFail($contaReceber->empresa_id);

        if (empty($usuario->host_email)) {
            $erro = 1;
            $this->handleError('Não foi configurado email no usuário. Verifique o cadastro do usuário');
            return false;
        }

        $this->configureMail($usuario);
        $cliente = Cliente::findOrFail($contaReceber->cliente_id);

        if (!$cliente->email) {
            $erro = 1;
            $this->handleError('Cliente sem email configurado. Verifique o cadastro do cliente');
            return false;
        }

        $pdfBoleto = public_path('boletos_pdf/' . $boleto->nome_arquivo);


        $subject = 'Envio de boleto referente a parcela: ' . $contaReceber->numero_documento;
        $body = 'Segue em anexo o PDF do boleto referente a parcela: ' . $contaReceber->numero_documento;
        if ($contaReceber->nfe_id){
            $body .= '<br>Referente a nota: ' . $nota->numero . '/ ' . $nota->numero_serie . '.';
        }
        $body .= '<br>Emitida em ' . __data_pt($contaReceber->create_at, false);
        $body .= '<br>Empresa: ' . $empresa->nome;
        $body .= '<br>CNPJ: ' . $empresa->cpf_cnpj;
        $body .= '<br><br><br>Atenciosamente ' . $usuario->name;
        $body .= '<br>E-mail enviado automaticamente pelo sistema Meu SIG - visite o nosso site: www.meusig.com.br';

        if ($erro == 1) {
            return false;
        } else {
            $this->sendEmail($cliente->email, $subject, $body, $pdfBoleto, null);
            return true;
        }
    }

    private function handleError($message)
    {
        session()->flash('flash_error', $message);
        return redirect()->back();
    }

    private function sendEmail($to, $subject, $body, $pdfPath = null, $xmlPath = null)
    {
        try {
            $this->mail->isHTML(true);
            $this->mail->addAddress($to);
            $this->mail->Subject = $subject;
            $this->mail->Body = $body;

            if ($pdfPath){
                $this->mail->addAttachment($pdfPath, basename($pdfPath));
            }
            if ($xmlPath){
                $this->mail->addAttachment($xmlPath, basename($xmlPath));
            }
            $this->mail->send();

            return true;
        } catch (Exception $e) {
            return false;
        }
    }

    private function gerarDanfe($idNota)
    {
        $nota = Nfe::findOrFail($idNota);
        $empresa = Empresa::findOrFail($nota->empresa_id);

        $xmlPath = public_path('xml_nfe/') . $nota->chave . '.xml';
        if (!file_exists($xmlPath)) {
            return $this->handleError("Arquivo não encontrado");
        }

        $xml = file_get_contents($xmlPath);
        $danfe = new Danfe($xml);

        if ($empresa->logo) {
            $logoPath = public_path('/uploads/logos/') . $empresa->logo;
            $logo = 'data://text/plain;base64,' . base64_encode(file_get_contents($logoPath));
            $danfe->logoParameters($logo, 'L');
        }

        $pdf = $danfe->render();
        file_put_contents(public_path('danfe/' . $nota->chave . '.pdf'), $pdf);
    }



    // Métodos semelhantes para enviarEmailNFCe e enviarEmailBoletos...
}

