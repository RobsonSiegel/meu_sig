<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\RegistroTef;
use App\Models\TefMultiPlusCard;
use App\Models\UsuarioEmpresa;
use App\Models\User;

class TefRegistroController extends Controller
{
    public function index(Request $request){
        $data = RegistroTef::where('empresa_id', $request->empresa_id)
        ->when($request->usuario_id, function ($q) use ($request) {
            return $q->where('usuario_id', $request->usuario_id);
        })
        ->orderBy('created_at', 'desc')
        ->paginate(env("PAGINACAO"));

        $usuarios = User::where('usuario_empresas.empresa_id', $request->empresa_id)
        ->select('users.*')
        ->join('usuario_empresas', 'users.id', '=', 'usuario_empresas.usuario_id')
        ->get();

        return view('tef_registro.index', compact('data', 'usuarios'));
    }

    public function destroy($id){

        $registro = RegistroTef::findOrFail($id);

        $item = TefMultiPlusCard::where('empresa_id', $registro->empresa_id)
        ->where('status', 1)
        ->where('usuario_id', $registro->usuario_id)
        ->first();

        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, "https://api.multipluscard.com.br/api/Servicos/SetVendaTef");
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
        curl_setopt($curl, CURLOPT_CUSTOMREQUEST, 'POST');

        $cnpj = preg_replace('/[^0-9]/', '', $item->cnpj);
        $conteudo = '000-000 = CNC¬001-000 = '.$registro->id.'¬003-000 = '.$registro->valor_total.'¬010-000 = '.$registro->nome_rede.'¬012-000 = '.$registro->nsu.'¬022-000 = '.$registro->data_transacao.'¬024-000 = '.$registro->hora_transacao;

        $headers = [
            "Content-Type: application/json",
            "Content-Length: 0",
            "CNPJ: $cnpj",
            "PDV: $item->pdv",
            "TOKEN: $item->token",
            "CONTEUDO: $conteudo"
        ];

        curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
        $result = curl_exec($curl);

        sleep(2);
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, "https://api.multipluscard.com.br/api/Servicos/GetVendasTef");
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
        $headers = [
            "Content-Type: application/json",
            "Content-Length: 0",
            "hash: $result",
            "TOKEN: $item->token",
        ];
        curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
        $resp = curl_exec($curl);
        if($resp == 'Pendente'){
            session()->flash("flash_warning", "Pendente!");
        }else{
            dd($resp);
            session()->flash("flash_success", "Evento registrado!");
        }
        return redirect()->back();
    }
}
