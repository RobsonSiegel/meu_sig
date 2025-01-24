<html>
<head>
    <style type="text/css">
        /* --------------------- MARGENS DE PÁGINA (PDF) --------------------- */
        @page {
            margin: 0cm 0cm;
        }

        body {
            margin-top: 2cm;
            margin-left: 1cm;
            margin-right: 1cm;
            margin-bottom: 2cm;
            font-family: 'Arial', sans-serif; /* Fonte mais moderna */
            font-size: 0.9rem;
            color: #333;
        }

        /* ------------------------- ESTILOS DE HEADER ------------------------ */
        header {
            position: relative;
            padding: 0 40px;
            margin-bottom: 25px;
        }

        .headReport {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .headReport img {
            max-height: 80px;
        }

        .headReport .date small {
            color: #555;
            font-size: 0.8rem;
        }

        .headReport h4 {
            margin: 0;
            text-align: center;
        }

        /* ------------------------- ESTILOS DE FOOTER ------------------------ */
        footer {
            position: fixed;
            bottom: 1.9cm;
            left: 0.4cm;
            right: 0cm;
            height: 0cm;
        }

        #footer_imagem table {
            width: 100%;
            border-top: 1px solid #999;
            padding-top: 5px;
        }

        #footer_imagem td {
            font-size: 0.8rem;
            color: #555;
        }

        #footer_imagem img {
            max-height: 30px;
            float: right;
        }

        /* ------------------------- ESTILOS DE TABELAS ----------------------- */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 8px;
        }

        table thead {
            background-color: #f0f0f0;
            border-bottom: 2px solid #ccc;
        }

        table thead td {
            font-weight: 600;
            text-align: left;
            padding: 8px;
        }

        table td {
            vertical-align: top;
            padding: 4px;
        }

        /* Bordinhas simples para destacar partes importantes */
        .b-top {
            border-top: 1px solid #ccc;
        }

        .b-bottom {
            border-bottom: 1px solid #ccc;
        }

        /* --------------------- TÍTULOS E DESTAQUES -------------------------- */
        strong {
            color: #333;
        }

        /* Espaçamento vertical entre blocos de informações */
        .section-title {
            margin: 16px 0 8px 0;
            font-weight: bold;
            font-size: 1rem;
            text-transform: uppercase;
            border-bottom: 1px solid #ddd;
            padding-bottom: 4px;
        }

        /* -------------------- CLASSES UTILIZADAS (GRID) -------------------- */
        /*
          Mantenha as classes caso estejam em uso em outras partes do sistema
          ou para organização em possíveis layouts responsivos.
        */
        .row {
            display: flex;
            flex-wrap: wrap;
            margin-right: -15px;
            margin-left: -15px;
        }

        .col-1,
        .col-2,
        .col-3,
        .col-4,
        .col-5,
        .col-6,
        .col-7,
        .col-8,
        .col-9,
        .col-10,
        .col-11,
        .col-12 {
            position: relative;
            width: 100%;
            min-height: 1px;
            padding-right: 15px;
            padding-left: 15px;
        }

        .col-1 { flex: 0 0 8.333333%; max-width: 8.333333%; }
        .col-2 { flex: 0 0 16.666667%; max-width: 16.666667%; }
        .col-3 { flex: 0 0 25%; max-width: 25%; }
        .col-4 { flex: 0 0 33.333333%; max-width: 33.333333%; }
        .col-5 { flex: 0 0 41.666667%; max-width: 41.666667%; }
        .col-6 { flex: 0 0 50%; max-width: 50%; }
        .col-7 { flex: 0 0 58.333333%; max-width: 58.333333%; }
        .col-8 { flex: 0 0 66.666667%; max-width: 66.666667%; }
        .col-9 { flex: 0 0 75%; max-width: 75%; }
        .col-10 { flex: 0 0 83.333333%; max-width: 83.333333%; }
        .col-11 { flex: 0 0 91.666667%; max-width: 91.666667%; }
        .col-12 { flex: 0 0 100%; max-width: 100%; }

        /* ---------------------- CLASSES DE TEXTO E ALINHAMENTO-------------- */
        .text-left { text-align: left !important; }
        .text-right { text-align: right !important; }
        .text-center { text-align: center !important; }
        .text-justify { text-align: justify !important; }

        /* ------------------------- EXTRAS DE MARGEM ------------------------- */
        .mb-2 { margin-bottom: 0.5rem !important; }
        .mb-3 { margin-bottom: 1rem !important; }
        .mt-3 { margin-top: 1rem !important; }
        /* (Demais classes de espaçamento podem ser adicionadas conforme necessidade) */

        /* ----------------------- QUEBRA DE PÁGINA -------------------------- */
        .page_break {
            page-break-before: always;
        }
    </style>
