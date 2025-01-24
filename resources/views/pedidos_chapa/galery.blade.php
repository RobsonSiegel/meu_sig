@extends('layouts.app', ['title' => 'Galeria do Pedido'])
@section('css')
    <style type="text/css">
        .img-ml {
            height: 200px;
            margin-left: auto;
            margin-right: auto;
            width: 50%;
        }
    </style>
@endsection
@section('content')
    <div class="card mt-1">
        <div class="card-header">
            <div>
                <h4>Galeria do Pedido: <strong>{{ $item->numero }}</strong></h4>
                <div style="text-align: right; margin-top: -35px;">
                    <a href="{{ route('pedidos.index') }}" class="btn btn-danger btn-sm px-3">
                        <i class="ri-arrow-left-double-fill"></i>Voltar
                    </a>
                </div>
            </div>

            <hr>
            <h4>Cliente: <strong>{{ $item->cliente->razao_social }}</strong></h4>
            <hr>
            <h4>Valor: R$ <strong>{{ $item->total }}</strong></h4>
        </div>
        @foreach($produtos as $produto)
            <div class="card-header">
                <h4>Produto: <strong>{{ $produto->produto->nome }}</strong></h4>
                <h4>Quantidade: <strong>{{ $produto->quantidade }}</strong></h4>
                <h4>Valor de Venda: R$ <strong>{{ $produto->sub_total }}</strong></h4>
                <img style="width: 300px" id="file-ip-1-preview" src="{{ asset('public/uploads/pedidos/' . $produto->imagem) }}"
                     alt="Imagem do Produto">
            </div>
        @endforeach
    </div>
@endsection
