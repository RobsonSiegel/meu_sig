@extends('layouts.app', ['title' => 'Setores'])
@section('content')
    <div class="mt-3">
        <div class="row">
            <div class="card">
                <div class="card-body">
                    <div class="col-md-2">
                        @can('marcas_create')
                            <a href="{{ route('setor.create') }}" class="btn btn-success">
                                <i class="ri-add-circle-fill"></i>
                                Novo Setor
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
                                <a id="clear-filter" class="btn btn-danger" href="{{ route('setor.index') }}"><i
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
                                    @can('setor_delete')
                                        <th>
                                            <div class="form-check form-checkbox-danger mb-2">
                                                <input class="form-check-input" type="checkbox"
                                                       id="select-all-checkbox">
                                            </div>
                                        </th>
                                    @endcan
                                    <th>Nome</th>
                                    <th>Status</th>
                                    <th width="10%">Ações</th>
                                </tr>
                                </thead>
                                <tbody>
                                @forelse($data as $item)
                                    <tr>
                                        @can('setor_delete')
                                            <td>
                                                <div class="form-check form-checkbox-danger mb-2">
                                                    <input class="form-check-input check-delete" type="checkbox"
                                                           name="item_delete[]" value="{{ $item->id }}">
                                                </div>
                                            </td>
                                        @endcan
                                        <td>{{ $item->nome }}</td>
                                        <td>
                                            @if($item->status)
                                                <i class="ri-checkbox-circle-fill text-success"></i>
                                            @else
                                                <i class="ri-close-circle-fill text-danger"></i>
                                            @endif
                                        </td>
                                        <td>
                                            <form action="{{ route('setor.destroy', $item->id) }}" method="post"
                                                  id="form-{{$item->id}}">
                                                @method('delete')
                                                @can('setor_edit')
                                                    <a class="btn btn-warning btn-sm text-white"
                                                       href="{{ route('setor.edit', [$item->id]) }}">
                                                        <i class="ri-pencil-fill"></i>
                                                    </a>
                                                @endcan
                                                @csrf
                                                @can('setor_delete')
                                                    <button type="button" class="btn btn-delete btn-sm btn-danger">
                                                        <i class="ri-delete-bin-line"></i>
                                                    </button>
                                                @endcan
                                            </form>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="2" class="text-center">Nada encontrado</td>
                                    </tr>
                                @endforelse
                                </tbody>
                            </table>
                            <br>
{{--                            @can('setor_delete')--}}
{{--                                <form action="{{ route('setor.destroy-select') }}" method="post"--}}
{{--                                      id="form-delete-select">--}}
{{--                                    @method('delete')--}}
{{--                                    @csrf--}}
{{--                                    <div></div>--}}
{{--                                    <button type="button" class="btn btn-danger btn-sm btn-delete-all" disabled>--}}
{{--                                        <i class="ri-close-circle-line"></i> Remover selecionados--}}
{{--                                    </button>--}}
{{--                                </form>--}}
{{--                            @endcan--}}
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
