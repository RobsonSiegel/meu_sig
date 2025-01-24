<div class="row g-2">
    <div class="col-md-3">
        {!!Form::text('nome', 'Nome')->required()
        !!}
    </div>
    <div class="col-md-2">
        {!!Form::tel('valor_hora', 'Valor Hora')
        ->required()
        ->value(isset($item) ? __moeda($item->valor_hora) : '')
        ->attrs(['class' => 'moeda'])
        !!}
    </div>
    <div class="col-md-2">
        {!!Form::select('status', 'Ativo', ['1' => 'Sim', '0' => 'Não'])
        ->attrs(['class' => 'form-select'])
        !!}
    </div>
    <div class="col-md-2">
        {!!Form::select('tipo_processo', 'Tipo Processo', ['01' => 'Processo Interno', '02' => 'Proesso Externo'])
        ->attrs(['class' => 'form-select'])
        !!}
    </div>
    <div class="col-md-2">
        {!!Form::select('movimenta_estoque', 'Movimenta Estoque', [true => 'Sim', false => 'Não'])
        ->attrs(['class' => 'form-select'])
        !!}
    </div>

    <div class="col-md-3">
        <label>Setor</label>
        <div class="input-group flex-nowrap">
            <select class="select2" name="setor_id" id="setor_id">
                <option value="">Selecione</option>
                @foreach($setores as $s)
                    <option @isset($item) @if($item->setor_id == $s->id) selected @endif @endif value="{{ $s->id}}">{{ $s->nome }}</option>
                @endforeach
            </select>
        </div>
    </div>
    <hr class="mt-4">
    <div class="col-12" style="text-align: right;">
        <button type="submit" class="btn btn-success px-5" id="btn-store">Salvar</button>
    </div>
</div>