</head>

<header>
    <div class="headReport" style="padding-top:1rem">
        @if($config->logo != null)
            <img src="{{ 'data:image/png;base64,' . base64_encode(file_get_contents(@public_path('/uploads/logos/' . $config->logo))) }}" alt="Logo">
        @else
            <img src="{{ 'data:image/png;base64,' . base64_encode(file_get_contents(@public_path('logo.png'))) }}" alt="Logo">
        @endif

        <div class="row text-right" style="flex:1; justify-content:flex-end;">
            <div class="col-12">
                <small class="float-right">
                    Emissão: {{ date('d/m/Y - H:i') }}
                </small>
            </div>
        </div>

        <div class="row" style="justify-content:center;">
            @if($item->tpNF == 1)
                <h4>Pedido de Venda</h4>
            @else
                <h4>Pedido de Compra</h4>
            @endif
        </div>
    </div>
</header>

<body>
<!-- DADOS DA EMPRESA -->
<table>
    <tr>
        <td class="text-left" style="width: 700px;">
            <strong>Dados da empresa</strong>
        </td>
    </tr>
</table>

<table>
    <tr>
        <td class="b-top text-left" style="width: 450px;">
            Razão social: <strong>{{ $config->nome }}</strong>
        </td>
        <td class="b-top" style="width: 247px;">
            Documento: <strong>{{ $config->cpf_cnpj }}</strong>
        </td>
    </tr>
</table>
<table>
    <tr>
        <td class="b-top text-left" style="width: 700px;">
            Endereço:
            <strong>
                {{ $config->rua }}, {{ $config->numero }} - {{ $config->bairro }} -
                {{ $config->cidade->nome }} ({{ $config->cidade->uf }})
            </strong>
        </td>
    </tr>
</table>
<table>
    <tr>
        <td class="b-top b-bottom text-left" style="width: 300px;">
            Complemento: <strong>{{ $config->complemento }}</strong>
        </td>
        <td class="b-top b-bottom text-left" style="width: 200px;">
            CEP: <strong>{{ $config->cep }}</strong>
        </td>
        <td class="b-top b-bottom text-left" style="width: 200px;">
            Telefone: <strong>{{ $config->celular }}</strong>
        </td>
    </tr>
</table>
<table>
    <tr>
        <td class="b-bottom text-left" style="width: 700px;">
            Email: <strong>{{ $config->email }}</strong>
        </td>
    </tr>
</table>

<br>

<!-- DADOS DO FORNECEDOR OU CLIENTE -->
@if($item->tpNF == 0)
    <!-- Fornecedor -->
    <table>
        <tr>
            <td class="text-left" style="width: 700px;">
                <strong>Dados do fornecedor</strong>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="b-top text-left" style="width: 450px;">
                Nome: <strong>{{ $item->fornecedor->razao_social }}</strong>
            </td>
            <td class="b-top" style="width: 247px;">
                CPF/CNPJ: <strong>{{ $item->fornecedor->cpf_cnpj }}</strong>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="b-top text-left" style="width: 500px;">
                Endereço:
                <strong>
                    {{ $item->fornecedor->rua }}, {{ $item->fornecedor->numero }}
                    - {{ $item->fornecedor->bairro }}
                    - {{ $item->fornecedor->cidade->nome }}
                    ({{ $item->fornecedor->cidade->uf }})
                </strong>
            </td>
            <td class="b-top text-left" style="width: 200px;">
                CEP: <strong>{{ $item->fornecedor->cep }}</strong>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="b-top text-left" style="width: 300px;">
                Complemento: <strong>{{ $item->fornecedor->complemento }}</strong>
            </td>
            <td class="b-top text-left" style="width: 200px;">
                Telefone: <strong>{{ $item->fornecedor->telefone }}</strong>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="b-top text-left" style="width: 700px;">
                Email: <strong>{{ $item->fornecedor->email }}</strong>
            </td>
        </tr>
    </table>
