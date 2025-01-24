<?php

namespace App\Http\Controllers\API\PDV;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\UsuarioEmpresa;
use Illuminate\Http\Request;
use App\Models\Empresa;

use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    public function login(Request $request)
    {
        $user = User::where('email', $request->email)->first();


        // Verifica se o usuário existe
        if (!$user) {
            return response()->json("Usuário não encontrado", 404);
        }

        $validCredentials = Hash::check($request->senha, $user->getAuthPassword());
        if (!$validCredentials) {
            return response()->json("Credenciais incorretas", 404);
        }

        $user->empresa_id = $user->empresa->empresa_id;
        $emp = Empresa::findOrFail($user->empresa->empresa_id);
        $user->empresa_nome = $emp->nome;
        return response()->json($user, 200);
    }

    public function dadosEmpresa(Request $request)
    {
        $empresa = Empresa::select(
            'empresas.id','empresas.nome as nome_empresa', 'empresas.nome_fantasia', 'empresas.cpf_cnpj',
            'empresas.ie', 'empresas.email', 'empresas.celular', 'empresas.csc', 'empresas.csc_id',
            'empresas.status', 'empresas.cep', 'empresas.rua', 'empresas.numero', 'empresas.bairro', 'empresas.complemento',
            'empresas.numero_serie_nfe', 'empresas.numero_ultima_nfe_producao', 'empresas.numero_ultima_nfe_homologacao',
            'empresas.numero_serie_nfce', 'empresas.numero_ultima_nfce_producao', 'empresas.numero_ultima_nfce_homologacao',
            'empresas.token', 'empresas.ambiente', 'empresas.tributacao',
            'empresas.numero_ultima_cte_producao', 'empresas.numero_ultima_cte_homologacao', 'empresas.numero_serie_cte',
            'empresas.natureza_id_pdv', 'empresas.numero_ultima_mdfe_producao', 'empresas.numero_ultima_mdfe_homologacao',
            'empresas.numero_serie_mdfe', 'empresas.tipo_contador', 'empresas.limite_cadastro_empresas',
            'empresas.percentual_comissao', 'empresas.exclusao_icms_pis_cofins', 'empresas.token_nfse',
            'empresas.numero_ultima_nfse', 'empresas.numero_serie_nfse', 'empresas.aut_xml',
            'cidades.nome as nome_cidade', 'cidades.uf','cidades.codigo' ,'config_gerals.usa_caixa_cego',
            'config_gerals.percentual_maximo_desconto')
            ->leftJoin('cidades', 'cidades.id', '=', 'empresas.cidade_id')
            ->leftjoin('config_gerals', 'config_gerals.empresa_id', '=', 'empresas.id')
            ->where('empresas.id', $request->empresa_id)
            ->first();
        return response()->json($empresa, 200);
    }

    public function empresaAtiva(Request $request)
    {
        $empresa_id = $request->empresa_id;
        $empresa = Empresa::findOrFail($empresa_id);
        return response()->json($empresa->status, 200);
    }

    public function usuarios(Request $request){
        $usuariosEmpresa = UsuarioEmpresa::where('empresa_id', $request->empresa_id)->get();
        $usuarios = [];

        for ($i=0; $i < count($usuariosEmpresa); $i++) {
            $user = User::findOrFail($usuariosEmpresa[$i]->usuario_id);
            $usuarios[] = $user;
        }
        return response()->json($usuarios, 200);
    }
}
