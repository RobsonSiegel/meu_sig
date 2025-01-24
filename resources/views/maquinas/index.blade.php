@extends('layouts.app', ['title' => 'Máquinas'])
@section('content')
    <div class="mt-3">
        <div class="row">
            <div class="card">
                <div class="card-body">
                    <div class="col-md-2">
                        @can('marcas_create')
                            <a href="{{ route('maquinas.create') }}" class="btn btn-success">
                                <i class="ri-add-circle-fill"></i>
                                Nova Máquina
                            </a>
                        @endcan
                    </div>
                    <hr class="mt-3">
                    <div class="col-lg-12">
                        {!!Form::open()->fill(request()->all())
                        ->get()
                        !!}
                        <div class="row mt-3">
                            <div class="col-md-4">
                                {!!Form::text('nome', 'Pesquisar por nome')
                                !!}
                            </div>
                            <div class="col-md-3 text-left ">
                                <br>
                                <button class="btn btn-primary" type="submit"><i class="ri-search-line"></i>Pesquisar
                                </button>
                                <a id="clear-filter" class="btn btn-danger" href="{{ route('maquinas.index') }}"><i
                                        class="ri-eraser-fill"></i>Limpar</a>
                            </div>
                        </div>
                        {!!Form::close()!!}
                    </div>
                    <div class="col-md-12 mt-3">
                        <div class="table-responsive-sm">
                            <table class="table table-striped table-centered mb-0">
                                <thead class="table-dark">
                                <tr>
                                    @can('maquina_delete')
                                        <th>
                                            <div class="form-check form-checkbox-danger mb-2">
                                                <input class="form-check-input" type="checkbox"
                                                       id="select-all-checkbox">
                                            </div>
                                        </th>
                                    @endcan
                                    <th>Nome</th>
                                    <th>Valor Hora</th>
                                    <th>Tipo Processo</th>
                                    <th>Setor</th>
                                    <th>Movimenta Estoque</th>
                                    <th>Status</th>
                                    <th width="10%">Ações</th>
                                </tr>
                                </thead>
                                <tbody>
                                @forelse($data as $item)
                                    <tr>
                                        @can('maquina_delete')
                                            <td>
                                                <div class="form-check form-checkbox-danger mb-2">
                                                    <input class="form-check-input check-delete" type="checkbox"
                                                           name="item_delete[]" value="{{ $item->id }}">
                                                </div>
                                            </td>
                                        @endcan
                                        <td>{{ $item->nome }}</td>
                                        <td>{{ __moeda($item->valor_hora) }}</td>
                                        @if($item->tipo_processo == '01')
                                            <td>{{ 'Processo Interno' }}</td>
                                        @else
                                            <td>{{ 'Processo Externo' }}</td>
                                        @endif

                                        <td><label
                                                style="width: 100px">{{ $item->setor_id ? $item->setor->nome : '--' }}</label>
                                        </td>
                                        <td>
                                            @if($item->movimenta_estoque)
                                                <i class="ri-checkbox-circle-fill text-success"></i>
                                            @else
                                                <i class="ri-close-circle-fill text-danger"></i>
                                            @endif
                                        </td>
                                        <td>
                                            @if($item->status)
                                                <i class="ri-checkbox-circle-fill text-success"></i>
                                            @else
                                                <i class="ri-close-circle-fill text-danger"></i>
                                            @endif
                                        </td>

                                        <td>
                                            <form action="{{ route('maquinas.destroy', $item->id) }}" method="post"
                                                  id="form-{{$item->id}}">
                                                @method('delete')
                                                @can('maquina_edit')
                                                    <a class="btn btn-warning btn-sm text-white"
                                                       href="{{ route('maquinas.edit', [$item->id]) }}">
                                                        <i class="ri-pencil-fill"></i>
                                                    </a>
                                                @endcan
                                                @csrf
                                                @can('maquina_delete')
                                                    <button type="button" class="btn btn-delete btn-sm btn-danger">
                                                        <i class="ri-delete-bin-line"></i>
                                                    </button>
                                                @endcan
                                            </form>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="4" class="text-center">Nada encontrado</td>
                                    </tr>
                                @endforelse
                                </tbody>
                            </table>
                            <br>
                            @can('maquinas_delete')
                                <form action="{{ route('maquinas.destroy-select') }}" method="post"
                                      id="form-delete-select">
                                    @method('delete')
                                    @csrf
                                    <div></div>
                                    <button type="button" class="btn btn-danger btn-sm btn-delete-all" disabled>
                                        <i class="ri-close-circle-line"></i> Remover selecionados
                                    </button>
                                </form>
                            @endcan
                        </div>
                    </div>
                    {{--                {!! $data->appends(request()->all())->links() !!}--}}
                </div>
            </div>
        </div>
    </div>
@endsection
@section('js')
    <script type="text/javascript" src="/js/delete_selecionados.js"></script>
@endsection
