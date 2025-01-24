alter table produtos add column valor_compra decimal(12,4);
alter table produtos add column valor_delivery decimal(12,4);
alter table produtos add column tempo_preparo integer default null;
alter table produtos add column referencia varchar(20) default null;
alter table produtos add column adRemICMSRet decimal(10,4) default 0;
alter table produtos add column pBio decimal(10,4) default 0;
alter table produtos add column tipo_servico boolean default 0;
alter table produtos add column delivery boolean default 0;
alter table produtos add column cUFOrig varchar(2) default null;
alter table produtos add column pOrig decimal(5,2) default 0;
alter table produtos add column indImport integer default 0;
alter table produtos add column codigo_anp varchar(10) default null;
alter table produtos add column perc_glp decimal(5,2) default 0;
alter table produtos add column perc_gnn decimal(5,2) default 0;
alter table produtos add column perc_gni decimal(5,2) default 0;
alter table produtos add column valor_partida decimal(10, 2) default 0;
alter table produtos add column unidade_tributavel varchar(4) default '';
alter table produtos add column quantidade_tributavel decimal(10, 2) default 0;
alter table produtos add column composto boolean default 0;
alter table produtos add column estoque_minimo decimal(5, 2) default 0;
alter table produtos add column alerta_validade varchar(255) default '';
alter table produtos add column referencia_balanca integer default null;
alter table produtos add column variacao_modelo_id integer default null;
alter table produtos add column cfop_entrada_estadual varchar(4) default null;
alter table produtos add column cfop_entrada_outro_estado varchar(4) default null;
alter table users add column sidebar_active boolean default 1;
alter table users add column notificacao_cardapio boolean default 0;
alter table users add column notificacao_marketplace boolean default 0;
alter table users add column tipo_contador boolean default 0;
alter table empresas add column logo varchar(100) default null;
alter table empresas add column tipo_contador boolean default 0;
alter table empresas add column exclusao_icms_pis_cofins boolean default 0;
alter table empresas add column limite_cadastro_empresas integer default 0;
alter table empresas add column percentual_comissao decimal(10,2) default 0;
alter table empresas add column empresa_selecionada integer default null;
alter table categoria_produtos add column tipo_pizza boolean default 0;
alter table categoria_produtos add column delivery boolean default 0;
alter table padrao_tributacao_produtos add column codigo_beneficio_fiscal varchar(10) default null;
alter table padrao_tributacao_produtos add column cfop_entrada_estadual varchar(4) default null;
alter table padrao_tributacao_produtos add column cfop_entrada_outro_estado varchar(4) default null;
alter table padrao_tributacao_produtos add column padrao boolean default 0;
alter table caixas add column data_fechamento timestamp default null;
alter table caixas add column valor_fechamento decimal(10,2) default 0;
alter table caixas add column valor_dinheiro decimal(10,2) default 0;
alter table caixas add column valor_cheque decimal(10,2) default 0;
alter table caixas add column valor_outros decimal(10,2) default 0;
alter table planos add column modulos text;
alter table planos add column visivel_contadores boolean default 0;
alter table clientes add column senha varchar(200) default null;
alter table clientes add column token integer default null;
alter table clientes add column valor_cashback decimal(10,2) default 0;
alter table nves add column orcamento boolean default 0;
alter table nves add column ref_orcamento integer default null;
alter table nves add column data_emissao_saida date default null;
alter table nves add column data_emissao_retroativa date default null;
alter table nves add column bandeira_cartao varchar(2) default null;
alter table nves add column cnpj_cartao varchar(18) default null;
alter table nves add column cAut_cartao varchar(18) default null;
alter table nves add column tipo_pagamento varchar(2) default '';
alter table nfces add column bandeira_cartao varchar(2) default 99;
alter table nfces add column cnpj_cartao varchar(18) default null;
alter table nfces add column cAut_cartao varchar(18) default null;
alter table nfces add column gerar_conta_receber boolean default 0;
alter table nfces add column valor_cashback decimal(10,2) default null;
alter table item_nves add column lote varchar(30) default null;
alter table item_nves add column data_vencimento date default null;
alter table item_nves add column variacao_id integer default null;
alter table item_nfces add column codigo_beneficio_fiscal varchar(10) default null;
alter table item_nfces add column variacao_id integer default null;
alter table configuracao_supers add column sms_key varchar(120) default null;
alter table configuracao_supers add column token_whatsapp varchar(120) default null;
alter table estoques add column produto_variacao_id integer default null;
alter table movimentacao_produtos add column produto_variacao_id integer default null;
alter table ctes add column status_pagamento boolean default 0;
alter table ctes add column api boolean default 0;
alter table conta_pagars add column caixa_id bigint(20) default null;
alter table conta_recebers add column caixa_id bigint(20) default null;
alter table funcionarios add column comissao decimal(10 ,2) default 0;
alter table funcionarios add column salario decimal(10 ,2) default 0;
alter table comissao_vendas add column valor_venda decimal(10,2) default 0;
alter table mdves add column latitude_carregamento varchar(15) default '';
alter table mdves add column longitude_carregamento varchar(15) default '';
alter table mdves add column latitude_descarregamento varchar(15) default '';
alter table mdves add column longitude_descarregamento varchar(15) default '';
alter table mdves add column estado_emissao enum('novo', 'aprovado', 'rejeitado', 'cancelado');
alter table mdves add column mdfe_numero integer default null;
alter table categoria_servicos add column imagem varchar(25) default '';
alter table servicos add column imagem varchar(25) default null;
alter table servicos add column status boolean default 1;
alter table interrupcoes add column motivo varchar(50) default null;
alter table servico_os add column valor decimal(10, 2) default 0;
alter table servico_os add column subtotal decimal(10, 2) default 0;
alter table produto_os add column valor decimal(10, 2) default 0;
alter table produto_os add column subtotal decimal(10, 2) default 0;
alter table agendamentos add column prioridade enum('baixa', 'media', 'alta') default 'baixa';
alter table tamanho_pizzas add column nome_en varchar(50) default null;
alter table tamanho_pizzas add column nome_es varchar(50) default null;
alter table pedidos add column em_atendimento boolean default 1;
alter table pedidos add column nfce_id integer default null;
alter table produtos add column tempo_preparo integer default null;
alter table produtos add column ponto_carne varchar(30) default null;
alter table item_pedidos add column tamanho_id integer default null;
alter table configuracao_cardapios add column valor_pizza enum('divide', 'valor_maior') default 'divide';
alter table cte_os add column data_viagem varchar(10) default '';
alter table cte_os add column horario_viagem varchar(5) default '';
alter table cte_os add column cfop varchar(4) default null;
alter table cte_os add column recibo varchar(30) default null;
alter table config_gerals add column confirmar_itens_prevenda boolean default 0;
alter table bairro_deliveries add column status boolean default 1;
alter table market_place_configs add column tipo_entrega varchar(30) default '';
alter table pedido_deliveries add column finalizado boolean default 0;
alter table pedido_deliveries add column nfce_id integer default null;
alter table produtos add column ecommerce boolean default 0;
alter table produtos add column valor_ecommerce decimal(12,4) default null;
alter table produtos add column percentual_desconto integer default null;
alter table produtos add column descricao_ecommerce varchar(255) default null;
alter table produtos add column largura decimal(8, 2) default null;
alter table produtos add column comprimento decimal(8, 2) default null;
alter table produtos add column altura decimal(8, 2) default null;
alter table produtos add column peso decimal(12, 3) default null;
alter table categoria_produtos add column ecommerce boolean default 0;
alter table produtos add column destaque_ecommerce boolean default 0;
alter table produtos add column hash_ecommerce varchar(50) default null;
alter table produtos add column texto_ecommerce text;
alter table configuracao_supers add column usuario_correios varchar(30) default null;
alter table configuracao_supers add column codigo_acesso_correios varchar(100) default null;
alter table configuracao_supers add column cartao_postagem_correios varchar(100) default null;
alter table configuracao_supers add column token_correios text;
alter table configuracao_supers add column token_expira_correios varchar(30) default null;
alter table configuracao_supers add column dr_correios varchar(30) default null;
alter table configuracao_supers add column contrato_correios varchar(30) default null;
alter table categoria_produtos add column hash_ecommerce varchar(50) default null;
alter table users add column notificacao_ecommerce boolean default 0;
alter table planos add column auto_cadastro boolean default 0;
alter table clientes add column uid varchar(30) default null;
alter table clientes add column status boolean default 1;
alter table config_gerals modify column balanca_digito_verificador integer default null;
alter table empresas add column numero_ultima_nfse integer default null;
alter table empresas add column numero_serie_nfse integer default null;
alter table servicos add column codigo_tributacao_municipio varchar(30) default null;
alter table nfces add column lista_id integer default null;
alter table pre_vendas add column lista_id integer default null;
alter table item_pre_vendas add column variacao_id integer default null;
alter table ordem_servicos add column codigo_sequencial integer default null;
alter table configuracao_supers add column token_auth_nfse varchar(255) default null;
alter table empresas add column token_nfse varchar(200) default null;
alter table config_gerals add column notificacoes text;
alter table market_place_configs add column loja_id varchar(15) default null;
alter table produtos add column destaque_delivery boolean default 0;
alter table categoria_produtos add column hash_delivery varchar(50) default null;
alter table produtos add column hash_delivery varchar(50) default null;
alter table produtos add column texto_delivery text;
alter table nves add column numero_sequencial integer default null;
alter table nfces add column numero_sequencial integer default null;
alter table market_place_configs add column email varchar(80) default null;
alter table market_place_configs add column cor_principal varchar(10) default null;
alter table ecommerce_configs add column dados_deposito text;
alter table pedido_ecommerces modify column tipo_pagamento enum('cartao', 'pix', 'boleto', 'deposito');
alter table empresas add column aut_xml varchar(18) default null;
alter table pedido_ecommerces add column comprovante varchar(25) default null;
alter table planos add column segmento_id integer default null;
alter table configuracao_supers add column timeout_nfe integer default 8;
alter table configuracao_supers add column timeout_nfce integer default 8;
alter table configuracao_supers add column timeout_cte integer default 8;
alter table configuracao_supers add column timeout_mdfe integer default 8;
alter table produtos add column mercado_livre_id varchar(20) default null;
alter table produtos add column mercado_livre_link varchar(255) default null;
alter table produtos add column mercado_livre_valor decimal(12, 4) default null;
alter table produtos add column mercado_livre_categoria varchar(20) default null;
alter table produtos add column condicao_mercado_livre varchar(20) default null;
alter table produtos add column quantidade_mercado_livre integer default null;
alter table produtos add column mercado_livre_tipo_publicacao varchar(20) default null;
alter table produtos add column mercado_livre_youtube varchar(100) default null;
alter table produtos add column mercado_livre_descricao text;
alter table mercado_livre_configs add column refresh_token varchar(255) default null;
alter table mercado_livre_configs add column token_expira bigint default null;
alter table mercado_livre_perguntas add column resposta text;
alter table pedido_mercado_livres add column codigo_rastreamento varchar(30) default null;
alter table planos add column fiscal boolean default 1;
alter table nves add column crt integer default null;
alter table caixas add column conta_empresa_id integer default null;
alter table sangria_caixas add column conta_empresa_id integer default null;
alter table suprimento_caixas add column conta_empresa_id integer default null;
alter table suprimento_caixas add column tipo_pagamento varchar(2) default null;
alter table produtos add column combo boolean default 0;
alter table produtos add column margem_combo decimal(5, 2) default 0;
alter table config_gerals add column margem_combo decimal(5,2) default 50;
alter table agendamentos add column nfce_id integer default null;
alter table nfces add column funcionario_id integer default null;
alter table produtos add column nuvem_shop_id varchar(20) default null;
alter table produtos add column nuvem_shop_valor decimal(12, 4) default null;
alter table produtos add column texto_nuvem_shop text;
alter table clientes add column nuvem_shop_id varchar(20) default null;
alter table produtos add column modBCST integer default null;
alter table produtos add column pMVAST decimal(5,2) default null;
alter table produtos add column pICMSST decimal(5,2) default null;
alter table produtos add column redBCST decimal(5,2) default null;
alter table padrao_tributacao_produtos add column modBCST integer default null;
alter table padrao_tributacao_produtos add column pMVAST decimal(5,2) default null;
alter table padrao_tributacao_produtos add column pICMSST decimal(5,2) default null;
alter table padrao_tributacao_produtos add column redBCST decimal(5,2) default null;
alter table conta_pagars add column local_id integer default null;
alter table conta_recebers add column local_id integer default null;
alter table nfces add column local_id integer default null;
alter table nves add column local_id integer default null;
alter table estoques add column local_id integer default null;
alter table ctes add column local_id integer default null;
alter table mdves add column local_id integer default null;
alter table cte_os add column local_id integer default null;
alter table caixas add column local_id integer default null;
alter table pre_vendas add column local_id integer default null;
alter table produtos modify column nome varchar(200);
alter table planos add column valor_implantacao decimal(10,2) default 0;
alter table nves add column signed_xml text default null;
alter table nfces add column signed_xml text default null;

