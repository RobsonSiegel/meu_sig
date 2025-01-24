<div class="row g-2">
    <div class="col-md-3">
        {!!Form::text('nome', 'Nome')->required()
        !!}
    </div>
    <div class="col-md-2">
        {!!Form::select('status', 'Ativo', ['1' => 'Sim', '0' => 'Não'])
        ->attrs(['class' => 'form-select'])
        !!}
    </div>

    <div class="col-md-4">
        <label for="setores">Setor</label>
        <select
            id="setores"
            required
            class="select2 form-control select2-multiple"
            data-toggle="select2"
            name="setores[]"
            multiple="multiple">


            @php
                // Verifica se o item existe e busca os setores
                $setores = __getTodosSetoresComAssociados($item->id ?? null);
            @endphp

            @foreach($setores as $setor)
                <option
                    value="{{ $setor['id'] }}"
                    @if(isset($item) && $setor['associado'])
                        selected
                    @endif>
                    {{ $setor['nome'] }}
                </option>
            @endforeach
        </select>
    </div>


    <hr class="mt-4">
    <div class="col-12" style="text-align: right;">
        <button type="submit" class="btn btn-success px-5" id="btn-store">Salvar</button>
    </div>
</div>


