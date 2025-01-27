ALTER TABLE `categoria_produtos` ADD `chapas` TINYINT(1) NULL DEFAULT '0' AFTER `reserva`;
ALTER TABLE `categoria_produtos` ADD `sequencia_id` TINYINT(1) NULL DEFAULT '0' AFTER `chapas`;
alter table item_nves add column cUFOrig varchar(2) default null;


/* Permissões da tela de Pedidos */
INSERT INTO `permissions` VALUES (223,'pedido_view','Visualiza Pedido Chapa e Dobra','web','2024-12-12 16:24:10','2024-12-12 16:24:10'),
                                 (224,'pedido_create','Cria Pedido Chapa e Dobra','web','2024-12-12 16:24:10','2024-12-12 16:24:10'),
                                 (225,'pedido_edit','Edita Pedido Chapa e Dobra','web','2024-12-12 16:24:10','2024-12-12 16:24:10'),
                                 (226,'pedido_delete','Deleta Pedido Chapa e Dobra','web','2024-12-12 16:24:10','2024-12-12 16:24:10');

alter table item_nves add column largura decimal(8, 2) default null;
alter table item_nves add column comprimento decimal(8, 2) default null;
alter table item_nves add column altura decimal(8, 2) default null;
alter table item_nves add column peso decimal(12, 3) default null;
alter table item_nves add column espessura decimal(8, 2) default null;
alter table item_nves add column diametro decimal(8, 2) default null;
alter table item_nves add column peso_por_peca decimal(12, 3) default null;
alter table item_nves add column peso_total decimal(12, 3) default null;

alter table maquinas add column movimenta_estoque boolean default 0 after valor_hora;

