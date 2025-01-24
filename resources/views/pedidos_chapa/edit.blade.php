@extends('layouts.app', ['title' => 'Editar Pedido'])
@section('content')

<div class="card mt-1">
    <div class="card-header">
        <h4>Editar Pedido</h4>
        <div style="text-align: right; margin-top: -35px;">
            <a href="{{ route('pedidos.index') }}" class="btn btn-danger btn-sm px-3">
                <i class="ri-arrow-left-double-fill"></i>Voltar
            </a>
        </div>
    </div>
    <div class="card-body">
        {!!Form::open()->fill($item)
        ->put()
        ->route('pedidos.update', [$item->id])
        ->multipart()
        !!}
        <div class="pl-lg-4">
            @include('pedidos_chapa._forms')
        </div>
        {!!Form::close()!!}
    </div>
</div>
@endsection
@section('js')
    <script type="text/javascript" src="/js/produto_chapa.js"></script>
@endsection
