CREATE TABLE `acesso_logs`
(
    `id`         bigint unsigned                        NOT NULL AUTO_INCREMENT,
    `usuario_id` bigint unsigned                             DEFAULT NULL,
    `ip`         varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp                              NULL DEFAULT NULL,
    `updated_at` timestamp                              NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `acesso_logs_usuario_id_foreign` (`usuario_id`),
    CONSTRAINT `acesso_logs_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 42
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `motivo_interrupcaos`
(
    `id`         bigint unsigned                        NOT NULL AUTO_INCREMENT,
    `empresa_id` bigint unsigned                        NOT NULL,
    `motivo`     varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp                              NULL DEFAULT NULL,
    `updated_at` timestamp                              NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `motivo_interrupcaos_empresa_id_foreign` (`empresa_id`),
    CONSTRAINT `motivo_interrupcaos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `evento_salarios`
(
    `id`         bigint unsigned                                              NOT NULL AUTO_INCREMENT,
    `nome`       varchar(50) COLLATE utf8mb4_unicode_ci                       NOT NULL,
    `tipo`       enum ('semanal','mensal','anual') COLLATE utf8mb4_unicode_ci NOT NULL,
    `metodo`     enum ('informado','fixo') COLLATE utf8mb4_unicode_ci         NOT NULL,
    `condicao`   enum ('soma','diminui') COLLATE utf8mb4_unicode_ci           NOT NULL,
    `tipo_valor` enum ('fixo','percentual') COLLATE utf8mb4_unicode_ci        NOT NULL,
    `ativo`      tinyint(1)                                                   NOT NULL DEFAULT '1',
    `empresa_id` bigint unsigned                                              NOT NULL,
    `created_at` timestamp                                                    NULL     DEFAULT NULL,
    `updated_at` timestamp                                                    NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `evento_salarios_empresa_id_foreign` (`empresa_id`),
    CONSTRAINT `evento_salarios_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `apuracao_mensals`
(
    `id`              bigint unsigned                         NOT NULL AUTO_INCREMENT,
    `funcionario_id`  bigint unsigned                         NOT NULL,
    `mes`             varchar(20) COLLATE utf8mb4_unicode_ci  NOT NULL,
    `ano`             int                                     NOT NULL,
    `valor_final`     decimal(10, 2)                          NOT NULL,
    `forma_pagamento` varchar(30) COLLATE utf8mb4_unicode_ci  NOT NULL,
    `observacao`      varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    `conta_pagar_id`  int                                     NOT NULL DEFAULT '0',
    `created_at`      timestamp                               NULL     DEFAULT NULL,
    `updated_at`      timestamp                               NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `apuracao_mensals_funcionario_id_foreign` (`funcionario_id`),
    CONSTRAINT `apuracao_mensals_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 12
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `apuracao_mensal_eventos`
(
    `id`          bigint unsigned                                      NOT NULL AUTO_INCREMENT,
    `apuracao_id` bigint unsigned                                           DEFAULT NULL,
    `evento_id`   bigint unsigned                                           DEFAULT NULL,
    `valor`       decimal(8, 2)                                        NOT NULL,
    `metodo`      enum ('informado','fixo') COLLATE utf8mb4_unicode_ci NOT NULL,
    `condicao`    enum ('soma','diminui') COLLATE utf8mb4_unicode_ci   NOT NULL,
    `nome`        varchar(100) COLLATE utf8mb4_unicode_ci              NOT NULL,
    `created_at`  timestamp                                            NULL DEFAULT NULL,
    `updated_at`  timestamp                                            NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `apuracao_mensal_eventos_apuracao_id_foreign` (`apuracao_id`),
    KEY `apuracao_mensal_eventos_evento_id_foreign` (`evento_id`),
    CONSTRAINT `apuracao_mensal_eventos_apuracao_id_foreign` FOREIGN KEY (`apuracao_id`) REFERENCES `apuracao_mensals` (`id`),
    CONSTRAINT `apuracao_mensal_eventos_evento_id_foreign` FOREIGN KEY (`evento_id`) REFERENCES `evento_salarios` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 23
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `funcionario_eventos`
(
    `id`             bigint unsigned                                      NOT NULL AUTO_INCREMENT,
    `funcionario_id` bigint unsigned                                      NOT NULL,
    `evento_id`      bigint unsigned                                               DEFAULT NULL,
    `condicao`       enum ('soma','diminui') COLLATE utf8mb4_unicode_ci   NOT NULL,
    `metodo`         enum ('informado','fixo') COLLATE utf8mb4_unicode_ci NOT NULL,
    `valor`          decimal(10, 2)                                       NOT NULL,
    `ativo`          tinyint(1)                                           NOT NULL DEFAULT '1',
    `created_at`     timestamp                                            NULL     DEFAULT NULL,
    `updated_at`     timestamp                                            NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `funcionario_eventos_funcionario_id_foreign` (`funcionario_id`),
    KEY `funcionario_eventos_evento_id_foreign` (`evento_id`),
    CONSTRAINT `funcionario_eventos_evento_id_foreign` FOREIGN KEY (`evento_id`) REFERENCES `evento_salarios` (`id`),
    CONSTRAINT `funcionario_eventos_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 35
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `bairro_delivery_masters`
(
    `id`         bigint unsigned                        NOT NULL AUTO_INCREMENT,
    `nome`       varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
    `cidade_id`  bigint unsigned                             DEFAULT NULL,
    `created_at` timestamp                              NULL DEFAULT NULL,
    `updated_at` timestamp                              NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `bairro_delivery_masters_cidade_id_foreign` (`cidade_id`),
    CONSTRAINT `bairro_delivery_masters_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `bairro_deliveries`
(
    `id`                    bigint unsigned                        NOT NULL AUTO_INCREMENT,
    `empresa_id`            bigint unsigned                             DEFAULT NULL,
    `nome`                  varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
    `valor_entrega`         decimal(10, 2)                         NOT NULL,
    `bairro_delivery_super` int                                         DEFAULT NULL,
    `created_at`            timestamp                              NULL DEFAULT NULL,
    `updated_at`            timestamp                              NULL DEFAULT NULL,
    `status`                tinyint(1)                                  DEFAULT '1',
    PRIMARY KEY (`id`),
    KEY `bairro_deliveries_empresa_id_foreign` (`empresa_id`),
    CONSTRAINT `bairro_deliveries_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `contador_empresas`
(
    `id`          bigint unsigned NOT NULL AUTO_INCREMENT,
    `empresa_id`  bigint unsigned      DEFAULT NULL,
    `contador_id` bigint unsigned      DEFAULT NULL,
    `created_at`  timestamp       NULL DEFAULT NULL,
    `updated_at`  timestamp       NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `contador_empresas_empresa_id_foreign` (`empresa_id`),
    KEY `contador_empresas_contador_id_foreign` (`contador_id`),
    CONSTRAINT `contador_empresas_contador_id_foreign` FOREIGN KEY (`contador_id`) REFERENCES `empresas` (`id`),
    CONSTRAINT `contador_empresas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `plano_pendentes`
(
    `id`          bigint unsigned NOT NULL AUTO_INCREMENT,
    `empresa_id`  bigint unsigned NOT NULL,
    `contador_id` bigint unsigned NOT NULL,
    `valor`       decimal(10, 2)  NOT NULL,
    `plano_id`    bigint unsigned NOT NULL,
    `status`      tinyint(1)      NOT NULL DEFAULT '0',
    `created_at`  timestamp       NULL     DEFAULT NULL,
    `updated_at`  timestamp       NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `plano_pendentes_empresa_id_foreign` (`empresa_id`),
    KEY `plano_pendentes_contador_id_foreign` (`contador_id`),
    KEY `plano_pendentes_plano_id_foreign` (`plano_id`),
    CONSTRAINT `plano_pendentes_contador_id_foreign` FOREIGN KEY (`contador_id`) REFERENCES `empresas` (`id`),
    CONSTRAINT `plano_pendentes_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
    CONSTRAINT `plano_pendentes_plano_id_foreign` FOREIGN KEY (`plano_id`) REFERENCES `planos` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `difals`
(
    `id`             bigint unsigned                       NOT NULL AUTO_INCREMENT,
    `empresa_id`     bigint unsigned                       NOT NULL,
    `uf`             varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
    `cfop`           varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
    `pICMSUFDest`    decimal(6, 2)                         NOT NULL,
    `pICMSInter`     decimal(6, 2)                         NOT NULL,
    `pICMSInterPart` decimal(6, 2)                         NOT NULL,
    `pFCPUFDest`     decimal(6, 2)                         NOT NULL,
    `created_at`     timestamp                             NULL DEFAULT NULL,
    `updated_at`     timestamp                             NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `difals_empresa_id_foreign` (`empresa_id`),
    CONSTRAINT `difals_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `financeiro_contadors`
(
    `id`                  bigint unsigned                        NOT NULL AUTO_INCREMENT,
    `contador_id`         bigint unsigned                                 DEFAULT NULL,
    `percentual_comissao` decimal(5, 2)                          NOT NULL,
    `valor_comissao`      decimal(10, 2)                         NOT NULL,
    `total_venda`         decimal(10, 2)                         NOT NULL,
    `mes`                 varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
    `ano`                 int                                    NOT NULL,
    `tipo_pagamento`      varchar(30) COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `observacao`          varchar(100) COLLATE utf8mb4_unicode_ci         DEFAULT NULL,
    `status_pagamento`    tinyint(1)                             NOT NULL DEFAULT '0',
    `created_at`          timestamp                              NULL     DEFAULT NULL,
    `updated_at`          timestamp                              NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `financeiro_contadors_contador_id_foreign` (`contador_id`),
    CONSTRAINT `financeiro_contadors_contador_id_foreign` FOREIGN KEY (`contador_id`) REFERENCES `empresas` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `market_place_configs`
(
    `id`                         bigint unsigned                                          NOT NULL AUTO_INCREMENT,
    `empresa_id`                 bigint unsigned                                                   DEFAULT NULL,
    `cidade_id`                  bigint unsigned                                                   DEFAULT NULL,
    `link_facebook`              varchar(255) COLLATE utf8mb4_unicode_ci                           DEFAULT NULL,
    `link_instagram`             varchar(255) COLLATE utf8mb4_unicode_ci                           DEFAULT NULL,
    `link_whatsapp`              varchar(255) COLLATE utf8mb4_unicode_ci                           DEFAULT NULL,
    `telefone`                   varchar(20) COLLATE utf8mb4_unicode_ci                   NOT NULL,
    `rua`                        varchar(80) COLLATE utf8mb4_unicode_ci                   NOT NULL,
    `numero`                     varchar(15) COLLATE utf8mb4_unicode_ci                   NOT NULL,
    `bairro`                     varchar(30) COLLATE utf8mb4_unicode_ci                   NOT NULL,
    `cep`                        varchar(9) COLLATE utf8mb4_unicode_ci                    NOT NULL,
    `tempo_medio_entrega`        varchar(10) COLLATE utf8mb4_unicode_ci                            DEFAULT NULL,
    `valor_entrega`              decimal(10, 2)                                                    DEFAULT NULL,
    `nome`                       varchar(50) COLLATE utf8mb4_unicode_ci                   NOT NULL,
    `descricao`                  varchar(200) COLLATE utf8mb4_unicode_ci                           DEFAULT NULL,
    `latitude`                   varchar(15) COLLATE utf8mb4_unicode_ci                            DEFAULT NULL,
    `longitude`                  varchar(15) COLLATE utf8mb4_unicode_ci                            DEFAULT NULL,
    `valor_entrega_gratis`       int                                                               DEFAULT NULL,
    `usar_bairros`               tinyint(1)                                               NOT NULL,
    `status`                     tinyint(1)                                               NOT NULL DEFAULT '0',
    `notificacao_novo_pedido`    tinyint(1)                                               NOT NULL DEFAULT '1',
    `mercadopago_public_key`     varchar(120) COLLATE utf8mb4_unicode_ci                           DEFAULT NULL,
    `mercadopago_access_token`   varchar(120) COLLATE utf8mb4_unicode_ci                           DEFAULT NULL,
    `tipo_divisao_pizza`         enum ('divide','valor_maior') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'divide',
    `logo`                       varchar(25) COLLATE utf8mb4_unicode_ci                   NOT NULL,
    `fav_icon`                   varchar(25) COLLATE utf8mb4_unicode_ci                   NOT NULL,
    `tipos_pagamento`            varchar(255) COLLATE utf8mb4_unicode_ci                  NOT NULL DEFAULT '[]',
    `segmento`                   varchar(100) COLLATE utf8mb4_unicode_ci                  NOT NULL DEFAULT '[]',
    `pedido_minimo`              decimal(10, 2)                                                    DEFAULT NULL,
    `avaliacao_media`            decimal(10, 2)                                           NOT NULL,
    `api_token`                  varchar(50) COLLATE utf8mb4_unicode_ci                            DEFAULT NULL,
    `autenticacao_sms`           tinyint(1)                                               NOT NULL DEFAULT '0',
    `confirmacao_pedido_cliente` tinyint(1)                                               NOT NULL DEFAULT '0',
    `created_at`                 timestamp                                                NULL     DEFAULT NULL,
    `updated_at`                 timestamp                                                NULL     DEFAULT NULL,
    `tipo_entrega`               varchar(30) COLLATE utf8mb4_unicode_ci                            DEFAULT '',
    PRIMARY KEY (`id`),
    KEY `market_place_configs_empresa_id_foreign` (`empresa_id`),
    KEY `market_place_configs_cidade_id_foreign` (`cidade_id`),
    CONSTRAINT `market_place_configs_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
    CONSTRAINT `market_place_configs_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `destaque_market_places`
(
    `id`         bigint unsigned NOT NULL AUTO_INCREMENT,
    `empresa_id` bigint unsigned NOT NULL,
    `produto_id` bigint unsigned                         DEFAULT NULL,
    `servico_id` bigint unsigned                         DEFAULT NULL,
    `descricao`  varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `valor`      decimal(12, 4)                          DEFAULT NULL,
    `status`     tinyint(1)      NOT NULL                DEFAULT '1',
    `imagem`     varchar(25) COLLATE utf8mb4_unicode_ci  DEFAULT NULL,
    `created_at` timestamp       NULL                    DEFAULT NULL,
    `updated_at` timestamp       NULL                    DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `destaque_market_places_empresa_id_foreign` (`empresa_id`),
    KEY `destaque_market_places_produto_id_foreign` (`produto_id`),
    KEY `destaque_market_places_servico_id_foreign` (`servico_id`),
    CONSTRAINT `destaque_market_places_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
    CONSTRAINT `destaque_market_places_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
    CONSTRAINT `destaque_market_places_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `cupom_descontos`
(
    `id`                  bigint unsigned                                        NOT NULL AUTO_INCREMENT,
    `empresa_id`          bigint unsigned                                        NOT NULL,
    `cliente_id`          bigint unsigned                                                 DEFAULT NULL,
    `tipo_desconto`       enum ('valor','percentual') COLLATE utf8mb4_unicode_ci NOT NULL,
    `codigo`              varchar(6) COLLATE utf8mb4_unicode_ci                  NOT NULL,
    `descricao`           varchar(50) COLLATE utf8mb4_unicode_ci                          DEFAULT NULL,
    `valor`               decimal(10, 4)                                         NOT NULL,
    `valor_minimo_pedido` decimal(12, 4)                                         NOT NULL,
    `status`              tinyint(1)                                             NOT NULL DEFAULT '1',
    `expiracao`           date                                                            DEFAULT NULL,
    `created_at`          timestamp                                              NULL     DEFAULT NULL,
    `updated_at`          timestamp                                              NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `cupom_descontos_empresa_id_foreign` (`empresa_id`),
    KEY `cupom_descontos_cliente_id_foreign` (`cliente_id`),
    CONSTRAINT `cupom_descontos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
    CONSTRAINT `cupom_descontos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `funcionamento_deliveries`
(
    `id`         bigint unsigned                                                                                  NOT NULL AUTO_INCREMENT,
    `empresa_id` bigint unsigned                                                                                  NOT NULL,
    `inicio`     time                                                                                             NOT NULL,
    `fim`        time                                                                                             NOT NULL,
    `dia`        enum ('segunda','terca','quarta','quinta','sexta','sabado','domingo') COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp                                                                                        NULL DEFAULT NULL,
    `updated_at` timestamp                                                                                        NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `funcionamento_deliveries_empresa_id_foreign` (`empresa_id`),
    CONSTRAINT `funcionamento_deliveries_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `motoboys`
(
    `id`             bigint unsigned                                             NOT NULL AUTO_INCREMENT,
    `empresa_id`     bigint unsigned                                             NOT NULL,
    `nome`           varchar(60) COLLATE utf8mb4_unicode_ci                      NOT NULL,
    `telefone`       varchar(20) COLLATE utf8mb4_unicode_ci                      NOT NULL,
    `valor_comissao` decimal(10, 2)                                              NOT NULL,
    `tipo_comissao`  enum ('valor_fixo','percentual') COLLATE utf8mb4_unicode_ci NOT NULL,
    `status`         tinyint(1)                                                  NOT NULL DEFAULT '1',
    `created_at`     timestamp                                                   NULL     DEFAULT NULL,
    `updated_at`     timestamp                                                   NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `motoboys_empresa_id_foreign` (`empresa_id`),
    CONSTRAINT `motoboys_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `endereco_deliveries`
(
    `id`         bigint unsigned                                     NOT NULL AUTO_INCREMENT,
    `cidade_id`  bigint unsigned                                     NOT NULL,
    `cliente_id` bigint unsigned                                     NOT NULL,
    `bairro_id`  bigint unsigned                                     NOT NULL,
    `rua`        varchar(50) COLLATE utf8mb4_unicode_ci              NOT NULL,
    `numero`     varchar(10) COLLATE utf8mb4_unicode_ci              NOT NULL,
    `referencia` varchar(30) COLLATE utf8mb4_unicode_ci                   DEFAULT NULL,
    `latitude`   varchar(10) COLLATE utf8mb4_unicode_ci                   DEFAULT NULL,
    `longitude`  varchar(10) COLLATE utf8mb4_unicode_ci                   DEFAULT NULL,
    `cep`        varchar(10) COLLATE utf8mb4_unicode_ci              NOT NULL,
    `tipo`       enum ('casa','trabalho') COLLATE utf8mb4_unicode_ci NOT NULL,
    `padrao`     tinyint(1)                                          NOT NULL,
    `created_at` timestamp                                           NULL DEFAULT NULL,
    `updated_at` timestamp                                           NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `endereco_deliveries_cidade_id_foreign` (`cidade_id`),
    KEY `endereco_deliveries_cliente_id_foreign` (`cliente_id`),
    KEY `endereco_deliveries_bairro_id_foreign` (`bairro_id`),
    CONSTRAINT `endereco_deliveries_bairro_id_foreign` FOREIGN KEY (`bairro_id`) REFERENCES `bairro_deliveries` (`id`),
    CONSTRAINT `endereco_deliveries_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
    CONSTRAINT `endereco_deliveries_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `pedido_deliveries`
(
    `id`               bigint unsigned                                                              NOT NULL AUTO_INCREMENT,
    `empresa_id`       bigint unsigned                                                              NOT NULL,
    `cliente_id`       bigint unsigned                                                              NOT NULL,
    `motoboy_id`       bigint unsigned                                                                       DEFAULT NULL,
    `comissao_motoboy` decimal(10, 2)                                                                        DEFAULT NULL,
    `valor_total`      decimal(10, 2)                                                               NOT NULL,
    `troco_para`       decimal(10, 2)                                                                        DEFAULT NULL,
    `tipo_pagamento`   varchar(20) COLLATE utf8mb4_unicode_ci                                       NOT NULL,
    `observacao`       varchar(50) COLLATE utf8mb4_unicode_ci                                                DEFAULT NULL,
    `telefone`         varchar(15) COLLATE utf8mb4_unicode_ci                                       NOT NULL,
    `estado`           enum ('novo','aprovado','cancelado','finalizado') COLLATE utf8mb4_unicode_ci NOT NULL,
    `motivo_estado`    varchar(50) COLLATE utf8mb4_unicode_ci                                                DEFAULT NULL,
    `endereco_id`      bigint unsigned                                                                       DEFAULT NULL,
    `cupom_id`         bigint unsigned                                                                       DEFAULT NULL,
    `desconto`         decimal(10, 2)                                                                        DEFAULT NULL,
    `valor_entrega`    decimal(10, 2)                                                               NOT NULL,
    `app`              tinyint(1)                                                                   NOT NULL,
    `qr_code_base64`   text COLLATE utf8mb4_unicode_ci,
    `qr_code`          text COLLATE utf8mb4_unicode_ci,
    `transacao_id`     varchar(50) COLLATE utf8mb4_unicode_ci                                                DEFAULT NULL,
    `status_pagamento` varchar(100) COLLATE utf8mb4_unicode_ci                                               DEFAULT NULL,
    `pedido_lido`      tinyint(1)                                                                   NOT NULL DEFAULT '0',
    `finalizado`       tinyint(1)                                                                   NOT NULL DEFAULT '0',
    `horario_cricao`   varchar(5) COLLATE utf8mb4_unicode_ci                                                 DEFAULT NULL,
    `horario_leitura`  varchar(5) COLLATE utf8mb4_unicode_ci                                                 DEFAULT NULL,
    `horario_entrega`  varchar(5) COLLATE utf8mb4_unicode_ci                                                 DEFAULT NULL,
    `nfce_id`          int                                                                                   DEFAULT NULL,
    `created_at`       timestamp                                                                    NULL     DEFAULT NULL,
    `updated_at`       timestamp                                                                    NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `pedido_deliveries_empresa_id_foreign` (`empresa_id`),
    KEY `pedido_deliveries_cliente_id_foreign` (`cliente_id`),
    KEY `pedido_deliveries_motoboy_id_foreign` (`motoboy_id`),
    KEY `pedido_deliveries_endereco_id_foreign` (`endereco_id`),
    KEY `pedido_deliveries_cupom_id_foreign` (`cupom_id`),
    CONSTRAINT `pedido_deliveries_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
    CONSTRAINT `pedido_deliveries_cupom_id_foreign` FOREIGN KEY (`cupom_id`) REFERENCES `cupom_descontos` (`id`),
    CONSTRAINT `pedido_deliveries_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
    CONSTRAINT `pedido_deliveries_endereco_id_foreign` FOREIGN KEY (`endereco_id`) REFERENCES `endereco_deliveries` (`id`),
    CONSTRAINT `pedido_deliveries_motoboy_id_foreign` FOREIGN KEY (`motoboy_id`) REFERENCES `motoboys` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 41
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `item_pedido_deliveries`
(
    `id`             bigint unsigned                                                               NOT NULL AUTO_INCREMENT,
    `produto_id`     bigint unsigned                                                               NOT NULL,
    `pedido_id`      bigint unsigned                                                               NOT NULL,
    `tamanho_id`     bigint unsigned                                                                        DEFAULT NULL,
    `status`         tinyint(1)                                                                    NOT NULL,
    `estado`         enum ('novo','pendente','preparando','finalizado') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'novo',
    `quantidade`     decimal(8, 2)                                                                 NOT NULL,
    `valor_unitario` decimal(12, 2)                                                                NOT NULL,
    `sub_total`      decimal(12, 2)                                                                NOT NULL,
    `observacao`     varchar(50) COLLATE utf8mb4_unicode_ci                                                 DEFAULT NULL,
    `created_at`     timestamp                                                                     NULL     DEFAULT NULL,
    `updated_at`     timestamp                                                                     NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `item_pedido_deliveries_produto_id_foreign` (`produto_id`),
    KEY `item_pedido_deliveries_pedido_id_foreign` (`pedido_id`),
    KEY `item_pedido_deliveries_tamanho_id_foreign` (`tamanho_id`),
    CONSTRAINT `item_pedido_deliveries_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedido_deliveries` (`id`),
    CONSTRAINT `item_pedido_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
    CONSTRAINT `item_pedido_deliveries_tamanho_id_foreign` FOREIGN KEY (`tamanho_id`) REFERENCES `tamanho_pizzas` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 41
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `item_adicional_deliveries`
(
    `id`             bigint unsigned NOT NULL AUTO_INCREMENT,
    `item_pedido_id` bigint unsigned NOT NULL,
    `adicional_id`   bigint unsigned NOT NULL,
    `created_at`     timestamp       NULL DEFAULT NULL,
    `updated_at`     timestamp       NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `item_adicional_deliveries_item_pedido_id_foreign` (`item_pedido_id`),
    KEY `item_adicional_deliveries_adicional_id_foreign` (`adicional_id`),
    CONSTRAINT `item_adicional_deliveries_adicional_id_foreign` FOREIGN KEY (`adicional_id`) REFERENCES `adicionals` (`id`),
    CONSTRAINT `item_adicional_deliveries_item_pedido_id_foreign` FOREIGN KEY (`item_pedido_id`) REFERENCES `item_pedido_deliveries` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 9
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `item_pizza_pedido_deliveries`
(
    `id`             bigint unsigned NOT NULL AUTO_INCREMENT,
    `item_pedido_id` bigint unsigned NOT NULL,
    `produto_id`     bigint unsigned NOT NULL,
    `created_at`     timestamp       NULL DEFAULT NULL,
    `updated_at`     timestamp       NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `item_pizza_pedido_deliveries_item_pedido_id_foreign` (`item_pedido_id`),
    KEY `item_pizza_pedido_deliveries_produto_id_foreign` (`produto_id`),
    CONSTRAINT `item_pizza_pedido_deliveries_item_pedido_id_foreign` FOREIGN KEY (`item_pedido_id`) REFERENCES `item_pedido_deliveries` (`id`),
    CONSTRAINT `item_pizza_pedido_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `motoboy_comissaos`
(
    `id`                 bigint unsigned NOT NULL AUTO_INCREMENT,
    `empresa_id`         bigint unsigned NOT NULL,
    `pedido_id`          bigint unsigned NOT NULL,
    `motoboy_id`         bigint unsigned NOT NULL,
    `valor`              decimal(10, 2)  NOT NULL,
    `valor_total_pedido` decimal(10, 2)  NOT NULL,
    `status`             tinyint(1)      NOT NULL DEFAULT '0',
    `created_at`         timestamp       NULL     DEFAULT NULL,
    `updated_at`         timestamp       NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `motoboy_comissaos_empresa_id_foreign` (`empresa_id`),
    KEY `motoboy_comissaos_pedido_id_foreign` (`pedido_id`),
    KEY `motoboy_comissaos_motoboy_id_foreign` (`motoboy_id`),
    CONSTRAINT `motoboy_comissaos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
    CONSTRAINT `motoboy_comissaos_motoboy_id_foreign` FOREIGN KEY (`motoboy_id`) REFERENCES `motoboys` (`id`),
    CONSTRAINT `motoboy_comissaos_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedido_deliveries` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `cupom_desconto_clientes`
(
    `id`         bigint unsigned NOT NULL AUTO_INCREMENT,
    `cliente_id` bigint unsigned NOT NULL,
    `empresa_id` bigint unsigned NOT NULL,
    `cupom_id`   bigint unsigned NOT NULL,
    `pedido_id`  bigint unsigned NOT NULL,
    `created_at` timestamp       NULL DEFAULT NULL,
    `updated_at` timestamp       NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `cupom_desconto_clientes_cliente_id_foreign` (`cliente_id`),
    KEY `cupom_desconto_clientes_empresa_id_foreign` (`empresa_id`),
    KEY `cupom_desconto_clientes_cupom_id_foreign` (`cupom_id`),
    KEY `cupom_desconto_clientes_pedido_id_foreign` (`pedido_id`),
    CONSTRAINT `cupom_desconto_clientes_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
    CONSTRAINT `cupom_desconto_clientes_cupom_id_foreign` FOREIGN KEY (`cupom_id`) REFERENCES `cupom_descontos` (`id`),
    CONSTRAINT `cupom_desconto_clientes_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
    CONSTRAINT `cupom_desconto_clientes_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedido_deliveries` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `cash_back_configs`
(
    `id`                       bigint unsigned                         NOT NULL AUTO_INCREMENT,
    `empresa_id`               bigint unsigned                         NOT NULL,
    `valor_percentual`         decimal(5, 2)                           NOT NULL,
    `dias_expiracao`           int                                     NOT NULL,
    `valor_minimo_venda`       decimal(10, 2)                          NOT NULL,
    `percentual_maximo_venda`  decimal(10, 2)                          NOT NULL,
    `mensagem_padrao_whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at`               timestamp                               NULL DEFAULT NULL,
    `updated_at`               timestamp                               NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `cash_back_configs_empresa_id_foreign` (`empresa_id`),
    CONSTRAINT `cash_back_configs_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `cash_back_clientes`
(
    `id`               bigint unsigned                                 NOT NULL AUTO_INCREMENT,
    `empresa_id`       bigint unsigned                                 NOT NULL,
    `cliente_id`       bigint unsigned                                 NOT NULL,
    `tipo`             enum ('venda','pdv') COLLATE utf8mb4_unicode_ci NOT NULL,
    `venda_id`         int                                             NOT NULL,
    `valor_venda`      decimal(16, 7)                                  NOT NULL,
    `valor_credito`    decimal(16, 7)                                  NOT NULL,
    `valor_percentual` decimal(5, 2)                                   NOT NULL,
    `data_expiracao`   date                                            NOT NULL,
    `status`           tinyint(1)                                      NOT NULL DEFAULT '1',
    `created_at`       timestamp                                       NULL     DEFAULT NULL,
    `updated_at`       timestamp                                       NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `cash_back_clientes_empresa_id_foreign` (`empresa_id`),
    KEY `cash_back_clientes_cliente_id_foreign` (`cliente_id`),
    CONSTRAINT `cash_back_clientes_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
    CONSTRAINT `cash_back_clientes_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `variacao_modelos`
(
    `id`         bigint unsigned                         NOT NULL AUTO_INCREMENT,
    `descricao`  varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
    `status`     tinyint(1)                              NOT NULL DEFAULT '1',
    `empresa_id` bigint unsigned                         NOT NULL,
    `created_at` timestamp                               NULL     DEFAULT NULL,
    `updated_at` timestamp                               NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `variacao_modelos_empresa_id_foreign` (`empresa_id`),
    CONSTRAINT `variacao_modelos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `variacao_modelo_items`
(
    `id`                 bigint unsigned                         NOT NULL AUTO_INCREMENT,
    `variacao_modelo_id` bigint unsigned                         NOT NULL,
    `nome`               varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at`         timestamp                               NULL DEFAULT NULL,
    `updated_at`         timestamp                               NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `variacao_modelo_items_variacao_modelo_id_foreign` (`variacao_modelo_id`),
    CONSTRAINT `variacao_modelo_items_variacao_modelo_id_foreign` FOREIGN KEY (`variacao_modelo_id`) REFERENCES `variacao_modelos` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 15
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `produto_variacaos`
(
    `id`            bigint unsigned                         NOT NULL AUTO_INCREMENT,
    `produto_id`    bigint unsigned                              DEFAULT NULL,
    `descricao`     varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    `valor`         decimal(12, 4)                          NOT NULL,
    `codigo_barras` varchar(20) COLLATE utf8mb4_unicode_ci       DEFAULT NULL,
    `referencia`    varchar(20) COLLATE utf8mb4_unicode_ci       DEFAULT NULL,
    `imagem`        varchar(25) COLLATE utf8mb4_unicode_ci       DEFAULT NULL,
    `created_at`    timestamp                               NULL DEFAULT NULL,
    `updated_at`    timestamp                               NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `produto_variacaos_produto_id_foreign` (`produto_id`),
    CONSTRAINT `produto_variacaos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `ecommerce_configs`
(
    `id`                       bigint unsigned                         NOT NULL AUTO_INCREMENT,
    `empresa_id`               bigint unsigned                                  DEFAULT NULL,
    `nome`                     varchar(50) COLLATE utf8mb4_unicode_ci  NOT NULL,
    `loja_id`                  varchar(30) COLLATE utf8mb4_unicode_ci  NOT NULL,
    `logo`                     varchar(30) COLLATE utf8mb4_unicode_ci  NOT NULL,
    `descricao_breve`          varchar(200) COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `rua`                      varchar(80) COLLATE utf8mb4_unicode_ci  NOT NULL,
    `numero`                   varchar(10) COLLATE utf8mb4_unicode_ci  NOT NULL,
    `bairro`                   varchar(30) COLLATE utf8mb4_unicode_ci  NOT NULL,
    `cep`                      varchar(10) COLLATE utf8mb4_unicode_ci  NOT NULL,
    `cidade_id`                bigint unsigned                         NOT NULL,
    `telefone`                 varchar(15) COLLATE utf8mb4_unicode_ci  NOT NULL,
    `email`                    varchar(60) COLLATE utf8mb4_unicode_ci           DEFAULT NULL,
    `link_facebook`            varchar(120) COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `link_whatsapp`            varchar(120) COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `link_instagram`           varchar(120) COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `frete_gratis_valor`       decimal(10, 2)                                   DEFAULT NULL,
    `mercadopago_public_key`   varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
    `mercadopago_access_token` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
    `habilitar_retirada`       tinyint(1)                              NOT NULL DEFAULT '0',
    `notificacao_novo_pedido`  tinyint(1)                              NOT NULL DEFAULT '1',
    `desconto_padrao_boleto`   decimal(4, 2)                                    DEFAULT NULL,
    `desconto_padrao_pix`      decimal(4, 2)                                    DEFAULT NULL,
    `desconto_padrao_cartao`   decimal(4, 2)                                    DEFAULT NULL,
    `tipos_pagamento`          varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '[]',
    `status`                   tinyint(1)                              NOT NULL DEFAULT '1',
    `politica_privacidade`     text COLLATE utf8mb4_unicode_ci         NOT NULL,
    `termos_condicoes`         text COLLATE utf8mb4_unicode_ci         NOT NULL,
    `created_at`               timestamp                               NULL     DEFAULT NULL,
    `updated_at`               timestamp                               NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `ecommerce_configs_empresa_id_foreign` (`empresa_id`),
    KEY `ecommerce_configs_cidade_id_foreign` (`cidade_id`),
    CONSTRAINT `ecommerce_configs_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
    CONSTRAINT `ecommerce_configs_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `galeria_produtos`
(
    `id`         bigint unsigned NOT NULL AUTO_INCREMENT,
    `produto_id` bigint unsigned NOT NULL,
    `imagem`     varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at` timestamp       NULL                   DEFAULT NULL,
    `updated_at` timestamp       NULL                   DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `galeria_produtos_produto_id_foreign` (`produto_id`),
    CONSTRAINT `galeria_produtos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `endereco_ecommerces`
(
    `id`         bigint unsigned                        NOT NULL AUTO_INCREMENT,
    `cidade_id`  bigint unsigned                        NOT NULL,
    `cliente_id` bigint unsigned                        NOT NULL,
    `rua`        varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    `bairro`     varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
    `numero`     varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
    `referencia` varchar(50) COLLATE utf8mb4_unicode_ci      DEFAULT NULL,
    `cep`        varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
    `padrao`     tinyint(1)                             NOT NULL,
    `created_at` timestamp                              NULL DEFAULT NULL,
    `updated_at` timestamp                              NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `endereco_ecommerces_cidade_id_foreign` (`cidade_id`),
    KEY `endereco_ecommerces_cliente_id_foreign` (`cliente_id`),
    CONSTRAINT `endereco_ecommerces_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
    CONSTRAINT `endereco_ecommerces_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `carrinhos`
(
    `id`           bigint unsigned                                           NOT NULL AUTO_INCREMENT,
    `cliente_id`   bigint unsigned                                                DEFAULT NULL,
    `empresa_id`   bigint unsigned                                           NOT NULL,
    `endereco_id`  bigint unsigned                                                DEFAULT NULL,
    `estado`       enum ('pendente','finalizado') COLLATE utf8mb4_unicode_ci NOT NULL,
    `valor_total`  decimal(10, 2)                                            NOT NULL,
    `tipo_frete`   varchar(20) COLLATE utf8mb4_unicode_ci                         DEFAULT NULL,
    `valor_frete`  decimal(10, 2)                                            NOT NULL,
    `cep`          decimal(9, 2)                                             NOT NULL,
    `session_cart` varchar(30) COLLATE utf8mb4_unicode_ci                    NOT NULL,
    `created_at`   timestamp                                                 NULL DEFAULT NULL,
    `updated_at`   timestamp                                                 NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `carrinhos_cliente_id_foreign` (`cliente_id`),
    KEY `carrinhos_empresa_id_foreign` (`empresa_id`),
    KEY `carrinhos_endereco_id_foreign` (`endereco_id`),
    CONSTRAINT `carrinhos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
    CONSTRAINT `carrinhos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
    CONSTRAINT `carrinhos_endereco_id_foreign` FOREIGN KEY (`endereco_id`) REFERENCES `endereco_ecommerces` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `item_carrinhos`
(
    `id`             bigint unsigned NOT NULL AUTO_INCREMENT,
    `carrinho_id`    bigint unsigned NOT NULL,
    `produto_id`     bigint unsigned NOT NULL,
    `variacao_id`    bigint unsigned      DEFAULT NULL,
    `quantidade`     decimal(8, 3)   NOT NULL,
    `valor_unitario` decimal(10, 2)  NOT NULL,
    `sub_total`      decimal(10, 3)  NOT NULL,
    `created_at`     timestamp       NULL DEFAULT NULL,
    `updated_at`     timestamp       NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `item_carrinhos_carrinho_id_foreign` (`carrinho_id`),
    KEY `item_carrinhos_produto_id_foreign` (`produto_id`),
    KEY `item_carrinhos_variacao_id_foreign` (`variacao_id`),
    CONSTRAINT `item_carrinhos_carrinho_id_foreign` FOREIGN KEY (`carrinho_id`) REFERENCES `carrinhos` (`id`),
    CONSTRAINT `item_carrinhos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
    CONSTRAINT `item_carrinhos_variacao_id_foreign` FOREIGN KEY (`variacao_id`) REFERENCES `produto_variacaos` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `pedido_ecommerces`
(
    `id`                  bigint unsigned                                                                              NOT NULL AUTO_INCREMENT,
    `cliente_id`          bigint unsigned                                                                              NOT NULL,
    `empresa_id`          bigint unsigned                                                                              NOT NULL,
    `endereco_id`         bigint unsigned                                                                                       DEFAULT NULL,
    `estado`              enum ('novo','preparando','em_trasporte','finalizado','recusado') COLLATE utf8mb4_unicode_ci NOT NULL,
    `tipo_pagamento`      enum ('cartao','pix','boleto') COLLATE utf8mb4_unicode_ci                                    NOT NULL,
    `valor_total`         decimal(10, 2)                                                                               NOT NULL,
    `valor_frete`         decimal(10, 2)                                                                               NOT NULL,
    `desconto`            decimal(10, 2)                                                                               NOT NULL,
    `tipo_frete`          varchar(20) COLLATE utf8mb4_unicode_ci                                                                DEFAULT NULL,
    `rua_entrega`         varchar(50) COLLATE utf8mb4_unicode_ci                                                                DEFAULT NULL,
    `numero_entrega`      varchar(10) COLLATE utf8mb4_unicode_ci                                                                DEFAULT NULL,
    `referencia_entrega`  varchar(50) COLLATE utf8mb4_unicode_ci                                                                DEFAULT NULL,
    `bairro_entrega`      varchar(30) COLLATE utf8mb4_unicode_ci                                                                DEFAULT NULL,
    `cep_entrega`         varchar(10) COLLATE utf8mb4_unicode_ci                                                                DEFAULT NULL,
    `cidade_entrega`      varchar(60) COLLATE utf8mb4_unicode_ci                                                                DEFAULT NULL,
    `link_boleto`         text COLLATE utf8mb4_unicode_ci                                                              NOT NULL,
    `qr_code_base64`      text COLLATE utf8mb4_unicode_ci                                                              NOT NULL,
    `qr_code`             text COLLATE utf8mb4_unicode_ci                                                              NOT NULL,
    `observacao`          varchar(100) COLLATE utf8mb4_unicode_ci                                                               DEFAULT NULL,
    `hash_pedido`         varchar(30) COLLATE utf8mb4_unicode_ci                                                       NOT NULL,
    `status_pagamento`    varchar(15) COLLATE utf8mb4_unicode_ci                                                       NOT NULL DEFAULT '',
    `transacao_id`        varchar(100) COLLATE utf8mb4_unicode_ci                                                      NOT NULL DEFAULT '',
    `nfe_id`              int                                                                                                   DEFAULT NULL,
    `cupom_desconto`      varchar(6) COLLATE utf8mb4_unicode_ci                                                                 DEFAULT NULL,
    `data_entrega`        varchar(10) COLLATE utf8mb4_unicode_ci                                                                DEFAULT NULL,
    `codigo_rastreamento` varchar(20) COLLATE utf8mb4_unicode_ci                                                                DEFAULT NULL,
    `pedido_lido`         tinyint(1)                                                                                   NOT NULL DEFAULT '0',
    `nome`                varchar(40) COLLATE utf8mb4_unicode_ci                                                                DEFAULT NULL,
    `sobre_nome`          varchar(40) COLLATE utf8mb4_unicode_ci                                                                DEFAULT NULL,
    `email`               varchar(60) COLLATE utf8mb4_unicode_ci                                                                DEFAULT NULL,
    `tipo_documento`      enum ('cpf','cnpj') COLLATE utf8mb4_unicode_ci                                                        DEFAULT NULL,
    `numero_documento`    varchar(20) COLLATE utf8mb4_unicode_ci                                                                DEFAULT NULL,
    `created_at`          timestamp                                                                                    NULL     DEFAULT NULL,
    `updated_at`          timestamp                                                                                    NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `pedido_ecommerces_cliente_id_foreign` (`cliente_id`),
    KEY `pedido_ecommerces_empresa_id_foreign` (`empresa_id`),
    KEY `pedido_ecommerces_endereco_id_foreign` (`endereco_id`),
    CONSTRAINT `pedido_ecommerces_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
    CONSTRAINT `pedido_ecommerces_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
    CONSTRAINT `pedido_ecommerces_endereco_id_foreign` FOREIGN KEY (`endereco_id`) REFERENCES `endereco_ecommerces` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `item_pedido_ecommerces`
(
    `id`             bigint unsigned NOT NULL AUTO_INCREMENT,
    `pedido_id`      bigint unsigned NOT NULL,
    `produto_id`     bigint unsigned NOT NULL,
    `variacao_id`    bigint unsigned      DEFAULT NULL,
    `quantidade`     decimal(8, 3)   NOT NULL,
    `valor_unitario` decimal(10, 2)  NOT NULL,
    `sub_total`      decimal(10, 2)  NOT NULL,
    `created_at`     timestamp       NULL DEFAULT NULL,
    `updated_at`     timestamp       NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `item_pedido_ecommerces_pedido_id_foreign` (`pedido_id`),
    KEY `item_pedido_ecommerces_produto_id_foreign` (`produto_id`),
    KEY `item_pedido_ecommerces_variacao_id_foreign` (`variacao_id`),
    CONSTRAINT `item_pedido_ecommerces_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedido_ecommerces` (`id`),
    CONSTRAINT `item_pedido_ecommerces_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
    CONSTRAINT `item_pedido_ecommerces_variacao_id_foreign` FOREIGN KEY (`variacao_id`) REFERENCES `produto_variacaos` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `cotacaos`
(
    `id`                  bigint unsigned                                                              NOT NULL AUTO_INCREMENT,
    `empresa_id`          bigint unsigned                                                              NOT NULL,
    `fornecedor_id`       bigint unsigned                                                              NOT NULL,
    `responsavel`         varchar(50) COLLATE utf8mb4_unicode_ci                                                DEFAULT NULL,
    `hash_link`           varchar(30) COLLATE utf8mb4_unicode_ci                                       NOT NULL,
    `referencia`          varchar(15) COLLATE utf8mb4_unicode_ci                                       NOT NULL,
    `observacao_resposta` varchar(200) COLLATE utf8mb4_unicode_ci                                               DEFAULT NULL,
    `observacao`          varchar(200) COLLATE utf8mb4_unicode_ci                                               DEFAULT NULL,
    `status`              tinyint(1)                                                                   NOT NULL DEFAULT '1',
    `valor_total`         decimal(10, 2)                                                                        DEFAULT NULL,
    `desconto`            decimal(10, 2)                                                                        DEFAULT NULL,
    `estado`              enum ('nova','respondida','aprovada','rejeitada') COLLATE utf8mb4_unicode_ci NOT NULL,
    `escolhida`           tinyint(1)                                                                   NOT NULL DEFAULT '0',
    `data_resposta`       timestamp                                                                    NULL     DEFAULT NULL,
    `nfe_id`              int                                                                                   DEFAULT NULL,
    `valor_frete`         decimal(10, 2)                                                                        DEFAULT NULL,
    `observacao_frete`    varchar(200) COLLATE utf8mb4_unicode_ci                                               DEFAULT NULL,
    `previsao_entrega`    date                                                                                  DEFAULT NULL,
    `created_at`          timestamp                                                                    NULL     DEFAULT NULL,
    `updated_at`          timestamp                                                                    NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `cotacaos_empresa_id_foreign` (`empresa_id`),
    KEY `cotacaos_fornecedor_id_foreign` (`fornecedor_id`),
    CONSTRAINT `cotacaos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
    CONSTRAINT `cotacaos_fornecedor_id_foreign` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedors` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `item_cotacaos`
(
    `id`             bigint unsigned NOT NULL AUTO_INCREMENT,
    `cotacao_id`     bigint unsigned                         DEFAULT NULL,
    `produto_id`     bigint unsigned                         DEFAULT NULL,
    `valor_unitario` decimal(12, 3)                          DEFAULT NULL,
    `quantidade`     decimal(12, 3)  NOT NULL,
    `sub_total`      decimal(12, 3)                          DEFAULT NULL,
    `observacao`     varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at`     timestamp       NULL                    DEFAULT NULL,
    `updated_at`     timestamp       NULL                    DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `item_cotacaos_cotacao_id_foreign` (`cotacao_id`),
    KEY `item_cotacaos_produto_id_foreign` (`produto_id`),
    CONSTRAINT `item_cotacaos_cotacao_id_foreign` FOREIGN KEY (`cotacao_id`) REFERENCES `cotacaos` (`id`),
    CONSTRAINT `item_cotacaos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `fatura_cotacaos`
(
    `id`              bigint unsigned NOT NULL AUTO_INCREMENT,
    `cotacao_id`      bigint unsigned                       DEFAULT NULL,
    `tipo_pagamento`  varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `data_vencimento` date            NOT NULL,
    `valor`           decimal(10, 2)  NOT NULL,
    `created_at`      timestamp       NULL                  DEFAULT NULL,
    `updated_at`      timestamp       NULL                  DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fatura_cotacaos_cotacao_id_foreign` (`cotacao_id`),
    CONSTRAINT `fatura_cotacaos_cotacao_id_foreign` FOREIGN KEY (`cotacao_id`) REFERENCES `cotacaos` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `nota_servicos`
(
    `id`                 bigint unsigned                                                                           NOT NULL AUTO_INCREMENT,
    `empresa_id`         bigint unsigned                                                                                DEFAULT NULL,
    `cliente_id`         bigint unsigned                                                                                DEFAULT NULL,
    `cidade_id`          bigint unsigned                                                                                DEFAULT NULL,
    `valor_total`        decimal(16, 7)                                                                            NOT NULL,
    `estado`             enum ('novo','rejeitado','aprovado','cancelado','processando') COLLATE utf8mb4_unicode_ci NOT NULL,
    `serie`              varchar(3) COLLATE utf8mb4_unicode_ci                                                     NOT NULL,
    `codigo_verificacao` varchar(20) COLLATE utf8mb4_unicode_ci                                                    NOT NULL,
    `numero_nfse`        int                                                                                       NOT NULL,
    `url_xml`            varchar(255) COLLATE utf8mb4_unicode_ci                                                   NOT NULL,
    `url_pdf_nfse`       varchar(255) COLLATE utf8mb4_unicode_ci                                                   NOT NULL,
    `url_pdf_rps`        varchar(255) COLLATE utf8mb4_unicode_ci                                                   NOT NULL,
    `documento`          varchar(18) COLLATE utf8mb4_unicode_ci                                                    NOT NULL,
    `razao_social`       varchar(60) COLLATE utf8mb4_unicode_ci                                                    NOT NULL,
    `im`                 varchar(20) COLLATE utf8mb4_unicode_ci                                                         DEFAULT NULL,
    `ie`                 varchar(20) COLLATE utf8mb4_unicode_ci                                                         DEFAULT NULL,
    `cep`                varchar(9) COLLATE utf8mb4_unicode_ci                                                     NOT NULL,
    `rua`                varchar(80) COLLATE utf8mb4_unicode_ci                                                    NOT NULL,
    `numero`             varchar(20) COLLATE utf8mb4_unicode_ci                                                    NOT NULL,
    `bairro`             varchar(40) COLLATE utf8mb4_unicode_ci                                                    NOT NULL,
    `complemento`        varchar(80) COLLATE utf8mb4_unicode_ci                                                         DEFAULT NULL,
    `email`              varchar(80) COLLATE utf8mb4_unicode_ci                                                         DEFAULT NULL,
    `telefone`           varchar(20) COLLATE utf8mb4_unicode_ci                                                         DEFAULT NULL,
    `natureza_operacao`  varchar(100) COLLATE utf8mb4_unicode_ci                                                        DEFAULT NULL,
    `uuid`               varchar(100) COLLATE utf8mb4_unicode_ci                                                        DEFAULT NULL,
    `chave`              varchar(50) COLLATE utf8mb4_unicode_ci                                                         DEFAULT NULL,
    `created_at`         timestamp                                                                                 NULL DEFAULT NULL,
    `updated_at`         timestamp                                                                                 NULL DEFAULT NULL,
    `ambiente`           int                                                                                            DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `nota_servicos_empresa_id_foreign` (`empresa_id`),
    KEY `nota_servicos_cliente_id_foreign` (`cliente_id`),
    KEY `nota_servicos_cidade_id_foreign` (`cidade_id`),
    CONSTRAINT `nota_servicos_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
    CONSTRAINT `nota_servicos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
    CONSTRAINT `nota_servicos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 13
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `item_nota_servicos`
(
    `id`                             bigint unsigned                 NOT NULL AUTO_INCREMENT,
    `nota_servico_id`                bigint unsigned                               DEFAULT NULL,
    `servico_id`                     bigint unsigned                               DEFAULT NULL,
    `discriminacao`                  text COLLATE utf8mb4_unicode_ci NOT NULL,
    `valor_servico`                  decimal(16, 7)                  NOT NULL,
    `codigo_cnae`                    varchar(30) COLLATE utf8mb4_unicode_ci        DEFAULT NULL,
    `codigo_servico`                 varchar(30) COLLATE utf8mb4_unicode_ci        DEFAULT NULL,
    `codigo_tributacao_municipio`    varchar(30) COLLATE utf8mb4_unicode_ci        DEFAULT NULL,
    `exigibilidade_iss`              int                             NOT NULL,
    `iss_retido`                     int                             NOT NULL,
    `data_competencia`               date                                          DEFAULT NULL,
    `estado_local_prestacao_servico` varchar(2) COLLATE utf8mb4_unicode_ci         DEFAULT NULL,
    `cidade_local_prestacao_servico` varchar(60) COLLATE utf8mb4_unicode_ci        DEFAULT NULL,
    `valor_deducoes`                 decimal(16, 7)                                DEFAULT NULL,
    `desconto_incondicional`         decimal(16, 7)                                DEFAULT NULL,
    `desconto_condicional`           decimal(16, 7)                                DEFAULT NULL,
    `outras_retencoes`               decimal(16, 7)                                DEFAULT NULL,
    `aliquota_iss`                   decimal(7, 2)                                 DEFAULT NULL,
    `aliquota_pis`                   decimal(7, 2)                                 DEFAULT NULL,
    `aliquota_cofins`                decimal(7, 2)                                 DEFAULT NULL,
    `aliquota_inss`                  decimal(7, 2)                                 DEFAULT NULL,
    `aliquota_ir`                    decimal(7, 2)                                 DEFAULT NULL,
    `aliquota_csll`                  decimal(7, 2)                                 DEFAULT NULL,
    `intermediador`                  enum ('n','f','j') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `documento_intermediador`        varchar(18) COLLATE utf8mb4_unicode_ci        DEFAULT NULL,
    `nome_intermediador`             varchar(80) COLLATE utf8mb4_unicode_ci        DEFAULT NULL,
    `im_intermediador`               varchar(20) COLLATE utf8mb4_unicode_ci        DEFAULT NULL,
    `responsavel_retencao_iss`       int                             NOT NULL      DEFAULT '1',
    `created_at`                     timestamp                       NULL          DEFAULT NULL,
    `updated_at`                     timestamp                       NULL          DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `item_nota_servicos_nota_servico_id_foreign` (`nota_servico_id`),
    KEY `item_nota_servicos_servico_id_foreign` (`servico_id`),
    CONSTRAINT `item_nota_servicos_nota_servico_id_foreign` FOREIGN KEY (`nota_servico_id`) REFERENCES `nota_servicos` (`id`),
    CONSTRAINT `item_nota_servicos_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 16
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `lista_precos`
(
    `id`                   bigint unsigned                                                NOT NULL AUTO_INCREMENT,
    `empresa_id`           bigint unsigned                                                NOT NULL,
    `nome`                 varchar(50) COLLATE utf8mb4_unicode_ci                         NOT NULL,
    `ajuste_sobre`         enum ('valor_compra','valor_venda') COLLATE utf8mb4_unicode_ci NOT NULL,
    `tipo`                 enum ('incremento','reducao') COLLATE utf8mb4_unicode_ci       NOT NULL,
    `percentual_alteracao` decimal(5, 2)                                                  NOT NULL,
    `tipo_pagamento`       varchar(2) COLLATE utf8mb4_unicode_ci                               DEFAULT NULL,
    `funcionario_id`       bigint unsigned                                                     DEFAULT NULL,
    `created_at`           timestamp                                                      NULL DEFAULT NULL,
    `updated_at`           timestamp                                                      NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `lista_precos_empresa_id_foreign` (`empresa_id`),
    KEY `lista_precos_funcionario_id_foreign` (`funcionario_id`),
    CONSTRAINT `lista_precos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
    CONSTRAINT `lista_precos_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `item_lista_precos`
(
    `id`               bigint unsigned NOT NULL AUTO_INCREMENT,
    `lista_id`         bigint unsigned      DEFAULT NULL,
    `produto_id`       bigint unsigned      DEFAULT NULL,
    `valor`            decimal(10, 2)  NOT NULL,
    `percentual_lucro` decimal(10, 2)  NOT NULL,
    `created_at`       timestamp       NULL DEFAULT NULL,
    `updated_at`       timestamp       NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `item_lista_precos_lista_id_foreign` (`lista_id`),
    KEY `item_lista_precos_produto_id_foreign` (`produto_id`),
    CONSTRAINT `item_lista_precos_lista_id_foreign` FOREIGN KEY (`lista_id`) REFERENCES `lista_precos` (`id`),
    CONSTRAINT `item_lista_precos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `ncms`
(
    `id`         bigint unsigned                        NOT NULL AUTO_INCREMENT,
    `codigo`     varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
    `descricao`  text COLLATE utf8mb4_unicode_ci        NOT NULL,
    `created_at` timestamp                              NULL DEFAULT NULL,
    `updated_at` timestamp                              NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `tickets`
(
    `id`           bigint unsigned                                                                  NOT NULL AUTO_INCREMENT,
    `empresa_id`   bigint unsigned                                                                       DEFAULT NULL,
    `assunto`      varchar(200) COLLATE utf8mb4_unicode_ci                                          NOT NULL,
    `departamento` enum ('financeiro','suporte') COLLATE utf8mb4_unicode_ci                         NOT NULL,
    `status`       enum ('aberto','respondida','resolvido','aguardando') COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at`   timestamp                                                                        NULL DEFAULT NULL,
    `updated_at`   timestamp                                                                        NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `tickets_empresa_id_foreign` (`empresa_id`),
    CONSTRAINT `tickets_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 9
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `ticket_mensagems`
(
    `id`         bigint unsigned                 NOT NULL AUTO_INCREMENT,
    `ticket_id`  bigint unsigned                 NOT NULL,
    `descricao`  text COLLATE utf8mb4_unicode_ci NOT NULL,
    `resposta`   tinyint(1)                      NOT NULL,
    `created_at` timestamp                       NULL DEFAULT NULL,
    `updated_at` timestamp                       NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `ticket_mensagems_ticket_id_foreign` (`ticket_id`),
    CONSTRAINT `ticket_mensagems_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 17
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `ticket_mensagem_anexos`
(
    `id`                 bigint unsigned NOT NULL AUTO_INCREMENT,
    `ticket_mensagem_id` bigint unsigned NOT NULL,
    `anexo`              varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at`         timestamp       NULL                   DEFAULT NULL,
    `updated_at`         timestamp       NULL                   DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `ticket_mensagem_anexos_ticket_mensagem_id_foreign` (`ticket_mensagem_id`),
    CONSTRAINT `ticket_mensagem_anexos_ticket_mensagem_id_foreign` FOREIGN KEY (`ticket_mensagem_id`) REFERENCES `ticket_mensagems` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `notificacaos`
(
    `id`              bigint unsigned                                          NOT NULL AUTO_INCREMENT,
    `empresa_id`      bigint unsigned                                                   DEFAULT NULL,
    `tabela`          varchar(60) COLLATE utf8mb4_unicode_ci                            DEFAULT NULL,
    `descricao`       text COLLATE utf8mb4_unicode_ci                          NOT NULL,
    `descricao_curta` varchar(60) COLLATE utf8mb4_unicode_ci                   NOT NULL,
    `titulo`          varchar(30) COLLATE utf8mb4_unicode_ci                   NOT NULL,
    `referencia`      int                                                               DEFAULT NULL,
    `status`          tinyint(1)                                               NOT NULL DEFAULT '1',
    `visualizada`     tinyint(1)                                               NOT NULL DEFAULT '0',
    `por_sistema`     tinyint(1)                                               NOT NULL DEFAULT '0',
    `prioridade`      enum ('baixa','media','alta') COLLATE utf8mb4_unicode_ci NOT NULL,
    `super`           tinyint(1)                                               NOT NULL DEFAULT '0',
    `created_at`      timestamp                                                NULL     DEFAULT NULL,
    `updated_at`      timestamp                                                NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `notificacaos_empresa_id_foreign` (`empresa_id`),
    CONSTRAINT `notificacaos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `carrinho_deliveries`
(
    `id`                    bigint unsigned                                           NOT NULL AUTO_INCREMENT,
    `cliente_id`            bigint unsigned                                                DEFAULT NULL,
    `empresa_id`            bigint unsigned                                           NOT NULL,
    `endereco_id`           bigint unsigned                                                DEFAULT NULL,
    `estado`                enum ('pendente','finalizado') COLLATE utf8mb4_unicode_ci NOT NULL,
    `valor_total`           decimal(10, 2)                                            NOT NULL,
    `valor_desconto`        decimal(10, 2)                                            NOT NULL,
    `cupom`                 varchar(6) COLLATE utf8mb4_unicode_ci                     NOT NULL,
    `fone`                  varchar(20) COLLATE utf8mb4_unicode_ci                    NOT NULL,
    `valor_frete`           decimal(10, 2)                                            NOT NULL,
    `session_cart_delivery` varchar(30) COLLATE utf8mb4_unicode_ci                    NOT NULL,
    `created_at`            timestamp                                                 NULL DEFAULT NULL,
    `updated_at`            timestamp                                                 NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `carrinho_deliveries_cliente_id_foreign` (`cliente_id`),
    KEY `carrinho_deliveries_empresa_id_foreign` (`empresa_id`),
    KEY `carrinho_deliveries_endereco_id_foreign` (`endereco_id`),
    CONSTRAINT `carrinho_deliveries_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
    CONSTRAINT `carrinho_deliveries_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
    CONSTRAINT `carrinho_deliveries_endereco_id_foreign` FOREIGN KEY (`endereco_id`) REFERENCES `endereco_deliveries` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `item_carrinho_deliveries`
(
    `id`             bigint unsigned NOT NULL AUTO_INCREMENT,
    `carrinho_id`    bigint unsigned NOT NULL,
    `produto_id`     bigint unsigned NOT NULL,
    `tamanho_id`     bigint unsigned      DEFAULT NULL,
    `quantidade`     decimal(8, 3)   NOT NULL,
    `valor_unitario` decimal(10, 2)  NOT NULL,
    `sub_total`      decimal(10, 3)  NOT NULL,
    `created_at`     timestamp       NULL DEFAULT NULL,
    `updated_at`     timestamp       NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `item_carrinho_deliveries_carrinho_id_foreign` (`carrinho_id`),
    KEY `item_carrinho_deliveries_produto_id_foreign` (`produto_id`),
    KEY `item_carrinho_deliveries_tamanho_id_foreign` (`tamanho_id`),
    CONSTRAINT `item_carrinho_deliveries_carrinho_id_foreign` FOREIGN KEY (`carrinho_id`) REFERENCES `carrinho_deliveries` (`id`),
    CONSTRAINT `item_carrinho_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
    CONSTRAINT `item_carrinho_deliveries_tamanho_id_foreign` FOREIGN KEY (`tamanho_id`) REFERENCES `tamanho_pizzas` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `ibpts`
(
    `id`         bigint unsigned                        NOT NULL AUTO_INCREMENT,
    `uf`         varchar(2) COLLATE utf8mb4_unicode_ci  NOT NULL,
    `versao`     varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp                              NULL DEFAULT NULL,
    `updated_at` timestamp                              NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 13
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `item_ibpts`
(
    `id`                bigint unsigned                        NOT NULL AUTO_INCREMENT,
    `ibpt_id`           bigint unsigned                             DEFAULT NULL,
    `codigo`            varchar(8) COLLATE utf8mb4_unicode_ci  NOT NULL,
    `descricao`         varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
    `nacional_federal`  decimal(5, 2)                          NOT NULL,
    `importado_federal` decimal(5, 2)                          NOT NULL,
    `estadual`          decimal(5, 2)                          NOT NULL,
    `municipal`         decimal(5, 2)                          NOT NULL,
    `created_at`        timestamp                              NULL DEFAULT NULL,
    `updated_at`        timestamp                              NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `item_ibpts_ibpt_id_foreign` (`ibpt_id`),
    CONSTRAINT `item_ibpts_ibpt_id_foreign` FOREIGN KEY (`ibpt_id`) REFERENCES `ibpts` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 60636
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `item_carrinho_adicional_deliveries`
(
    `id`               bigint unsigned NOT NULL AUTO_INCREMENT,
    `item_carrinho_id` bigint unsigned NOT NULL,
    `adicional_id`     bigint unsigned NOT NULL,
    `created_at`       timestamp       NULL DEFAULT NULL,
    `updated_at`       timestamp       NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `item_carrinho_adicional_deliveries_item_carrinho_id_foreign` (`item_carrinho_id`),
    KEY `item_carrinho_adicional_deliveries_adicional_id_foreign` (`adicional_id`),
    CONSTRAINT `item_carrinho_adicional_deliveries_adicional_id_foreign` FOREIGN KEY (`adicional_id`) REFERENCES `adicionals` (`id`),
    CONSTRAINT `item_carrinho_adicional_deliveries_item_carrinho_id_foreign` FOREIGN KEY (`item_carrinho_id`) REFERENCES `item_carrinho_deliveries` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `item_pizza_carrinhos`
(
    `id`               bigint unsigned NOT NULL AUTO_INCREMENT,
    `item_carrinho_id` bigint unsigned NOT NULL,
    `produto_id`       bigint unsigned NOT NULL,
    `created_at`       timestamp       NULL DEFAULT NULL,
    `updated_at`       timestamp       NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `item_pizza_carrinhos_item_carrinho_id_foreign` (`item_carrinho_id`),
    KEY `item_pizza_carrinhos_produto_id_foreign` (`produto_id`),
    CONSTRAINT `item_pizza_carrinhos_item_carrinho_id_foreign` FOREIGN KEY (`item_carrinho_id`) REFERENCES `item_carrinho_deliveries` (`id`),
    CONSTRAINT `item_pizza_carrinhos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 17
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `nota_servico_configs`
(
    `id`               bigint unsigned                                      NOT NULL AUTO_INCREMENT,
    `nome`             varchar(100) COLLATE utf8mb4_unicode_ci              NOT NULL,
    `razao_social`     varchar(100) COLLATE utf8mb4_unicode_ci              NOT NULL,
    `documento`        varchar(18) COLLATE utf8mb4_unicode_ci               NOT NULL,
    `regime`           enum ('simples','normal') COLLATE utf8mb4_unicode_ci NOT NULL,
    `ie`               varchar(20) COLLATE utf8mb4_unicode_ci                    DEFAULT NULL,
    `im`               varchar(20) COLLATE utf8mb4_unicode_ci                    DEFAULT NULL,
    `cnae`             varchar(20) COLLATE utf8mb4_unicode_ci                    DEFAULT NULL,
    `login_prefeitura` varchar(50) COLLATE utf8mb4_unicode_ci                    DEFAULT NULL,
    `senha_prefeitura` varchar(50) COLLATE utf8mb4_unicode_ci                    DEFAULT NULL,
    `telefone`         varchar(20) COLLATE utf8mb4_unicode_ci               NOT NULL,
    `email`            varchar(80) COLLATE utf8mb4_unicode_ci               NOT NULL,
    `rua`              varchar(80) COLLATE utf8mb4_unicode_ci               NOT NULL,
    `numero`           varchar(10) COLLATE utf8mb4_unicode_ci               NOT NULL,
    `bairro`           varchar(30) COLLATE utf8mb4_unicode_ci               NOT NULL,
    `complemento`      varchar(50) COLLATE utf8mb4_unicode_ci                    DEFAULT NULL,
    `cep`              varchar(9) COLLATE utf8mb4_unicode_ci                NOT NULL,
    `token`            varchar(255) COLLATE utf8mb4_unicode_ci                   DEFAULT NULL,
    `logo`             varchar(30) COLLATE utf8mb4_unicode_ci                    DEFAULT NULL,
    `empresa_id`       bigint unsigned                                           DEFAULT NULL,
    `cidade_id`        bigint unsigned                                           DEFAULT NULL,
    `created_at`       timestamp                                            NULL DEFAULT NULL,
    `updated_at`       timestamp                                            NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `nota_servico_configs_empresa_id_foreign` (`empresa_id`),
    KEY `nota_servico_configs_cidade_id_foreign` (`cidade_id`),
    CONSTRAINT `nota_servico_configs_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
    CONSTRAINT `nota_servico_configs_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `segmentos`
(
    `id`         bigint unsigned                        NOT NULL AUTO_INCREMENT,
    `nome`       varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    `status`     tinyint(1)                             NOT NULL,
    `created_at` timestamp                              NULL DEFAULT NULL,
    `updated_at` timestamp                              NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `segmento_empresas`
(
    `id`          bigint unsigned NOT NULL AUTO_INCREMENT,
    `empresa_id`  bigint unsigned      DEFAULT NULL,
    `segmento_id` bigint unsigned      DEFAULT NULL,
    `created_at`  timestamp       NULL DEFAULT NULL,
    `updated_at`  timestamp       NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `segmento_empresas_empresa_id_foreign` (`empresa_id`),
    KEY `segmento_empresas_segmento_id_foreign` (`segmento_id`),
    CONSTRAINT `segmento_empresas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
    CONSTRAINT `segmento_empresas_segmento_id_foreign` FOREIGN KEY (`segmento_id`) REFERENCES `segmentos` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `mercado_livre_configs`
(
    `id`            bigint unsigned                         NOT NULL AUTO_INCREMENT,
    `empresa_id`    bigint unsigned                         NOT NULL,
    `client_id`     varchar(30) COLLATE utf8mb4_unicode_ci  NOT NULL,
    `client_secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    `access_token`  varchar(255) COLLATE utf8mb4_unicode_ci      DEFAULT NULL,
    `user_id`       varchar(25) COLLATE utf8mb4_unicode_ci       DEFAULT NULL,
    `code`          varchar(100) COLLATE utf8mb4_unicode_ci      DEFAULT NULL,
    `url`           varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at`    timestamp                               NULL DEFAULT NULL,
    `updated_at`    timestamp                               NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `mercado_livre_configs_empresa_id_foreign` (`empresa_id`),
    CONSTRAINT `mercado_livre_configs_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `categoria_mercado_livres`
(
    `id`         bigint unsigned                         NOT NULL AUTO_INCREMENT,
    `_id`        varchar(20) COLLATE utf8mb4_unicode_ci  NOT NULL,
    `nome`       varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp                               NULL DEFAULT NULL,
    `updated_at` timestamp                               NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `mercado_livre_perguntas`
(
    `id`         bigint unsigned                        NOT NULL AUTO_INCREMENT,
    `empresa_id` bigint unsigned                        NOT NULL,
    `_id`        varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
    `item_id`    varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
    `status`     varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
    `texto`      text COLLATE utf8mb4_unicode_ci        NOT NULL,
    `data`       timestamp                              NOT NULL,
    `created_at` timestamp                              NULL DEFAULT NULL,
    `updated_at` timestamp                              NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `mercado_livre_perguntas_empresa_id_foreign` (`empresa_id`),
    CONSTRAINT `mercado_livre_perguntas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `pedido_mercado_livres`
(
    `id`                  bigint unsigned                        NOT NULL AUTO_INCREMENT,
    `empresa_id`          bigint unsigned                        NOT NULL,
    `cliente_id`          bigint unsigned                             DEFAULT NULL,
    `_id`                 bigint                                 NOT NULL,
    `tipo_pagamento`      varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    `status`              varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
    `total`               decimal(10, 2)                         NOT NULL,
    `valor_entrega`       decimal(10, 2)                         NOT NULL,
    `nickname`            varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    `seller_id`           bigint                                 NOT NULL,
    `entrega_id`          varchar(20) COLLATE utf8mb4_unicode_ci      DEFAULT NULL,
    `data_pedido`         timestamp                              NOT NULL,
    `comentario`          varchar(200) COLLATE utf8mb4_unicode_ci     DEFAULT NULL,
    `nfe_id`              int                                         DEFAULT NULL,
    `rua_entrega`         varchar(100) COLLATE utf8mb4_unicode_ci     DEFAULT NULL,
    `numero_entrega`      varchar(10) COLLATE utf8mb4_unicode_ci      DEFAULT NULL,
    `cep_entrega`         varchar(10) COLLATE utf8mb4_unicode_ci      DEFAULT NULL,
    `bairro_entrega`      varchar(50) COLLATE utf8mb4_unicode_ci      DEFAULT NULL,
    `cidade_entrega`      varchar(100) COLLATE utf8mb4_unicode_ci     DEFAULT NULL,
    `comentario_entrega`  varchar(200) COLLATE utf8mb4_unicode_ci     DEFAULT NULL,
    `codigo_rastreamento` varchar(30) COLLATE utf8mb4_unicode_ci      DEFAULT NULL,
    `cliente_nome`        varchar(50) COLLATE utf8mb4_unicode_ci      DEFAULT NULL,
    `cliente_documento`   varchar(20) COLLATE utf8mb4_unicode_ci      DEFAULT NULL,
    `created_at`          timestamp                              NULL DEFAULT NULL,
    `updated_at`          timestamp                              NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `pedido_mercado_livres_empresa_id_foreign` (`empresa_id`),
    KEY `pedido_mercado_livres_cliente_id_foreign` (`cliente_id`),
    CONSTRAINT `pedido_mercado_livres_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
    CONSTRAINT `pedido_mercado_livres_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `item_pedido_mercado_livres`
(
    `id`             bigint unsigned                         NOT NULL AUTO_INCREMENT,
    `pedido_id`      bigint unsigned                         NOT NULL,
    `produto_id`     bigint unsigned                              DEFAULT NULL,
    `item_id`        varchar(20) COLLATE utf8mb4_unicode_ci  NOT NULL,
    `item_nome`      varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    `condicao`       varchar(20) COLLATE utf8mb4_unicode_ci  NOT NULL,
    `variacao_id`    varchar(20) COLLATE utf8mb4_unicode_ci       DEFAULT NULL,
    `quantidade`     decimal(8, 2)                           NOT NULL,
    `valor_unitario` decimal(12, 2)                          NOT NULL,
    `sub_total`      decimal(12, 2)                          NOT NULL,
    `taxa_venda`     decimal(12, 2)                          NOT NULL,
    `created_at`     timestamp                               NULL DEFAULT NULL,
    `updated_at`     timestamp                               NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `item_pedido_mercado_livres_pedido_id_foreign` (`pedido_id`),
    KEY `item_pedido_mercado_livres_produto_id_foreign` (`produto_id`),
    CONSTRAINT `item_pedido_mercado_livres_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedido_mercado_livres` (`id`),
    CONSTRAINT `item_pedido_mercado_livres_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `variacao_mercado_livres`
(
    `id`         bigint unsigned                        NOT NULL AUTO_INCREMENT,
    `produto_id` bigint unsigned                             DEFAULT NULL,
    `_id`        varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
    `quantidade` decimal(10, 2)                         NOT NULL,
    `valor`      decimal(12, 2)                         NOT NULL,
    `created_at` timestamp                              NULL DEFAULT NULL,
    `updated_at` timestamp                              NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `variacao_mercado_livres_produto_id_foreign` (`produto_id`),
    CONSTRAINT `variacao_mercado_livres_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `plano_contas`
(
    `id`             bigint unsigned                         NOT NULL AUTO_INCREMENT,
    `empresa_id`     bigint unsigned                              DEFAULT NULL,
    `plano_conta_id` bigint unsigned                              DEFAULT NULL,
    `descricao`      varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at`     timestamp                               NULL DEFAULT NULL,
    `updated_at`     timestamp                               NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `plano_contas_empresa_id_foreign` (`empresa_id`),
    KEY `plano_contas_plano_conta_id_foreign` (`plano_conta_id`),
    CONSTRAINT `plano_contas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
    CONSTRAINT `plano_contas_plano_conta_id_foreign` FOREIGN KEY (`plano_conta_id`) REFERENCES `plano_contas` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 88
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `conta_empresas`
(
    `id`             bigint unsigned                        NOT NULL AUTO_INCREMENT,
    `empresa_id`     bigint unsigned                                 DEFAULT NULL,
    `nome`           varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    `banco`          varchar(50) COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `agencia`        varchar(10) COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `conta`          varchar(10) COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `plano_conta_id` int                                             DEFAULT NULL,
    `saldo`          decimal(16, 2)                                  DEFAULT NULL,
    `saldo_inicial`  decimal(16, 2)                                  DEFAULT NULL,
    `status`         tinyint(1)                             NOT NULL DEFAULT '0',
    `created_at`     timestamp                              NULL     DEFAULT NULL,
    `updated_at`     timestamp                              NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `conta_empresas_empresa_id_foreign` (`empresa_id`),
    CONSTRAINT `conta_empresas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `item_conta_empresas`
(
    `id`             bigint unsigned                                     NOT NULL AUTO_INCREMENT,
    `conta_id`       bigint unsigned                                          DEFAULT NULL,
    `descricao`      varchar(150) COLLATE utf8mb4_unicode_ci                  DEFAULT NULL,
    `caixa_id`       int                                                      DEFAULT NULL,
    `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci               NOT NULL,
    `valor`          decimal(16, 2)                                           DEFAULT NULL,
    `saldo_atual`    decimal(16, 2)                                           DEFAULT NULL,
    `tipo`           enum ('entrada','saida') COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at`     timestamp                                           NULL DEFAULT NULL,
    `updated_at`     timestamp                                           NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `item_conta_empresas_conta_id_foreign` (`conta_id`),
    CONSTRAINT `item_conta_empresas_conta_id_foreign` FOREIGN KEY (`conta_id`) REFERENCES `conta_empresas` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 28
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `produto_combos`
(
    `id`           bigint unsigned NOT NULL AUTO_INCREMENT,
    `produto_id`   bigint unsigned NOT NULL,
    `item_id`      bigint unsigned NOT NULL,
    `quantidade`   decimal(8, 3)   NOT NULL,
    `valor_compra` decimal(12, 4)  NOT NULL,
    `sub_total`    decimal(12, 4)  NOT NULL,
    `created_at`   timestamp       NULL DEFAULT NULL,
    `updated_at`   timestamp       NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `produto_combos_produto_id_foreign` (`produto_id`),
    KEY `produto_combos_item_id_foreign` (`item_id`),
    CONSTRAINT `produto_combos_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `produtos` (`id`),
    CONSTRAINT `produto_combos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 21
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `item_servico_nfces`
(
    `id`             bigint unsigned NOT NULL AUTO_INCREMENT,
    `nfce_id`        bigint unsigned NOT NULL,
    `servico_id`     bigint unsigned NOT NULL,
    `quantidade`     decimal(6, 2)   NOT NULL,
    `valor_unitario` decimal(10, 2)  NOT NULL,
    `sub_total`      decimal(10, 2)  NOT NULL,
    `observacao`     varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at`     timestamp       NULL                   DEFAULT NULL,
    `updated_at`     timestamp       NULL                   DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `item_servico_nfces_nfce_id_foreign` (`nfce_id`),
    KEY `item_servico_nfces_servico_id_foreign` (`servico_id`),
    CONSTRAINT `item_servico_nfces_nfce_id_foreign` FOREIGN KEY (`nfce_id`) REFERENCES `nfces` (`id`),
    CONSTRAINT `item_servico_nfces_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `conta_boletos`
(
    `id`         bigint unsigned                                       NOT NULL AUTO_INCREMENT,
    `empresa_id` bigint unsigned                                                DEFAULT NULL,
    `banco`      varchar(30) COLLATE utf8mb4_unicode_ci                NOT NULL,
    `agencia`    varchar(10) COLLATE utf8mb4_unicode_ci                NOT NULL,
    `conta`      varchar(15) COLLATE utf8mb4_unicode_ci                NOT NULL,
    `titular`    varchar(45) COLLATE utf8mb4_unicode_ci                NOT NULL,
    `padrao`     tinyint(1)                                            NOT NULL DEFAULT '0',
    `usar_logo`  tinyint(1)                                            NOT NULL DEFAULT '0',
    `documento`  varchar(18) COLLATE utf8mb4_unicode_ci                NOT NULL,
    `rua`        varchar(60) COLLATE utf8mb4_unicode_ci                NOT NULL,
    `numero`     varchar(10) COLLATE utf8mb4_unicode_ci                NOT NULL,
    `cep`        varchar(9) COLLATE utf8mb4_unicode_ci                 NOT NULL,
    `bairro`     varchar(30) COLLATE utf8mb4_unicode_ci                NOT NULL,
    `cidade_id`  bigint unsigned                                                DEFAULT NULL,
    `carteira`   varchar(10) COLLATE utf8mb4_unicode_ci                         DEFAULT NULL,
    `convenio`   varchar(20) COLLATE utf8mb4_unicode_ci                         DEFAULT NULL,
    `juros`      decimal(10, 2)                                                 DEFAULT NULL,
    `multa`      decimal(10, 2)                                                 DEFAULT NULL,
    `juros_apos` int                                                            DEFAULT NULL,
    `tipo`       enum ('Cnab400','Cnab240') COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp                                             NULL     DEFAULT NULL,
    `updated_at` timestamp                                             NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `conta_boletos_empresa_id_foreign` (`empresa_id`),
    KEY `conta_boletos_cidade_id_foreign` (`cidade_id`),
    CONSTRAINT `conta_boletos_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
    CONSTRAINT `conta_boletos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `boletos`
(
    `id`               bigint unsigned                                       NOT NULL AUTO_INCREMENT,
    `empresa_id`       bigint unsigned                                                DEFAULT NULL,
    `conta_boleto_id`  bigint unsigned                                                DEFAULT NULL,
    `conta_receber_id` bigint unsigned                                                DEFAULT NULL,
    `numero`           varchar(10) COLLATE utf8mb4_unicode_ci                NOT NULL,
    `numero_documento` varchar(10) COLLATE utf8mb4_unicode_ci                NOT NULL,
    `carteira`         varchar(10) COLLATE utf8mb4_unicode_ci                NOT NULL,
    `convenio`         varchar(20) COLLATE utf8mb4_unicode_ci                NOT NULL,
    `vencimento`       date                                                  NOT NULL,
    `valor`            decimal(12, 2)                                        NOT NULL,
    `instrucoes`       varchar(255) COLLATE utf8mb4_unicode_ci                        DEFAULT NULL,
    `linha_digitavel`  varchar(50) COLLATE utf8mb4_unicode_ci                         DEFAULT NULL,
    `nome_arquivo`     varchar(35) COLLATE utf8mb4_unicode_ci                         DEFAULT NULL,
    `juros`            decimal(10, 2)                                                 DEFAULT NULL,
    `multa`            decimal(10, 2)                                                 DEFAULT NULL,
    `juros_apos`       int                                                            DEFAULT NULL,
    `tipo`             enum ('Cnab400','Cnab240') COLLATE utf8mb4_unicode_ci NOT NULL,
    `usar_logo`        tinyint(1)                                            NOT NULL DEFAULT '0',
    `posto`            varchar(10) COLLATE utf8mb4_unicode_ci                         DEFAULT NULL,
    `codigo_cliente`   varchar(10) COLLATE utf8mb4_unicode_ci                         DEFAULT NULL,
    `created_at`       timestamp                                             NULL     DEFAULT NULL,
    `updated_at`       timestamp                                             NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `boletos_empresa_id_foreign` (`empresa_id`),
    KEY `boletos_conta_boleto_id_foreign` (`conta_boleto_id`),
    KEY `boletos_conta_receber_id_foreign` (`conta_receber_id`),
    CONSTRAINT `boletos_conta_boleto_id_foreign` FOREIGN KEY (`conta_boleto_id`) REFERENCES `conta_boletos` (`id`),
    CONSTRAINT `boletos_conta_receber_id_foreign` FOREIGN KEY (`conta_receber_id`) REFERENCES `conta_recebers` (`id`),
    CONSTRAINT `boletos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `remessa_boletos`
(
    `id`              bigint unsigned                        NOT NULL AUTO_INCREMENT,
    `nome_arquivo`    varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
    `conta_boleto_id` int                                    NOT NULL,
    `empresa_id`      bigint unsigned                             DEFAULT NULL,
    `created_at`      timestamp                              NULL DEFAULT NULL,
    `updated_at`      timestamp                              NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `remessa_boletos_empresa_id_foreign` (`empresa_id`),
    CONSTRAINT `remessa_boletos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `remessa_boleto_items`
(
    `id`         bigint unsigned NOT NULL AUTO_INCREMENT,
    `remessa_id` bigint unsigned      DEFAULT NULL,
    `boleto_id`  bigint unsigned      DEFAULT NULL,
    `created_at` timestamp       NULL DEFAULT NULL,
    `updated_at` timestamp       NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `remessa_boleto_items_remessa_id_foreign` (`remessa_id`),
    KEY `remessa_boleto_items_boleto_id_foreign` (`boleto_id`),
    CONSTRAINT `remessa_boleto_items_boleto_id_foreign` FOREIGN KEY (`boleto_id`) REFERENCES `boletos` (`id`),
    CONSTRAINT `remessa_boleto_items_remessa_id_foreign` FOREIGN KEY (`remessa_id`) REFERENCES `remessa_boletos` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 9
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `video_suportes`
(
    `id`           bigint unsigned                         NOT NULL AUTO_INCREMENT,
    `pagina`       varchar(80) COLLATE utf8mb4_unicode_ci  NOT NULL,
    `url_video`    varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
    `url_servidor` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at`   timestamp                               NULL DEFAULT NULL,
    `updated_at`   timestamp                               NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `nuvem_shop_configs`
(
    `id`            bigint unsigned                         NOT NULL AUTO_INCREMENT,
    `empresa_id`    bigint unsigned                         NOT NULL,
    `client_id`     varchar(10) COLLATE utf8mb4_unicode_ci  NOT NULL DEFAULT '',
    `client_secret` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    `email`         varchar(80) COLLATE utf8mb4_unicode_ci  NOT NULL DEFAULT '',
    `created_at`    timestamp                               NULL     DEFAULT NULL,
    `updated_at`    timestamp                               NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `nuvem_shop_configs_empresa_id_foreign` (`empresa_id`),
    CONSTRAINT `nuvem_shop_configs_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `nuvem_shop_pedidos`
(
    `id`               bigint unsigned                        NOT NULL AUTO_INCREMENT,
    `empresa_id`       bigint unsigned                        NOT NULL,
    `pedido_id`        varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
    `rua`              varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
    `numero`           varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
    `bairro`           varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    `cidade`           varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
    `cep`              varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
    `subtotal`         decimal(10, 2)                         NOT NULL,
    `total`            decimal(10, 2)                         NOT NULL,
    `valor_frete`      decimal(10, 2)                         NOT NULL,
    `desconto`         decimal(10, 2)                         NOT NULL,
    `observacao`       varchar(150) COLLATE utf8mb4_unicode_ci     DEFAULT NULL,
    `cliente_id`       varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
    `nome`             varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email`            varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    `documento`        varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
    `nfe_id`           int                                         DEFAULT NULL,
    `status_envio`     varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
    `gateway`          varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
    `status_pagamento` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
    `data`             varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
    `venda_id`         int                                         DEFAULT NULL,
    `created_at`       timestamp                              NULL DEFAULT NULL,
    `updated_at`       timestamp                              NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `nuvem_shop_pedidos_empresa_id_foreign` (`empresa_id`),
    CONSTRAINT `nuvem_shop_pedidos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `nuvem_shop_item_pedidos`
(
    `id`             bigint unsigned                         NOT NULL AUTO_INCREMENT,
    `produto_id`     bigint unsigned                              DEFAULT NULL,
    `pedido_id`      bigint unsigned                              DEFAULT NULL,
    `quantidade`     decimal(8, 2)                           NOT NULL,
    `valor_unitario` decimal(10, 2)                          NOT NULL,
    `sub_total`      decimal(10, 2)                          NOT NULL,
    `nome`           varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at`     timestamp                               NULL DEFAULT NULL,
    `updated_at`     timestamp                               NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `nuvem_shop_item_pedidos_produto_id_foreign` (`produto_id`),
    KEY `nuvem_shop_item_pedidos_pedido_id_foreign` (`pedido_id`),
    CONSTRAINT `nuvem_shop_item_pedidos_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `nuvem_shop_pedidos` (`id`),
    CONSTRAINT `nuvem_shop_item_pedidos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `categoria_nuvem_shops`
(
    `id`         bigint unsigned                        NOT NULL AUTO_INCREMENT,
    `empresa_id` bigint unsigned                        NOT NULL,
    `nome`       varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
    `_id`        varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp                              NULL DEFAULT NULL,
    `updated_at` timestamp                              NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `categoria_nuvem_shops_empresa_id_foreign` (`empresa_id`),
    CONSTRAINT `categoria_nuvem_shops_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 84
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `permissions`
(
    `id`          bigint unsigned                         NOT NULL AUTO_INCREMENT,
    `name`        varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `guard_name`  varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at`  timestamp                               NULL DEFAULT NULL,
    `updated_at`  timestamp                               NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `permissions_name_guard_name_unique` (`name`, `guard_name`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 126
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `roles`
(
    `id`          bigint unsigned                         NOT NULL AUTO_INCREMENT,
    `name`        varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `guard_name`  varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `empresa_id`  bigint unsigned                                  DEFAULT NULL,
    `is_default`  tinyint(1)                              NOT NULL DEFAULT '0',
    `type_user`   smallint                                NOT NULL,
    `created_at`  timestamp                               NULL     DEFAULT NULL,
    `updated_at`  timestamp                               NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `roles_name_guard_name_unique` (`name`, `guard_name`),
    KEY `roles_empresa_id_foreign` (`empresa_id`),
    CONSTRAINT `roles_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `model_has_permissions`
(
    `permission_id` bigint unsigned                         NOT NULL,
    `model_type`    varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `model_id`      bigint unsigned                         NOT NULL,
    PRIMARY KEY (`permission_id`, `model_id`, `model_type`),
    KEY `model_has_permissions_model_id_model_type_index` (`model_id`, `model_type`),
    CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `model_has_roles`
(
    `role_id`    bigint unsigned                         NOT NULL,
    `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `model_id`   bigint unsigned                         NOT NULL,
    PRIMARY KEY (`role_id`, `model_id`, `model_type`),
    KEY `model_has_roles_model_id_model_type_index` (`model_id`, `model_type`),
    CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `role_has_permissions`
(
    `permission_id` bigint unsigned NOT NULL,
    `role_id`       bigint unsigned NOT NULL,
    PRIMARY KEY (`permission_id`, `role_id`),
    KEY `role_has_permissions_role_id_foreign` (`role_id`),
    CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
    CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `localizacaos`
(
    `id`                             bigint unsigned                                                            NOT NULL AUTO_INCREMENT,
    `empresa_id`                     bigint unsigned                                                                     DEFAULT NULL,
    `descricao`                      varchar(150) COLLATE utf8mb4_unicode_ci                                    NOT NULL,
    `status`                         tinyint(1)                                                                 NOT NULL DEFAULT '1',
    `nome`                           varchar(150) COLLATE utf8mb4_unicode_ci                                             DEFAULT NULL,
    `nome_fantasia`                  mediumtext COLLATE utf8mb4_unicode_ci,
    `cpf_cnpj`                       varchar(18) COLLATE utf8mb4_unicode_ci                                     NOT NULL,
    `aut_xml`                        varchar(18) COLLATE utf8mb4_unicode_ci                                              DEFAULT NULL,
    `ie`                             varchar(18) COLLATE utf8mb4_unicode_ci                                              DEFAULT NULL,
    `email`                          varchar(60) COLLATE utf8mb4_unicode_ci                                              DEFAULT NULL,
    `celular`                        varchar(20) COLLATE utf8mb4_unicode_ci                                              DEFAULT NULL,
    `arquivo`                        blob,
    `senha`                          varchar(30) COLLATE utf8mb4_unicode_ci                                              DEFAULT NULL,
    `cep`                            varchar(9) COLLATE utf8mb4_unicode_ci                                               DEFAULT NULL,
    `rua`                            varchar(50) COLLATE utf8mb4_unicode_ci                                              DEFAULT NULL,
    `numero`                         varchar(10) COLLATE utf8mb4_unicode_ci                                              DEFAULT NULL,
    `bairro`                         varchar(30) COLLATE utf8mb4_unicode_ci                                              DEFAULT NULL,
    `complemento`                    varchar(50) COLLATE utf8mb4_unicode_ci                                              DEFAULT NULL,
    `cidade_id`                      bigint unsigned                                                                     DEFAULT NULL,
    `numero_ultima_nfe_producao`     int                                                                                 DEFAULT NULL,
    `numero_ultima_nfe_homologacao`  int                                                                                 DEFAULT NULL,
    `numero_serie_nfe`               int                                                                                 DEFAULT NULL,
    `numero_ultima_nfce_producao`    int                                                                                 DEFAULT NULL,
    `numero_ultima_nfce_homologacao` int                                                                                 DEFAULT NULL,
    `numero_serie_nfce`              int                                                                                 DEFAULT NULL,
    `numero_ultima_cte_producao`     int                                                                                 DEFAULT NULL,
    `numero_ultima_cte_homologacao`  int                                                                                 DEFAULT NULL,
    `numero_serie_cte`               int                                                                                 DEFAULT NULL,
    `numero_ultima_mdfe_producao`    int                                                                                 DEFAULT NULL,
    `numero_ultima_mdfe_homologacao` int                                                                                 DEFAULT NULL,
    `numero_serie_mdfe`              int                                                                                 DEFAULT NULL,
    `numero_ultima_nfse`             int                                                                                 DEFAULT NULL,
    `numero_serie_nfse`              int                                                                                 DEFAULT NULL,
    `csc`                            varchar(50) COLLATE utf8mb4_unicode_ci                                              DEFAULT NULL,
    `csc_id`                         varchar(20) COLLATE utf8mb4_unicode_ci                                              DEFAULT NULL,
    `ambiente`                       int                                                                        NOT NULL,
    `tributacao`                     enum ('MEI','Simples Nacional','Regime Normal') COLLATE utf8mb4_unicode_ci NOT NULL,
    `token_nfse`                     varchar(200) COLLATE utf8mb4_unicode_ci                                             DEFAULT NULL,
    `logo`                           varchar(100) COLLATE utf8mb4_unicode_ci                                    NOT NULL DEFAULT '',
    `created_at`                     timestamp                                                                  NULL     DEFAULT NULL,
    `updated_at`                     timestamp                                                                  NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `localizacaos_empresa_id_foreign` (`empresa_id`),
    KEY `localizacaos_cidade_id_foreign` (`cidade_id`),
    CONSTRAINT `localizacaos_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
    CONSTRAINT `localizacaos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `produto_localizacaos`
(
    `id`             bigint unsigned NOT NULL AUTO_INCREMENT,
    `produto_id`     bigint unsigned      DEFAULT NULL,
    `localizacao_id` bigint unsigned      DEFAULT NULL,
    `created_at`     timestamp       NULL DEFAULT NULL,
    `updated_at`     timestamp       NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `produto_localizacaos_produto_id_foreign` (`produto_id`),
    KEY `produto_localizacaos_localizacao_id_foreign` (`localizacao_id`),
    CONSTRAINT `produto_localizacaos_localizacao_id_foreign` FOREIGN KEY (`localizacao_id`) REFERENCES `localizacaos` (`id`),
    CONSTRAINT `produto_localizacaos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 14
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `usuario_localizacaos`
(
    `id`             bigint unsigned NOT NULL AUTO_INCREMENT,
    `usuario_id`     bigint unsigned      DEFAULT NULL,
    `localizacao_id` bigint unsigned      DEFAULT NULL,
    `created_at`     timestamp       NULL DEFAULT NULL,
    `updated_at`     timestamp       NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `usuario_localizacaos_usuario_id_foreign` (`usuario_id`),
    KEY `usuario_localizacaos_localizacao_id_foreign` (`localizacao_id`),
    CONSTRAINT `usuario_localizacaos_localizacao_id_foreign` FOREIGN KEY (`localizacao_id`) REFERENCES `localizacaos` (`id`),
    CONSTRAINT `usuario_localizacaos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `financeiro_planos`
(
    `id`               bigint unsigned                                                     NOT NULL AUTO_INCREMENT,
    `empresa_id`       bigint unsigned                                                          DEFAULT NULL,
    `plano_id`         bigint unsigned                                                          DEFAULT NULL,
    `valor`            decimal(10, 2)                                                      NOT NULL,
    `tipo_pagamento`   varchar(50) COLLATE utf8mb4_unicode_ci                              NOT NULL,
    `status_pagamento` enum ('pendente','recebido','cancelado') COLLATE utf8mb4_unicode_ci NOT NULL,
    `plano_empresa_id` int                                                                 NOT NULL,
    `created_at`       timestamp                                                           NULL DEFAULT NULL,
    `updated_at`       timestamp                                                           NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `financeiro_planos_empresa_id_foreign` (`empresa_id`),
    KEY `financeiro_planos_plano_id_foreign` (`plano_id`),
    CONSTRAINT `financeiro_planos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
    CONSTRAINT `financeiro_planos_plano_id_foreign` FOREIGN KEY (`plano_id`) REFERENCES `planos` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 13
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `modelo_etiquetas`
(
    `id`                          bigint unsigned                                       NOT NULL AUTO_INCREMENT,
    `empresa_id`                  bigint unsigned                                            DEFAULT NULL,
    `nome`                        varchar(40) COLLATE utf8mb4_unicode_ci                NOT NULL,
    `observacao`                  varchar(255) COLLATE utf8mb4_unicode_ci                    DEFAULT NULL,
    `altura`                      decimal(7, 2)                                         NOT NULL,
    `largura`                     decimal(7, 2)                                         NOT NULL,
    `etiquestas_por_linha`        int                                                   NOT NULL,
    `distancia_etiquetas_lateral` decimal(7, 2)                                         NOT NULL,
    `distancia_etiquetas_topo`    decimal(7, 2)                                         NOT NULL,
    `quantidade_etiquetas`        int                                                   NOT NULL,
    `tamanho_fonte`               decimal(7, 2)                                         NOT NULL,
    `tamanho_codigo_barras`       decimal(7, 2)                                         NOT NULL,
    `nome_empresa`                tinyint(1)                                            NOT NULL,
    `nome_produto`                tinyint(1)                                            NOT NULL,
    `valor_produto`               tinyint(1)                                            NOT NULL,
    `codigo_produto`              tinyint(1)                                            NOT NULL,
    `codigo_barras_numerico`      tinyint(1)                                            NOT NULL,
    `tipo`                        enum ('simples','gondola') COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at`                  timestamp                                             NULL DEFAULT NULL,
    `updated_at`                  timestamp                                             NULL DEFAULT NULL,
    `importado_super`             tinyint(1)                                                 DEFAULT '0',
    PRIMARY KEY (`id`),
    KEY `modelo_etiquetas_empresa_id_foreign` (`empresa_id`),
    CONSTRAINT `modelo_etiquetas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;


INSERT INTO `permissions`
VALUES (1, 'usuarios_view', 'Visualiza usuários', 'web', '2024-06-24 01:32:58', '2024-06-24 01:32:58'),
       (2, 'usuarios_create', 'Cria usuário', 'web', '2024-06-24 01:32:58', '2024-06-24 01:32:58'),
       (3, 'usuarios_edit', 'Edita usuário', 'web', '2024-06-24 01:32:58', '2024-06-24 01:32:58'),
       (4, 'usuarios_delete', 'Deleta usuário', 'web', '2024-06-24 01:32:58', '2024-06-24 01:32:58'),
       (5, 'produtos_view', 'Visualiza produtos', 'web', '2024-06-24 01:32:58', '2024-06-24 01:32:58'),
       (6, 'produtos_create', 'Cria produto', 'web', '2024-06-24 01:32:58', '2024-06-24 01:32:58'),
       (7, 'produtos_edit', 'Edita produtos', 'web', '2024-06-24 01:32:58', '2024-06-24 01:32:58'),
       (8, 'produtos_delete', 'Deleta produtos', 'web', '2024-06-24 01:32:58', '2024-06-24 01:32:58'),
       (9, 'estoque_view', 'Visualiza estoque', 'web', '2024-06-24 01:32:58', '2024-06-24 01:32:58'),
       (10, 'estoque_create', 'Cria estoque', 'web', '2024-06-24 01:32:58', '2024-06-24 01:32:58'),
       (11, 'estoque_edit', 'Edita estoque', 'web', '2024-06-24 01:32:58', '2024-06-24 01:32:58'),
       (12, 'estoque_delete', 'Deleta estoque', 'web', '2024-06-24 01:32:58', '2024-06-24 01:32:58'),
       (13, 'variacao_view', 'Visualiza variação', 'web', '2024-06-24 01:32:58', '2024-06-24 01:32:58'),
       (14, 'variacao_create', 'Cria variação', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (15, 'variacao_edit', 'Edita variação', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (16, 'variacao_delete', 'Deleta variação', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (17, 'categoria_produtos_view', 'Visualiza categoria de produtos', 'web', '2024-06-24 01:32:59',
        '2024-06-24 01:32:59'),
       (18, 'categoria_produtos_create', 'Cria categoria de produtos', 'web', '2024-06-24 01:32:59',
        '2024-06-24 01:32:59'),
       (19, 'categoria_produtos_edit', 'Edita categoria de produtos', 'web', '2024-06-24 01:32:59',
        '2024-06-24 01:32:59'),
       (20, 'categoria_produtos_delete', 'Deleta categoria de produtos', 'web', '2024-06-24 01:32:59',
        '2024-06-24 01:32:59'),
       (21, 'marcas_view', 'Visualiza marca', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (22, 'marcas_create', 'Cria marca', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (23, 'marcas_edit', 'Edita marca', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (24, 'marcas_delete', 'Deleta marca', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (25, 'lista_preco_view', 'Visualiza lista de preços', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (26, 'lista_preco_create', 'Cria lista de preços', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (27, 'lista_preco_edit', 'Edita lista de preços', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (28, 'lista_preco_delete', 'Deleta lista de preços', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (29, 'config_produto_fiscal_view', 'Visualiza configuração fiscal produto', 'web', '2024-06-24 01:32:59',
        '2024-06-24 01:32:59'),
       (30, 'config_produto_fiscal_create', 'Cria configuração fiscal produto', 'web', '2024-06-24 01:32:59',
        '2024-06-24 01:32:59'),
       (31, 'config_produto_fiscal_edit', 'Edita configuração fiscal produto', 'web', '2024-06-24 01:32:59',
        '2024-06-24 01:32:59'),
       (32, 'config_produto_fiscal_delete', 'Deleta configuração fiscal produto', 'web', '2024-06-24 01:32:59',
        '2024-06-24 01:32:59'),
       (33, 'atribuicoes_view', 'Visualiza atribuições', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (34, 'atribuicoes_create', 'Cria atribuição', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (35, 'atribuicoes_edit', 'Edita atribuições', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (36, 'atribuicoes_delete', 'Deleta atribuições', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (37, 'clientes_view', 'Visualiza clientes', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (38, 'clientes_create', 'Cria cliente', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (39, 'clientes_edit', 'Edita cliente', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (40, 'clientes_delete', 'Deleta cliente', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (41, 'fornecedores_view', 'Visualiza fornecedores', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (42, 'fornecedores_create', 'Cria fornecedor', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (43, 'fornecedores_edit', 'Edita fornecedor', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (44, 'fornecedores_delete', 'Deleta fornecedor', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (45, 'transportadoras_view', 'Visualiza transportadora', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (46, 'transportadoras_create', 'Cria transportadora', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (47, 'transportadoras_edit', 'Edita transportadora', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (48, 'transportadoras_delete', 'Deleta transportadora', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (49, 'nfe_view', 'Visualiza NFe', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (50, 'nfe_create', 'Cria NFe', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (51, 'nfe_edit', 'Edita NFe', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (52, 'nfe_delete', 'Deleta NFe', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (53, 'nfe_inutiliza', 'Inutiliza NFe', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (54, 'nfe_transmitir', 'Transmitir NFe', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (55, 'orcamento_view', 'Visualiza Orçamento', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (56, 'orcamento_create', 'Cria Orçamento', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (57, 'orcamento_edit', 'Edita Orçamento', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (58, 'orcamento_delete', 'Deleta Orçamento', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (59, 'nfce_view', 'Visualiza NFCe', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (60, 'nfce_create', 'Cria NFCe', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (61, 'nfce_edit', 'Edita NFCe', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (62, 'nfce_delete', 'Deleta NFCe', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (63, 'nfce_transmitir', 'Transmitir NFCe', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (64, 'nfce_inutiliza', 'Inutiliza NFce', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (65, 'cte_view', 'Visualiza CTe', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (66, 'cte_create', 'Cria CTe', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (67, 'cte_edit', 'Edita CTe', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (68, 'cte_delete', 'Deleta CTe', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (69, 'cte_os_view', 'Visualiza CTeOs', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (70, 'cte_os_create', 'Cria CTeOs', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (71, 'cte_os_edit', 'Edita CTeOs', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (72, 'cte_os_delete', 'Deleta CTeOs', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (73, 'mdfe_view', 'Visualiza MDFe', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (74, 'mdfe_create', 'Cria MDFe', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (75, 'mdfe_edit', 'Edita MDFe', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (76, 'mdfe_delete', 'Deleta MDFe', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (77, 'nfse_view', 'Visualiza NFSe', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (78, 'nfse_create', 'Cria NFSe', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (79, 'nfse_edit', 'Edita NFSe', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (80, 'nfse_delete', 'Deleta NFSe', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (81, 'pdv_view', 'Visualiza PDV', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (82, 'pdv_create', 'Cria PDV', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (83, 'pdv_edit', 'Edita PDV', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (84, 'pdv_delete', 'Deleta PDV', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (85, 'pre_venda_view', 'Visualiza pré venda', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (86, 'pre_venda_create', 'Cria pré venda', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (87, 'pre_venda_edit', 'Edita pré venda', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (88, 'pre_venda_delete', 'Deleta pré venda', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (89, 'agendamento_view', 'Visualiza agendamento', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (90, 'agendamento_create', 'Cria agendamento', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (91, 'agendamento_edit', 'Edita agendamento', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (92, 'agendamento_delete', 'Deleta agendamento', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (93, 'servico_view', 'Visualiza serviço', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (94, 'servico_create', 'Cria serviço', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (95, 'servico_edit', 'Edita serviço', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (96, 'servico_delete', 'Deleta serviço', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (97, 'categoria_servico_view', 'Visualiza categoria de serviço', 'web', '2024-06-24 01:32:59',
        '2024-06-24 01:32:59'),
       (98, 'categoria_servico_create', 'Cria categoria de serviço', 'web', '2024-06-24 01:32:59',
        '2024-06-24 01:32:59'),
       (99, 'categoria_servico_edit', 'Edita categoria de serviço', 'web', '2024-06-24 01:32:59',
        '2024-06-24 01:32:59'),
       (100, 'categoria_servico_delete', 'Deleta categoria de serviço', 'web', '2024-06-24 01:32:59',
        '2024-06-24 01:32:59'),
       (101, 'veiculos_view', 'Visualiza veículo', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (102, 'veiculos_create', 'Cria veículo', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (103, 'veiculos_edit', 'Edita veículo', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (104, 'veiculos_delete', 'Deleta veículo', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (105, 'atendimentos_view', 'Visualiza atendimento', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (106, 'atendimentos_create', 'Cria atendimento', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (107, 'atendimentos_edit', 'Edita atendimento', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (108, 'atendimentos_delete', 'Deleta atendimento', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (109, 'conta_pagar_view', 'Visualiza conta a pagar', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (110, 'conta_pagar_create', 'Cria conta a pagar', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (111, 'conta_pagar_edit', 'Edita conta a pagar', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (112, 'conta_pagar_delete', 'Deleta conta a pagar', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (113, 'conta_receber_view', 'Visualiza conta a receber', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (114, 'conta_receber_create', 'Cria conta a receber', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (115, 'conta_receber_edit', 'Edita conta a receber', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (116, 'conta_receber_delete', 'Deleta conta a receber', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (117, 'cardapio_view', 'Visualiza cárdapio', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (118, 'controle_acesso_view', 'Visualiza controle de acesso', 'web', '2024-06-24 01:32:59',
        '2024-06-24 01:32:59'),
       (119, 'controle_acesso_create', 'Cria controle de acesso', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (120, 'controle_acesso_edit', 'Edita controle de acesso', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (121, 'controle_acesso_delete', 'Deleta controle de acesso', 'web', '2024-06-24 01:32:59',
        '2024-06-24 01:32:59'),
       (122, 'arquivos_xml_view', 'Visualiza arquivos xml', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (123, 'natureza_operacao_view', 'Visualiza natureza de operação', 'web', '2024-06-24 01:32:59',
        '2024-06-24 01:32:59'),
       (124, 'natureza_operacao_create', 'Cria natureza de operação', 'web', '2024-06-24 01:32:59',
        '2024-06-24 01:32:59'),
       (125, 'natureza_operacao_edit', 'Edita natureza de operação', 'web', '2024-06-24 01:32:59',
        '2024-06-24 01:32:59'),
       (126, 'natureza_operacao_delete', 'Deleta natureza de operação', 'web', '2024-06-24 01:32:59',
        '2024-06-24 01:32:59'),
       (127, 'emitente_view', 'Visualiza emitente', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (128, 'compras_view', 'Visualiza compras', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (129, 'compras_create', 'Cria compras', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (130, 'compras_edit', 'Edita compras', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (131, 'compras_delete', 'Deleta compras', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (132, 'manifesto_view', 'Visualiza manifesto compras', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (133, 'cotacao_view', 'Visualiza cotação', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (134, 'cotacao_create', 'Cria cotação', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (135, 'cotacao_edit', 'Edita cotação', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (136, 'cotacao_delete', 'Deleta cotação', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (137, 'devolucao_view', 'Visualiza devolução', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (138, 'devolucao_create', 'Cria devolução', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (139, 'devolucao_edit', 'Edita devolução', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (140, 'devolucao_delete', 'Deleta devolução', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (141, 'funcionario_view', 'Visualiza funcionário', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (142, 'funcionario_create', 'Cria funcionário', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (143, 'funcionario_edit', 'Edita funcionário', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (144, 'funcionario_delete', 'Deleta funcionário', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (145, 'apuracao_mensal_view', 'Visualiza Apuração mensal', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (146, 'apuracao_mensal_create', 'Cria Apuração mensal', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (147, 'apuracao_mensal_edit', 'Edita Apuração mensal', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (148, 'apuracao_mensal_delete', 'Deleta Apuração mensal', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (149, 'ecommerce_view', 'Visualiza ecommerce', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (150, 'delivery_view', 'Visualiza delivery', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (151, 'mercado_livre_view', 'Visualiza mercado livre', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (152, 'nuvem_shop_view', 'Visualiza nuvem shop', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (153, 'relatorio_view', 'Visualiza relatório', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (154, 'caixa_view', 'Visualiza caixa', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (155, 'contas_empresa_view', 'Visualiza contas da empresa', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (156, 'contas_empresa_create', 'Cria contas da empresa', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (157, 'contas_empresa_edit', 'Edita contas da empresa', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (158, 'contas_empresa_delete', 'Deleta contas da empresa', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (159, 'contas_boleto_view', 'Visualiza contas de boleto', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (160, 'contas_boleto_create', 'Cria contas de boleto', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (161, 'contas_boleto_edit', 'Edita contas de boleto', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (162, 'contas_boleto_delete', 'Deleta contas de boleto', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (163, 'boleto_view', 'Visualiza boleto', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (164, 'boleto_create', 'Cria boleto', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (165, 'boleto_edit', 'Edita boleto', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (166, 'boleto_delete', 'Deleta boleto', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (167, 'taxa_pagamento_view', 'Visualiza taxa de pagamento', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (168, 'taxa_pagamento_create', 'Cria taxa de pagamento', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (169, 'taxa_pagamento_edit', 'Edita taxa de pagamento', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (170, 'taxa_pagamento_delete', 'Deleta taxa de pagamento', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (171, 'ordem_servico_view', 'Visualiza ordem de serviço', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (172, 'ordem_servico_create', 'Cria ordem de serviço', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (173, 'ordem_servico_edit', 'Edita ordem de serviço', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (174, 'ordem_servico_delete', 'Deleta ordem de serviço', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (175, 'difal_view', 'Visualiza difal', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (176, 'difal_create', 'Cria difal', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (177, 'difal_edit', 'Edita difal', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (178, 'difal_delete', 'Deleta difal', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (179, 'cashback_config_view', 'Visualiza cashback config', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (180, 'localizacao_view', 'Visualiza localização', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (181, 'localizacao_create', 'Cria localização', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (182, 'localizacao_edit', 'Edita localização', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
       (183, 'localizacao_delete', 'Deleta localização', 'web', '2024-06-24 01:32:59', '2024-06-24 01:32:59'),
	   (184,'transferencia_estoque_view','Visualiza transferência de estoque','web','2024-07-24 18:43:06','2024-07-24 18:43:06'),
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


CREATE TABLE `produto_fornecedors`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `empresa_id`     bigint(20) unsigned          DEFAULT NULL,
    `produto_id`     bigint(20) unsigned          DEFAULT NULL,
    `fornecedor_id`  bigint(20) unsigned          DEFAULT NULL,
    `nr_referencia`  varchar(100)        NOT NULL,
    `nr_nota_fiscal` varchar(100)        NOT NULL,
    `un_estoque`     varchar(20)         NOT NULL,
    `un_original`    varchar(20)         NOT NULL,
    `qt_estoque`     decimal(5, 2)       NOT NULL DEFAULT 0.00,
    `qt_original`    decimal(5, 2)       NOT NULL DEFAULT 0.00,
    `created_at`     timestamp           NULL     DEFAULT NULL,
    `updated_at`     timestamp           NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `produto_fornecedors_empresa_id_foreign` (`empresa_id`),
    KEY `produto_fornecedors_produto_id_foreign` (`produto_id`),
    KEY `produto_fornecedors_fornecedor_id_foreign` (`fornecedor_id`),
    CONSTRAINT `produto_fornecedors_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
    CONSTRAINT `produto_fornecedors_fornecedor_id_foreign` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedors` (`id`),
    CONSTRAINT `produto_fornecedors_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 16
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;
  
  

CREATE TABLE `item_transferencia_estoques` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` bigint unsigned DEFAULT NULL,
  `transferencia_id` bigint unsigned DEFAULT NULL,
  `quantidade` decimal(14,4) NOT NULL,
  `observacao` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_transferencia_estoques_produto_id_foreign` (`produto_id`),
  KEY `item_transferencia_estoques_transferencia_id_foreign` (`transferencia_id`),
  CONSTRAINT `item_transferencia_estoques_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `item_transferencia_estoques_transferencia_id_foreign` FOREIGN KEY (`transferencia_id`) REFERENCES `transferencia_estoques` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `transferencia_estoques` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `local_saida_id` bigint unsigned DEFAULT NULL,
  `local_entrada_id` bigint unsigned DEFAULT NULL,
  `usuario_id` bigint unsigned DEFAULT NULL,
  `observacao` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo_transacao` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transferencia_estoques_empresa_id_foreign` (`empresa_id`),
  KEY `transferencia_estoques_local_saida_id_foreign` (`local_saida_id`),
  KEY `transferencia_estoques_local_entrada_id_foreign` (`local_entrada_id`),
  KEY `transferencia_estoques_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `transferencia_estoques_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `transferencia_estoques_local_entrada_id_foreign` FOREIGN KEY (`local_entrada_id`) REFERENCES `localizacaos` (`id`),
  CONSTRAINT `transferencia_estoques_local_saida_id_foreign` FOREIGN KEY (`local_saida_id`) REFERENCES `localizacaos` (`id`),
  CONSTRAINT `transferencia_estoques_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `categoria_acomodacaos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria_acomodacaos_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `categoria_acomodacaos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `acomodacaos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria_id` bigint unsigned NOT NULL,
  `valor_diaria` decimal(12,2) NOT NULL,
  `capacidade` int NOT NULL,
  `estacionamento` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `acomodacaos_empresa_id_foreign` (`empresa_id`),
  KEY `acomodacaos_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `acomodacaos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_acomodacaos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `acomodacaos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `frigobars` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `acomodacao_id` bigint unsigned NOT NULL,
  `modelo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `frigobars_empresa_id_foreign` (`empresa_id`),
  KEY `frigobars_acomodacao_id_foreign` (`acomodacao_id`),
  CONSTRAINT `frigobars_acomodacao_id_foreign` FOREIGN KEY (`acomodacao_id`) REFERENCES `acomodacaos` (`id`),
  CONSTRAINT `frigobars_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `reserva_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `cpf_cnpj` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `razao_social` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rua` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complemento` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cidade_id` bigint unsigned NOT NULL,
  `telefone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `horario_checkin` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `horario_checkout` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reserva_configs_empresa_id_foreign` (`empresa_id`),
  KEY `reserva_configs_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `reserva_configs_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
  CONSTRAINT `reserva_configs_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `servico_reservas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reserva_id` bigint unsigned NOT NULL,
  `servico_id` bigint unsigned DEFAULT NULL,
  `quantidade` decimal(8,2) NOT NULL,
  `valor_unitario` decimal(12,2) NOT NULL,
  `sub_total` decimal(12,2) NOT NULL,
  `observacao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `servico_reservas_reserva_id_foreign` (`reserva_id`),
  KEY `servico_reservas_servico_id_foreign` (`servico_id`),
  CONSTRAINT `servico_reservas_reserva_id_foreign` FOREIGN KEY (`reserva_id`) REFERENCES `reservas` (`id`),
  CONSTRAINT `servico_reservas_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `padrao_frigobars` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `frigobar_id` bigint unsigned NOT NULL,
  `produto_id` bigint unsigned NOT NULL,
  `quantidade` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `padrao_frigobars_frigobar_id_foreign` (`frigobar_id`),
  KEY `padrao_frigobars_produto_id_foreign` (`produto_id`),
  CONSTRAINT `padrao_frigobars_frigobar_id_foreign` FOREIGN KEY (`frigobar_id`) REFERENCES `frigobars` (`id`),
  CONSTRAINT `padrao_frigobars_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `hospede_reservas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reserva_id` bigint unsigned NOT NULL,
  `descricao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_completo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cpf` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rua` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bairro` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cidade_id` bigint unsigned DEFAULT NULL,
  `telefone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cep` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hospede_reservas_reserva_id_foreign` (`reserva_id`),
  KEY `hospede_reservas_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `hospede_reservas_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
  CONSTRAINT `hospede_reservas_reserva_id_foreign` FOREIGN KEY (`reserva_id`) REFERENCES `reservas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





CREATE TABLE `consumo_reservas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reserva_id` bigint unsigned NOT NULL,
  `produto_id` bigint unsigned DEFAULT NULL,
  `quantidade` decimal(8,2) NOT NULL,
  `valor_unitario` decimal(12,2) NOT NULL,
  `sub_total` decimal(12,2) NOT NULL,
  `observacao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frigobar` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `consumo_reservas_reserva_id_foreign` (`reserva_id`),
  KEY `consumo_reservas_produto_id_foreign` (`produto_id`),
  CONSTRAINT `consumo_reservas_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `consumo_reservas_reserva_id_foreign` FOREIGN KEY (`reserva_id`) REFERENCES `reservas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `notas_reservas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reserva_id` bigint unsigned NOT NULL,
  `texto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notas_reservas_reserva_id_foreign` (`reserva_id`),
  CONSTRAINT `notas_reservas_reserva_id_foreign` FOREIGN KEY (`reserva_id`) REFERENCES `reservas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `fatura_reservas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reserva_id` bigint unsigned DEFAULT NULL,
  `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_vencimento` date NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fatura_reservas_reserva_id_foreign` (`reserva_id`),
  CONSTRAINT `fatura_reservas_reserva_id_foreign` FOREIGN KEY (`reserva_id`) REFERENCES `reservas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `reservas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `cliente_id` bigint unsigned NOT NULL,
  `acomodacao_id` bigint unsigned NOT NULL,
  `numero_sequencial` int DEFAULT NULL,
  `data_checkin` date NOT NULL,
  `data_checkout` date NOT NULL,
  `valor_estadia` decimal(12,2) NOT NULL,
  `desconto` decimal(12,2) DEFAULT NULL,
  `valor_outros` decimal(12,2) DEFAULT NULL,
  `valor_total` decimal(12,2) DEFAULT NULL,
  `estado` enum('pendente','iniciado','finalizado','cancelado') COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `motivo_cancelamento` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `conferencia_frigobar` tinyint(1) NOT NULL DEFAULT '0',
  `total_hospedes` int DEFAULT NULL,
  `codigo_reseva` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_externo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_checkin_realizado` timestamp NULL DEFAULT NULL,
  `nfe_id` int DEFAULT NULL,
  `nfse_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reservas_empresa_id_foreign` (`empresa_id`),
  KEY `reservas_cliente_id_foreign` (`cliente_id`),
  KEY `reservas_acomodacao_id_foreign` (`acomodacao_id`),
  CONSTRAINT `reservas_acomodacao_id_foreign` FOREIGN KEY (`acomodacao_id`) REFERENCES `acomodacaos` (`id`),
  CONSTRAINT `reservas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `reservas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






















