ALTER TABLE `categoria_produtos` ADD `sequencia_id` BIGINT(20) NULL DEFAULT NULL AFTER `chapas`;

/* Permissões da tela de Máquinas */
INSERT INTO `permissions` VALUES (211,'maquina_view','Visualiza máquina','web','2024-12-12 16:24:10','2024-12-12 16:24:10'),
                                 (212,'maquina_create','Cria máquina','web','2024-12-12 16:24:10','2024-12-12 16:24:10'),
                                 (213,'maquina_edit','Edita máquina','web','2024-12-12 16:24:10','2024-12-12 16:24:10'),
                                 (214,'maquina_delete','Deleta máquina','web','2024-12-12 16:24:10','2024-12-12 16:24:10');

/* Permissões da tela de Setores */
INSERT INTO `permissions` VALUES (215,'setor_view','Visualiza setor','web','2024-12-12 16:24:10','2024-12-12 16:24:10'),
                                 (216,'setor_create','Cria setor','web','2024-12-12 16:24:10','2024-12-12 16:24:10'),
                                 (217,'setor_edit','Edita setor','web','2024-12-12 16:24:10','2024-12-12 16:24:10'),
                                 (218,'setor_delete','Deleta setor','web','2024-12-12 16:24:10','2024-12-12 16:24:10');

/* Permissões da tela de Sequencia padrão*/
INSERT INTO `permissions` VALUES (219,'seqpadrao_view','Visualiza sequência padrão','web','2024-12-12 16:24:10','2024-12-12 16:24:10'),
                                 (220,'seqpadrao_create','Cria sequência padrão','web','2024-12-12 16:24:10','2024-12-12 16:24:10'),
                                 (221,'seqpadrao_edit','Edita sequência padrão','web','2024-12-12 16:24:10','2024-12-12 16:24:10'),
                                 (222,'seqpadrao_delete','Deleta sequência padrão','web','2024-12-12 16:24:10','2024-12-12 16:24:10');

insert into migrations (id, migration, batch) values (170, '2024_06_27_091834_create_modelo_etiquetas_table', 1);
insert into migrations (id, migration, batch) values (171, '2024_07_02_111631_create_produto_fornecedors_table', 1);
insert into migrations (id, migration, batch) values (172, '2024_07_06_104854_create_transferencia_estoques_table', 1);
insert into migrations (id, migration, batch) values (173, '2024_07_06_105116_create_item_transferencia_estoques_table', 1);
insert into migrations (id, migration, batch) values (174, '2024_07_07_082043_create_reserva_configs_table', 1);
insert into migrations (id, migration, batch) values (175, '2024_07_07_082044_create_categoria_acomodacaos_table', 1);
insert into migrations (id, migration, batch) values (176, '2024_07_07_084023_create_acomodacaos_table', 1);
insert into migrations (id, migration, batch) values (177, '2024_07_07_095427_create_frigobars_table', 1);
insert into migrations (id, migration, batch) values (178, '2024_07_07_121439_create_reservas_table', 1);
insert into migrations (id, migration, batch) values (192, '2024_07_07_122035_create_consumo_reservas_table', 1);
insert into migrations (id, migration, batch) values (179, '2024_07_07_122230_create_notas_reservas_table', 1);
insert into migrations (id, migration, batch) values (180, '2024_07_07_122604_create_servico_reservas_table', 1);
insert into migrations (id, migration, batch) values (181, '2024_07_07_122913_create_padrao_frigobars_table', 1);
insert into migrations (id, migration, batch) values (182, '2024_07_07_164930_create_hospede_reservas_table', 1);
insert into migrations (id, migration, batch) values (183, '2024_07_09_112559_create_fatura_reservas_table', 1);
insert into migrations (id, migration, batch) values (201, '2024_08_14_095314_create_venda_suspensas_table', 1);
insert into migrations (id, migration, batch) values (184, '2024_08_14_095318_create_item_venda_suspensas_table', 1);
insert into migrations (id, migration, batch) values (185, '2024_08_14_184446_create_trocas_table', 1);
insert into migrations (id, migration, batch) values (186, '2024_08_14_184450_create_item_trocas_table', 1);
insert into migrations (id, migration, batch) values (187, '2024_08_16_092516_create_credito_clientes_table', 1);
insert into migrations (id, migration, batch) values (188, '2024_08_18_110001_create_contigencias_table', 1);
insert into migrations (id, migration, batch) values (189, '2024_08_30_104205_create_woocommerce_configs_table', 1);
insert into migrations (id, migration, batch) values (190, '2024_08_30_111235_create_categoria_woocommerces_table', 1);
insert into migrations (id, migration, batch) values (191, '2024_08_31_152251_create_woocommerce_pedidos_table', 1);
insert into migrations (id, migration, batch) values (193, '2024_08_31_152257_create_woocommerce_item_pedidos_table', 1);
insert into migrations (id, migration, batch) values (194, '2024_08_31_152257_create_woocommerce_item_pedidos_table', 1);
insert into migrations (id, migration, batch) values (195, '2024_09_11_103656_create_system_updates_table', 1);
insert into migrations (id, migration, batch) values (196, '2024_09_13_112025_create_tef_multi_plus_cards_table', 1);
insert into migrations (id, migration, batch) values (197, '2024_09_13_171400_create_registro_tefs_table', 1);
insert into migrations (id, migration, batch) values (198, '2024_09_24_000224_create_acao_logs_table', 1);