@else
    <!-- Cliente -->
    <table>
        <tr>
            <td class="text-left" style="width: 700px;">
                <strong>Dados do cliente</strong>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="b-top text-left" style="width: 450px;">
                Nome: <strong>{{ $item->cliente->razao_social }}</strong>
            </td>
            <td class="b-top" style="width: 247px;">
                CPF/CNPJ: <strong>{{ $item->cliente->cpf_cnpj }}</strong>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="b-top text-left" style="width: 500px;">
                Endereço:
                <strong>
                    {{ $item->cliente->rua }}, {{ $item->cliente->numero }}
                    - {{ $item->cliente->bairro }}
                    - {{ $item->cliente->cidade->nome }}
                    ({{ $item->cliente->cidade->uf }})
                </strong>
            </td>
            <td class="b-top text-left" style="width: 200px;">
                CEP: <strong>{{ $item->cliente->cep }}</strong>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="b-top text-left" style="width: 300px;">
                Complemento: <strong>{{ $item->cliente->complemento }}</strong>
            </td>
            <td class="b-top text-left" style="width: 200px;">
                Telefone: <strong>{{ $item->cliente->telefone }}</strong>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="b-top text-left" style="width: 700px;">
                Email: <strong>{{ $item->cliente->email }}</strong>
            </td>
        </tr>
    </table>
@endif

<table>
    <tr>
        <td class="b-top text-left" style="width: 350px;">
            Nº Doc: <strong>{{ $item->numero_sequencial }}</strong>
        </td>
        <td class="b-top" style="width: 347px;">
        </td>
    </tr>
</table>

<!-- ITENS DA VENDA/COMPRA -->
<table>
    <tr>
        <td class="b-top b-bottom" style="width: 700px; height: 50px;">
            <strong>MERCADORIAS</strong>
        </td>
    </tr>
</table>

<table>
    <thead>
    <tr>
        <td style="width: 95px;">Cod/Ref</td>
        <td style="width: 350px;">Descrição</td>
        <td style="width: 80px;">Qtd.</td>
        <td style="width: 80px;">Vl Uni</td>
        <td style="width: 80px;">Vl Liq.</td>
    </tr>
    </thead>
    <tbody>
    @php
        $somaItens = 0;
        $somaTotalItens = 0;
        $tipoDimensao = false;
        $tipoReceita = false;
        $casasDecimais = $config->casas_decimais;
        $casasDecimaisQtd = 2;
    @endphp
    @foreach($item->itens as $i)
        <tr>
            <td class="b-top">
                {{ $i->produto->id }}
                @if($i->produto->referencia != "")
                    / {{ $i->produto->referencia }}
                @endif
            </td>
            <td class="b-top">
                {{ $i->descricao() }}
            </td>
            <td class="b-top">
                {{ __moeda($i->quantidade) }}
                @if($i->largura > 0 || $i->esquerda > 0)
                    <span style="font-size: 12px;">x{{ __moeda($i->quantidade_dimensao) }}</span>
                @endif
            </td>
            <td class="b-top">{{ __moeda($i->valor_unitario) }}</td>
            <td class="b-top">{{ __moeda($i->quantidade * $i->valor_unitario) }}</td>
        </tr>
        @php
            $somaItens += $i->quantidade;
            $somaTotalItens += $i->quantidade * $i->valor_unitario;
            if($i->altura > 0 || $i->esquerda > 0) $tipoDimensao = true;
            if($i->produto->receita) $tipoReceita = true;
        @endphp
    @endforeach
    </tbody>
