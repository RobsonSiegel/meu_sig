$(function () {
    getDadosProduto();
    getMateriais();

});

$('body').on('change', '.cliente_id', function () {

    let cliente = $('.cliente_id').val()
    if (cliente !== '') {
        getClient(cliente)
    } else {

    }
})

$('body').on('change', '.transportadora_id', function () {
    let transportadora = $('.transportadora_id').val()
    if (transportadora != '') {
        getTransp(transportadora)
    } else {

    }
})

$('body').on('change', '.produto_id', function () {
    let cliente_id = $('.cliente_id').val()
    let produto_id = $('.produto_id').val()
    if (cliente_id !== '' && produto_id !== '') {
        getNaturezaOperacao(produto_id, cliente_id);
    } else {

    }
})

function getNaturezaOperacao(produto_id, cliente_id) {
    $.get(path_url + "api/produtos/get-natureza-operacao",
        {
            empresa_id: $('#empresa_id').val(),
            produto: produto_id,
            cliente: cliente_id
        })
        .done((res) => {
            $('#inp-cfop_estadual').val(res)
        })
        .fail((err) => {
            console.error(err)
        })

}


function getClient(cliente) {
    $.get(path_url + "api/clientes/find/" + cliente)
        .done((res) => {
            CLIENTE = res
            $('#inp-cliente_nome').val(res.razao_social)
            $('#inp-nome_fantasia').val(res.nome_fantasia)
            $('#inp-cliente_cpf_cnpj').val(res.cpf_cnpj)
            $('#inp-ie').val(res.ie)
            $('#inp-telefone').val(res.telefone)
            $('#inp-contribuinte').val(res.contribuinte).change()
            $('#inp-consumidor_final').val(res.consumidor_final).change()
            $('#inp-email').val(res.email)
            $('#inp-cidade_cliente').val(res.cidade_id).change()
            $('#inp-cliente_rua').val(res.rua)
            $('#inp-cliente_numero').val(res.numero)
            $('#inp-cep').val(res.cep)
            $('#inp-cliente_bairro').val(res.bairro)
            $('#inp-complemento').val(res.complemento)
        })
        .fail((err) => {
            console.error(err)
        })
}

function getTransp(transportadora) {
    $.get(path_url + "api/transportadoras/find/" + transportadora)
        .done((res) => {
            $('#inp-razao_social_transp').val(res.razao_social)
            $('#inp-nome_fantasia_transp').val(res.nome_fantasia)
            $('#inp-cpf_cnpj_transp').val(res.cpf_cnpj)
            $('#inp-ie_transp').val(res.ie)
            $('#inp-antt').val(res.antt)
            $('#inp-telefone_transp').val(res.telefone)
            $('#inp-email_transp').val(res.email)
            $('#inp-cidade_transp').val(res.cidade_id).change()
            $('#inp-rua_transp').val(res.rua)
            $('#inp-numero_transp').val(res.numero)
            $('#inp-cep_transp').val(res.cep)
            $('#inp-bairro_transp').val(res.bairro)
            $('#inp-complemento_transp').val(res.complemento)

            console.log('Cidade', res.razao_social);
        })
        .fail((err) => {
            console.error(err)
        })
}

// Função para converter valores formatados (1.000,00 -> 1000.00)
function convertToNumber(value) {
    if (typeof value === "string") {
        value = value.replace(/\./g, ""); // Remove separadores de milhar
        value = value.replace(",", "."); // Substitui vírgula por ponto
    }
    return parseFloat(value); // Converte para número
}

// Função para formatar números sem casas decimais (ex.: 1000 -> 1.000)
function formatNumberWithoutDecimals(value) {
    return Math.round(value).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
}

// Função para formatar números com duas casas decimais (ex.: 1000.5 -> 1.000,50)
function formatNumberWithDecimals(value) {
    let formattedValue = parseFloat(value).toFixed(2);
    let [inteira, decimal] = formattedValue.split(".");
    inteira = inteira.replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    return `${inteira},${decimal}`;
}

// Cálculo de Quilo e Subtotal
function calculaTotal(quilo, quantidade, valor_unitario, $row) {
    let quiloTotal = convertToNumber(quilo) * convertToNumber(quantidade || 0);
    let valorTotal = quiloTotal * convertToNumber(valor_unitario || 0);
    $row.find(".quilo_total").val(formatNumberWithDecimals(quiloTotal));
    $row.find(".sub_total").val(formatNumberWithDecimals(valorTotal));
}

