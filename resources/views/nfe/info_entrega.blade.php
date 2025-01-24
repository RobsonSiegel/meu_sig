@extends('layouts.app', ['title' => 'Informação de Entrega'])
@section('content')
<div class="mt-3">
    <div class="row">
        <div class="card">
            <div class="card-body">

                <h3>Produtos da Venda: {{$venda->id}} para o Cliente: {{$venda->cliente->razao_social}}</h3>
                {!!Form::open()
                ->post()
                ->route('nfe.setar-info-entrega')
                !!}
                <input type="hidden" name="venda_id[]" value="{{ $venda->id }}">
                 <div class="col-md-12 mt-3">
                    <div class="table-responsive-sm">
                        <table class="table table-striped table-centered mb-0">
                            <thead class="table-dark">
                                <tr>
                                    <th>Produto</th>
                                    <th>Quantidade</th>
                                    <th>Valor Unitário</th>
                                    <th>Valor Total</th>
                                </tr>
                            </thead>
                            <tbody>

                                @forelse($produtos as $item)
                                <tr>
                                    <td>

                                        <input type="hidden" name="produto_id[]" value="{{ $item->produto_id }}">
                                        <input class="form-control" readonly type="text" name="produto_nome[]" value="{{ $item->produto->nome }}">
                                    </td>
                                    <td class="col-2">
                                        <input value="{{ __moeda($item->quantidade) }}" class="form-control qtd" type="tel" name="quantidade[]" id="qtd">
                                    </td>
                                    <td class="col-2">
                                        <input value="{{ __moeda($item->valor_unitario) }}" class="form-control moeda valor_unit" type="tel" name="valor_unitario[]" id="valor_unit" readonly>
                                    </td>
                                    <td class="col-2">
                                        <input type="tel" name="sub_total[]" required class="form-control sub_total" value="{{ $item->sub_total }}" readonly>
                                    </td>
                                </tr>
                                @empty
                                <tr>
                                    <td colspan="3" class="text-center">Nada encontrado</td>
                                </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                    <div class="col-12" style="text-align: right;">
                        <button type="submit" class="btn btn-success btn-salvar-nfe px-5 m-3">Salvar</button>
                    </div>
                </div>
                {!!Form::close()!!}
            </div>
        </div>
    </div>
</div>
<script>

    document.addEventListener('DOMContentLoaded', function() {
        // Seleciona todos os inputs de quantidade e valor unitário
        const quantidadeInputs = document.querySelectorAll('.qtd');
        const valorUnitarioInputs = document.querySelectorAll('.valor_unit');
        const subTotalInputs = document.querySelectorAll('.sub_total');

        function calculateSubTotal() {
            quantidadeInputs.forEach((quantidadeInput, index) => {
                const valorUnitarioInput = valorUnitarioInputs[index];
                const subTotalInput = subTotalInputs[index];

                const quantidade = parseFloat(quantidadeInput.value.replace(/\./g, '').replace(',', '.')) || 0;
                const valorUnitario = parseFloat(valorUnitarioInput.value.replace(/\./g, '').replace(',', '.')) || 0;
                const subTotal = quantidade * valorUnitario;

                subTotalInput.value = subTotal.toFixed(2); // Formata o resultado com 2 casas decimais
            });
        }

        // Adiciona eventos de escuta aos inputs de quantidade e valor unitário
        quantidadeInputs.forEach(input => input.addEventListener('input', calculateSubTotal));
        valorUnitarioInputs.forEach(input => input.addEventListener('input', calculateSubTotal));

        // Calcula o subtotal ao carregar a página
        calculateSubTotal();
    });
</script>

@endsection

