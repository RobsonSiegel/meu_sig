<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\DiaSemana;
use App\Models\Funcionamento;
use App\Models\Funcionario;
use App\Models\Interrupcoes;
use App\Models\Agendamento;
use App\Models\ItemNfe;
use App\Models\Nfe;
use App\Models\Produto;
use App\Models\Servico;
use App\Models\User;
use Illuminate\Http\Request;

class CompraController extends Controller
{
    public function buscarNumeroCompra(Request $request)
    {
        $produtoIds = $request->input('produto_ids');
        if (is_array($produtoIds)) {
            // Array de resultados
            $resultados = [];

            foreach ($produtoIds as $produtoId) {
                $resultados[] = $this->processarProduto($produtoId);
            }
            return response()->json($resultados);
        } else {
            return response()->json(['error' => 'Dados inválidos'], 400);
        }
    }

    private function processarProduto($produtoId) {
        if ($produtoId > 0) {
            $numeroCompra = $this->getUltimaCompra($produtoId);
        } else {
            $numeroCompra = 0;
        }
        return [
            'produto_id' => $produtoId,
            'numero_compra' => $numeroCompra,
        ];
    }

    private function getUltimaCompra($produtoId) {
        $itemCompra = ItemNfe::where('produto_id', $produtoId)
            ->orderBy('id', 'desc')
            ->first();

        if ($itemCompra) {
            $compra = Nfe::where('id', $itemCompra->nfe_id)
                ->where('tpNF', 0)
                ->first();
            return $compra ? $compra->id : 0;
        }
        return 0;
    }

    public function find($numeroCompra){
        $compra = Nfe::findOrFail($numeroCompra);
        if ($compra){
            $itemCompra = ItemNfe::where('nfe_id', $compra->id)->get();
            if ($itemCompra){
                foreach ($itemCompra as $item) {
                    $prod = Produto::findOrFail($item->produto_id);
                    $resultado[] = [
                        'produto_id' => $item->produto_id,
                        'numero_compra' => $item->nfe_id,
                        'unidade_medida' => $prod->unidade,
                        'quantidade' => $item->quantidade,
                        'valor_unitario' => $item->valor_unitario,
                    ];
                }
            }
            return response()->json($resultado);
        }else{
            return response()->json(['error' => 'Dados inválidos'], 400);
        }
    }
}
