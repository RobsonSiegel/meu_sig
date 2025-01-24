<div class="row">
    <div class="col-md-12">
        <ul class="nav nav-tabs nav-primary" role="tablist">
            <li class="nav-item" role="presentation">
                <a class="nav-link active" data-bs-toggle="tab" href="#cliente" role="tab" aria-selected="true">
                    <div class="d-flex align-items-center">
                        <div class="tab-icon"><i class='fa fa-user me-2'></i>
                        </div>
                        <div class="tab-title">
                            <i class="ri-file-user-fill"></i>
                            Cliente
                        </div>
                    </div>
                </a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" data-bs-toggle="tab" href="#produtos" role="tab" aria-selected="false">
                    <div class="d-flex align-items-center">
                        <div class="tab-icon"><i class='fa fa-shopping-cart me-2'></i>
                        </div>
                        <div class="tab-title">
                            <i class="ri-box-2-line"></i>
                            Produtos
                        </div>
                    </div>
                </a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" data-bs-toggle="tab" href="#transportadora" role="tab" aria-selected="false">
                    <div class="d-flex align-items-center">
                        <div class="tab-icon"><i class='fa fa-truck me-2'></i>
                        </div>
                        <div class="tab-title">
                            <i class="ri-truck-line"></i>
                            Frete
                        </div>
                    </div>
                </a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" data-bs-toggle="tab" href="#fatura" role="tab" aria-selected="false">
                    <div class="d-flex align-items-center">
                        <div class="tab-icon"><i class='fa fa-money-bill me-2'></i>
                        </div>
                        <div class="tab-title">
                            <i class="ri-coins-line"></i>
                            Fatura
                        </div>
                    </div>
                </a>
            </li>
        </ul>
        <hr>
        <div class="tab-content">
            <div class="tab-pane fade show active" id="cliente" role="tabpanel">
                <div class="card">
                    <div class="row m-3">
                        <div class="col-md-5">
                            <label>Cliente</label>
                            <div class="input-group flex-nowrap">
                                <select id="inp-cliente_id" name="cliente_id" class="cliente_id">
                                    @if(isset($item) && $item->cliente)
                                        <option
                                            value="{{ $item->cliente_id }}">{{ $item->cliente->razao_social }}</option>
                                    @endif
                                </select>
                                @can('clientes_create')
                                    <button class="btn btn-dark" data-bs-toggle="modal"
                                            data-bs-target="#modal_novo_cliente" type="button">
                                        <i class="ri-add-circle-fill"></i>
                                    </button>
                                @endcan
                            </div>
                        </div>
                        <hr class="mt-3">
                        <div class="row d-cliente">
                            <div class="col-md-3">
                                {!!Form::text('cliente_nome', 'Razão Social')->attrs(['class' => ''])->required()
                                ->value(isset($item) ? $item->cliente->razao_social : '')
                                !!}
                            </div>
                            <div class="col-md-3">
                                {!!Form::text('nome_fantasia', 'Nome Fantasia')->attrs(['class' => ''])
                                ->value(isset($item) ? $item->cliente->nome_fantasia : '')
                                !!}
                            </div>
                            <div class="col-md-2">
                                {!!Form::tel('cliente_cpf_cnpj', 'CPF/CNPJ')->attrs(['class' => 'cpf_cnpj'])->required()
                                ->value(isset($item) ? $item->cliente->cpf_cnpj : '')
                                !!}
                            </div>
                            <div class="col-md-2">
                                {!!Form::text('ie', 'IE')->attrs(['class' => ''])
                                ->value(isset($item) ? $item->cliente->ie : '')
                                !!}
                            </div>
                            <div class="col-md-2">
                                {!!Form::tel('telefone', 'Fone')->attrs(['class' => 'fone'])
                                ->value(isset($item) ? $item->cliente->telefone : '')
                                !!}
                            </div>
                            <div class="col-md-2 mt-3">
                                {!!Form::select('contribuinte', 'Contribuinte', [0 => 'Não', 1 => 'Sim'])->attrs(['class' => 'form-select'])
                                ->value(isset($item) ? $item->cliente->contribuinte : '')
                                !!}
                            </div>
                            <div class="col-md-2 mt-3">
                                {!!Form::select('consumidor_final', 'Consumidor Final', [0 => 'Não', 1 => 'Sim'])->attrs(['class' => 'form-select'])->required()
                                ->value(isset($item) ? $item->cliente->consumidor_final : '')
                                !!}
                            </div>
                            <div class="col-md-4 mt-3">
                                {!!Form::text('email', 'E-mail')->attrs(['class' => ''])
                                ->value(isset($item) ? $item->cliente->email : '')
                                !!}
                            </div>
                            <div class="col-md-4 mt-3">
                                <label for="">Cidade</label>
                                <select required class="form-control select2 cidade_id" name="cliente_cidade"
                                        id="inp-cidade_cliente">
                                    <option value="">Selecione..</option>
                                    @foreach ($cidades as $c)
                                        <option @isset($item) @if($item->cliente->cidade_id == $c->id) selected
                                                @endif @endisset value="{{$c->id}}">{{$c->nome}}
                                            - {{$c->uf}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-md-3 mt-3">
                                {!!Form::text('cliente_rua', 'Rua')->attrs(['class' => ''])->required()
                                ->value(isset($item) ? $item->cliente->rua : '')
                                !!}
                            </div>
                            <div class="col-md-1 mt-3">
                                {!!Form::text('cliente_numero', 'Número')->attrs(['class' => ''])->required()
                                ->value(isset($item) ? $item->cliente->numero : '')
                                !!}
                            </div>
                            <div class="col-md-2 mt-3">
                                {!!Form::text('cep', 'CEP')->attrs(['class' => 'cep'])->required()
                                ->value(isset($item) ? $item->cliente->cep : '')
                                !!}
                            </div>
                            <div class="col-md-2 mt-3">
                                {!!Form::text('cliente_bairro', 'Bairro')->attrs(['class' => ''])->required()
                                ->value(isset($item) ? $item->cliente->bairro : '')
                                !!}
                            </div>
                            <div class="col-md-4 mt-3">
                                {!!Form::text('complemento', 'Complemento')->attrs(['class' => ''])
                                ->value(isset($item) ? $item->cliente->complemento : '')
                                !!}
                            </div>
                        </div>
                        <div>
                            <div class="col-md-3">
                                {!!Form::select('vendedor_id', 'Vendedor', ['' => 'Selecione'] + $vendedores->pluck('nome', 'id')->all())
                                ->attrs(['class' => 'form-select'])
                                ->value(isset($item) ? $item->vendedor_id : '')
                                ->required()
                                !!}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="produtos" role="tabpanel">
                <div class="card">
                    <div class="row m-3">
                        <div class="table-responsive">
                            <table class="table table-dynamic table-produtos" style="width: 100%">
                                <thead>
                                <tr>
                                    <th>Ações</th>
                                    <th>Produto</th>
                                    <th>Material</th>
                                    <th>CFOP</th>
                                    <th>Largura (mm)</th>
                                    <th>Comprimento (mm)</th>
                                    <th>Expessura</th>
                                    <th>KG</th>
                                    <th>KG por Peça</th>
                                    <th>Valor Unit.</th>
                                    <th>Quantidade</th>
                                    <th>Kilo Total</th>
                                    <th>Subtotal</th>
                                    <th>Imagem</th>
                                </tr>
                        </div>
                    </div>
                    </thead>
                    <tbody>
                    @if(isset($item))
                        @foreach ($item->itens as $prod)
                            <tr class="dynamic-form">
                                <td width="30">
                                    <button class="btn btn-danger btn-remove-tr">
                                        <i class="ri-delete-bin-line"></i>
                                    </button>
                                </td>

                                <td width="450">
                                    <select style="width: 300px" class="form-control select2 produto_id"
                                            name="produto_id[]" id="inp-produto_id">
                                        <option
                                            value="{{ $prod->produto_id }}">{{ $prod->produto->nome }}</option>
                                    </select>

                                </td>
                                <td width="300">
                                    <select required class="form-control select2 variacao_id" name="variacao_id[]"
                                            id="inp-variacao_id">
                                        <option value="{{ $prod->variacao_id }}">{{ $prod->produtoVariacao->descricao }}</option>
                                    </select>
                                </td>

                                <td width="100">
                                    <input style="width: 100px" required value="{{ $prod->cfop }}"
                                           class="form-control cfop" type="tel" name="cfop[]"
                                           id="inp-cfop_estadual">
                                </td>
                                <td width="100">
                                    <input style="width: 100px" required value="{{ $prod->largura }}"
                                           class="form-control largura" type="tel" name="largura[]"
                                           id="inp-largura">
                                </td>
                                <td width="100">
                                    <input style="width: 100px" required value="{{ $prod->comprimento }}"
                                           class="form-control comprimento" type="tel" name="comprimento[]"
                                           id="inp-comprimento">
                                </td>
                                <td width="100">
                                    <input style="width: 100px" required value="{{ $prod->espessura }}"
                                           class="form-control espessura" type="tel" name="espessura[]"
                                           id="inp-espessura">
                                </td>
                                <td width="100">
                                    <input style="width: 100px" required value="{{ $prod->peso }}"
                                           class="form-control quilo" type="tel" name="quilo[]"
                                           id="inp-quilo">
                                </td>

                                <td width="100">
                                    <input style="width: 100px" required value="{{ $prod->peso_por_peca }}"
                                           class="form-control quilo_por_peca" type="tel" name="quilo_por_peca[]"
                                           id="inp-quilo_por_peca">
                                </td>

                                <td width="100">
                                    <input style="width: 100px" required value="{{ $prod->valor_unitario }}"
                                           class="form-control valor_unit" type="tel" name="valor_unitario[]"
                                           id="inp-valor_unitario">
                                </td>

                                <td width="100">
                                    <input style="width: 100px" required value="{{ $prod->quantidade }}"
                                           class="form-control qtd" type="tel" name="quantidade[]"
                                           id="inp-quantidade">
                                </td>
                                <td width="100">
                                    <input style="width: 100px" required value="{{ $prod->peso_total }}"
                                           class="form-control quilo_total" type="tel" name="quilo_total[]"
                                           id="inp-quilo_total">
                                </td>
                                <td width="100">
                                    <input style="width: 100px" required value="{{ $prod->sub_total }}"
                                           class="form-control sub_total" type="tel" name="sub_total[]"
                                           id="inp-sub_total">
                                </td>
{{--                                <td width="100">--}}
{{--                                    @isset($item)--}}
{{--                                        <img style="width: 100px"--}}
{{--                                             id="file-ip-1-preview"--}}
{{--                                             src="{{ isset($prod->imagem) && $prod->imagem ? asset('public/uploads/pedidos/' . $prod->imagem) : asset('imgs/no-image.png') }}"--}}
{{--                                             alt="Imagem do Produto">--}}
{{--                                    @else--}}
{{--                                        <img id="file-ip-1-preview" src="{{ public_path('/imgs/no-image.png')}}">--}}
{{--                                    @endif--}}
{{--                                </td>--}}
{{--                                <td>--}}
{{--                                    <button class="btn">--}}
{{--                                        <input type="file" id="file-ip-1" name="image[]" accept="image/*"--}}
{{--                                               onchange="showPreview(event);">--}}
{{--                                    </button>--}}
{{--                                </td>--}}
                                <td width="40">
                                    @isset($item)
                                        <img style="width: 100px"
                                             id="file-ip-{{ $loop->index }}-preview"
                                             src="{{ isset($prod->imagem) && $prod->imagem ? asset('public/uploads/pedidos/' . $prod->imagem) : asset('imgs/no-image.png') }}"
                                             alt="Imagem do Produto">
                                    @else
                                        <img style="width: 100px"
                                             id="file-ip-{{ $loop->index }}-preview"
                                             src="/imgs/no-image.png"
                                             alt="Imagem Padrão">
                                    @endif
                                </td>
                                <td>
                                    <button type="button" class="btn btn-primary btn-upload-image">
                                        <input type="file"
                                               id="file-ip-{{ $loop->index }}"
                                               name="image[]"
                                               accept="image/*"
                                               class="upload-image-input d-none"
                                               onchange="showPreviewLinha(event, {{ $loop->index }});">
                                        <i class="ri-image-add-line"></i>
                                    </button>
                                </td>

                            </tr>
                        @endforeach
                    @else
                        <tr class="dynamic-form">
                            <td width="30">
                                <button class="btn btn-danger btn-remove-tr">
                                    <i class="ri-delete-bin-line"></i>
                                </button>
                            </td>

                            <td>
                                <select required class="form-control select2 produto_id" name="produto_id[]"
                                        id="inp-produto_id">
                                </select>
                            </td>

                            <td width="300">
                                <select required class="form-control select2 variacao_id" name="variacao_id[]"
                                        id="inp-variacao_id">
                                </select>
                            </td>
                            <td width="150">
                                <input style="width: 120px" required class="form-control cfop" type="tel"
                                       name="cfop[]" id="inp-cfop_estadual">
                            </td>
                            <td width="100">
                                <input style="width: 100px" class="form-control largura" type="tel"
                                       name="largura[]" id="inp-largura">
                            </td>
                            <td width="150">
                                <input style="width: 150px" class="form-control comprimento" type="tel"
                                       name="comprimento[]" id="inp-comprimento">
                            </td>
                            <td width="100">
                                <input style="width: 100px" class="form-control espessura" type="tel"
                                       name="espessura[]" id="inp-espessura">
                            </td>
                            <td width="100">
                                <input style="width: 100px" class="form-control quilo" type="tel"
                                       name="quilo[]" id="inp-quilo">
                            </td>
                            <td width="100">
                                <input style="width: 100px" class="form-control quilo_por_peca" type="tel"
                                       name="quilo_por_peca[]" id="inp-quilo_por_peca">
                            </td>
                            <td width="100">
                                <input style="width: 100px" class="form-control moeda valor_unit" type="tel"
                                       name="valor_unitario[]" id="inp-valor_unitario">
                            </td>
                            <td width="100">
                                <input style="width: 100px" class="form-control qtd" type="tel"
                                       name="quantidade[]" id="inp-quantidade">
                            </td>
                            <td width="100">
                                <input style="width: 100px" readonly class="form-control moeda quilo_total"
                                       type="tel" name="quilo_total[]" id="inp-quilo_total">
                            </td>
                            <td width="100">
                                <input style="width: 100px" readonly class="form-control moeda sub_total"
                                       type="tel" name="sub_total[]" id="inp-subtotal">
                            </td>
                            <td width="40">
                                <button class="btn btn-primary">
                                    <input type="file" id="file-ip-1" name="image" accept="image/*"
                                           onchange="showPreview(event);">
                                </button>
                            </td>
                        </tr>
                    @endisset


                    </tbody>
                    </table>
                </div>
                <div class="row col-12 col-lg-2 mt-3">
                    <br>
                    <button type="button" class="btn btn-dark btn-add-tr-nfe px-2">
                        <i class="ri-add-fill"></i>
                        Adicionar Produto
                    </button>
                </div>
                <div class="mt-3">
                    <h5>Total de Produtos:  <strong class="total_prod">R$</strong> @isset($item){{ $item->valor_produtos }} @endisset</h5>
                </div>
                <input type="hidden" class="total_prod" name="valor_produtos" id="" @isset($item) value="{{$item->valor_produtos}}" @endisset value="">

            </div>
        </div>
    </div>
    <div class="tab-pane fade show" id="transportadora" role="tabpanel">
        <div class="card">
            <div class="row m-3">
                <div class="col-md-5">
                    {!!Form::select('transportadora_id', 'Transportadora',['' => 'Selecione..'] + $transportadoras->pluck('razao_social', 'id')->all())
                    ->attrs(['class' => 'select2 transportadora_id'])
                    !!}
                </div>
                <hr class="mt-3">
                <div class="row">
                    <div class="col-md-3">
                        {!!Form::text('razao_social_transp', 'Razão Social')
                        ->value(isset($item->transportadora) ? $item->transportadora->razao_social : '')
                        !!}
                    </div>
                    <div class="col-md-3">
                        {!!Form::text('nome_fantasia_transp', 'Nome Fantasia')
                        ->value(isset($item->transportadora) ? $item->transportadora->nome : '')
                        !!}
                    </div>
                    <div class="col-md-2">
                        {!!Form::tel('cpf_cnpj_transp', 'CNPJ')
                        ->attrs(['class' => 'cpf_cnpj'])
                        ->value(isset($item->transportadora) ? $item->transportadora->cpf_cnpj : '')
                        !!}
                    </div>
                    <div class="col-md-2">
                        {!!Form::tel('ie_transp', 'Incrição Estadual')
                        ->value(isset($item->transportadora) ? $item->transportadora->ie : '')
                        !!}
                    </div>
                    <div class="col-md-2">
                        {!!Form::tel('antt', 'ANTT')
                        ->value(isset($item->transportadora) ? $item->transportadora->antt : '')
                        !!}
                    </div>
                    <div class="col-md-3 mt-3">
                        {!!Form::tel('rua_transp', 'Rua')
                        ->value(isset($item->transportadora) ? $item->transportadora->rua : '')
                        !!}
                    </div>
                    <div class="col-md-1 mt-3">
                        {!!Form::tel('numero_transp', 'Número')
                        ->value(isset($item->transportadora) ? $item->transportadora->numero : '')
                        !!}
                    </div>
                    {{--                            <div class="col-md-3 mt-3">--}}
                    {{--                                {!!Form::select('cidade_transp', 'Cidade')--}}
                    {{--                                ->attrs(['class' => 'select2 cidade_select2'])--}}
                    {{--                                ->options(isset($item->transportadora) && isset($item->transportadora->cidade) ? [$item->transportadora->cidade_id => $item->transportadora->cidade->nome] : [])--}}
                    {{--                                !!}--}}
                    {{--                            </div>--}}

                    <div class="col-md-4 mt-3">
                        <label for="">Cidade</label>
                        <select class="form-control select2 cidade_id" name="cidade_transp"
                                id="inp-cidade_transp">
                            <option value="">Selecione..</option>
                            @foreach ($cidades as $c)
                                <option
                                    @isset($item->transportadora) @if($item->transportadora->cidade_id == $c->id) selected
                                    @endif @endisset value="{{$c->id}}">{{$c->nome}}
                                    - {{$c->uf}}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-2 mt-3">
                        {!!Form::tel('cep_transp', 'CEP')
                        ->attrs(['class' => 'cep'])
                        ->value(isset($item->transportadora) ? $item->transportadora->cep : '')
                        !!}
                    </div>
                    <div class="col-md-3 mt-3">
                        {!!Form::text('email_transp', 'E-mail')
                        ->value(isset($item->transportadora) ? $item->transportadora->email : '')
                        !!}
                    </div>
                    <div class="col-md-2 mt-3">
                        {!!Form::tel('telefone_transp', 'Telefone')
                        ->attrs(['class' => 'fone'])
                        ->value(isset($item->transportadora) ? $item->transportadora->telefone : '')
                        !!}
                    </div>
                    <div class="col-md-3 mt-3">
                        {!!Form::text('bairro_transp', 'Bairro')
                        ->value(isset($item->transportadora) ? $item->transportadora->bairro : '')
                        !!}
                    </div>
                    <div class="col-md-3 mt-3">
                        {!!Form::text('complemento_transp', 'Complemento')
                        ->value(isset($item->transportadora) ? $item->transportadora->complemento : '')
                        !!}
                    </div>
                    <hr class="mt-3">
                    <h4 class="mt-3">Informações do Frete</h4>
                    <div class="col-md-2 mt-2">
                        {!!Form::tel('valor_frete', 'Valor do Frete')
                        ->attrs(['class' => 'moeda valor_frete'])
                        ->value(isset($item) ? __moeda($item->valor_frete) : (isset($cotacao) ? __moeda($cotacao->valor_frete) : ''))
                        !!}
                    </div>
                    <div class="col-md-2 mt-2">
                        {!!Form::tel('qtd_volumes', 'Qtd de Volumes')
                        ->attrs(['class' => ''])
                        !!}
                    </div>
                    <div class="col-md-2 mt-2">
                        {!!Form::tel('numeracao_volumes', 'Número de Volumes')
                        ->attrs(['class' => ''])
                        !!}
                    </div>
                    <div class="col-md-2 mt-2">
                        {!!Form::tel('peso_bruto', 'Peso Bruto')
                        ->attrs(['class' => 'peso'])
                        !!}
                    </div>
                    <div class="col-md-2 mt-2">
                        {!!Form::tel('peso_liquido', 'Peso Líquido')
                        ->attrs(['class' => 'peso'])
                        !!}
                    </div>
                    <div class="col-md-3 mt-3">
                        {!!Form::text('especie', 'Espécie')
                        ->attrs(['class' => ''])
                        !!}
                    </div>
                    <div class="col-md-3 mt-3">
                        {!!Form::select('tipo', 'Tipo', ['' => 'Selecione..'] + App\Models\Nfe::tiposFrete())
                        ->attrs(['class' => 'form-select'])
                        !!}
                    </div>
                    <div class="col-md-2 mt-3">
                        {!!Form::text('placa', 'Placa')
                        ->attrs(['class' => 'placa'])
                        !!}
                    </div>
                    <div class="col-md-1 mt-3">
                        {!!Form::select('uf', 'UF', App\Models\Cidade::estados())
                        ->attrs(['class' => 'form-select'])
                        !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="tab-pane fade show" id="fatura" role="tabpanel">
        <div class="card">
            <div class="row m-3">
                <div class="col-md-3">
                    {!!Form::select('natureza_id', 'Natureza de Operação', ['' => 'Selecione'] + $naturezas->pluck('descricao', 'id')->all())
                    ->attrs(['class' => 'form-select'])
                    ->value(isset($item) ? $item->natureza_id : '')
                    ->required()
                    !!}
                </div>
                <div class="col-md-2">
                    {!!Form::tel('acrescimo', 'Acréscimo')
                    ->attrs(['class' =>'acrescimo moeda'])
                    ->value(isset($item) ? __moeda($item->acrescimo) : '')
                    !!}
                </div>
                <div class="col-md-2">
                    {!!Form::tel('desconto', 'Desconto')
                    ->attrs(['class' => 'desconto moeda'])
                    ->value(isset($item) ? __moeda($item->desconto) : '')
                    !!}
                </div>
                <div class="col-md-5">
                    {!!Form::text('observacao', 'Observação')
                    ->attrs(['class' => ''])
                    !!}
                </div>
                @if(__isPlanoFiscal())
                    <div class="col-md-2 mt-3">
                        {!!Form::tel('numero_nfe', 'Número Pedido')
                        ->required()
                        ->value(isset($item) ? $item->numero : $numeroNfe)
                        !!}
                    </div>

                    <div class="col-md-2 mt-3">
                        {!!Form::date('data_emissao_saida', 'Data Emissão Saída')
                        !!}
                    </div>

                    <div class="col-md-2 mt-3">
                        {!!Form::date('data_entrega', 'Data de Entrega')
                        !!}
                    </div>

                @endif

            </div>
        </div>
        <div class="card mt-1">
            <div class="row m-3">
                <div class="table-responsive">
                    <table class="table table-dynamic table-fatura" style="width: 800px">
                        <thead>
                        <tr>
                            <th>Tipo de Pagamento</th>
                            <th>Data Vencimento</th>
                            <th>Valor</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody id="body-pagamento" class="datatable-body">
                        @isset($cotacao)
                            @if(sizeof($cotacao->fatura) > 0)
                                @foreach ($cotacao->fatura as $f)
                                    <tr class="dynamic-form">
                                        <td width="300">
                                            <select name="tipo_pagamento[]"
                                                    class="form-control tipo_pagamento select2">
                                                <option value="">Selecione..</option>
                                                @foreach(App\Models\Nfe::tiposPagamento() as $key => $c)
                                                    <option @if($f->tipo_pagamento == $key) selected
                                                            @endif value="{{$key}}">{{$c}}</option>
                                                @endforeach
                                            </select>
                                        </td>
                                        <td width="150">
                                            <input value="{{ $f->data_vencimento }}" type="date"
                                                   class="form-control" name="data_vencimento[]" id="">
                                        </td>
                                        <td width="150">
                                            <input value="{{ __moeda($f->valor) }}" type="tel"
                                                   class="form-control moeda valor_fatura"
                                                   name="valor_fatura[]">
                                        </td>
                                        <td width="30">
                                            <button class="btn btn-danger btn-remove-tr">
                                                <i class="ri-delete-bin-line"></i>
                                            </button>
                                        </td>
                                    </tr>
                                @endforeach
                            @else
                                <tr class="dynamic-form">
                                    <td width="300">
                                        <select name="tipo_pagamento[]"
                                                class="form-control tipo_pagamento select2">
                                            <option value="">Selecione..</option>
                                            @foreach(App\Models\Nfe::tiposPagamento() as $key => $c)
                                                <option value="{{$key}}">{{$c}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td width="150">
                                        <input type="date" class="form-control date_atual"
                                               name="data_vencimento[]" id="" value="">
                                    </td>
                                    <td width="150">
                                        <input type="tel" class="form-control moeda valor_fatura"
                                               name="valor_fatura[]" id="valor">
                                    </td>
                                    <td width="30">
                                        <button class="btn btn-danger btn-remove-tr">
                                            <i class="ri-delete-bin-line"></i>
                                        </button>
                                    </td>
                                </tr>
                            @endif

                        @else
                            @if(isset($item) && isset($item->fatura) && sizeof($item->fatura) > 0 && !isset($isOrdemServico))
                                @foreach ($item->fatura as $f)
                                    <tr class="dynamic-form">
                                        <td width="300">
                                            <select name="tipo_pagamento[]"
                                                    class="form-control tipo_pagamento select2">
                                                <option value="">Selecione..</option>
                                                @foreach(App\Models\Nfe::tiposPagamento() as $key => $c)
                                                    <option @if($f->tipo_pagamento == $key) selected
                                                            @endif value="{{$key}}">{{$c}}</option>
                                                @endforeach
                                            </select>
                                        </td>
                                        <td width="150">
                                            <input value="{{ $f->data_vencimento }}" type="date"
                                                   class="form-control" name="data_vencimento[]" id="">
                                        </td>
                                        <td width="150">
                                            <input value="{{ __moeda($f->valor) }}" type="tel"
                                                   class="form-control moeda valor_fatura" name="valor_fatura[]"
                                                   id="valor">
                                        </td>
                                        <td width="30">
                                            <button class="btn btn-danger btn-remove-tr">
                                                <i class="ri-delete-bin-line"></i>
                                            </button>
                                        </td>
                                    </tr>
                                @endforeach
                            @else

                                <tr class="dynamic-form">
                                    <td width="300">
                                        <select name="tipo_pagamento[]"
                                                class="form-control tipo_pagamento select2">
                                            <option value="">Selecione..</option>
                                            @foreach(App\Models\Nfe::tiposPagamento() as $key => $c)
                                                <option value="{{$key}}">{{$c}}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td width="150">
                                        <input type="date" class="form-control date_atual"
                                               name="data_vencimento[]" id="" value="">
                                    </td>
                                    <td width="150">
                                        <input type="tel" class="form-control moeda valor_fatura"
                                               name="valor_fatura[]" id="valor">
                                    </td>
                                    <td width="30">
                                        <button class="btn btn-danger btn-remove-tr">
                                            <i class="ri-delete-bin-line"></i>
                                        </button>
                                    </td>
                                </tr>

                            @endif
                        @endif
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <div class="col-12">
                        <button type="button" class="btn btn-info btn-add-tr px-5">
                            Adicionar Pagamento
                        </button>
                    </div>
                </div>
                <div class="col-3 mt-4">
                    <h5>Total da Fatura: <strong class="total_fatura">R$ @isset($item) {{$item->total}}@endisset</strong></h5>
                </div>
                <div class="col-3 mt-4">
                    <h5>Total de Produtos: <strong class="total_prod">R$ @isset($item) {{$item->valor_produtos}}@endisset</strong></h5>
                </div>
                <div class="col-3 mt-4">
                    <h5>Total do Frete: <strong class="total_frete">R$ @isset($item) {{$item->valor_frete}}@endisset</strong></h5>
                </div>
                <div class="col-3 mt-4">
                    <h5>Total da NFe: <strong class="total_nfe text-success">R$ @isset($item) {{$item->total}}@endisset</strong></h5>
                </div>
                <input type="hidden" class="valor_total" name="valor_total" id=""  @isset($item) value="{{$item->total}}" @endisset value="">
            </div>
        </div>
    </div>
</div>
<hr class="mt-4">
<div class="col-12" style="text-align: right;">
    <button type="submit" class="btn btn-success btn-salvar-nfe px-5 m-3">Salvar</button>
</div>

@include('modals._sequencias', ['not_submit' => true])