// Cálculo do Quilo com base em dimensões
function getCalculaKG(largura, comprimento, espessura, $row) {
    let quilo = ((largura * comprimento * espessura) * 8) / 1000;
    let quiloPorPeca = quilo / 1000;

    $row.find(".quilo").val(formatNumberWithoutDecimals(quilo));
    $row.find(".quilo_por_peca").val(quiloPorPeca.toFixed(2).replace(".", ","));
}

// Atualiza os cálculos quando o campo "expessura" perde o foco
$(document).on("blur", ".espessura", function () {
    let $row = $(this).closest('tr');
    let largura = convertToNumber($row.find(".largura").val()) || 0;
    let comprimento = convertToNumber($row.find(".comprimento").val()) || 0;
    let espessura = $row.find(".espessura").val();

    getCalculaKG(largura, comprimento, espessura, $row);

});

// Atualiza os cálculos quando o campo "qtd" perde o foco
$(document).on("blur", ".qtd", function () {
    let $row = $(this).closest('tr');
    let quantidade = $row.find("#inp-quantidade").val();
    let valor_unitario = $row.find("#inp-valor_unitario").val();
    let quilo = $row.find("#inp-quilo_por_peca").val();

    calculaTotal(quilo, quantidade, valor_unitario, $row);
});

// Busca materiais ao mudar o produto
function getMateriais() {
    $(document).on("change", ".produto_id", function () {
        let product_id = $(this).val();
        if (!product_id) return;

        $.get(path_url + "api/produtos/getVariacoes/" + product_id)
            .done((res) => {
                let $select = $(this).closest("tr").find(".variacao_id");
                $select.empty();
                $select.append(new Option("Selecione uma variação", "", true, true));
                res.forEach(item => {
                    $select.append(new Option(item.descricao, item.id));
                });
                $select.trigger('change');
            })
            .fail((err) => {
                console.error("Erro ao buscar variações:", err);
            });
    });
}

function getDadosProduto() {
    $(document).on("change", ".produto_id", function () {
        let product_id = $(this).val();
        if (!product_id) return;
        $.get(path_url + "api/produtos/findId/" + product_id)
            .done((res) => {
                PRODUTO = res
                $('#inp-espessura').val(res.espessura);
            })
            .fail((err) => {
                console.error("Erro ao buscar produto:", err);
            });
    });
}

// Busca valor do material ao selecionar a variação
$(document).on("change", ".variacao_id", function () {
    let materialId = $(this).val();
    if (!materialId) return;
    $.get(path_url + "api/produtos/getValorVariacao/" + materialId)
        .done((res) => {
            let $row = $(this).closest('tr');
            $row.find(".valor_unit").val(formatNumberWithDecimals(res.valor));
        })
        .fail((err) => {
            console.error("Erro ao buscar valor unitário:", err);
        });
});

// Botão para adicionar mais um item no pedido
$('.btn-add-tr-nfe').on("click", function () {
    console.clear()
    var $table = $(this)
        .closest(".row")
        .prev()
        .find(".table-dynamic");

    var hasEmpty = false;

    $table.find("input, select").each(function () {
        if (($(this).val() === "" || $(this).val() == null) && $(this).attr("type") !== "hidden" && $(this).attr("type") !== "file" && !$(this).hasClass("ignore")) {
            hasEmpty = true;
        }
    });

    var $tr = $table.find(".dynamic-form").first();
    $tr.find("select.select2").select2("destroy");
    var $clone = $tr.clone();
    $clone.show();


    $clone.find("input,select").val("");
    $clone.find("span").html("");

    $table.append($clone);
    $(this).val("");
    setTimeout(function () {
        $("tbody select.select2").select2({
            language: "pt-BR",
            width: "100%",
            theme: "bootstrap4"
        });

        $("tbody #inp-produto_id").select2({
            minimumInputLength: 2,
            language: "pt-BR",
            placeholder: "Digite para buscar o produto",
            width: "100%",
            theme: "bootstrap4",
            ajax: {
                cache: true,
                url: path_url + "api/produtos",
                dataType: "json",
                data: function (params) {
                    let empresa_id = $('#empresa_id').val()
                    console.clear();
                    var query = {
                        pesquisa: params.term,
                        empresa_id: empresa_id
                    };
                    return query;
                },
                processResults: function (response) {
                    var results = [];
                    let compra = 0
                    if ($('#is_compra') && $('#is_compra').val() == 1) {
                        compra = 1
                    }
                    console.log(response)
                    $.each(response, function (i, v) {
                        var o = {};
                        o.id = v.id;
                        if (v.codigo_variacao) {
                            o.codigo_variacao = v.codigo_variacao
                        }

                        o.text = v.nome;
                        if (compra === 0) {
                            o.text += ' R$ ' + convertFloatToMoeda(v.valor_unitario);
                        } else {
                            o.text += ' R$ ' + convertFloatToMoeda(v.valor_compra);
                        }
                        if (v.codigo_barras) {
                            o.text += ' [' + v.codigo_barras + ']';
                        }
                        o.value = v.id;
                        results.push(o);
                    });
                    return {
                        results: results,
                    };
                },
            },
        });
    }, 100);

});

