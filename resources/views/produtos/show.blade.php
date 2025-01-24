@extends('layouts.app', ['title' => 'Movimentações'])
@section('css')
    <style type="text/css">
        @page {
            size: auto;
            margin: 0mm;
        }

        @media print {
            .print {
                margin: 10px;
            }
        }
    </style>
@endsection
@section('content')
    <div class="mt-1 print">
        <div class="row">

            <div class="card">
                <div class="card-body">

                    <!-- Invoice Logo-->
                    <div class="clearfix">
                        <div class="float-start mb-3">
                            <img class="img-60" src="{{ $item->img }}" height="60">
                        </div>
                        <div class="float-end">
                            <h4 class="m-0">{{ $item->nome }}</h4>
                            <br>
                            <h5 class="m-0">Referência {{ $item->referencia }}</h5>
                        </div>
                    </div>

                    <!-- Invoice Detail-->
                    <div class="row">
                        <div class="col-sm-6">
                            <div class=" mt-3">
                                <p><b>Total de movimentações: <strong class="text-success">{{ sizeof($data) }}</strong></b>
                                </p>
                                <p><b>Categoria: <strong
                                            class="text-success">{{ $item->categoria ? $item->categoria->nome : '--' }}</strong></b>
                                </p>
                                <p><b>Marca: <strong
                                            class="text-success">{{ $item->marca ? $item->marca->nome : '--' }}</strong></b>
                                </p>
                                <p><b>Controla Estoque: <strong
                                            class="text-success">{{ $item->gerenciar_estoque == '1' ? 'Sim' : 'Não'}}
                                        </strong>
                                    </b>
                                </p>
                            </div>

                        </div><!-- end col -->
                        <div class="col-sm-4 offset-sm-2">
                            <div class="mt-3 float-sm-end">
                                <p class="fs-15"><strong>Valor de
                                        venda: </strong>R$ {{ __moeda($item->valor_unitario) }}</p>
                                <p class="fs-15"><strong>Valor de compra: </strong>R$ {{ __moeda($item->valor_compra) }}
                                </p>
                                <p class="fs-15"><strong>Data de
                                        cadastro: </strong>{{ __data_pt($item->created_at, 0) }}</p>
                            </div>
                        </div><!-- end col -->
                    </div>
                    <!-- end row -->
                    <div class="row">
                        <div class="col-12">
                            <div class="table-responsive">
                                <table class="table table-sm table-centered table-hover table-borderless mb-0 mt-3">
                                    <thead class="border-top border-bottom bg-light-subtle border-light">
                                    <tr>
                                        <th>#</th>
                                        <th>Data Movim.</th>
                                        <th>Quantidade</th>
                                        <th>Transação</th>
                                        <th>Tipo</th>
                                        <th class="d-print-none">Ação</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($data as $i)
                                        <tr>
                                            <td>{{ $i->id }}</td>
                                            <td>{{ __data_pt($i->created_at, true) }}</td>
                                            <td>{{ number_format($i->quantidade, 2) }}</td>
                                            @if($i->tipo_transacao == 'compra' || $i->tipo_transacao == 'alteracao_estoque' || $i->tipo_transacao == 'cancela_nfce')
                                                <td>{{ 'Entrada' }}</td>
                                            @else
                                                <td>{{ 'Saída' }}</td>
                                            @endif

                                            <td>{{ $i->tipoTransacao()  }}</td>
                                            @if ($i->tipo !== 'incremento')
                                                <td class="d-print-none">
                                                    <a class="btn btn-dark btn-sm"
                                                       href="{{ route('produtos.movimentacao', [$i->id]) }}">
                                                        Visualizar
                                                    </a>
                                                </td>
                                            @endif
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div> <!-- end table-responsive-->
                        </div> <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                        <div class="col-sm-6">
                            <div class="clearfix pt-3">

                            </div>
                        </div> <!-- end col -->
                        <div class="col-sm-6">
                            <div class="float-end mt-3">
                                <p><b>Total Entradas: </b>
                                    <span class="float-end ml-1" style="margin-left: 3px">
                                    {{ number_format($total_entrada->sum('quantidade'), 2) }}
                                </span>
                                </p>
                                <p><b>Total Saídas: </b>
                                    <span class="float-end ml-1" style="margin-left: 3px">
                                    {{ number_format($total_saida->sum(['quantidade']), 2) }}
                                </span>
                                </p>
                                <p><b>Saldo: </b>
                                    <span class="float-end ml-1" style="margin-left: 3px">
                                    {{ number_format( $total_entrada->sum('quantidade') - $total_saida->sum(['quantidade']), 2) }}
                                </span>
                                </p>

                            </div>
                            <div class="clearfix"></div>
                        </div> <!-- end col -->
                    </div>
                    <!-- end row-->
                    <div class="d-print-none mt-4">
                        <div class="text-end">
                            <a href="javascript:window.print()" class="btn btn-primary"><i class="ri-printer-line"></i>
                                Imprimir</a>
                        </div>
                    </div>
                    <!-- end buttons -->

                </div>
            </div>
        </div>
    </div>
@endsection
