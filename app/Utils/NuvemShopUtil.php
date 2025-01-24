<?php

namespace App\Utils;

use App\Models\Estoque;
use App\Models\NuvemShopConfig;
use App\Models\ProdutoVariacao;
use Illuminate\Support\Str;
use App\Models\CategoriaNuvemShop;

class NuvemShopUtil
{

    public function create($request, $produto)
    {
        $store_info = session('store_info');
        if (!$store_info) {
            $config = NuvemShopConfig::where('empresa_id', $request->empresa_id)->first();
            $auth = new \TiendaNube\Auth($config->client_id, $config->client_secret);
            $url = $auth->login_url_brazil();
            return redirect($url);
        }

        $api = new \TiendaNube\API($store_info['store_id'], $store_info['access_token'], 'Awesome App (' . $store_info['email'] . ')');

        $dataProduto = [
            'name' => $produto->nome,
            'description' => $request->texto_nuvem_shop,
            'published' => true,
        ];


        /*Alteração feita para inclusão das variações quando tiver*/
        if ($request->variavel) {
            $dataProduto['attributes'][] = [ "pt" => "Tamanho"];
            for ($i = 0; $i < sizeof($request->variacao_id); $i++) {
                $variacao = ProdutoVariacao::findOrFail($request->variacao_id[$i]);
                $dataProduto['variants'][] = [
                    'price' =>__convert_value_bd($request->nuvem_shop_valor),
                    "stock_management" => true,
                    "stock" => intval($request->estoque_variacao[$i]),
                    "weight" => $request->peso,
                    "width" => $request->largura,
                    "height" => $request->altura,
                    "depth" => $request->comprimento,
                    "cost" => __convert_value_bd($request->valor_compra),
                    "values" => [$variacao->descricao]
                ];
            }
        }

        if ($request->categoria_nuvem_shop) {
            $dataProduto['categories'] = [$request->categoria_nuvem_shop];
        }
        $response = $api->post("products", $dataProduto);
        $prod = $response->body;

        $produto->nuvem_shop_id = $prod->id;
        $produto->save();

        /*Alteração feita para manter como era antes quando não tem variação */
        if (!$request->variavel) {
            $response = $api->put("products/$prod->id/variants/" . $prod->variants[0]->id, [
                'price' => __convert_value_bd($request->nuvem_shop_valor),
                'stock' => intval($request->estoque_inicial),
                'cost' => __convert_value_bd($request->valor_compra),
                'promotional_price' => __convert_value_bd($request->nuvem_shop_valor_promocional),
                'barcode' => $request->codigo_barras,
                "weight" => $request->peso,
                "width" => $request->largura,
                "height" => $request->altura,
                "depth" => $request->comprimento,
            ]);
        }

        if ($request->hasFile('image')) {

            $image = base64_encode(file_get_contents(public_path($produto->img)));

            $ext = $request->file('image')->getClientOriginalExtension();
            $response = $api->post("products/$prod->id/images", [
                "filename" => Str::random(20) . "." . $ext,
                "attachment" => $image
            ]);
        }

        return $response;
    }
}
