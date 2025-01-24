@extends('layouts.app', ['title' => 'Pedidos'])
@section('content')
    <div class="mt-3">
        <div class="row">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        @can('nfe_create')
                            <div class="col-md-2">
                                <a href="{{ route('pedidos.create') }}" class="btn btn-success">
                                    <i class="ri-add-circle-fill"></i>
                                    Novo Pedido
                                </a>
                            </div>
                        @endcan

                    </div>
                    <hr class="mt-3">
                    <div class="col-lg-12">
                        {!!Form::open()->fill(request()->all())
                        ->get()
                        !!}
                        <div class="row mt-3 g-1">
                            <div class="col-md-4">
                                {!!Form::select('cliente_id', 'Cliente')
                                ->attrs(['class' => 'select2'])
                                !!}
                            </div>
                            <div class="col-md-2">
                                {!!Form::date('start_date', 'Data inicial')
                                !!}
                            </div>
                            <div class="col-md-2">
                                {!!Form::date('end_date', 'Data final')
                                !!}
                            </div>
                            <div class="col-lg-4 col-12">
                                <br>

                                <button class="btn btn-primary" type="submit"><i class="ri-search-line"></i>Pesquisar
                                </button>
                                <a id="clear-filter" class="btn btn-danger" href="{{ route('pedidos.index') }}"><i
                                        class="ri-eraser-fill"></i>Limpar</a>
                            </div>
                        </div>
                        {!!Form::close()!!}
                    </div>
                    <div class="col-md-12 mt-3">
                        <div class="table-responsive">
                            <table class="table table-striped table-centered mb-0">
                                <thead class="table-dark">
                                <tr>
                                    <th>Cliente</th>
                                    <th>CPF/CNPJ</th>
                                    <th>Número</th>
                                    <th>Valor</th>
                                    <th>Data</th>
                                    <th>Ações</th>
                                </tr>
                                </thead>
                                <tbody>
                                @forelse($data as $item)
                                    <tr>
                                        <td>{{ $item->cliente ? $item->cliente->razao_social : "--" }}</td>
                                        <td>{{ $item->cliente ? $item->cliente->cpf_cnpj : "--" }}</td>
                                        <td>{{ $item->numero ? $item->numero : '' }}</td>
                                        <td>{{ __moeda($item->total) }}</td>
                                        <td>{{ __data_pt($item->created_at) }}</td>
                                        <td>
                                            <form action="{{ route('pedidos.destroy', $item->id) }}" method="post"
                                                  id="form-{{$item->id}}" style="width: 200px">
                                                @method('delete')
                                                @csrf
                                                {{--   Editar  --}}
                                                @if($item->estado == 'novo')
                                                    @can('nfe_edit')
                                                        <a class="btn btn-warning btn-sm"
                                                           href="{{ route('pedidos.edit', $item->id) }}">
                                                            <i class="ri-edit-line"></i>
                                                        </a>
                                                    @endcan

                                                    {{--  Deletar  --}}
                                                    @can('nfe_delete')
                                                        @if($item->estado == 'novo')
                                                            <button type="button"
                                                                    class="btn btn-danger btn-sm btn-delete">
                                                                <i class="ri-delete-bin-line"></i></button>
                                                        @endif
                                                    @endcan
                                                @endif

                                                {{--  Detalhes--}}
                                                <a class="btn btn-ligth btn-sm" title="Detalhes"
                                                   href="{{ route('nfe.show', $item->id) }}"><i class="ri-eye-line"></i></a>.

                                                {{-- Galeria --}}
                                                <a class="btn btn-dark btn-sm text-white" href="{{ route('pedidos.galery', [$item->id]) }}">
                                                    <i class="ri-image-edit-line"></i>
                                                </a>

                                                {{--   Enviar Email--}}
                                                @if($item->estado == 'aprovado' && $item->enviado_email == 0)
                                                    <a class="btn btn-primary btn-sm" title="Enviar Email"
                                                       href="{{ route('nfe.enviar-email', [$item->id]) }}">
                                                        <i class="ri-mail-send-line"></i>
                                                    </a>
                                                @endif

                                            </form>

                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="13" class="text-center">Nada encontrado</td>
                                    </tr>
                                @endforelse
                                </tbody>
                            </table>
                        </div>
                        {!! $data->appends(request()->all())->links() !!}
                    </div>
                    <h5 class="mt-2">Soma: <strong class="text-success">R$ {{ __moeda($data->sum('total')) }}</strong>
                    </h5>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modal-print" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Imprimir NFe <strong class="ref-numero"></strong>
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-12 col-lg-4">
                            <button type="button" class="btn btn-success w-100" onclick="gerarDanfe('danfe')">
                                <i class="ri-printer-line"></i>
                                DANFE
                            </button>
                        </div>

                        <div class="col-12 col-lg-4">
                            <button type="button" class="btn btn-primary w-100" onclick="gerarDanfe('simples')">
                                <i class="ri-printer-line"></i>
                                DANFE Simples
                            </button>
                        </div>

                        <div class="col-12 col-lg-4">
                            <button type="button" class="btn btn-dark w-100" onclick="gerarDanfe('etiqueta')">
                                <i class="ri-printer-line"></i>
                                DANFE Etiqueta
                            </button>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('js')
    <script type="text/javascript" src="/js/nfe_transmitir.js"></script>
@endsection