</table>

<br>
<table>
    <tr>
        <td class="b-top b-bottom" style="width: 350px;">
            <center>
                <strong>Quantidade Total: {{ $somaItens }}</strong>
            </center>
        </td>
        <td class="b-top b-bottom" style="width: 350px;">
            <center>
                <strong>Valor Total dos Itens: {{ __moeda($somaTotalItens) }}</strong>
            </center>
        </td>
    </tr>
</table>

@if(sizeof($item->fatura) > 0)
    <table>
        <tr>
            <td class="b-bottom" style="width: 700px; height: 50px;">
                <strong>FATURA:</strong>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="b-bottom" style="width: 150px;">Vencimento</td>
            <td class="b-bottom" style="width: 150px;">Valor</td>
        </tr>
        @foreach($item->fatura as $key => $d)
            <tr>
                <td class="b-bottom">
                    <strong>{{ \Carbon\Carbon::parse($d->data_vencimento)->format('d/m/Y') }}</strong>
                </td>
                <td class="b-bottom">
                    <strong>{{ __moeda($d->valor) }}</strong>
                </td>
            </tr>
        @endforeach
    </table>
@endif

<br>
<table>
    <tr>
        <td class="text-left" style="width: 278px;">
            Forma de pagamento:
            <strong>
                @if(isset($item->fatura) && sizeof($item->fatura) > 0)
                    @foreach ($item->fatura as $f)
                        <span style="color: #8950FC">
                                {{ $f->getTipo($f->tipo_pagamento) }}
                            </span>
                    @endforeach
                @else
                    <span style="color: #8950FC">Não Informado</span>
                @endif
            </strong>
        </td>
    </tr>
</table>
<table>
    <tr>
        <td class="text-left" style="width: 230px;">
            Frete por conta:
            <strong>
                @if($item->frete)
                    @if($item->frete->tipo == 0)
                        Emitente
                    @elseif($item->frete->tipo == 1)
                        Destinatário
                    @elseif($item->frete->tipo == 2)
                        Terceiros
                    @else
                        Outros
                    @endif
                @else
                    sem frete
                @endif
            </strong>
        </td>
    </tr>
</table>
<table>
    <tr>
        <td class="text-left" style="width: 250px;">
            Data da venda: <strong>{{ __data_pt($item->created_at) }}</strong>
        </td>
        <td class="" style="width: 250px;">
            @if($item->data_entrega != null)
                Data de entrega: <strong>{{ __data_pt($item->data_entrega, 0) }}</strong>
            @endif
        </td>
    </tr>
</table>
<table>
    <tr>
        <td class="text-left" style="width: 170px;">
            Desconto (-): <strong>{{ __moeda($item->desconto) }}</strong>
        </td>
        <td class="" style="width: 170px;">
            Acrescimo (+): <strong>{{ __moeda($item->acrescimo) }}</strong>
        </td>
        <td class="" style="width: 170px;">
            Frete (+):
            <strong>
                @if($item->frete)
                    {{ __moeda($item->valor_frete) }}
                @else
                    0,00
                @endif
            </strong>
        </td>
        <td class="" style="width: 200px;">
            Valor Líquido:
            <strong>
                {{ __moeda($item->valor_produtos - $item->desconto + $item->acrescimo) }}
            </strong>
        </td>
    </tr>
</table>

@if($item->observacao != "" || $config->campo_obs_pedido != "")
    <table>
        <tr>
            <td style="width: 700px;">
                Observação:
                <strong>
                    {{ $config->campo_obs_pedido }} {{ $item->observacao }}
                </strong>
            </td>
        </tr>
    </table>
@endif

<br><br><br>
<table>
    <tr>
        <td style="width: 350px;">
            <strong>________________________________________</strong><br>
            <span style="font-size: 11px;">{{ $config->nome }}</span>
        </td>
        <td style="width: 350px;">
            <strong>________________________________________</strong><br>
            @if($item->tpNF == 1)
                <span style="font-size: 11px;">{{ $item->cliente->razao_social }}</span>
            @else
                <span style="font-size: 11px;">{{ $item->fornecedor->razao_social }}</span>
            @endif
        </td>
    </tr>
