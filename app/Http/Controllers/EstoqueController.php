<?php

namespace App\Http\Controllers;

use App\Models\ProdutoVariacao;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use App\Models\Estoque;
use App\Utils\EstoqueUtil;
use App\Models\ProdutoLocalizacao;

class EstoqueController extends Controller
{

    protected $util;

    public function __construct(EstoqueUtil $util)
    {
        $this->util = $util;
        $this->middleware('permission:estoque_create', ['only' => ['create', 'store']]);
        $this->middleware('permission:estoque_edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:estoque_view', ['only' => ['show', 'index']]);
        $this->middleware('permission:estoque_delete', ['only' => ['destroy']]);
    }

    public function index(Request $request)
    {
        $local = __countLocalAtivo();
        if ($local > 1) {
            $data = Estoque::select('estoques.*')
                ->join('produtos', 'produtos.id', '=', 'estoques.produto_id')
                ->where('produtos.empresa_id', request()->empresa_id)
                ->when(!empty($request->produto), function ($q) use ($request) {
                    return $q->where('produtos.nome', 'LIKE', "%$request->produto%");
                })
                ->groupBy('produtos.id')
                ->orderBy('id', 'desc')
                ->paginate(env("PAGINACAO"));
        } else {
            $data = Estoque::select('estoques.*')
                ->join('produtos', 'produtos.id', '=', 'estoques.produto_id')
                ->where('produtos.empresa_id', request()->empresa_id)
                ->when(!empty($request->produto), function ($q) use ($request) {
                    return $q->where('produtos.nome', 'LIKE', "%$request->produto%");
                })
                ->when(!empty($request->referencia), function ($q) use ($request) {
                    return $q->where('produtos.referencia', 'LIKE', "%$request->referencia%");
                })
                ->orderBy('id', 'desc')
                ->paginate(env("PAGINACAO"));
        }
        return view('estoque.index', compact('data'));
    }

    public function create()
    {
        return view('estoque.create');
    }

    public function edit(Request $request, $id)
    {
        $local_id = $request->local_id;
        $item = Estoque::findOrFail($id);
        $locais = Estoque::where('produto_id', $item->produto_id)->get();

        return view('estoque.edit', compact('item', 'locais'));
    }

    public function store(Request $request)
    {

        try {
            if (isset($request->local_id)) {
                ProdutoLocalizacao::updateOrCreate([
                    'produto_id' => $request->produto_id,
                    'localizacao_id' => $request->local_id
                ]);
            }

            $this->util->incrementaEstoque($request->produto_id, $request->quantidade, $request->produto_variacao_id, $request->local_id);

            $transacao = Estoque::where('produto_id', $request->produto_id)->first();
            $tipo = 'incremento';
            $codigo_transacao = $transacao->id;
            $tipo_transacao = 'alteracao_estoque';

            $this->util->movimentacaoProduto($request->produto_id, $request->quantidade, $tipo, $codigo_transacao, $tipo_transacao, $request->produto_variacao_id);

            session()->flash("flash_success", "Estoque adicionado com sucesso!");
        } catch (\Exception $e) {
            // echo $e->getLine();
            // die;
            session()->flash("flash_error", "Algo deu errado: " . $e->getMessage());
        }
        return redirect()->route('estoque.index');
    }

    public function update(Request $request, $id)
    {

        try {
            $item = Estoque::findOrFail($id);
            $produtoVariacao = isset($item->produto_variacao_id) ? ProdutoVariacao::findOrFail($item->produto_variacao_id) : null;

            if (!empty($request->local_id)) {
                foreach ($request->local_id as $index => $localId) {
                    $itemLocal = Estoque::findOrFail($localId);
                    $itemLocal->quantidade = $request->quantidade[$index];
                    $itemLocal->save();
                }
            } else {
                $item->quantidade = $request->quantidade;
                $item->save();

                if ($produtoVariacao) {
                    $produtoVariacao->estoque_variacao = $request->quantidade;
                    $produtoVariacao->save();
                }
            }

            session()->flash("flash_success", "Estoque alterado com sucesso!");
        } catch (ModelNotFoundException $e) {
            session()->flash("flash_error", "Registro não encontrado.");
        } catch (\Exception $e) {
            session()->flash("flash_error", "Algo deu errado: " . $e->getMessage());
        }

        return redirect()->route('estoque.index');
    }
}
