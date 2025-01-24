<?php

namespace App\Utils;

use App\Models\Empresa;
use Mike42\Escpos\Printer;

class NFCePrinterUtil
{

    public function imprimirNFCe($printer, $item, $fatura): void
    {
        //Cabeçalho - Informações do Emitente
        $printer->selectPrintMode(Printer::MODE_FONT_B);
        $printer->setJustification(Printer::JUSTIFY_CENTER);
        $printer->text($item->empresa->nome . "\n");
        $printer->text("CNPJ: " . $item->empresa->cpf_cnpj . " IE: " . $item->empresa->ie . "\n");
        $printer->text("Rua: " . $item->empresa->rua . ", " . $item->empresa->numero . "\n");
        $printer->text("" . $item->empresa->bairro . " -  " . $item->empresa->cidade->nome . " / " . $item->empresa->cidade->uf . "\n");

        //Linha Divisória
        $printer->text("----------------------------------------------------------------\n");

        // Informações Fixas
        $printer->text("Documento Auxiliar da Nota Fiscal de Consumidor Eletronica\n");
        $printer->text("Não permite aproveitamento de crédito de ICMS\n");

        //Linha Divisória
        $printer->text("----------------------------------------------------------------\n");

        // Definindo o comprimento máximo para cada coluna
        $col1Width = 8;  // Comprimento da coluna para o Código
        $col2Width = 24; // Comprimento da coluna para a Descrição
        $col3Width = 6;  // Comprimento da coluna para a Qtde
        $col4Width = 6;  // Comprimento da coluna para a UN
        $col5Width = 10; // Comprimento da coluna para Vl Unit
        $col6Width = 10; // Comprimento da coluna para Vl Total

        // Cabeçalho da tabela de itens
        $printer->setJustification(Printer::JUSTIFY_LEFT);
        $printer->text(str_pad("Código", $col1Width));
        $printer->text(str_pad(" Descrição", $col2Width));
        $printer->text(str_pad("   Qtde", $col3Width));
        $printer->text(str_pad("  UN", $col4Width));
        $printer->text(str_pad("  Vl Unit", $col5Width));
        $printer->text(str_pad("  Vl Total", $col6Width) . "\n");

        // Produtos
        $total_itens = 0;
        foreach ($item->itens as $produto) {
            $codigo = str_pad($produto->produto->id, $col1Width);
            $descricao = str_pad(substr($produto->produto->nome, 0, 22), $col2Width);
            $quantidade = str_pad(number_format($produto->quantidade, 2, ',', '.'), $col3Width);
            $unidade = str_pad($produto->produto->unidade, $col4Width);
            $valorUnitario = str_pad(number_format($produto->produto->valor_unitario, 2, ',', '.'), $col5Width);
            $valorTotal = str_pad(number_format($produto->sub_total, 2, ',', '.'), $col6Width);
            $total_itens++;
            $printer->text($codigo);
            $printer->text($descricao);
            $printer->text($quantidade);
            $printer->text($unidade);
            $printer->text($valorUnitario);
            $printer->text($valorTotal . "\n");
        }

        //Linha Divisória
        $printer->setJustification(Printer::JUSTIFY_CENTER);
        $printer->text("----------------------------------------------------------------\n");

        // Total de Itens
        $printer->setJustification(Printer::JUSTIFY_LEFT);
        $printer->text(str_pad("Qtde total de itens", 30) . str_pad($total_itens, 33, ' ', STR_PAD_LEFT) . "\n");

        // Valor Total
        $printer->text(str_pad("Valor Total RS ", 30) . str_pad($item->total, 33, ' ', STR_PAD_LEFT) . "\n");

        // Valor de Desconto
        $printer->text(str_pad("Desconto RS ", 30) . str_pad(__moeda($item->desconto), 33, ' ', STR_PAD_LEFT) . "\n");

        // Valor de Frete
        $printer->text(str_pad("Frete RS ", 30) . str_pad(__moeda(0), 33, ' ', STR_PAD_LEFT) . "\n");

        // Valor Total a Pagar
        $printer->text(str_pad("Valor a Pagar RS ", 30) . str_pad(__moeda($item->total), 33, ' ', STR_PAD_LEFT) . "\n");


        $printer->setJustification(Printer::JUSTIFY_CENTER);
        $printer->text("----------------------------------------------------------------\n");

        $tipos_pagamento = [
            '01' => 'Dinheiro',
            '02' => 'Cheque',
            '03' => 'Cartão de Crédito',
            '04' => 'Cartão de Débito',
            '05' => 'Crédito Loja',
            '06' => 'Crediário',
            '10' => 'Vale Alimentação',
            '11' => 'Vale Refeição',
            '12' => 'Vale Presente',
            '13' => 'Vale Combustível',
            '14' => 'Duplicata Mercantil',
            '15' => 'Boleto Bancário',
            '16' => 'Depósito Bancário',
            '17' => 'Pagamento Instantâneo (PIX)',
            '90' => 'Sem Pagamento',
        ];

        $tipo_pagamento = $item->tipo_pagamento;
        $descricao_pagamento = $tipos_pagamento[$tipo_pagamento] ?? 'Não Informado';

        $printer->setJustification(Printer::JUSTIFY_LEFT);

        // Cabeçalho da Forma de Pagamento
        $printer->text(str_pad("Forma de Pagamento ", 30) . str_pad('VALOR PAGO RS', 33, ' ', STR_PAD_LEFT) . "\n");

        // Forma de Pagamento
        if ($tipo_pagamento == '01') {
            $printer->text(str_pad($descricao_pagamento, 30) . str_pad(__moeda($item->dinheiro_recebido), 33, ' ', STR_PAD_LEFT) . "\n");
        } elseif ($tipo_pagamento >= '03' && $tipo_pagamento < '17') {
            $printer->text(str_pad($descricao_pagamento, 30) . str_pad(__moeda($fatura->valor), 35, ' ', STR_PAD_LEFT) . "\n");
        } elseif ($tipo_pagamento == '17') {
            $printer->text(str_pad($descricao_pagamento, 30) . str_pad(__moeda($fatura->valor), 34, ' ', STR_PAD_LEFT) . "\n");
        }

        // Troco
        $printer->text(str_pad('Troco RS', 30) . str_pad(__moeda($item->troco), 33, ' ', STR_PAD_LEFT) . "\n");

        $printer->setJustification(Printer::JUSTIFY_CENTER);
        $printer->text("----------------------------------------------------------------\n");

        $linkConsulta = $this->geraLinkConsulta($item);

        // Dados de Consulta da Chave + a Chave
        if ($item->ambiente == '1'){
            $printer->text("Consulte pela Chave de Acesso em: \n");
            $printer->text($linkConsulta . "\n");
            $printer->text($item->chave . "\n");
        }else{
            $printer->text("Consulte pela Chave de Acesso em: \n");
            $printer->text("Nota gerada em ambiente de \n");
            $printer->selectPrintMode(Printer::MODE_FONT_A);
            $printer->text("HOMOLOGAÇÃO \n");

        }

        $printer->selectPrintMode(Printer::MODE_FONT_B);
        $printer->text("----------------------------------------------------------------\n");

        // Informações de Identificação do Cliente informado na venda
        $campo = "CONSUMIDOR NÃO IDENTIFICADO";
        if ($item->cliente_nome) {
            $cpf = $item->cliente_cpf_cnpj;
            $nome = $item->cliente_nome;
            $campo = "CONSUMIDOR - CPF: " . $cpf . "\n" . " Nome: " . $nome;
        }

        $printer->text($campo . "\n");
        $printer->text("NFCe n. " . $item->numero . " Série " . $item->numero_serie . " " . __data_pt_nfce($item->data_emissao) . "\n");
        $printer->text("Protocolo de Autorização: " . $item->recibo . "\n");
        $printer->text("Data de Autorização: " . __data_pt_nfce($item->updated_at) . "\n");

        // Linha Divisória
        $printer->text("----------------------------------------------------------------\n");

        //Geração do QRCode
        $link = $this->geraLinkQRCode($item);
        $chave = $link . $item->chave;
        $model2 = Printer::QR_MODEL_1;
        $printer->qrCode($chave, Printer::QR_MODEL_1, 6, $model2);

        //Linha Divisória
        $printer->text("----------------------------------------------------------------\n");

        //Informações da Empresa

        $printer->text("NFCe emitida pelo sistema MeuSIG\n");
        $printer->text("Visite nosso site: www.meusig.com.br\n");


        // Alimenta 3 linhas de papel e corta o papel
        $printer->feed(2);
        $printer->cut();
    }

