@extends('layouts.app', ['title' => 'Importar Produtos'])
@section('css')
<style type="text/css">
    .btn-file {
        position: relative;
        overflow: hidden;
    }

    .btn-file input[type=file] {
        position: absolute;
        top: 0;
        right: 0;
        min-width: 100%;
        min-height: 100%;
        font-size: 100px;
        text-align: right;
        filter: alpha(opacity=0);
        opacity: 0;
        outline: none;
        background: white;
        cursor: inherit;
        display: block;
    }
</style>
@endsection
@section('content')

<div class="card mt-1">
    <div class="card-header">
        <h4>Importar Produtos</h4>
        <div style="text-align: right; margin-top: -35px;">
            <a href="{{ route('produtos.index') }}" class="btn btn-danger btn-sm px-3">
                <i class="ri-arrow-left-double-fill"></i>Voltar
            </a>
        </div>
    </div>
    <div class="card-body">
        <p>Campos com <span class="text-danger">*</span> são obrigatórios</p>
        <div class="row">
            <div class="col-12 col-md-6">
                <h5><strong class="text-primary">Nome </strong><span class="text-danger">*</span> - Texto</h5>
                <h5><strong class="text-primary">Categoria </strong> - Texto</h5>
                <h5><strong class="text-primary">Valor de venda </strong><span class="text-danger">*</span> - Moeda</h5>
                <h5><strong class="text-primary">Valor de compra</strong> - Moeda</h5>
                <h5><strong class="text-primary">NCM </strong><span class="text-danger">*</span> - Númerico</h5>
                <h5><strong class="text-primary">Código de barras</strong> - Texto</h5>
                <h5><strong class="text-primary">CEST</strong> - Númerico</h5>
                <h5><strong class="text-primary">CST ou CSOSN </strong><span class="text-danger">*</span> - Númerico</h5>
                <h5><strong class="text-primary">CST PIS </strong><span class="text-danger">*</span> - Númerico</h5>
                <h5><strong class="text-primary">CST COFINS </strong><span class="text-danger">*</span> - Númerico</h5>
                <h5><strong class="text-primary">CST IPI </strong><span class="text-danger">*</span> - Númerico</h5>
                <h5><strong class="text-primary">% Red. base de cálculo</strong> - Percentual</h5>
            </div>
            <div class="col-12 col-md-6">
                <h5><strong class="text-primary">Origem</strong> - Númerico</h5>
                <h5><strong class="text-primary">Código de enquadramento IPI</strong> - Númerico</h5>
                <h5><strong class="text-primary">CFOP estadual </strong><span class="text-danger">*</span> - Númerico</h5>
                <h5><strong class="text-primary">CFOP outro estado </strong><span class="text-danger">*</span> - Númerico</h5>
                <h5><strong class="text-primary">Código do benefício</strong> - Texto</h5>
                <h5><strong class="text-primary">Unidade</strong> - Texto</h5>
                <h5><strong class="text-primary">Gerenciar Estoque</strong> - Binário (Sim = 1 ou Não = 0)</h5>
                <h5><strong class="text-primary">% ICMS</strong> - Percentual</h5>
                <h5><strong class="text-primary">% PIS</strong> - Percentual</h5>
                <h5><strong class="text-primary">% COFINS</strong> - Percentual</h5>
                <h5><strong class="text-primary">% IPI</strong> - Percentual</h5>
                <h5><strong class="text-primary">Referência</strong> - Texto</h5>
            </div>
        </div>
        <div class="col-12 col-md-2">
            <a href="{{ route('produtos.import-download') }}" class="btn btn-primary">
                <i class="ri-file-download-line"></i>
                Download Modelo
            </a>
        </div>
    </div>
    <div class="card-footer">
        <hr>
        <form id="form-import" class="row" method="post" action="{{ route('produtos.import-store') }}" enctype="multipart/form-data">
            @csrf
            <p>Importar modelo preenchido</p>
            <div class="form-group validated col-12 col-lg-6">
                <label class="col-form-label">.xls/.xlsx</label>
                <div class="">
                    <span class="btn btn-success btn-file">
                        <i class="ri-file-search-line"></i>
                        Procurar arquivo<input accept=".xls, .xlsx" name="file" type="file" id="file">
                    </span>
                </div>
            </div>
        </form>
    </div>
</div>
@endsection
@section('js')
<script type="text/javascript">
    $('#file').change(function() {
        $('#form-import').submit();
        $body = $("body");
        $body.addClass("loading");
    });
</script>
@endsection