</table>

<!-- BLOCO EXTRA PARA DIMENSÕES -->
@if($tipoDimensao)
    <div class="page_break"></div>
    <table>
        <tr>
            <td style="width: 700px;">
                <strong>Dados do cliente</strong>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="b-top" style="width: 450px;">
                Nome: <strong>{{ $item->cliente->razao_social }}</strong>
            </td>
            <td class="b-top" style="width: 247px;">
                CPF/CNPJ: <strong>{{ $item->cliente->cpf_cnpj }}</strong>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="b-top text-left" style="width: 500px;">
                Endereço:
                <strong>
                    {{ $item->cliente->rua }}, {{ $item->cliente->numero }}
                    - {{ $item->cliente->bairro }}
                    - {{ $item->cliente->cidade->nome }}
                    ({{ $item->cliente->cidade->uf }})
                </strong>
            </td>
            <td class="b-top text-left" style="width: 200px;">
                Telefone: <strong>{{ $item->cliente->telefone }}</strong>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="b-top text-left" style="width: 350px;">
                Nº Doc: <strong>{{ $item->id }}</strong>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="b-top b-bottom" style="width: 700px; height: 50px;">
                <strong>MERCADORIAS:</strong>
            </td>
        </tr>
    </table>
    <table>
        <thead>
        <tr>
            <td style="width: 70px;">Cod</td>
            <td style="width: 470px;">Descrição</td>
            <td style="width: 70px;">Qtd. Dim.</td>
            <td style="width: 70px;">Qtd.</td>
        </tr>
        </thead>
        <tbody>
        @php
            $somaItens = 0;
            $somaTotalItens = 0;
        @endphp
        @foreach($item->itens as $i)
            <tr>
                <td class="b-top">{{ $i->produto->id }}</td>
                <td class="b-top">
                    {{ $i->produto->nome }}
                    @if($i->produto->grade)
                        ({{ $i->produto->str_grade }})
                    @endif
                    @if($i->produto->lote != "")
                        | Lote: {{ $i->produto->lote }},
                        Vencimento: {{ $i->produto->vencimento }}
                    @endif
                    @if($i->produto->tipo_dimensao != '')
                        @if($i->produto->tipo_dimensao == 'area')
                            [Altura: {{ $i->altura }},
                            Largura: {{ $i->largura }},
                            Profundidade: {{ $i->profundidade }}]
                        @else
                            [Superior: {{ $i->superior }},
                            Infeior: {{ $i->inferior }},
                            Esquerda: {{ $i->esquerda }},
                            Direita: {{ $i->direita }}]
                        @endif
                    @endif
                </td>
                <td class="b-top">{{ number_format($i->quantidade, 2, ',', '.') }}</td>
                <td class="b-top">{{ number_format($i->quantidade_dimensao, 2, ',', '.') }}</td>
            </tr>
            @php
                $somaItens += $i->quantidade;
                $somaTotalItens += $i->quantidade * $i->valor;
            @endphp
        @endforeach
        </tbody>
    </table>
    <br>
    <table>
        <tr>
            <td style="width: 200px;">
                <strong>Vendedor: {{ $item->usuario->nome }}</strong>
            </td>
            <td style="width: 250px;">
                Data da venda:
                <strong>{{ \Carbon\Carbon::parse($item->created_at)->format('d/m/Y H:i') }}</strong>
            </td>
            <td style="width: 250px;">
                Data da entrega:
                <strong>{{ \Carbon\Carbon::parse($item->data_entrega)->format('d/m/Y') }}</strong>
            </td>
        </tr>
    </table>
    @if($item->observacao != "")
        <table>
            <tr>
                <td style="width: 700px;">
                    <strong>Observação: {{ $item->observacao }}</strong>
                </td>
            </tr>
        </table>
    @endif
@endif