    public function imprimirNaoFiscal($printer, $item, $fatura): void
    {
        //Cabeçalho - Informações do Emitente
        $printer->selectPrintMode(Printer::MODE_FONT_B);
        $printer->setJustification(Printer::JUSTIFY_CENTER);
//        $printer->text($item->empresa->nome . "\n");
//        $printer->text("CNPJ: " . $item->empresa->cpf_cnpj . " IE: " . $item->empresa->ie . "\n");
//        $printer->text("Rua: " . $item->empresa->rua . ", " . $item->empresa->numero . "\n");
//        $printer->text("" . $item->empresa->bairro . " -  " . $item->empresa->cidade->nome . " / " . $item->empresa->cidade->uf . "\n");

        //Linha Divisória
        $printer->text("----------------------------------------------------------------\n");

        // Informações Fixas
        $printer->text("Documento Auxiliar da Nota Fiscal de Consumidor Eletronica\n");
//        $printer->text("Não comprova pagamento\n");

        //Linha Divisória
        $printer->text("----------------------------------------------------------------\n");

        // Definindo o comprimento máximo para cada coluna
        $col1Width = 8;  // Comprimento da coluna para o Código
        $col2Width = 24; // Comprimento da coluna para a Descrição
        $col3Width = 6;  // Comprimento da coluna para a Qtde
        $col4Width = 6;  // Comprimento da coluna para a UN
        $col5Width = 10; // Comprimento da coluna para Vl Unit
        $col6Width = 10; // Comprimento da coluna para Vl Total

        // Cabeçalho da tabela de itens
        $printer->setJustification(Printer::JUSTIFY_LEFT);
        $printer->text(str_pad("Código", $col1Width));
        $printer->text(str_pad(" Descrição", $col2Width));
        $printer->text(str_pad("   Qtde", $col3Width));
        $printer->text(str_pad("  UN", $col4Width));
        $printer->text(str_pad("  Vl Unit", $col5Width));
        $printer->text(str_pad("  Vl Total", $col6Width) . "\n");

        // Produtos
        $total_itens = 0;
        foreach ($item->itens as $produto) {
            $codigo = str_pad($produto->produto->id, $col1Width);
            $descricao = str_pad(substr($produto->produto->nome, 0, 22), $col2Width);
            $quantidade = str_pad(number_format($produto->quantidade, 2, ',', '.'), $col3Width);
            $unidade = str_pad($produto->produto->unidade, $col4Width);
            $valorUnitario = str_pad(number_format($produto->produto->valor_unitario, 2, ',', '.'), $col5Width);
            $valorTotal = str_pad(number_format($produto->sub_total, 2, ',', '.'), $col6Width);
            $total_itens++;
            $printer->text($codigo);
            $printer->text($descricao);
            $printer->text($quantidade);
            $printer->text($unidade);
            $printer->text($valorUnitario);
            $printer->text($valorTotal . "\n");
        }

        //Linha Divisória
        $printer->setJustification(Printer::JUSTIFY_CENTER);
        $printer->text("----------------------------------------------------------------\n");

        // Total de Itens
        $printer->setJustification(Printer::JUSTIFY_LEFT);
        $printer->text(str_pad("Qtde total de itens", 30) . str_pad($total_itens, 33, ' ', STR_PAD_LEFT) . "\n");

        // Valor Total
        $printer->text(str_pad("Valor Total RS ", 30) . str_pad($item->total, 33, ' ', STR_PAD_LEFT) . "\n");

        // Valor de Desconto
        $printer->text(str_pad("Desconto RS ", 30) . str_pad(__moeda($item->desconto), 33, ' ', STR_PAD_LEFT) . "\n");

//        // Valor de Frete
//        $printer->text(str_pad("Frete RS ", 30) . str_pad(__moeda(0), 33, ' ', STR_PAD_LEFT) . "\n");

        // Valor Total a Pagar
        $printer->text(str_pad("Valor a Pagar RS ", 30) . str_pad(__moeda($item->total), 33, ' ', STR_PAD_LEFT) . "\n");


        $printer->setJustification(Printer::JUSTIFY_CENTER);
        $printer->text("----------------------------------------------------------------\n");

        $tipos_pagamento = [
            '01' => 'Dinheiro',
            '02' => 'Cheque',
            '03' => 'Cartão de Crédito',
            '04' => 'Cartão de Débito',
            '05' => 'Crédito Loja',
            '06' => 'Crediário',
            '10' => 'Vale Alimentação',
            '11' => 'Vale Refeição',
            '12' => 'Vale Presente',
            '13' => 'Vale Combustível',
            '14' => 'Duplicata Mercantil',
            '15' => 'Boleto Bancário',
            '16' => 'Depósito Bancário',
            '17' => 'Pagamento Instantâneo (PIX)',
            '90' => 'Sem Pagamento',
        ];

        $tipo_pagamento = $item->tipo_pagamento;
        $descricao_pagamento = $tipos_pagamento[$tipo_pagamento] ?? 'Não Informado';

        $printer->setJustification(Printer::JUSTIFY_LEFT);

        // Cabeçalho da Forma de Pagamento
        $printer->text(str_pad("Forma de Pagamento ", 30) . str_pad('VALOR PAGO RS', 33, ' ', STR_PAD_LEFT) . "\n");

        // Forma de Pagamento
        if ($tipo_pagamento == '01') {
            $printer->text(str_pad($descricao_pagamento, 30) . str_pad(__moeda($item->dinheiro_recebido), 33, ' ', STR_PAD_LEFT) . "\n");
        } elseif ($tipo_pagamento >= '03' && $tipo_pagamento < '17') {
            $printer->text(str_pad($descricao_pagamento, 30) . str_pad(__moeda($fatura->valor), 35, ' ', STR_PAD_LEFT) . "\n");
        } elseif ($tipo_pagamento == '17') {
            $printer->text(str_pad($descricao_pagamento, 30) . str_pad(__moeda($fatura->valor), 34, ' ', STR_PAD_LEFT) . "\n");
        }

        // Troco
        $printer->text(str_pad('Troco RS', 30) . str_pad(__moeda($item->troco), 33, ' ', STR_PAD_LEFT) . "\n");

        $printer->setJustification(Printer::JUSTIFY_CENTER);
        $printer->text("----------------------------------------------------------------\n");


        // Informações de Identificação do Cliente informado na venda
        $campo = "CONSUMIDOR NÃO IDENTIFICADO";
        if ($item->cliente_nome) {
            $cpf = $item->cliente_cpf_cnpj;
            $nome = $item->cliente_nome;
            $campo = "CONSUMIDOR - CPF: " . $cpf . "\n" . " Nome: " . $nome;
        }

        $printer->text($campo . "\n");
        $printer->text("NFCe n. " . $item->numero . " Série " . $item->numero_serie . " " . __data_pt_nfce($item->data_emissao) . "\n");
        // Linha Divisória
        $printer->text("----------------------------------------------------------------\n");

        //Informações da Empresa

//        $printer->text("NFCe emitida pelo sistema MeuSIG\n");
//        $printer->text("Visite nosso site: www.meusig.com.br\n");


        // Alimenta 3 linhas de papel e corta o papel
        $printer->feed(2);
        $printer->cut();
    }

