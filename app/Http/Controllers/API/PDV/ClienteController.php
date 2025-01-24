<?php

namespace App\Http\Controllers\API\PDV;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Cliente;

class ClienteController extends Controller
{
    public function all(Request $request)
    {
        $data = Cliente::select('clientes.*', 'cidades.nome as nome_cidade', 'cidades.uf as uf', 'cidades.codigo as codigo_cidade')
            ->leftjoin('cidades', 'clientes.cidade_id', '=', 'cidades.id')
            ->where('empresa_id', $request->empresa_id)
            ->get();
        return response()->json($data, 200);
    }
}
