<div class="modal fade" id="modal_altera_produto" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <div class="row">

                    <div class="col-md-2 mt-2">
                        <label>Código</label>
                        <input readonly class="form-control" type="text" id="modal_codigo">
                    </div>

                    <div class="col-md-4 mt-2">
                        <label>Nome</label>
                        <input class="form-control" type="text" id="modal_nome">
                    </div>

                    <div class="col-md-3 mt-2">
                        <label>Categoria</label>
                        <select class="form-select" id="modal_categoria_id">
                            <option value="">Selecione</option>
                            @foreach($categorias as $c)
                            <option value="{{ $c->id }}">{{ $c->nome }}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="col-md-3 mt-2">
                        <label>Marca</label>
                        <select class="form-select" id="modal_marca_id">
                            <option value="">Selecione</option>
                            @foreach($marcas as $c)
                            <option value="{{ $c->id }}">{{ $c->nome }}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="col-md-2 mt-2">
                        <label>Gerenciar estoque</label>
                        <select class="form-select" id="modal_gerenciar_estoque">
                            <option value="1">Sim</option>
                            <option value="0">Não</option>
                        </select>
                    </div>

                    <div class="col-md-3 mt-2">
                        <label>Código de barras</label>
                        <input class="form-control" type="text" id="modal_codigo_barras">
                    </div>

                    <div class="col-md-3 mt-2">
                        <label>NCM</label>
                        <input class="form-control ncm" type="text" id="modal_ncm">
                    </div>

                    <div class="col-md-2 mt-2">
                        <label>Valor de compra</label>
                        <input class="form-control moeda" type="tel" id="modal_valor_compra">
                    </div>

                    <div class="col-md-2 mt-2">
                        <label>Margem</label>
                        <input class="form-control percentual" type="tel" id="modal_margem">
                    </div>

                    <div class="col-md-2 mt-2">
                        <label>Valor de venda</label>
                        <input class="form-control moeda" type="tel" id="modal_valor_venda">
                    </div>

                    <div class="col-md-2 mt-2">
                        <label>Estoque mínimo</label>
                        <input class="form-control" type="tel" id="modal_estoque_minimo" data-mask="00000.00" data-mask-reverse="true">
                    </div>

                    <div class="col-md-2 mt-2 form-check" style="margin-left: 10px">
                        <br>
                        <input type="checkbox" class="form-check-input ml-3" id="check">
                        <label>Revisado</label>

                    </div>
                    
                    <div class="mt-3 ms-auto">
                        <button type="submit" class="btn btn-success px-3 float-end btn-modal-alterar">Alterar</button>
                    </div>
                </div>

            </div>

        </div>
    </div>
</div>