    private function geraLinkQRCode($item)
    {

        $empresa = Empresa::where('id', $item->empresa_id)->first();
        $estado = $empresa->cidade->uf;

        //Precisa ser verificado cada estado.
        $link = match ($estado) {
            'AC' => 'http://www.sefaznet.ac.gov.br/nfce/consulta',
            'AL' => 'http://www.sefaz.al.gov.br/nfce/consulta',
            'AP' => 'http://www.sefaz.ap.gov.br/nfce/consulta',
            'AM' => 'http://www.sefaz.am.gov.br/nfce/consulta',
            'BA' => 'http://www.sefaz.ba.gov.br/nfce/consulta',
            'CE' => 'http://www.sefaz.ce.gov.br/nfce/consulta',
            'DF' => 'https://ww1.receita.fazenda.df.gov.br/DecVisualizador/Nfce/Captcha?Chave=',
            'ES' => 'http://www.sefaz.es.gov.br/nfce/consulta',
            'GO' => 'www.sefaz.go.gov.br/nfce/consulta',
            'MA' => 'http://www.sefaz.ma.gov.br/nfce/consulta',
            'MT' => 'http://www.sefaz.mt.gov.br/nfce/consulta',
            'MS' => 'http://www.dfe.ms.gov.br/nfce/consulta',
            'MG' => 'http://www.fazenda.mg.gov.br/nfce/consulta',
            'PA' => 'http://www.sefa.pa.gov.br/nfce/consulta',
            'PB' => 'http://www.receita.pb.gov.br/nfce/consulta',
            'PR' => 'http://www.fazenda.pr.gov.br/nfce/consulta',
            'PE' => 'http://www.sefaz.pe.gov.br/nfce/consulta',
            'PI' => 'http://www.sefaz.pi.gov.br/nfce/consulta',
            'RJ' => 'http://www.fazenda.rj.gov.br/nfce/consulta',
            'RN' => 'http://www.set.rn.gov.br/nfce/consulta',
            'RS' => 'http://www.sefaz.rs.gov.br/nfce/consulta',
            'RO' => 'http://www.sefin.ro.gov.br/nfce/consulta',
            'RR' => 'http://www.sefaz.rr.gov.br/nfce/consulta',
            'SC' => 'https://sat.sef.sc.gov.br/nfce/consulta?p=',
            'SP' => 'http://www.nfce.fazenda.sp.gov.br/consulta',
            'SE' => 'http://www.sefaz.se.gov.br/nfce/consulta',
            'TO' => 'http://www.sefaz.to.gov.br/nfce/consulta',
            default => 'Link padrão ou mensagem de erro',
        };

        return $link;

    }