$(document).delegate(".btn-remove-tr", "click", function (e) {
    e.preventDefault();
    swal({
        title: "Você esta certo?",
        text: "Deseja remover esse item mesmo?",
        icon: "warning",
        buttons: true
    }).then(willDelete => {
        if (willDelete) {
            var trLength = $(this)
                .closest("tr")
                .closest("tbody")
                .find("tr")
                .not(".dynamic-form-document").length;
            if (!trLength || trLength > 1) {
                $(this)
                    .closest("tr")
                    .remove();
                calcTotal()
                calTotalNfe()
                limpaFatura()
            } else {
                swal(
                    "Atenção",
                    "Você deve ter ao menos um item na lista",
                    "warning"
                );
            }
        }
    });
});

$(function () {
    $('body').on('blur', '.acrescimo, .desconto', function () {
        calTotalNfe()
    })
})

$(function () {
    calcTotal()
    $(document).on("blur", ".produto_id", function () {
        calcTotal()
    })
    calcTotal()
    $(document).on("blur", ".qtd", function () {
        calcTotal()
    })
})

// CÁLCULO TOTAL DE PRODUTOS
var total_venda = 0

function calcTotal() {
    var total = 0
    $(".sub_total").each(function () {
        total += convertMoedaToFloat($(this).val())
    })
    setTimeout(() => {
        total_venda = total
        $('.total_prod').html("R$ " + convertFloatToMoeda(total))
        $('.total_prod').val(total)
        calTotalNfe()
    }, 100)
}

$(function () {
    calcTotalFatura()
    $('body').on('blur', '.valor_fatura', function () {
        calcTotalFatura()
    })
})

function getCFOPProduto() {

}

function calcTotalFatura() {
    var total = 0
    $(".valor_fatura").each(function () {
        total += convertMoedaToFloat($(this).val())
    })

    setTimeout(() => {
        // let acrescimo = convertMoedaToFloat($('#inp-acrescimo').val())
        // let desconto = convertMoedaToFloat($('#inp-desconto').val())
        // let total_nfe = $('.total_nfe').val()
        total_fatura = total
        $('.total_fatura').html("R$ " + convertFloatToMoeda(total))
    }, 100)
}

// CALCULO TOTAL DA NFE
$(function () {
    $('body').on('blur', '.valor_frete', function () {
        calTotalNfe()
    })
})
var total_frete = 0
var total_nfe = 0

function calTotalNfe() {
    let acrescimo = convertMoedaToFloat($('#inp-acrescimo').val())
    let desconto = convertMoedaToFloat($('#inp-desconto').val())
    let total_fr = convertMoedaToFloat($("#inp-valor_frete").val())
    let total_prod = parseFloat($('.total_prod').val())

    setTimeout(() => {
        total_frete = total_fr
        total_nfe = total_prod + total_fr + acrescimo - desconto
        $('.total_frete').html("R$ " + convertFloatToMoeda(total_fr))
        $('.total_nfe').html("R$ " + convertFloatToMoeda(total_nfe))
        // $('.valor_fatura').val(convertFloatToMoeda(total_nfe))
        $('.valor_total').val(convertFloatToMoeda(total_nfe))
        calcTotalFatura()
    }, 100)
}

$('.btn-salvar-nfe').click(() => {
    addClassRequired();
    $('#modal_sequencia').modal('show');
})

function addClassRequired() {
    let infMsg = ""
    $("body #form-nfe").find('input, select').each(function () {
        if ($(this).prop('required')) {
            if ($(this).val() === "") {
                try {
                    infMsg += $(this).prev()[0].textContent + "\n"
                } catch {
                }
                $(this).addClass('is-invalid')
            } else {
                $(this).removeClass('is-invalid')
            }
        } else {
            $(this).removeClass('is-invalid')
        }
    })
}