alter table config_gerals add column percentual_lucro_produto decimal(10,2) default 0;
alter table config_gerals add column tipos_pagamento_pdv text;
alter table config_gerals add column senha_manipula_valor varchar(20) default null;
alter table config_gerals add column abrir_modal_cartao boolean default 1;

alter table movimentacao_produtos add column user_id integer default null after codigo_transacao;

alter table nota_servicos add column gerar_conta_receber boolean default null after valor_total;
alter table nota_servicos add column data_vencimento date default null after gerar_conta_receber;
alter table nota_servicos add column conta_receber_id integer default null after data_vencimento;

alter table servicos add column status boolean default 1 after imagem;
alter table servicos add column reserva boolean default 0 after status;
alter table servicos add column padrao_reserva_nfse boolean default 0 after reserva;
alter table servicos add column marketplace boolean default 0 after padrao_reserva_nfse;
alter table servicos add column codigo_tributacao_municipio varchar(30) default null after marketplace;
alter table servicos add column hash_delivery varchar(50) default null after codigo_tributacao_municipio;
alter table servicos add column descricao text after hash_delivery;
alter table servicos add column destaque_marketplace boolean default null after descricao;

alter table produtos add column percentual_lucro decimal(10,2) default 0 after valor_compra;

alter table categoria_servicos add column marketplace boolean default 0 after imagem;
alter table categoria_servicos add column hash_delivery varchar(50) default null after marketplace;

