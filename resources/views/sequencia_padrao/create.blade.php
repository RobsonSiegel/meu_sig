@extends('layouts.app', ['title' => 'Nova Sequência Padrão'])
@section('content')
<div class="card mt-1">
    <div class="card-header">
        <h4>Sequência Padrão</h4>

        <div style="text-align: right; margin-top: -35px;">
            <a href="{{ route('seqpadrao.index') }}" class="btn btn-danger btn-sm px-3">
                <i class="ri-arrow-left-double-fill"></i>Voltar
            </a>
        </div>
    </div>
    <div class="card-body">
        {!!Form::open()
        ->post()
        ->route('seqpadrao.store')
        !!}
        <div class="pl-lg-4">
            @include('sequencia_padrao._forms')
        </div>
        {!!Form::close()!!}

    </div>
</div>
@endsection
