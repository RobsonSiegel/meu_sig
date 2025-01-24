<?php

namespace App\Http\Controllers;

use App\Models\Cidade;
use App\Models\Cliente;
use App\Models\ConfigGeral;
use App\Models\ContaPagar;
use App\Models\ContaReceber;
use App\Models\Empresa;
use App\Models\FaturaNfe;
use App\Models\Funcionario;
use App\Models\ItemNfe;
use App\Models\NaturezaOperacao;
use App\Models\Nfe;
use App\Models\Pedido;
use App\Models\Produto;
use App\Models\Transportadora;
use App\Utils\EstoqueUtil;
use App\Utils\MailUtil;
use App\Utils\UploadUtil;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PedidoController extends Controller
{
    protected $util;

    protected $mailUtil;

    protected $uploadUtil;

    public function __construct(EstoqueUtil $util, MailUtil $mailUtil, UploadUtil $uploadUtil)
    {
        $this->util = $util;
        $this->mailUtil = $mailUtil;
        $this->uploadUtil = $uploadUtil;

    }

    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $start_date = $request->get('start_date');
        $end_date = $request->get('end_date');
        $cliente_id = $request->get('cliente_id');
        $estado = $request->get('estado');
        $tpNF = $request->get('tpNF');

        $data = Nfe::where('empresa_id', request()->empresa_id)->where('tpNF', 1)->where('orcamento', 2)
            ->when(!empty($start_date), function ($query) use ($start_date) {
                return $query->whereDate('created_at', '>=', $start_date);
            })
            ->when(!empty($end_date), function ($query) use ($end_date,) {
                return $query->whereDate('created_at', '<=', $end_date);
            })
            ->when(!empty($cliente_id), function ($query) use ($cliente_id) {
                return $query->where('cliente_id', $cliente_id);
            })
            ->when($estado != "", function ($query) use ($estado) {
                return $query->where('estado', $estado);
            })
            ->orderBy('created_at', 'desc')
            ->paginate(env("PAGINACAO"));

        $configGeral = ConfigGeral::where('empresa_id', $request->empresa_id)->first();
        return view('pedidos_chapa.index', compact('data', 'configGeral'));

    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $clientes = Cliente::where('empresa_id', request()->empresa_id)->get();
        if (sizeof($clientes) == 0) {
            session()->flash("flash_warning", "Primeiro cadastre um cliente!");
            return redirect()->route('clientes.create');
        }
        $sizeProdutos = Produto::where('empresa_id', request()->empresa_id)->count();
        if ($sizeProdutos == 0) {
            session()->flash("flash_warning", "Primeiro cadastre um produto!");
            return redirect()->route('produtos.create');
        }
        $transportadoras = Transportadora::where('empresa_id', request()->empresa_id)->get();
        $cidades = Cidade::all();
        $naturezas = NaturezaOperacao::where('empresa_id', request()->empresa_id)->get();
        if (sizeof($naturezas) == 0) {
            session()->flash("flash_warning", "Primeiro cadastre um natureza de operação!");
            return redirect()->route('natureza-operacao.create');
        }
        $vendedores = Funcionario::where('empresa_id', request()->empresa_id)->get();
        $empresa = Empresa::findOrFail(request()->empresa_id);
        $caixa = __isCaixaAberto();
        $empresa = __objetoParaEmissao($empresa, $caixa->local_id);

        $numeroNfe = Nfe::lastPedido($empresa);
        return view(
            'pedidos_chapa.create',
            compact('clientes', 'transportadoras', 'cidades', 'naturezas', 'numeroNfe', 'empresa', 'caixa', 'vendedores')
        );
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try {
            $nfe = DB::transaction(function () use ($request) {
                $cliente_id = isset($request->cliente_id) ? $request->cliente_id : null;
                $empresa = Empresa::findOrFail($request->empresa_id);
                $local_id = __getLocaisAtivoUsuario();

                $file_name = '';
                if ($request->hasFile('image')) {
                    // dd($request->file('image'));
                    $file_name = $this->uploadUtil->uploadImage($request, '/pedidos');
                }
                if (isset($request->cliente_id)) {
                    if ($request->cliente_id == null) {
                        $cliente_id = $this->cadastrarCliente($request);
                    } else {
                        // $this->atualizaCliente($request);
                    }
                }
                $transportadora_id = $request->transportadora_id;
                if ($request->transportadora_id == null) {
                    //    $transportadora_id = $this->cadastrarTransportadora($request);
                } else {
                    //   $this->atualizaTransportadora($request);
                }
                $config = Empresa::find($request->empresa_id);

                $tipoPagamento = $request->tipo_pagamento;

                $caixa = __isCaixaAberto();
                $valor_produto = number_format($request->valor_produtos, 2);
                $request->merge([
                    'emissor_nome' => $config->nome,
                    'emissor_cpf_cnpj' => $config->cpf_cnpj,
                    'ambiente' => $config->ambiente,
                    'chave' => '',
                    'cliente_id' => $cliente_id,
                    'fornecedor_id' => null,
                    'transportadora_id' => $transportadora_id,
                    'numero_serie' => $empresa->numero_serie_nfe ? $empresa->numero_serie_nfe : 0,
                    'numero' => $request->numero_nfe,
                    'estado' => 'novo',
                    'total' => __convert_value_bd($request->valor_total),
                    'desconto' => $request->desconto ? __convert_value_bd($request->desconto) : 0,
                    'acrescimo' => $request->acrescimo ? __convert_value_bd($request->acrescimo) : 0,
                    'valor_produtos' => __convert_value_bd($valor_produto),
                    'valor_frete' => $request->valor_frete ? __convert_value_bd($request->valor_frete) : 0,
                    'caixa_id' => $caixa ? $caixa->id : null,
                    'local_id' => $local_id,
                    'tipo_pagamento' => $request->tipo_pagamento[0],
                    'orcamento' => 2,
                    'vendedor_id' => $request->vendedor_id ? $request->vendedor_id : 0,
                ]);


                $nfe = Nfe::create($request->all());

                $dadosSequencias = [];
                $itensComSequencia = [];
                for ($i = 0; $i < sizeof($request->produto_id); $i++) {

                    $product = Produto::findOrFail($request->produto_id[$i]);
                    $categoria = $product->categoria;
                    $sequenciaProducao = $categoria->sequencias;
                    $variacao_id = isset($request->variacao_id[$i]) ? $request->variacao_id[$i] : null;

//                    // Monta os setores para cada sequência
//                    foreach ($sequenciaProducao as $sequencia) {
//                        $dadosSequencias[] = [
//                            'sequencia' => $sequencia->descricao,
//                            'setores' => $sequencia->setores->pluck('nome')->toArray(), // Relacionamento sequências -> setores
//                        ];
//                    }

                    // Adiciona o produto e suas sequências ao array
                    $itensComSequencia[] = [
                        'produto' => $product->nome,
                        'sequencias' => $dadosSequencias,
                    ];


                    ItemNfe::create([
                        'nfe_id' => $nfe->id,
                        'produto_id' => (int)$request->produto_id[$i],
                        'quantidade' => __convert_value_bd($request->quantidade[$i]),
                        'valor_unitario' => __convert_value_bd($request->valor_unitario[$i]),
                        'sub_total' => __convert_value_bd($request->sub_total[$i]),
                        'imagem' => $file_name,
                        'largura' => $request->largura[$i] ? $request->largura[$i] : 0,
                        'altura' => 0,
                        'comprimento' => $request->comprimento[$i] ? $request->comprimento[$i] : 0,
                        'espessura' => $request->espessura[$i] ? $request->espessura[$i] : 0,
                        'diametro' => 0,
                        'peso' => $request->quilo[$i] ? $request->quilo[$i] : 0,
                        'peso_por_peca' => $request->quilo_por_peca[$i] ? $request->quilo_por_peca[$i] : 0,
                        'peso_total' => $request->quilo_total[$i] ? $request->quilo_total[$i] : 0,
                        'perc_icms' => $product->perc_icms,
                        'perc_pis' => $product->perc_pis,
                        'perc_cofins' => $product->perc_cofins,
                        'perc_ipi' => $product->perc_ipi,
                        'cst_csosn' => $product->cst_csosn,
                        'cst_pis' => $product->cst_pis,
                        'cst_cofins' => $product->cst_cofins,
                        'cst_ipi' => $product->cst_ipi,
                        'perc_red_bc' => $product->perc_red_bc,
                        'cfop' => $request->cfop[$i],
                        'ncm' => $product->ncm,
                        'codigo_beneficio_fiscal' => $product->codigo_beneficio_fiscal,
                        'variacao_id' => $variacao_id
                    ]);

                    $configGeral = ConfigGeral::where('empresa_id', $request->empresa_id)->first();

                    if ($product->gerenciar_estoque && $request->orcamento == 0) {

                        //Feito alteração para movimentar estoque só quando a opção de Movimentar Estoque na Entrega estiver desmarcada.
                        if (!$configGeral->movimenta_estoque_entrega) {

                            if (isset($request->is_compra)) {
                                $this->util->incrementaEstoque($product->id, __convert_value_bd($request->quantidade[$i]),
                                    $variacao_id, $local_id);
                            } else {
                                $this->util->reduzEstoque($product->id, __convert_value_bd($request->quantidade[$i]),
                                    $variacao_id, $local_id);
                            }
                        }
                        //Feito alteração para movimentar estoque só quando a opção de Movimentar Estoque na Entrega estiver desmarcada.
                        if (!$configGeral->movimenta_estoque_entrega) {
                            if ($request->is_compra) {
                                $tipo = 'incremento';
                                $codigo_transacao = $nfe->id;
                                $tipo_transacao = 'compra';
                                $this->util->movimentacaoProduto($product->id, __convert_value_bd($request->quantidade[$i]), $tipo, $codigo_transacao, $tipo_transacao, $variacao_id);
                            } else {
                                $tipo = 'reducao';
                                $codigo_transacao = $nfe->id;
                                $tipo_transacao = 'venda_nfe';
                                $this->util->movimentacaoProduto($product->id, __convert_value_bd($request->quantidade[$i]), $tipo, $codigo_transacao, $tipo_transacao, $variacao_id);
                            }
                        }
                    }
                    if ($request->tipo_pagamento) {
                        if ($request->tipo_pagamento[0] != '') {
                            for ($i = 0; $i < sizeof($tipoPagamento); $i++) {
                                FaturaNfe::create([
                                    'nfe_id' => $nfe->id,
                                    'tipo_pagamento' => $tipoPagamento[$i],
                                    'data_vencimento' => $request->data_vencimento[$i],
                                    'valor' => __convert_value_bd($request->valor_fatura[$i])
                                ]);
                            }
                        }
                        if ($request->gerar_conta_receber) {
                            for ($i = 0; $i < sizeof($tipoPagamento); $i++) {
                                //Alteração feita para colocar um 0 antes do numero da parcela. Se caso for menor que 10.
                                $parcela = $i;
                                $parcela = $parcela + 1;
                                if ($parcela < 10) {
                                    $numero_documento = $nfe->numero . '/0' . $parcela;
                                } else {
                                    $numero_documento = $nfe->numero . '/' . $parcela;
                                }
                                ContaReceber::create([
                                    'empresa_id' => $request->empresa_id,
                                    'numero_documento' => $numero_documento,
                                    'nfe_id' => $nfe->id,
                                    'cliente_id' => $cliente_id,
                                    'valor_integral' => __convert_value_bd($request->valor_fatura[$i]),
                                    'tipo_pagamento' => $tipoPagamento[$i],
                                    'data_vencimento' => $request->data_vencimento[$i],
                                    'local_id' => $caixa->local_id,
                                ]);
                            }
                        }
                    }
                }
                return $nfe;
            });
            session()->flash("flash_success", "Pedido cadastrado!");
        } catch (\Exception $e) {
            echo $e->getMessage() . '<br>' . $e->getLine();
            session()->flash("flash_error", 'Algo deu errado: ' . $e->getMessage());
        }
        return redirect()->route('pedidos.index');
    }


    public function galery($id)
    {
        $item = Nfe::findOrFail($id);
        $produtos = $item->itens;
        return view('pedidos_chapa.galery', compact('item', 'produtos'));

    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $item = Nfe::findOrFail($id);
        $faturas = FaturaNfe::where('nfe_id', $item->id)->get();

        $clientes = Cliente::where('empresa_id', request()->empresa_id)->get();
        if (sizeof($clientes) == 0) {
            session()->flash("flash_warning", "Primeiro cadastre um cliente!");
            return redirect()->route('clientes.create');
        }
        $sizeProdutos = Produto::where('empresa_id', request()->empresa_id)->count();
        if ($sizeProdutos == 0) {
            session()->flash("flash_warning", "Primeiro cadastre um produto!");
            return redirect()->route('produtos.create');
        }
        $transportadoras = Transportadora::where('empresa_id', request()->empresa_id)->get();
        $cidades = Cidade::all();
        $naturezas = NaturezaOperacao::where('empresa_id', request()->empresa_id)->get();
        if (sizeof($naturezas) == 0) {
            session()->flash("flash_warning", "Primeiro cadastre um natureza de operação!");
            return redirect()->route('natureza-operacao.create');
        }
        $vendedores = Funcionario::where('empresa_id', request()->empresa_id)->get();
        $empresa = Empresa::findOrFail(request()->empresa_id);
        $caixa = __isCaixaAberto();
        $empresa = __objetoParaEmissao($empresa, null);

        return view('pedidos_chapa.edit',
            compact('clientes', 'item', 'transportadoras', 'cidades', 'naturezas', 'empresa', 'caixa', 'vendedores'));


    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        try {
            $nfe = DB::transaction(function () use ($request, $id) {
                $nfe = Nfe::findOrFail($id);
                $empresa = Empresa::findOrFail($request->empresa_id);
                $local_id = __getLocaisAtivoUsuario();
                $cliente_id = $request->cliente_id;
                $transportadora_id = $request->transportadora_id;
                $config = Empresa::find($request->empresa_id);
                $tipoPagamento = $request->tipo_pagamento;

                $caixa = __isCaixaAberto();
                $valor_produto = number_format($request->valor_produtos, 2);
                $request->merge([
                    'emissor_nome' => $config->nome,
                    'emissor_cpf_cnpj' => $config->cpf_cnpj,
                    'ambiente' => $config->ambiente,
                    'chave' => '',
                    'cliente_id' => $cliente_id,
                    'fornecedor_id' => null,
                    'transportadora_id' => $transportadora_id,
                    'numero_serie' => $empresa->numero_serie_nfe ? $empresa->numero_serie_nfe : 0,
                    'numero' => $request->numero_nfe,
                    'estado' => 'novo',
                    'total' => __convert_value_bd($request->valor_total),
                    'desconto' => $request->desconto ? __convert_value_bd($request->desconto) : 0,
                    'acrescimo' => $request->acrescimo ? __convert_value_bd($request->acrescimo) : 0,
                    'valor_produtos' => __convert_value_bd($valor_produto),
                    'valor_frete' => $request->valor_frete ? __convert_value_bd($request->valor_frete) : 0,
                    'caixa_id' => $caixa ? $caixa->id : null,
                    'local_id' => $local_id,
                    'tipo_pagamento' => $request->tipo_pagamento[0],
                    'orcamento' => 2,
                    'vendedor_id' => $request->vendedor_id ? $request->vendedor_id : 0,
                ]);


                $nfe->fill($request->all())->save();

                $nfe->itens()->delete();
                $nfe->fatura()->delete();

                $dadosSequencias = [];
                $itensComSequencia = [];
                for ($i = 0; $i < sizeof($request->produto_id); $i++) {

                    $product = Produto::findOrFail($request->produto_id[$i]);
                    $categoria = $product->categoria;
                    $sequenciaProducao = $categoria->sequencias;
                    $variacao_id = isset($request->variacao_id[$i]) ? $request->variacao_id[$i] : null;

//                    // Monta os setores para cada sequência
//                    foreach ($sequenciaProducao as $sequencia) {
//                        $dadosSequencias[] = [
//                            'sequencia' => $sequencia->descricao,
//                            'setores' => $sequencia->setores->pluck('nome')->toArray(), // Relacionamento sequências -> setores
//                        ];
//                    }

                    // Adiciona o produto e suas sequências ao array
                    $itensComSequencia[] = [
                        'produto' => $product->nome,
                        'sequencias' => $dadosSequencias,
                    ];

                    $file_name = '';
                    if ($request->hasFile('image')) {
                        // dd($request->file('image'));
                        $file_name = $this->uploadUtil->uploadImage($request, '/pedidos');
                    }

                 //   dd($request);
                    ItemNfe::create([
                        'nfe_id' => $nfe->id,
                        'produto_id' => (int)$request->produto_id[$i],
                        'quantidade' => __convert_value_bd($request->quantidade[$i]),
                        'valor_unitario' => __convert_value_bd($request->valor_unitario[$i]),
                        'sub_total' => __convert_value_bd($request->sub_total[$i]),
                        'imagem' => $file_name,
                        'largura' => $request->largura[$i] ? $request->largura[$i] : 0,
                        'altura' => 0,
                        'comprimento' => $request->comprimento[$i] ? $request->comprimento[$i] : 0,
                        'espessura' => $request->espessura[$i] ? $request->espessura[$i] : 0,
                        'diametro' => 0,
                        'peso' => $request->quilo[$i] ? $request->quilo[$i] : 0,
                        'peso_por_peca' => $request->quilo_por_peca[$i] ? $request->quilo_por_peca[$i] : 0,
                        'peso_total' => $request->quilo_total[$i] ? $request->quilo_total[$i] : 0,
                        'perc_icms' => $product->perc_icms,
                        'perc_pis' => $product->perc_pis,
                        'perc_cofins' => $product->perc_cofins,
                        'perc_ipi' => $product->perc_ipi,
                        'cst_csosn' => $product->cst_csosn,
                        'cst_pis' => $product->cst_pis,
                        'cst_cofins' => $product->cst_cofins,
                        'cst_ipi' => $product->cst_ipi,
                        'perc_red_bc' => $product->perc_red_bc,
                        'cfop' => $request->cfop[$i],
                        'ncm' => $product->ncm,
                        'codigo_beneficio_fiscal' => $product->codigo_beneficio_fiscal,
                        'variacao_id' => $variacao_id
                    ]);

                    $configGeral = ConfigGeral::where('empresa_id', $request->empresa_id)->first();

                    if ($product->gerenciar_estoque && $request->orcamento == 0) {

                        //Feito alteração para movimentar estoque só quando a opção de Movimentar Estoque na Entrega estiver desmarcada.
                        if (!$configGeral->movimenta_estoque_entrega) {

                            if (isset($request->is_compra)) {
                                $this->util->incrementaEstoque($product->id, __convert_value_bd($request->quantidade[$i]),
                                    $variacao_id, $local_id);
                            } else {
                                $this->util->reduzEstoque($product->id, __convert_value_bd($request->quantidade[$i]),
                                    $variacao_id, $local_id);
                            }
                        }
                        //Feito alteração para movimentar estoque só quando a opção de Movimentar Estoque na Entrega estiver desmarcada.
                        if (!$configGeral->movimenta_estoque_entrega) {
                            if ($request->is_compra) {
                                $tipo = 'incremento';
                                $codigo_transacao = $nfe->id;
                                $tipo_transacao = 'compra';
                                $this->util->movimentacaoProduto($product->id, __convert_value_bd($request->quantidade[$i]), $tipo, $codigo_transacao, $tipo_transacao, $variacao_id);
                            } else {
                                $tipo = 'reducao';
                                $codigo_transacao = $nfe->id;
                                $tipo_transacao = 'venda_nfe';
                                $this->util->movimentacaoProduto($product->id, __convert_value_bd($request->quantidade[$i]), $tipo, $codigo_transacao, $tipo_transacao, $variacao_id);
                            }
                        }
                    }
                    ContaReceber::where('nfe_id', $nfe->id)->delete();
                    ContaPagar::where('nfe_id', $nfe->id)->delete();
                    FaturaNfe::where('nfe_id', $nfe->id)->delete();

                    if ($request->tipo_pagamento) {
                        if ($request->tipo_pagamento[0] != '') {
                            for ($i = 0; $i < sizeof($tipoPagamento); $i++) {
                                FaturaNfe::create([
                                    'nfe_id' => $nfe->id,
                                    'tipo_pagamento' => $tipoPagamento[$i],
                                    'data_vencimento' => $request->data_vencimento[$i],
                                    'valor' => __convert_value_bd($request->valor_fatura[$i])
                                ]);
                            }
                        }
                        if ($request->gerar_conta_receber) {
                            for ($i = 0; $i < sizeof($tipoPagamento); $i++) {
                                //Alteração feita para colocar um 0 antes do numero da parcela. Se caso for menor que 10.
                                $parcela = $i;
                                $parcela = $parcela + 1;
                                if ($parcela < 10) {
                                    $numero_documento = $nfe->numero . '/0' . $parcela;
                                } else {
                                    $numero_documento = $nfe->numero . '/' . $parcela;
                                }
                                ContaReceber::create([
                                    'empresa_id' => $request->empresa_id,
                                    'numero_documento' => $numero_documento,
                                    'nfe_id' => $nfe->id,
                                    'cliente_id' => $cliente_id,
                                    'valor_integral' => __convert_value_bd($request->valor_fatura[$i]),
                                    'tipo_pagamento' => $tipoPagamento[$i],
                                    'data_vencimento' => $request->data_vencimento[$i],
                                    'local_id' => $caixa->local_id,
                                ]);
                            }
                        }
                    }
                }
                return $nfe;
            });
            session()->flash("flash_success", "Pedido alterado com sucesso!");
        } catch (\Exception $e) {
            echo $e->getMessage() . '<br>' . $e->getLine();
            session()->flash("flash_error", 'Algo deu errado: ' . $e->getMessage());
        }
        return redirect()->route('pedidos.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $pedido = Nfe::findOrFail($id);

        foreach ($pedido->itens as $item) {
            $item->delete();
        }
        $pedido->delete();
        session()->flash("flash_success", "Pedido removido!");
        return redirect()->route('pedidos.index');
    }


}
