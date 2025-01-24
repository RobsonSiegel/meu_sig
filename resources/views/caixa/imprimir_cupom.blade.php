<!DOCTYPE html>
<html>
<head>
    <title>Fechamento de Caixa</title>
    <style>

        body {
            font-family: Arial, sans-serif;
            font-size: 12px;
            margin: 0mm;
            width: 80mm;
        }

        .content {
            padding: 5px;
            text-align: center;
        }

        .titulo {
            font-size: 12px;
        }

        .linha-tracejada {
            border-top: 1px dashed #000;
            margin: 0px 0px;
        }
        .assinatura{
            display: flex;
            justify-content: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 10px;
        }
        .totais-pagamento {
            display: flex;
            justify-content: space-between;
            padding-left: 5px;
            padding-right: 5px;
        }

    </style>
</head>
@php
    $valorEmDinheiro = 0;
    $valorCartaoCredito = 0;
    $valorCartaoDebito = 0;
    $valorPix = 0;
    $difDinheiro = 0;
    $difCartaoCredito = 0;
    $difCartaoDebito = 0;
    $difPix = 0;
@endphp
<body>
<div class="content">
    <label class="titulo">{{$config->nome}}</label><br>
    <label class="titulo">CNPJ: {{$config->cpf_cnpj}} IE: {{$config->ie}}</label><br>
    <label class="titulo">{{$config->rua}}, {{$config->numero}}, {{$config->bairro}}, {{$config->cidade->nome}}
        - {{$config->UF}} Fone: {{$config->celular}}</label>
</div>
<hr class="linha-tracejada">
<div class="content">
    <label class="titulo">Operador (a): {{$usuario->name}}</label>
    <br>
    <label class="titulo">Data de abertura: {{\Carbon\Carbon::parse($item->created_at)->format('d/m/Y')}}</label>
    <br>
    <label class="titulo">Data de fechamento: {{\Carbon\Carbon::parse($item->updated_at)->format('d/m/Y')}}</label>
    <br>
</div>
<hr class="linha-tracejada">
<div style="padding: 5px">
    <label>
        <strong>Recebimentos:</strong>
    </label>
</div>
<hr class="linha-tracejada">
<table>
    @php  $soma = 0; @endphp
    @foreach($somaTiposPagamento as $key => $tp)
        @if($tp > 0)
            <tr class="totais-pagamento">
                <td>
                    {{App\Models\Nfce::getTipoPagamento($key)}}
                </td>
                <td>
                    <strong>R$ {{number_format($tp, 2, ',', '.')}}</strong>
                </td>
            </tr>
            @php
                if($key == '01')
                    $valorEmDinheiro = $tp;
                if($key == '03')
                    $valorCartaoCredito = $tp;
                if($key == '04')
                    $valorCartaoDebito = $tp;
                if($key == '17')
                    $valorPix = $tp;
            @endphp
        @endif
        @php
            $soma += $tp;
        @endphp
    @endforeach
</table>
<hr class="linha-tracejada">
<div class="totais-pagamento" style="padding: 5px">
    <label>
        <strong>Totais dos recebimentos:</strong>
    </label>
    <label>
        <strong>R$ {{number_format($soma, 2, ',', '.')}}</strong>
    </label>
</div>
<hr class="linha-tracejada">
<div style="padding: 5px">
    <label>
        <strong>Valores informados pelo usuário:</strong>
    </label>
</div>
<hr class="linha-tracejada">
<table>
    <tr class="totais-pagamento">
        <td>
            Valor em Dinheiro:
        </td>
        <td>
            <strong>R$ {{number_format($item->valor_dinheiro, 2, ',', '.')}}</strong>
        </td>
    </tr>
    <tr class="totais-pagamento">
        <td>
            Valor em Cartão de Crédito:
        </td>
        <td>
            <strong>R$ {{number_format($item->valor_cartao_credito, 2, ',', '.')}}</strong>
        </td>
    </tr>
    <tr class="totais-pagamento">
        <td>
            Valor em Cartão de Débito:
        </td>
        <td>
            <strong>R$ {{number_format($item->valor_cartao_debito, 2, ',', '.')}}</strong>
        </td>
    </tr>
    <tr class="totais-pagamento">
        <td>
            Valor em Pix:
        </td>
        <td>
            <strong>R$ {{number_format($item->valor_pix, 2, ',', '.')}}</strong>
        </td>
    </tr>