<!-- BLOCO EXTRA PARA RECEITA (COMPOSIÇÕES) -->
@if($tipoReceita)
    <div class="page_break"></div>
    <table>
        <tr>
            @if($config->logo != "")
                <td style="width: 150px;">
                    <img src="{{ 'data:image/png;base64,' . base64_encode(file_get_contents(@public_path('logos/' . $config->logo))) }}" width="100px;">
                </td>
            @else
                <td style="width: 150px;">
                    <img src="{{ 'data:image/png;base64,' . base64_encode(file_get_contents(@public_path('imgs/slym.png'))) }}" width="100px;">
                </td>
            @endif
        </tr>
    </table>

    <table>
        <tr>
            <td style="width: 700px;">
                <strong>Dados do cliente</strong>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="b-top" style="width: 450px;">
                Nome: <strong>{{ $item->cliente->razao_social }}</strong>
            </td>
            <td class="b-top" style="width: 247px;">
                CPF/CNPJ: <strong>{{ $item->cliente->cpf_cnpj }}</strong>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="b-top" style="width: 500px;">
                Endereço:
                <strong>
                    {{ $item->cliente->rua }}, {{ $item->cliente->numero }}
                    - {{ $item->cliente->bairro }}
                    - {{ $item->cliente->cidade->nome }} ({{ $item->cliente->cidade->uf }})
                </strong>
            </td>
            <td class="b-top" style="width: 200px;">
                Telefone: <strong>{{ $item->cliente->telefone }}</strong>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="b-top" style="width: 350px;">
                Nº Doc: <strong>{{ $item->id }}</strong>
            </td>
            <td class="b-top" style="width: 347px;"></td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="b-top b-bottom" style="width: 700px; height: 50px;">
                <strong>Produtos:</strong>
            </td>
        </tr>
    </table>

    <!-- receitas -->
    <table>
        <thead>
        <tr>
            <td style="width: 70px;">Cod</td>
            <td style="width: 540px;">Descrição</td>
            <td style="width: 14px;">Qtd.</td>
        </tr>
        </thead>
        <tbody>
        @php
            $somaItens = 0;
            $somaTotalItens = 0;
        @endphp
        @foreach($item->itens as $i)
            <tr>
                <td class="b-top">{{ $i->produto->id }}</td>
                <td class="b-top">
                    {{ $i->produto->nome }}
                    @if($i->produto->grade)
                        ({{ $i->produto->str_grade }})
                    @endif
                    @if($i->produto->lote != "")
                        | Lote: {{ $i->produto->lote }},
                        Vencimento: {{ $i->produto->vencimento }}
                    @endif
                </td>
                <td class="b-top">{{ number_format($i->quantidade, 2, ',', '.') }}</td>
            </tr>
            @php
                $somaItens += $i->quantidade;
                $somaTotalItens += $i->quantidade * $i->valor;
            @endphp
            <tr>
                <td colspan="3">Composição do item:</td>
            </tr>
            @foreach($i->produto->receita->itens as $ir)
                <tr>
                    <td colspan="2" class="b-bottom" style="text-align:left;">
                        {{ $ir->produto->nome }}
                    </td>
                    <td class="b-bottom">
                        {{ $ir->quantidade }} {{ $ir->medida }}
                    </td>
                </tr>
            @endforeach
        @endforeach
        </tbody>
    </table>
    <br>
    <h4>Informação técnica do(s) produto(s):</h4>
    @foreach($item->itens as $i)
        @if($i->produto->info_tecnica_composto != "")
            <p><strong>{{ $i->produto->nome }}:</strong> {!! $i->produto->info_tecnica_composto !!}</p>
        @endif
    @endforeach
@endif
</body>

<footer id="footer_imagem">
    <table>
        <tbody>
        <tr>
            <td class="text-left ml-3 mb-3">
                {{ env('SITE_SUPORTE') }}
            </td>
            <td class="text-right">
                <img src="{{ 'data:image/png;base64,' . base64_encode(file_get_contents(@public_path('logo.png'))) }}" alt="Logo">
            </td>
        </tr>
        </tbody>
    </table>
</footer>
</html>
