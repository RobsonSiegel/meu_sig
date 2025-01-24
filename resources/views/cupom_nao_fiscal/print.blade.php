<!DOCTYPE html>
<html>
<head>
    <title>Venda {{$venda->id}}</title>
    <style>

        body {
            font-family: Arial, sans-serif;
            font-size: 12px;
            margin: 0;
            padding: 0;
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
            margin: 0px 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 10px;
        }

        th, td {
            padding: 5px;
            text-align: left;
        }

        .totais {
            display: flex;
            justify-content: space-between;
            padding: 0 5px;
        }
    </style>
</head>
<body>
<div class="content">
    <label class="titulo">{{$config->nome}}</label><br>
    <label class="titulo">CNPJ: {{$config->cpf_cnpj}} IE: {{$config->ie}}</label><br>
    <label class="titulo">{{$config->rua}}, {{$config->numero}}, {{$config->bairro}}, {{$config->cidade->nome}} - {{$config->UF}} Fone: {{$config->celular}}</label>
</div>
<hr class="linha-tracejada">
<div class="content">
    <label class="titulo">DOCUMENTO AUXILIAR DE VENDA</label>
    <br>
    <label class="titulo">NÃO É DOCUMENTO FISCAL</label>
    <br>
    <label class="titulo">NÃO COMPROVA PAGAMENTO</label>
</div>
<hr class="linha-tracejada">
<table>
    <tr>
        <th>Código</th>
        <th>Descrição</th>
        <th>Qtde</th>
        <th>Vl Unit.</th>
        <th>Vl Total</th>
    </tr>
    @php
        $somaItens = 0;
        $somaTotalItens = 0;
    @endphp

    @foreach($venda->itens as $i)
        <tr>

            <td>{{$i->produto->id}}</td>
            <td>{{$i->produto->nome}}{{$i->produto->grade ? " (" . $i->produto->str_grade . ")" : ""}}</td>
            <td>{{number_format($i->quantidade, 2, ',', '.')}}</td>
            <td>{{number_format($i->valor_unitario, 2, ',', '.')}}</td>
            <td>{{number_format($i->sub_total, 2, ',', '.')}}</td>
        </tr>

        @php
            $somaItens += $i->quantidade;
            $somaTotalItens += $i->quantidade * $i->valor_unitario;
        @endphp
    @endforeach
</table>
<hr class="linha-tracejada">
<div class="totais"><label>Qtde total de itens:</label><label>{{$somaItens}}</label></div>
<div class="totais"><label>Valor Total R$:</label><label>{{number_format($somaTotalItens, 2, ',', '.')}}</label></div>
<div class="totais"><label>Desconto R$:</label><label>{{number_format(max($venda->desconto, 0), 2, ',', '.')}}</label></div>
<div class="totais"><label><strong>Valor a Pagar R$:</strong></label><label><strong>{{number_format($somaTotalItens, 2, ',', '.')}}</strong></label></div>
<hr class="linha-tracejada">
<div class="totais"><label>Forma de Pagamento</label><label>Valor Pago R$</label></div>
<div class="totais"><label>{{$venda->tipo_pagamento}}</label><label>{{$venda->dinheiro_recebido}}</label></div>
<div class="totais"><label>Troco R$:</label><label>{{$venda->troco}}</label></div>
<hr class="linha-tracejada">
<div class="content">
    <label class="titulo">{{$venda->cliente_nome}} - CPF {{$venda->cliente_cpf_cnpj}}</label><br>
    <label class="titulo">Data de Emissão: {{$venda->created_at}}</label><br>
    <label class="titulo">Obrigado pela sua preferência.</label>
    <hr class="linha-tracejada">
    <br>
    <br>
</div>

</body>
</html>
