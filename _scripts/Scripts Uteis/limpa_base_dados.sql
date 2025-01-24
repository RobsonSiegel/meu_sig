delete from empresas where id <> 3;
delete from pagamentos where empresa_id <>3;
delete from nuvem_shop_configs where empresa_id <>3;
delete from categoria_nuvem_shops where empresa_id <>3;
delete from ecommerce_configs where empresa_id <>3;
delete from variacao_modelos where empresa_id <>3;
delete from variacao_modelo_items where variacao_modelo_id in (select id from variacao_modelos where empresa_id <>3)
delete from tickets where empresa_id <>3;
delete from ticket_mensagems where ticket_id in (select id from tickets where empresa_id <>3);
delete from notificacaos where empresa_id <>3;
delete from funcionarios where empresa_id <>3;
delete from manifesto_dves where empresa_id <>3;
delete from config_gerals where empresa_id <>3;
delete from clientes where empresa_id <>3;
delete from fornecedors where empresa_id <>3;
delete from transportadoras where empresa_id <>3;
delete from roles where empresa_id <>3;
delete from plano_contas where empresa_id <>3;
delete from plano_empresas where empresa_id <>3;
update plano_contas set plano_conta_id = null where empresa_id <>3;
delete from padrao_tributacao_produtos where empresa_id <>3;
delete from natureza_operacaos where empresa_id <>3;
delete from financeiro_planos where empresa_id <>3;
delete from localizacaos where empresa_id <>3;
delete from usuario_localizacaos where localizacao_id in (select id from localizacaos where empresa_id <>3);
delete from item_nves where nfe_id in (select id from nves where empresa_id <>3)
delete from nves where empresa_id <>3;
delete from caixas where empresa_id <> 3;
delete from item_nfces where nfce_id in (select id from nfces where empresa_id <>3);
delete from nfces where empresa_id <>3;
delete from fatura_nfces where nfce_id in (select id from nfces where empresa_id <>3);
delete from categoria_produtos where empresa_id <> 3;
delete from produtos where empresa_id <>3;
delete from movimentacao_produtos where produto_id in (select id from produtos where empresa_id <>3);
delete from produto_localizacaos where produto_id in  (select id from produtos where empresa_id <>3);
delete from estoques where produto_id  in  (select id from produtos where empresa_id <>3);
delete from produto_variacaos where produto_id  in  (select id from produtos where empresa_id <>3);
delete from galeria_produtos  where produto_id  in  (select id from produtos where empresa_id <>3);

delete from users where id not in (2, 7);
delete from acesso_logs