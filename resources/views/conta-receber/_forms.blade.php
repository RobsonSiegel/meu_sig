<div class="row g-2">

    @if(__countLocalAtivo() > 1)
        <div class="col-md-2">
            <label for="">Local</label>

            <select id="inp-local_id" required class="select2 class-required" data-toggle="select2" name="local_id">
                <option value="">Selecione</option>
                @foreach(__getLocaisAtivoUsuario() as $local)
                    <option @isset($item) @if($item->local_id == $local->id) selected
                            @endif @endif value="{{ $local->id }}">{{ $local->descricao }}</option>
                @endforeach
            </select>
        </div>
    @else
        <input id="inp-local_id" type="hidden" value="{{ __getLocalAtivo() ? __getLocalAtivo()->id : '' }}"
               name="local_id">
    @endif
    <div class="col-md-2">
        @if(isset($item) && $item->numero_documento)
            {!!Form::text('numero_documento', 'Número Documento')
                ->value(isset($item) ? $item->numero_documento : '')
                ->readOnly()
            !!}
        @else
            {!!Form::text('numero_documento', 'Número Documento')->required()!!}
        @endif
    </div>
    <div class="col-md-3">
        {!!Form::text('descricao', 'Descrição')
        !!}
    </div>
    <div class="col-md-4">
        {!!Form::select('cliente_id', 'Cliente')->attrs(['class' => 'select2'])->required()->options(isset($item) ? [$item->cliente_id => $item->cliente->razao_social] : [])
        !!}
    </div>
    <div class="col-md-2">
        {!!Form::text('valor_integral', 'Valor Integral')->attrs(['class' => 'moeda'])->value(isset($item) ? __moeda($item->valor_integral) : '')->required()
        !!}
    </div>
    <div class="col-md-2">
        {!!Form::date('data_vencimento', 'Data Vencimento')->required()
        !!}
    </div>

    <div class="col-md-2">
        {!!Form::select('status', 'Conta Recebida', ['0' => 'Não', '1' => 'Sim'])->attrs(['class' => 'form-select'])->required()
        !!}
    </div>

    <div class="col-md-3">
        {!!Form::select('tipo_pagamento', 'Tipo Pagamento', App\Models\ContaReceber::tiposPagamento())->attrs(['class' => 'form-select'])->required()
        !!}
    </div>
    <div class="col-md-6">
        {!!Form::text('observacao', 'Observação')
        !!}
    </div>

    <hr class="mt-4">

    @if(!isset($item))
        <p class="text-danger">
            * Campo abaixo deve ser preenchido se ouver recorrência para este registro
        </p>

        <div class="col-md-2">
            {!!Form::tel('recorrencia', 'Data')
            ->attrs(['data-mask' => '00/00'])
            ->placeholder('mm/aa')
            !!}
        </div>
    @endif

    <div class="row tbl-recorrencia d-none mt-2">
    </div>

    <hr class="mt-4">
    <div class="col-12" style="text-align: right;">
        <button type="submit" class="btn btn-success px-5" id="btn-store">Salvar</button>
    </div>
</div>

@section('js')
    <script>
        $('#inp-recorrencia').blur(() => {
            let data = $('#inp-recorrencia').val()
            if (data.length == 5) {
                let vencimento = $('#inp-data_vencimento').val()
                let valor = $('#inp-valor_integral').val()
                if (valor && vencimento) {
                    let item = {
                        data: data
                        , vencimento: vencimento
                        , valor: valor
                    }
                    $.get(path_url + 'api/conta-receber/recorrencia', item)
                        .done((html) => {
                            $('.tbl-recorrencia').html(html)
                            $('.tbl-recorrencia').removeClass('d-none')

                        }).fail((err) => {
                        console.log(err)

                    })
                } else {
                    swal("Algo saiu errado", "Informe o valor e vencimento data conta base!", "warning")
                }
            } else {
                swal("Algo saiu errado", "Informe uma data válida mm/aa exemplo 12/25", "warning")
            }
        })

    </script>
@endsection