</table>
<hr class="linha-tracejada">
<div class="totais-pagamento" style="padding: 5px">
    @php
        $somaUsuario = $item->valor_dinheiro + $item->valor_cartao_credito + $item->valor_cartao_debito + $item->valor_pix
    @endphp
    <label>
        <strong>Totais dos valores:</strong>
    </label>
    <label>
        <strong>R$ {{number_format($somaUsuario, 2, ',', '.')}}</strong>
    </label>
</div>
<hr class="linha-tracejada">
<div style="padding: 5px">
    <label>
        <strong>Diferenças encontradas:</strong>
    </label>
</div>
<hr class="linha-tracejada">
<table>
    <tr class="totais-pagamento">
        <td>
            Valor em Dinheiro:
        </td>
        @php
            $difDinheiro =$item->valor_dinheiro -  $valorEmDinheiro;
        @endphp
        <td>
            <strong>R$ {{number_format($difDinheiro, 2, ',', '.')}}</strong>
        </td>
    </tr>
    <tr class="totais-pagamento">
        <td>
            Valor em Cartão de Crédito:
        </td>
        @php
            $difCartaoCredito =$item->valor_cartao_credito -  $valorCartaoCredito;
        @endphp
        <td>
            <strong>R$ {{number_format($difCartaoCredito, 2, ',', '.')}}</strong>
        </td>
    </tr>
    <tr class="totais-pagamento" >
        <td>
            Valor em Cartão de Débito:
        </td>
        @php
            $difCartaoDebito = $item->valor_cartao_debito - $valorCartaoDebito;
        @endphp
        <td>
            <strong>R$ {{number_format($difCartaoDebito, 2, ',', '.')}}</strong>
        </td>
    </tr>
    <tr class="totais-pagamento">
        <td>
            Valor em Pix:
        </td>
        @php
            $difPix = $item->valor_pix - $valorPix;
        @endphp
        <td>
            <strong>R$ {{number_format($difPix, 2, ',', '.')}}</strong>
        </td>
    </tr>
</table>
<hr class="linha-tracejada">
<div class="totais-pagamento" style="padding: 5px">
    @php
        $somaDiferencas = $difDinheiro + $difCartaoCredito + $difCartaoDebito + $difPix;
    @endphp
    <label>
        <strong>Totais de diferenças:</strong>
    </label>
    <label>
        <strong>R$ {{number_format($somaDiferencas, 2, ',', '.')}}</strong>
    </label>
</div>
<hr class="linha-tracejada">
<div style="padding: 5px">
    <label>
        <strong>Suprimentos (+): </strong>
    </label>
</div>
<hr class="linha-tracejada">
<table style="margin-top: 5px">
    @foreach($suprimentos as $sup)
        <tr class="totais-pagamento">

            <td>
                {{$sup->observacao}}
            </td>
            <td>
                <strong>R$ {{number_format($sup->valor, 2, ',', '.')}}</strong>
            </td>
        </tr>

    @endforeach
</table>
<hr class="linha-tracejada">
<div style="padding: 5px">
    <label>
        <strong>Sangrias (-):</strong>
    </label>
</div>
<hr class="linha-tracejada">
<table style="margin-top: 5px">

    @foreach($sangrias as $sang)
        <tr class="totais-pagamento">
            <td>
                {{$sang->observacao}}
            </td>
            <td>
                <strong>R$ {{number_format($sang->valor, 2, ',', '.')}}</strong>
            </td>
        </tr>
    @endforeach
</table>
<hr class="linha-tracejada">
<div class="assinatura" style="margin-top: 25px">
   <div>
       <label>___________________</label>
   </div>
</div>
<div class="assinatura">
    <div>
        <label>Assinatura do operador</label>
    </div>
</div>

</body>
<footer>
    <div style="margin-top: 50px;display:flex;justify-content: center">
        <label>Meu SIG - www.meusig.com.br</label>
    </div>
    <div style="display:flex;justify-content: center">
        {{\Carbon\Carbon::parse($item->updated_at)->format('d/m/Y h:m')}}
    </div>
</footer>

</html>
