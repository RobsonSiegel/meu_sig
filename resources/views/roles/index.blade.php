@extends('layouts.app', ['title' => 'Atribuições'])
@section('content')
<div class="mt-3">
    <div class="row">
        <div class="card">
            <div class="card-body">
                <div class="col-md-12">
                    <a href="{{ route('roles.create') }}" class="btn btn-success">
                        <i class="ri-add-circle-fill"></i>
                        Nova Atribuição
                    </a>
                    <button class="btn btn-info btn-cad" data-bs-toggle="modal" data-bs-target="#modal-cad">
                        <i class="ri-file-copy-line"></i>
                        Copiar Atribuições
                    </button>
                </div>
                <hr class="mt-3">
                <div class="col-lg-12">
                    {!!Form::open()->fill(request()->all())
                    ->get()
                    !!}
                    <div class="row mt-3">
                        <div class="col-md-3">
                            {!!Form::text('descricao', 'Pesquisar por descrição')
                            !!}
                        </div>
                        <div class="col-md-3">
                            {!!Form::select('empresa', 'Pesquisar por empresa')
                            ->options($empresa ? [$empresa->id => $empresa->nome] : [])
                            !!}
                        </div>
                        <div class="col-md-3 text-left ">
                            <br>
                            <button class="btn btn-primary" type="submit"> <i class="ri-search-line"></i>Pesquisar</button>
                            <a id="clear-filter" class="btn btn-danger" href="{{ route('roles.index') }}"><i class="ri-eraser-fill"></i>Limpar</a>
                        </div>
                    </div>
                    {!!Form::close()!!}
                </div>

                <div class="col-md-12 mt-3 table-responsive">
                    <h5>Total de registros: <strong class="text-success">{{ $data->total() }}</strong></h5>

                    <div class="table-responsive-sm">
                        <table class="table table-striped table-centered mb-0">
                            <thead class="table-dark">
                                <tr>
                                    <th>Nome</th>
                                    <th>Descrição</th>
                                    <th>Empresa</th>
                                    <th>Data de cadastro</th>
                                    <th>Data de atualização</th>
                                    <th width="10%">Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($data as $item)
                                <tr>

                                    <td>{{ $item->name }}</td>
                                    <td>{{ $item->description }}</td>
                                    <td>{{ $item->empresa ? $item->empresa->nome : '' }}</td>
                                    <td>{{ __data_pt($item->created_at) }}</td>
                                    <td>{{ __data_pt($item->updated_at) }}</td>
                                    <td>
                                        @if($item->name != 'gestor_plataforma')
                                        <form action="{{ route('roles.destroy', $item->id) }}" method="post" id="form-{{$item->id}}">
                                            @method('delete')
                                            <a class="btn btn-warning btn-sm" href="{{ route('roles.edit', [$item->id]) }}">
                                                <i class="ri-pencil-fill"></i>
                                            </a>
                                            @csrf
                                            <button type="button" class="btn btn-delete btn-sm btn-danger">
                                                <i class="ri-delete-bin-line"></i>
                                            </button>
                                        </form>
                                        @endif
                                    </td>
                                </tr>
                                @empty
                                <tr>
                                    <td colspan="6" class="text-center">Nada encontrado</td>
                                </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
                <br>
                {!! $data->appends(request()->all())->links() !!}
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modal-cad" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <form class="modal-content" method="post" action="{{ route('roles.inserir-atribuicao-empresa') }}">
            @csrf
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Atribuir Configuração</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-6">
                        {!!Form::select('empresa_atribuir', 'Empresa')
                        ->required()
                        ->attrs(['class' => 'select2 empresa'])
                        !!}
                    </div>

                    <div class="col-md-3">

                        <label>Atribuição</label>
                        <select required id="atribuicao" name="atribuicao_id" class="form-select select2">
                            <option value="">Selecione</option>
                            @foreach($atribuicoes as $p)
                                <option value="{{ $p->id }}" data-valor="{{ $p->id }}">{{ $p->name }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Fechar</button>
                <button type="submit" class="btn btn-success">Salvar</button>
            </div>
        </form>
    </div>
</div>
@endsection

@section('js')
    <script type="text/javascript">
        $(function(){
            setTimeout(() => {
                $("#modals-cad .empresa").select2({
                    minimumInputLength: 2,
                    language: "pt-BR",
                    placeholder: "Digite para buscar a empresa",
                    width: "100%",
                    theme: "bootstrap4",
                    dropdownParent: $('#modals-cad'),
                    ajax: {
                        cache: true,
                        url: path_url + "api/empresas/find-all",
                        dataType: "json",
                        data: function (params) {

                            var query = {
                                pesquisa: params.term,
                            };
                            return query;
                        },
                        processResults: function (response) {
                            var results = [];

                            $.each(response, function (i, v) {
                                var o = {};
                                o.id = v.id;

                                o.text = v.info;
                                o.value = v.id;
                                results.push(o);
                            });
                            return {
                                results: results,
                            };
                        },
                    },
                });
            }, 200)

        });

        $(document).on("change", "#plano", function () {
            if($(this).val()){
                let empresa_id = $('#inp-empresa_atribuir').val()

                $.get(path_url + 'api/planos/find', {empresa_id: empresa_id, plano_id: $(this).val()})
                    .done((res) => {
                        console.log(res)
                        $('#inp-valor').val(convertFloatToMoeda(res.valor))
                    })
                    .fail((err) => {
                        console.log(err)
                        swal("Erro", "Algo deu errado", "error")
                    })
            }else{
                $('#inp-valor').val(convertFloatToMoeda(0))
            }
        });

    </script>
@endsection
