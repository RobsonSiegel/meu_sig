@extends('relatorios.default')
@section('content')

    <table class="table-sm table-borderless"
           style="border-bottom: 1px solid rgb(206, 206, 206); margin-bottom:10px;  width: 100%;">
        <thead>
        <tr>
            <th style="width: 35%">Produto</th>
            <th>Estoque</th>
            <th>Comprado</th>
            <th>Vendido</th>
            <th>Est. Minímo</th>
            <th>Saldo</th>
            @if(__countLocalAtivo() > 1)
                <th>Local</th>
            @endif
        </tr>
        </thead>
        <tbody>
        @foreach($data as $item)
            <tr class="">
                <td style="align-items: start">
                    {{ $item->nome }}
                </td>

                @if ($item->qtd_estoque)
                    <td>
                        {{ number_format($item->qtd_estoque,2)  }}
                    </td>
                @else
                    <td>
                        {{ '0'  }}
                    </td>
                @endif
                {{--Quantidade Comprada--}}
                @if($item->qtd_compra)
                    <td>
                        {{ number_format($item->qtd_compra,2) }}
                    </td>
                @else
                    <td>
                        {{ '0' }}
                    </td>
                @endif
                {{--Quantidade Vendida--}}
                @if($item->qtd_venda)
                    <td>
                        {{ number_format($item->qtd_venda,2) }}
                    </td>
                @else
                    <td>
                        {{ '0' }}
                    </td>
                @endif
                {{--Estoque Minimo--}}
                @if($item->estoque_minimo > 0)
                    <td>
                        {{ number_format($item->estoque_minimo,2) }}
                    </td>
                @else
                    <td>
                        {{ '0,00' }}
                    </td>
                @endif
                <td>
                    {{ number_format($item->qtd_estoque - $item->estoque_minimo  -  $item->qtd_venda + $item->qtd_compra, 2) }}
                </td>
                @if(__countLocalAtivo() > 1)
                    <td class="text-danger">{{ $item->desc_localizacao }}</td>
                @endif
            </tr>
        @endforeach
        </tbody>
    </table>
@endsection