alter table item_nves add column vbc_icms decimal(10,2) default 0 after cest;
alter table item_nves add column vbc_pis decimal(10,2) default 0 after vbc_icms;
alter table item_nves add column vbc_cofins decimal(10,2) default 0 after vbc_pis;
alter table item_nves add column vbc_ipi decimal(10,2) default 0 after vbc_cofins;

alter table categoria_produtos add column reserva boolean default 0 after ecommerce;

alter table mdves add column tipo_modal integer default 1 after local_id;


INSERT INTO `permissions` VALUES (184,'transferencia_estoque_view','Visualiza transferência de estoque','web','2024-07-24 18:43:06','2024-07-24 18:43:06'),
(185,'transferencia_estoque_create','Cria transferência de estoque','web','2024-07-24 18:43:06','2024-07-24 18:43:06'),
(186,'transferencia_estoque_delete','Deleta transferência de estoque','web','2024-07-24 18:43:06','2024-07-24 18:43:06'),
(187,'config_reserva_view','Visualiza configuração de reserva','web','2024-07-24 18:43:06','2024-07-24 18:43:06'),
(188,'categoria_acomodacao_view','Visualiza categoria de acomodação','web','2024-07-24 18:43:06','2024-07-24 18:43:06'),
(189,'categoria_acomodacao_create','Cria categoria de acomodação','web','2024-07-24 18:43:06','2024-07-24 18:43:06'),
(190,'categoria_acomodacao_edit','Edita categoria de acomodação','web','2024-07-24 18:43:06','2024-07-24 18:43:06'),
(191,'categoria_acomodacao_delete','Deleta categoria de acomodação','web','2024-07-24 18:43:06','2024-07-24 18:43:06'),
(192,'acomodacao_view','Visualiza acomodação','web','2024-07-24 18:43:06','2024-07-24 18:43:06'),
(193,'acomodacao_create','Cria acomodação','web','2024-07-24 18:43:06','2024-07-24 18:43:06'),
(194,'acomodacao_edit','Edita acomodação','web','2024-07-24 18:43:06','2024-07-24 18:43:06'),
(195,'acomodacao_delete','Deleta acomodação','web','2024-07-24 18:43:06','2024-07-24 18:43:06'),
(196,'frigobar_view','Visualiza frigobar','web','2024-07-24 18:43:06','2024-07-24 18:43:06'),
(197,'frigobar_create','Cria frigobar','web','2024-07-24 18:43:06','2024-07-24 18:43:06'),
(198,'frigobar_edit','Edita frigobar','web','2024-07-24 18:43:06','2024-07-24 18:43:06'),
(199,'frigobar_delete','Deleta frigobar','web','2024-07-24 18:43:06','2024-07-24 18:43:06'),
(200,'reserva_view','Visualiza reserva','web','2024-07-24 18:43:06','2024-07-24 18:43:06'),
(201,'reserva_create','Cria reserva','web','2024-07-24 18:43:06','2024-07-24 18:43:06'),
(202,'reserva_edit','Edita reserva','web','2024-07-24 18:43:06','2024-07-24 18:43:06'),
(203,'reserva_delete','Deleta reserva','web','2024-07-24 18:43:06','2024-07-24 18:43:06');