    private function geraLinkConsulta($item)
    {

        $empresa = Empresa::where('id', $item->empresa_id)->first();
        $estado = $empresa->cidade->uf;

        //Precisa ser verificado cada estado.
        $link = match ($estado) {
            'AC' => 'http://www.sefaznet.ac.gov.br/nfce/consulta',
            'AL' => 'http://www.sefaz.al.gov.br/nfce/consulta',
            'AP' => 'http://www.sefaz.ap.gov.br/nfce/consulta',
            'AM' => 'http://www.sefaz.am.gov.br/nfce/consulta',
            'BA' => 'http://www.sefaz.ba.gov.br/nfce/consulta',
            'CE' => 'http://www.sefaz.ce.gov.br/nfce/consulta',
            'DF' => 'www.fazenda.df.gov.br/nfce/consulta',
            'ES' => 'http://www.sefaz.es.gov.br/nfce/consulta',
            'GO' => 'www.sefaz.go.gov.br/nfce/consulta',
            'MA' => 'http://www.sefaz.ma.gov.br/nfce/consulta',
            'MT' => 'http://www.sefaz.mt.gov.br/nfce/consulta',
            'MS' => 'http://www.dfe.ms.gov.br/nfce/consulta',
            'MG' => 'http://www.fazenda.mg.gov.br/nfce/consulta',
            'PA' => 'http://www.sefa.pa.gov.br/nfce/consulta',
            'PB' => 'http://www.receita.pb.gov.br/nfce/consulta',
            'PR' => 'http://www.fazenda.pr.gov.br/nfce/consulta',
            'PE' => 'http://www.sefaz.pe.gov.br/nfce/consulta',
            'PI' => 'http://www.sefaz.pi.gov.br/nfce/consulta',
            'RJ' => 'http://www.fazenda.rj.gov.br/nfce/consulta',
            'RN' => 'http://www.set.rn.gov.br/nfce/consulta',
            'RS' => 'http://www.sefaz.rs.gov.br/nfce/consulta',
            'RO' => 'http://www.sefin.ro.gov.br/nfce/consulta',
            'RR' => 'http://www.sefaz.rr.gov.br/nfce/consulta',
            'SC' => 'https://sat.sef.sc.gov.br/nfce/consulta',
            'SP' => 'http://www.nfce.fazenda.sp.gov.br/consulta',
            'SE' => 'http://www.sefaz.se.gov.br/nfce/consulta',
            'TO' => 'http://www.sefaz.to.gov.br/nfce/consulta',
            default => 'Link padrão ou mensagem de erro',
        };

        return $link;

    }


}
