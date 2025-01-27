--
-- Table structure for table `acesso_logs`
--

--DROP TABLE IF EXISTS `acesso_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acesso_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint unsigned DEFAULT NULL,
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `acesso_logs_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `acesso_logs_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acesso_logs`
--

LOCK TABLES `acesso_logs` WRITE;
/*!40000 ALTER TABLE `acesso_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `acesso_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acomodacaos`
--

--DROP TABLE IF EXISTS `acomodacaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acomodacaos`
--

LOCK TABLES `acomodacaos` WRITE;
/*!40000 ALTER TABLE `acomodacaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `acomodacaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adicionals`
--

--DROP TABLE IF EXISTS `adicionals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adicionals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `nome` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_en` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nome_es` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `valor` decimal(12,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adicionals_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `adicionals_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adicionals`
--

LOCK TABLES `adicionals` WRITE;
/*!40000 ALTER TABLE `adicionals` DISABLE KEYS */;
/*!40000 ALTER TABLE `adicionals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agendamentos`
--

--DROP TABLE IF EXISTS `agendamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agendamentos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `funcionario_id` bigint unsigned DEFAULT NULL,
  `cliente_id` bigint unsigned DEFAULT NULL,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `data` date NOT NULL,
  `observacao` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inicio` time NOT NULL,
  `termino` time NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) DEFAULT NULL,
  `acrescimo` decimal(10,2) DEFAULT NULL,
  `valor_comissao` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `prioridade` enum('baixa','media','alta') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'baixa',
  `nfce_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agendamentos_funcionario_id_foreign` (`funcionario_id`),
  KEY `agendamentos_cliente_id_foreign` (`cliente_id`),
  KEY `agendamentos_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `agendamentos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `agendamentos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `agendamentos_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendamentos`
--

LOCK TABLES `agendamentos` WRITE;
/*!40000 ALTER TABLE `agendamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `agendamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apontamentos`
--

--DROP TABLE IF EXISTS `apontamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apontamentos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` bigint unsigned DEFAULT NULL,
  `quantidade` decimal(14,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `apontamentos_produto_id_foreign` (`produto_id`),
  CONSTRAINT `apontamentos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apontamentos`
--

LOCK TABLES `apontamentos` WRITE;
/*!40000 ALTER TABLE `apontamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `apontamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apuracao_mensal_eventos`
--

--DROP TABLE IF EXISTS `apuracao_mensal_eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apuracao_mensal_eventos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `apuracao_id` bigint unsigned DEFAULT NULL,
  `evento_id` bigint unsigned DEFAULT NULL,
  `valor` decimal(8,2) NOT NULL,
  `metodo` enum('informado','fixo') COLLATE utf8mb4_unicode_ci NOT NULL,
  `condicao` enum('soma','diminui') COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `apuracao_mensal_eventos_apuracao_id_foreign` (`apuracao_id`),
  KEY `apuracao_mensal_eventos_evento_id_foreign` (`evento_id`),
  CONSTRAINT `apuracao_mensal_eventos_apuracao_id_foreign` FOREIGN KEY (`apuracao_id`) REFERENCES `apuracao_mensals` (`id`),
  CONSTRAINT `apuracao_mensal_eventos_evento_id_foreign` FOREIGN KEY (`evento_id`) REFERENCES `evento_salarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apuracao_mensal_eventos`
--

LOCK TABLES `apuracao_mensal_eventos` WRITE;
/*!40000 ALTER TABLE `apuracao_mensal_eventos` DISABLE KEYS */;
/*!40000 ALTER TABLE `apuracao_mensal_eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apuracao_mensals`
--

--DROP TABLE IF EXISTS `apuracao_mensals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apuracao_mensals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `funcionario_id` bigint unsigned NOT NULL,
  `mes` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ano` int NOT NULL,
  `valor_final` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conta_pagar_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `apuracao_mensals_funcionario_id_foreign` (`funcionario_id`),
  CONSTRAINT `apuracao_mensals_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apuracao_mensals`
--

LOCK TABLES `apuracao_mensals` WRITE;
/*!40000 ALTER TABLE `apuracao_mensals` DISABLE KEYS */;
/*!40000 ALTER TABLE `apuracao_mensals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bairro_deliveries`
--

--DROP TABLE IF EXISTS `bairro_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bairro_deliveries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `nome` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_entrega` decimal(10,2) NOT NULL,
  `bairro_delivery_super` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bairro_deliveries_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `bairro_deliveries_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bairro_deliveries`
--

LOCK TABLES `bairro_deliveries` WRITE;
/*!40000 ALTER TABLE `bairro_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `bairro_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bairro_delivery_masters`
--

--DROP TABLE IF EXISTS `bairro_delivery_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bairro_delivery_masters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bairro_delivery_masters_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `bairro_delivery_masters_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bairro_delivery_masters`
--

LOCK TABLES `bairro_delivery_masters` WRITE;
/*!40000 ALTER TABLE `bairro_delivery_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `bairro_delivery_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boletos`
--

--DROP TABLE IF EXISTS `boletos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boletos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `conta_boleto_id` bigint unsigned DEFAULT NULL,
  `conta_receber_id` bigint unsigned DEFAULT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_documento` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carteira` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `convenio` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vencimento` date NOT NULL,
  `valor` decimal(12,2) NOT NULL,
  `instrucoes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linha_digitavel` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nome_arquivo` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `juros` decimal(10,2) DEFAULT NULL,
  `multa` decimal(10,2) DEFAULT NULL,
  `juros_apos` int DEFAULT NULL,
  `tipo` enum('Cnab400','Cnab240') COLLATE utf8mb4_unicode_ci NOT NULL,
  `usar_logo` tinyint(1) NOT NULL DEFAULT '0',
  `posto` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo_cliente` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valor_tarifa` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `boletos_empresa_id_foreign` (`empresa_id`),
  KEY `boletos_conta_boleto_id_foreign` (`conta_boleto_id`),
  KEY `boletos_conta_receber_id_foreign` (`conta_receber_id`),
  CONSTRAINT `boletos_conta_boleto_id_foreign` FOREIGN KEY (`conta_boleto_id`) REFERENCES `conta_boletos` (`id`),
  CONSTRAINT `boletos_conta_receber_id_foreign` FOREIGN KEY (`conta_receber_id`) REFERENCES `conta_recebers` (`id`),
  CONSTRAINT `boletos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boletos`
--

LOCK TABLES `boletos` WRITE;
/*!40000 ALTER TABLE `boletos` DISABLE KEYS */;
/*!40000 ALTER TABLE `boletos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_te_descargas`
--

--DROP TABLE IF EXISTS `c_te_descargas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_te_descargas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `info_id` bigint unsigned NOT NULL,
  `chave` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seg_cod_barras` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `c_te_descargas_info_id_foreign` (`info_id`),
  CONSTRAINT `c_te_descargas_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_te_descargas`
--

LOCK TABLES `c_te_descargas` WRITE;
/*!40000 ALTER TABLE `c_te_descargas` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_te_descargas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caixas`
--

--DROP TABLE IF EXISTS `caixas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caixas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `usuario_id` bigint unsigned DEFAULT NULL,
  `valor_abertura` decimal(10,2) NOT NULL,
  `conta_empresa_id` int DEFAULT NULL,
  `observacao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `data_fechamento` timestamp NULL DEFAULT NULL,
  `valor_fechamento` decimal(10,2) DEFAULT NULL,
  `valor_dinheiro` decimal(10,2) DEFAULT NULL,
  `valor_cheque` decimal(10,2) DEFAULT NULL,
  `valor_outros` decimal(10,2) DEFAULT NULL,
  `local_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `caixas_empresa_id_foreign` (`empresa_id`),
  KEY `caixas_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `caixas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `caixas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixas`
--

LOCK TABLES `caixas` WRITE;
/*!40000 ALTER TABLE `caixas` DISABLE KEYS */;
/*!40000 ALTER TABLE `caixas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrinho_deliveries`
--

--DROP TABLE IF EXISTS `carrinho_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrinho_deliveries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` bigint unsigned DEFAULT NULL,
  `empresa_id` bigint unsigned NOT NULL,
  `endereco_id` bigint unsigned DEFAULT NULL,
  `estado` enum('pendente','finalizado') COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `valor_desconto` decimal(10,2) NOT NULL,
  `cupom` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_frete` decimal(10,2) NOT NULL,
  `session_cart_delivery` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_pagamento` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `troco_para` decimal(10,2) DEFAULT NULL,
  `tipo_entrega` enum('delivery','retirada') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carrinho_deliveries_cliente_id_foreign` (`cliente_id`),
  KEY `carrinho_deliveries_empresa_id_foreign` (`empresa_id`),
  KEY `carrinho_deliveries_endereco_id_foreign` (`endereco_id`),
  CONSTRAINT `carrinho_deliveries_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `carrinho_deliveries_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `carrinho_deliveries_endereco_id_foreign` FOREIGN KEY (`endereco_id`) REFERENCES `endereco_deliveries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrinho_deliveries`
--

LOCK TABLES `carrinho_deliveries` WRITE;
/*!40000 ALTER TABLE `carrinho_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrinho_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrinhos`
--

--DROP TABLE IF EXISTS `carrinhos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrinhos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` bigint unsigned DEFAULT NULL,
  `empresa_id` bigint unsigned NOT NULL,
  `endereco_id` bigint unsigned DEFAULT NULL,
  `estado` enum('pendente','finalizado') COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `tipo_frete` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valor_frete` decimal(10,2) NOT NULL,
  `cep` decimal(9,2) DEFAULT NULL,
  `session_cart` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carrinhos_cliente_id_foreign` (`cliente_id`),
  KEY `carrinhos_empresa_id_foreign` (`empresa_id`),
  KEY `carrinhos_endereco_id_foreign` (`endereco_id`),
  CONSTRAINT `carrinhos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `carrinhos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `carrinhos_endereco_id_foreign` FOREIGN KEY (`endereco_id`) REFERENCES `endereco_ecommerces` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrinhos`
--

LOCK TABLES `carrinhos` WRITE;
/*!40000 ALTER TABLE `carrinhos` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrinhos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrossel_cardapios`
--

--DROP TABLE IF EXISTS `carrossel_cardapios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrossel_cardapios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `produto_id` bigint unsigned DEFAULT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descricao_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descricao_es` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valor` decimal(12,4) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `imagem` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carrossel_cardapios_empresa_id_foreign` (`empresa_id`),
  KEY `carrossel_cardapios_produto_id_foreign` (`produto_id`),
  CONSTRAINT `carrossel_cardapios_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `carrossel_cardapios_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrossel_cardapios`
--

LOCK TABLES `carrossel_cardapios` WRITE;
/*!40000 ALTER TABLE `carrossel_cardapios` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrossel_cardapios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_back_clientes`
--

--DROP TABLE IF EXISTS `cash_back_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cash_back_clientes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `cliente_id` bigint unsigned NOT NULL,
  `tipo` enum('venda','pdv') COLLATE utf8mb4_unicode_ci NOT NULL,
  `venda_id` int NOT NULL,
  `valor_venda` decimal(16,7) NOT NULL,
  `valor_credito` decimal(16,7) NOT NULL,
  `valor_percentual` decimal(5,2) NOT NULL,
  `data_expiracao` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cash_back_clientes_empresa_id_foreign` (`empresa_id`),
  KEY `cash_back_clientes_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `cash_back_clientes_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `cash_back_clientes_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_back_clientes`
--

LOCK TABLES `cash_back_clientes` WRITE;
/*!40000 ALTER TABLE `cash_back_clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash_back_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_back_configs`
--

--DROP TABLE IF EXISTS `cash_back_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cash_back_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `valor_percentual` decimal(5,2) NOT NULL,
  `dias_expiracao` int NOT NULL,
  `valor_minimo_venda` decimal(10,2) NOT NULL,
  `percentual_maximo_venda` decimal(10,2) NOT NULL,
  `mensagem_padrao_whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cash_back_configs_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `cash_back_configs_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_back_configs`
--

LOCK TABLES `cash_back_configs` WRITE;
/*!40000 ALTER TABLE `cash_back_configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash_back_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_acomodacaos`
--

--DROP TABLE IF EXISTS `categoria_acomodacaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_acomodacaos`
--

LOCK TABLES `categoria_acomodacaos` WRITE;
/*!40000 ALTER TABLE `categoria_acomodacaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_acomodacaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_mercado_livres`
--

--DROP TABLE IF EXISTS `categoria_mercado_livres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_mercado_livres` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_mercado_livres`
--

LOCK TABLES `categoria_mercado_livres` WRITE;
/*!40000 ALTER TABLE `categoria_mercado_livres` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_mercado_livres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_nuvem_shops`
--

--DROP TABLE IF EXISTS `categoria_nuvem_shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_nuvem_shops` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `nome` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria_nuvem_shops_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `categoria_nuvem_shops_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_nuvem_shops`
--

LOCK TABLES `categoria_nuvem_shops` WRITE;
/*!40000 ALTER TABLE `categoria_nuvem_shops` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_nuvem_shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_produtos`
--

--DROP TABLE IF EXISTS `categoria_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_produtos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `nome` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_en` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nome_es` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cardapio` tinyint(1) NOT NULL DEFAULT '0',
  `delivery` tinyint(1) NOT NULL DEFAULT '0',
  `ecommerce` tinyint(1) NOT NULL DEFAULT '0',
  `reserva` tinyint(1) NOT NULL DEFAULT '0',
  `tipo_pizza` tinyint(1) NOT NULL DEFAULT '0',
  `hash_ecommerce` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hash_delivery` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoria_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria_produtos_empresa_id_foreign` (`empresa_id`),
  KEY `categoria_produtos_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `categoria_produtos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_produtos` (`id`),
  CONSTRAINT `categoria_produtos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_produtos`
--

LOCK TABLES `categoria_produtos` WRITE;
/*!40000 ALTER TABLE `categoria_produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_servicos`
--

--DROP TABLE IF EXISTS `categoria_servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_servicos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagem` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marketplace` tinyint(1) NOT NULL DEFAULT '0',
  `hash_delivery` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria_servicos_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `categoria_servicos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_servicos`
--

LOCK TABLES `categoria_servicos` WRITE;
/*!40000 ALTER TABLE `categoria_servicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_woocommerces`
--

--DROP TABLE IF EXISTS `categoria_woocommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_woocommerces` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria_woocommerces_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `categoria_woocommerces_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_woocommerces`
--

LOCK TABLES `categoria_woocommerces` WRITE;
/*!40000 ALTER TABLE `categoria_woocommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_woocommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chave_nfe_ctes`
--

--DROP TABLE IF EXISTS `chave_nfe_ctes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chave_nfe_ctes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cte_id` bigint unsigned NOT NULL,
  `chave` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chave_nfe_ctes_cte_id_foreign` (`cte_id`),
  CONSTRAINT `chave_nfe_ctes_cte_id_foreign` FOREIGN KEY (`cte_id`) REFERENCES `ctes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chave_nfe_ctes`
--

LOCK TABLES `chave_nfe_ctes` WRITE;
/*!40000 ALTER TABLE `chave_nfe_ctes` DISABLE KEYS */;
/*!40000 ALTER TABLE `chave_nfe_ctes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidades`
--

--DROP TABLE IF EXISTS `cidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidades` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5571 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidades`
--

LOCK TABLES `cidades` WRITE;
/*!40000 ALTER TABLE `cidades` DISABLE KEYS */;
--INSERT INTO `cidades` VALUES (1,'1100015','Alta Floresta D\'Oeste','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(2,'1100023','Ariquemes','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(3,'1100031','Cabixi','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(4,'1100049','Cacoal','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(5,'1100056','Cerejeiras','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(6,'1100064','Colorado do Oeste','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(7,'1100072','Corumbiara','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(8,'1100080','Costa Marques','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(9,'1100098','Espigão D\'Oeste','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(10,'1100106','Guajará-Mirim','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(11,'1100114','Jaru','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(12,'1100122','Ji-Paraná','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(13,'1100130','Machadinho D\'Oeste','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(14,'1100148','Nova Brasilândia D\'Oeste','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(15,'1100155','Ouro Preto do Oeste','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(16,'1100189','Pimenta Bueno','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(17,'1100205','Porto Velho','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(18,'1100254','Presidente Médici','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(19,'1100262','Rio Crespo','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(20,'1100288','Rolim de Moura','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(21,'1100296','Santa Luzia D\'Oeste','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(22,'1100304','Vilhena','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(23,'1100320','São Miguel do Guaporé','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(24,'1100338','Nova Mamoré','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(25,'1100346','Alvorada D\'Oeste','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(26,'1100379','Alto Alegre dos Parecis','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(27,'1100403','Alto Paraíso','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(28,'1100452','Buritis','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(29,'1100502','Novo Horizonte do Oeste','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(30,'1100601','Cacaulândia','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(31,'1100700','Campo Novo de Rondônia','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(32,'1100809','Candeias do Jamari','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(33,'1100908','Castanheiras','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(34,'1100924','Chupinguaia','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(35,'1100940','Cujubim','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(36,'1101005','Governador Jorge Teixeira','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(37,'1101104','Itapuã do Oeste','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(38,'1101203','Ministro Andreazza','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(39,'1101302','Mirante da Serra','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(40,'1101401','Monte Negro','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(41,'1101435','Nova União','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(42,'1101450','Parecis','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(43,'1101468','Pimenteiras do Oeste','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(44,'1101476','Primavera de Rondônia','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(45,'1101484','São Felipe D\'Oeste','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(46,'1101492','São Francisco do Guaporé','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(47,'1101500','Seringueiras','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(48,'1101559','Teixeirópolis','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(49,'1101609','Theobroma','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(50,'1101708','Urupá','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(51,'1101757','Vale do Anari','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(52,'1101807','Vale do Paraíso','RO','2024-09-03 10:31:01','2024-09-03 10:31:01'),(53,'1200013','Acrelândia','AC','2024-09-03 10:31:01','2024-09-03 10:31:01'),(54,'1200054','Assis Brasil','AC','2024-09-03 10:31:01','2024-09-03 10:31:01'),(55,'1200104','Brasiléia','AC','2024-09-03 10:31:01','2024-09-03 10:31:01'),(56,'1200138','Bujari','AC','2024-09-03 10:31:01','2024-09-03 10:31:01'),(57,'1200179','Capixaba','AC','2024-09-03 10:31:01','2024-09-03 10:31:01'),(58,'1200203','Cruzeiro do Sul','AC','2024-09-03 10:31:01','2024-09-03 10:31:01'),(59,'1200252','Epitaciolândia','AC','2024-09-03 10:31:01','2024-09-03 10:31:01'),(60,'1200302','Feijó','AC','2024-09-03 10:31:01','2024-09-03 10:31:01'),(61,'1200328','Jordão','AC','2024-09-03 10:31:01','2024-09-03 10:31:01'),(62,'1200336','Mâncio Lima','AC','2024-09-03 10:31:01','2024-09-03 10:31:01'),(63,'1200344','Manoel Urbano','AC','2024-09-03 10:31:01','2024-09-03 10:31:01'),(64,'1200351','Marechal Thaumaturgo','AC','2024-09-03 10:31:01','2024-09-03 10:31:01'),(65,'1200385','Plácido de Castro','AC','2024-09-03 10:31:01','2024-09-03 10:31:01'),(66,'1200393','Porto Walter','AC','2024-09-03 10:31:01','2024-09-03 10:31:01'),(67,'1200401','Rio Branco','AC','2024-09-03 10:31:01','2024-09-03 10:31:01'),(68,'1200427','Rodrigues Alves','AC','2024-09-03 10:31:01','2024-09-03 10:31:01'),(69,'1200435','Santa Rosa do Purus','AC','2024-09-03 10:31:01','2024-09-03 10:31:01'),(70,'1200450','Senador Guiomard','AC','2024-09-03 10:31:01','2024-09-03 10:31:01'),(71,'1200500','Sena Madureira','AC','2024-09-03 10:31:01','2024-09-03 10:31:01'),(72,'1200609','Tarauacá','AC','2024-09-03 10:31:01','2024-09-03 10:31:01'),(73,'1200708','Xapuri','AC','2024-09-03 10:31:01','2024-09-03 10:31:01'),(74,'1200807','Porto Acre','AC','2024-09-03 10:31:01','2024-09-03 10:31:01'),(75,'1300029','Alvarães','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(76,'1300060','Amaturá','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(77,'1300086','Anamã','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(78,'1300102','Anori','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(79,'1300144','Apuí','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(80,'1300201','Atalaia do Norte','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(81,'1300300','Autazes','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(82,'1300409','Barcelos','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(83,'1300508','Barreirinha','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(84,'1300607','Benjamin Constant','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(85,'1300631','Beruri','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(86,'1300680','Boa Vista do Ramos','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(87,'1300706','Boca do Acre','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(88,'1300805','Borba','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(89,'1300839','Caapiranga','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(90,'1300904','Canutama','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(91,'1301001','Carauari','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(92,'1301100','Careiro','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(93,'1301159','Careiro da Várzea','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(94,'1301209','Coari','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(95,'1301308','Codajás','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(96,'1301407','Eirunepé','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(97,'1301506','Envira','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(98,'1301605','Fonte Boa','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(99,'1301654','Guajará','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(100,'1301704','Humaitá','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(101,'1301803','Ipixuna','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(102,'1301852','Iranduba','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(103,'1301902','Itacoatiara','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(104,'1301951','Itamarati','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(105,'1302009','Itapiranga','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(106,'1302108','Japurá','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(107,'1302207','Juruá','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(108,'1302306','Jutaí','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(109,'1302405','Lábrea','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(110,'1302504','Manacapuru','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(111,'1302553','Manaquiri','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(112,'1302603','Manaus','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(113,'1302702','Manicoré','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(114,'1302801','Maraã','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(115,'1302900','Maués','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(116,'1303007','Nhamundá','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(117,'1303106','Nova Olinda do Norte','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(118,'1303205','Novo Airão','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(119,'1303304','Novo Aripuanã','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(120,'1303403','Parintins','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(121,'1303502','Pauini','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(122,'1303536','Presidente Figueiredo','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(123,'1303569','Rio Preto da Eva','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(124,'1303601','Santa Isabel do Rio Negro','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(125,'1303700','Santo Antônio do Içá','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(126,'1303809','São Gabriel da Cachoeira','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(127,'1303908','São Paulo de Olivença','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(128,'1303957','São Sebastião do Uatumã','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(129,'1304005','Silves','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(130,'1304062','Tabatinga','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(131,'1304104','Tapauá','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(132,'1304203','Tefé','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(133,'1304237','Tonantins','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(134,'1304260','Uarini','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(135,'1304302','Urucará','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(136,'1304401','Urucurituba','AM','2024-09-03 10:31:01','2024-09-03 10:31:01'),(137,'1400027','Amajari','RR','2024-09-03 10:31:01','2024-09-03 10:31:01'),(138,'1400050','Alto Alegre','RR','2024-09-03 10:31:01','2024-09-03 10:31:01'),(139,'1400100','Boa Vista','RR','2024-09-03 10:31:01','2024-09-03 10:31:01'),(140,'1400159','Bonfim','RR','2024-09-03 10:31:01','2024-09-03 10:31:01'),(141,'1400175','Cantá','RR','2024-09-03 10:31:01','2024-09-03 10:31:01'),(142,'1400209','Caracaraí','RR','2024-09-03 10:31:01','2024-09-03 10:31:01'),(143,'1400233','Caroebe','RR','2024-09-03 10:31:01','2024-09-03 10:31:01'),(144,'1400282','Iracema','RR','2024-09-03 10:31:01','2024-09-03 10:31:01'),(145,'1400308','Mucajaí','RR','2024-09-03 10:31:01','2024-09-03 10:31:01'),(146,'1400407','Normandia','RR','2024-09-03 10:31:01','2024-09-03 10:31:01'),(147,'1400456','Pacaraima','RR','2024-09-03 10:31:01','2024-09-03 10:31:01'),(148,'1400472','Rorainópolis','RR','2024-09-03 10:31:01','2024-09-03 10:31:01'),(149,'1400506','São João da Baliza','RR','2024-09-03 10:31:01','2024-09-03 10:31:01'),(150,'1400605','São Luiz','RR','2024-09-03 10:31:01','2024-09-03 10:31:01'),(151,'1400704','Uiramutã','RR','2024-09-03 10:31:01','2024-09-03 10:31:01'),(152,'1500107','Abaetetuba','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(153,'1500131','Abel Figueiredo','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(154,'1500206','Acará','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(155,'1500305','Afuá','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(156,'1500347','Água Azul do Norte','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(157,'1500404','Alenquer','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(158,'1500503','Almeirim','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(159,'1500602','Altamira','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(160,'1500701','Anajás','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(161,'1500800','Ananindeua','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(162,'1500859','Anapu','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(163,'1500909','Augusto Corrêa','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(164,'1500958','Aurora do Pará','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(165,'1501006','Aveiro','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(166,'1501105','Bagre','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(167,'1501204','Baião','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(168,'1501253','Bannach','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(169,'1501303','Barcarena','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(170,'1501402','Belém','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(171,'1501451','Belterra','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(172,'1501501','Benevides','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(173,'1501576','Bom Jesus do Tocantins','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(174,'1501600','Bonito','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(175,'1501709','Bragança','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(176,'1501725','Brasil Novo','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(177,'1501758','Brejo Grande do Araguaia','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(178,'1501782','Breu Branco','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(179,'1501808','Breves','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(180,'1501907','Bujaru','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(181,'1501956','Cachoeira do Piriá','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(182,'1502004','Cachoeira do Arari','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(183,'1502103','Cametá','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(184,'1502152','Canaã dos Carajás','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(185,'1502202','Capanema','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(186,'1502301','Capitão Poço','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(187,'1502400','Castanhal','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(188,'1502509','Chaves','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(189,'1502608','Colares','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(190,'1502707','Conceição do Araguaia','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(191,'1502756','Concórdia do Pará','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(192,'1502764','Cumaru do Norte','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(193,'1502772','Curionópolis','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(194,'1502806','Curralinho','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(195,'1502855','Curuá','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(196,'1502905','Curuçá','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(197,'1502939','Dom Eliseu','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(198,'1502954','Eldorado dos Carajás','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(199,'1503002','Faro','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(200,'1503044','Floresta do Araguaia','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(201,'1503077','Garrafão do Norte','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(202,'1503093','Goianésia do Pará','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(203,'1503101','Gurupá','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(204,'1503200','Igarapé-Açu','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(205,'1503309','Igarapé-Miri','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(206,'1503408','Inhangapi','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(207,'1503457','Ipixuna do Pará','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(208,'1503507','Irituia','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(209,'1503606','Itaituba','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(210,'1503705','Itupiranga','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(211,'1503754','Jacareacanga','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(212,'1503804','Jacundá','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(213,'1503903','Juruti','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(214,'1504000','Limoeiro do Ajuru','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(215,'1504059','Mãe do Rio','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(216,'1504109','Magalhães Barata','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(217,'1504208','Marabá','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(218,'1504307','Maracanã','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(219,'1504406','Marapanim','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(220,'1504422','Marituba','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(221,'1504455','Medicilândia','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(222,'1504505','Melgaço','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(223,'1504604','Mocajuba','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(224,'1504703','Moju','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(225,'1504752','Mojuí dos Campos','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(226,'1504802','Monte Alegre','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(227,'1504901','Muaná','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(228,'1504950','Nova Esperança do Piriá','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(229,'1504976','Nova Ipixuna','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(230,'1505007','Nova Timboteua','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(231,'1505031','Novo Progresso','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(232,'1505064','Novo Repartimento','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(233,'1505106','Óbidos','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(234,'1505205','Oeiras do Pará','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(235,'1505304','Oriximiná','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(236,'1505403','Ourém','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(237,'1505437','Ourilândia do Norte','PA','2024-09-03 10:31:01','2024-09-03 10:31:01'),(238,'1505486','Pacajá','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(239,'1505494','Palestina do Pará','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(240,'1505502','Paragominas','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(241,'1505536','Parauapebas','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(242,'1505551','Pau D\'Arco','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(243,'1505601','Peixe-Boi','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(244,'1505635','Piçarra','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(245,'1505650','Placas','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(246,'1505700','Ponta de Pedras','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(247,'1505809','Portel','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(248,'1505908','Porto de Moz','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(249,'1506005','Prainha','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(250,'1506104','Primavera','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(251,'1506112','Quatipuru','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(252,'1506138','Redenção','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(253,'1506161','Rio Maria','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(254,'1506187','Rondon do Pará','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(255,'1506195','Rurópolis','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(256,'1506203','Salinópolis','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(257,'1506302','Salvaterra','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(258,'1506351','Santa Bárbara do Pará','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(259,'1506401','Santa Cruz do Arari','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(260,'1506500','Santa Isabel do Pará','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(261,'1506559','Santa Luzia do Pará','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(262,'1506583','Santa Maria das Barreiras','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(263,'1506609','Santa Maria do Pará','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(264,'1506708','Santana do Araguaia','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(265,'1506807','Santarém','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(266,'1506906','Santarém Novo','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(267,'1507003','Santo Antônio do Tauá','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(268,'1507102','São Caetano de Odivelas','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(269,'1507151','São Domingos do Araguaia','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(270,'1507201','São Domingos do Capim','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(271,'1507300','São Félix do Xingu','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(272,'1507409','São Francisco do Pará','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(273,'1507458','São Geraldo do Araguaia','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(274,'1507466','São João da Ponta','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(275,'1507474','São João de Pirabas','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(276,'1507508','São João do Araguaia','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(277,'1507607','São Miguel do Guamá','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(278,'1507706','São Sebastião da Boa Vista','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(279,'1507755','Sapucaia','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(280,'1507805','Senador José Porfírio','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(281,'1507904','Soure','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(282,'1507953','Tailândia','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(283,'1507961','Terra Alta','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(284,'1507979','Terra Santa','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(285,'1508001','Tomé-Açu','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(286,'1508035','Tracuateua','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(287,'1508050','Trairão','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(288,'1508084','Tucumã','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(289,'1508100','Tucuruí','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(290,'1508126','Ulianópolis','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(291,'1508159','Uruará','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(292,'1508209','Vigia','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(293,'1508308','Viseu','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(294,'1508357','Vitória do Xingu','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(295,'1508407','Xinguara','PA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(296,'1600055','Serra do Navio','AP','2024-09-03 10:31:02','2024-09-03 10:31:02'),(297,'1600105','Amapá','AP','2024-09-03 10:31:02','2024-09-03 10:31:02'),(298,'1600154','Pedra Branca do Amapari','AP','2024-09-03 10:31:02','2024-09-03 10:31:02'),(299,'1600204','Calçoene','AP','2024-09-03 10:31:02','2024-09-03 10:31:02'),(300,'1600212','Cutias','AP','2024-09-03 10:31:02','2024-09-03 10:31:02'),(301,'1600238','Ferreira Gomes','AP','2024-09-03 10:31:02','2024-09-03 10:31:02'),(302,'1600253','Itaubal','AP','2024-09-03 10:31:02','2024-09-03 10:31:02'),(303,'1600279','Laranjal do Jari','AP','2024-09-03 10:31:02','2024-09-03 10:31:02'),(304,'1600303','Macapá','AP','2024-09-03 10:31:02','2024-09-03 10:31:02'),(305,'1600402','Mazagão','AP','2024-09-03 10:31:02','2024-09-03 10:31:02'),(306,'1600501','Oiapoque','AP','2024-09-03 10:31:02','2024-09-03 10:31:02'),(307,'1600535','Porto Grande','AP','2024-09-03 10:31:02','2024-09-03 10:31:02'),(308,'1600550','Pracuúba','AP','2024-09-03 10:31:02','2024-09-03 10:31:02'),(309,'1600600','Santana','AP','2024-09-03 10:31:02','2024-09-03 10:31:02'),(310,'1600709','Tartarugalzinho','AP','2024-09-03 10:31:02','2024-09-03 10:31:02'),(311,'1600808','Vitória do Jari','AP','2024-09-03 10:31:02','2024-09-03 10:31:02'),(312,'1700251','Abreulândia','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(313,'1700301','Aguiarnópolis','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(314,'1700350','Aliança do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(315,'1700400','Almas','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(316,'1700707','Alvorada','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(317,'1701002','Ananás','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(318,'1701051','Angico','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(319,'1701101','Aparecida do Rio Negro','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(320,'1701309','Aragominas','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(321,'1701903','Araguacema','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(322,'1702000','Araguaçu','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(323,'1702109','Araguaína','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(324,'1702158','Araguanã','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(325,'1702208','Araguatins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(326,'1702307','Arapoema','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(327,'1702406','Arraias','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(328,'1702554','Augustinópolis','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(329,'1702703','Aurora do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(330,'1702901','Axixá do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(331,'1703008','Babaçulândia','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(332,'1703057','Bandeirantes do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(333,'1703073','Barra do Ouro','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(334,'1703107','Barrolândia','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(335,'1703206','Bernardo Sayão','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(336,'1703305','Bom Jesus do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(337,'1703602','Brasilândia do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(338,'1703701','Brejinho de Nazaré','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(339,'1703800','Buriti do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(340,'1703826','Cachoeirinha','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(341,'1703842','Campos Lindos','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(342,'1703867','Cariri do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(343,'1703883','Carmolândia','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(344,'1703891','Carrasco Bonito','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(345,'1703909','Caseara','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(346,'1704105','Centenário','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(347,'1704600','Chapada de Areia','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(348,'1705102','Chapada da Natividade','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(349,'1705508','Colinas do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(350,'1705557','Combinado','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(351,'1705607','Conceição do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(352,'1706001','Couto Magalhães','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(353,'1706100','Cristalândia','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(354,'1706258','Crixás do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(355,'1706506','Darcinópolis','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(356,'1707009','Dianópolis','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(357,'1707108','Divinópolis do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(358,'1707207','Dois Irmãos do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(359,'1707306','Dueré','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(360,'1707405','Esperantina','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(361,'1707553','Fátima','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(362,'1707652','Figueirópolis','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(363,'1707702','Filadélfia','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(364,'1708205','Formoso do Araguaia','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(365,'1708254','Fortaleza do Tabocão','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(366,'1708304','Goianorte','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(367,'1709005','Goiatins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(368,'1709302','Guaraí','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(369,'1709500','Gurupi','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(370,'1709807','Ipueiras','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(371,'1710508','Itacajá','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(372,'1710706','Itaguatins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(373,'1710904','Itapiratins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(374,'1711100','Itaporã do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(375,'1711506','Jaú do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(376,'1711803','Juarina','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(377,'1711902','Lagoa da Confusão','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(378,'1711951','Lagoa do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(379,'1712009','Lajeado','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(380,'1712157','Lavandeira','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(381,'1712405','Lizarda','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(382,'1712454','Luzinópolis','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(383,'1712504','Marianópolis do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(384,'1712702','Mateiros','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(385,'1712801','Maurilândia do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(386,'1713205','Miracema do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(387,'1713304','Miranorte','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(388,'1713601','Monte do Carmo','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(389,'1713700','Monte Santo do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(390,'1713809','Palmeiras do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(391,'1713957','Muricilândia','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(392,'1714203','Natividade','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(393,'1714302','Nazaré','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(394,'1714880','Nova Olinda','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(395,'1715002','Nova Rosalândia','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(396,'1715101','Novo Acordo','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(397,'1715150','Novo Alegre','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(398,'1715259','Novo Jardim','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(399,'1715507','Oliveira de Fátima','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(400,'1715705','Palmeirante','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(401,'1715754','Palmeirópolis','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(402,'1716109','Paraíso do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(403,'1716208','Paranã','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(404,'1716307','Pau D\'Arco','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(405,'1716505','Pedro Afonso','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(406,'1716604','Peixe','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(407,'1716653','Pequizeiro','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(408,'1716703','Colméia','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(409,'1717008','Pindorama do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(410,'1717206','Piraquê','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(411,'1717503','Pium','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(412,'1717800','Ponte Alta do Bom Jesus','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(413,'1717909','Ponte Alta do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(414,'1718006','Porto Alegre do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(415,'1718204','Porto Nacional','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(416,'1718303','Praia Norte','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(417,'1718402','Presidente Kennedy','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(418,'1718451','Pugmil','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(419,'1718501','Recursolândia','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(420,'1718550','Riachinho','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(421,'1718659','Rio da Conceição','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(422,'1718709','Rio dos Bois','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(423,'1718758','Rio Sono','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(424,'1718808','Sampaio','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(425,'1718840','Sandolândia','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(426,'1718865','Santa Fé do Araguaia','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(427,'1718881','Santa Maria do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(428,'1718899','Santa Rita do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(429,'1718907','Santa Rosa do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(430,'1719004','Santa Tereza do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(431,'1720002','Santa Terezinha do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(432,'1720101','São Bento do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(433,'1720150','São Félix do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(434,'1720200','São Miguel do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(435,'1720259','São Salvador do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(436,'1720309','São Sebastião do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(437,'1720499','São Valério','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(438,'1720655','Silvanópolis','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(439,'1720804','Sítio Novo do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(440,'1720853','Sucupira','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(441,'1720903','Taguatinga','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(442,'1720937','Taipas do Tocantins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(443,'1720978','Talismã','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(444,'1721000','Palmas','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(445,'1721109','Tocantínia','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(446,'1721208','Tocantinópolis','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(447,'1721257','Tupirama','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(448,'1721307','Tupiratins','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(449,'1722081','Wanderlândia','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(450,'1722107','Xambioá','TO','2024-09-03 10:31:02','2024-09-03 10:31:02'),(451,'2100055','Açailândia','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(452,'2100105','Afonso Cunha','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(453,'2100154','Água Doce do Maranhão','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(454,'2100204','Alcântara','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(455,'2100303','Aldeias Altas','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(456,'2100402','Altamira do Maranhão','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(457,'2100436','Alto Alegre do Maranhão','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(458,'2100477','Alto Alegre do Pindaré','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(459,'2100501','Alto Parnaíba','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(460,'2100550','Amapá do Maranhão','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(461,'2100600','Amarante do Maranhão','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(462,'2100709','Anajatuba','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(463,'2100808','Anapurus','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(464,'2100832','Apicum-Açu','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(465,'2100873','Araguanã','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(466,'2100907','Araioses','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(467,'2100956','Arame','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(468,'2101004','Arari','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(469,'2101103','Axixá','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(470,'2101202','Bacabal','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(471,'2101251','Bacabeira','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(472,'2101301','Bacuri','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(473,'2101350','Bacurituba','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(474,'2101400','Balsas','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(475,'2101509','Barão de Grajaú','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(476,'2101608','Barra do Corda','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(477,'2101707','Barreirinhas','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(478,'2101731','Belágua','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(479,'2101772','Bela Vista do Maranhão','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(480,'2101806','Benedito Leite','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(481,'2101905','Bequimão','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(482,'2101939','Bernardo do Mearim','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(483,'2101970','Boa Vista do Gurupi','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(484,'2102002','Bom Jardim','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(485,'2102036','Bom Jesus das Selvas','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(486,'2102077','Bom Lugar','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(487,'2102101','Brejo','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(488,'2102150','Brejo de Areia','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(489,'2102200','Buriti','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(490,'2102309','Buriti Bravo','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(491,'2102325','Buriticupu','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(492,'2102358','Buritirana','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(493,'2102374','Cachoeira Grande','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(494,'2102408','Cajapió','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(495,'2102507','Cajari','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(496,'2102556','Campestre do Maranhão','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(497,'2102606','Cândido Mendes','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(498,'2102705','Cantanhede','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(499,'2102754','Capinzal do Norte','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(500,'2102804','Carolina','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(501,'2102903','Carutapera','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(502,'2103000','Caxias','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(503,'2103109','Cedral','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(504,'2103125','Central do Maranhão','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(505,'2103158','Centro do Guilherme','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(506,'2103174','Centro Novo do Maranhão','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(507,'2103208','Chapadinha','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(508,'2103257','Cidelândia','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(509,'2103307','Codó','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(510,'2103406','Coelho Neto','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(511,'2103505','Colinas','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(512,'2103554','Conceição do Lago-Açu','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(513,'2103604','Coroatá','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(514,'2103703','Cururupu','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(515,'2103752','Davinópolis','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(516,'2103802','Dom Pedro','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(517,'2103901','Duque Bacelar','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(518,'2104008','Esperantinópolis','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(519,'2104057','Estreito','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(520,'2104073','Feira Nova do Maranhão','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(521,'2104081','Fernando Falcão','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(522,'2104099','Formosa da Serra Negra','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(523,'2104107','Fortaleza dos Nogueiras','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(524,'2104206','Fortuna','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(525,'2104305','Godofredo Viana','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(526,'2104404','Gonçalves Dias','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(527,'2104503','Governador Archer','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(528,'2104552','Governador Edison Lobão','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(529,'2104602','Governador Eugênio Barros','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(530,'2104628','Governador Luiz Rocha','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(531,'2104651','Governador Newton Bello','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(532,'2104677','Governador Nunes Freire','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(533,'2104701','Graça Aranha','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(534,'2104800','Grajaú','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(535,'2104909','Guimarães','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(536,'2105005','Humberto de Campos','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(537,'2105104','Icatu','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(538,'2105153','Igarapé do Meio','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(539,'2105203','Igarapé Grande','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(540,'2105302','Imperatriz','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(541,'2105351','Itaipava do Grajaú','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(542,'2105401','Itapecuru Mirim','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(543,'2105427','Itinga do Maranhão','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(544,'2105450','Jatobá','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(545,'2105476','Jenipapo dos Vieiras','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(546,'2105500','João Lisboa','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(547,'2105609','Joselândia','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(548,'2105658','Junco do Maranhão','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(549,'2105708','Lago da Pedra','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(550,'2105807','Lago do Junco','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(551,'2105906','Lago Verde','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(552,'2105922','Lagoa do Mato','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(553,'2105948','Lago dos Rodrigues','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(554,'2105963','Lagoa Grande do Maranhão','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(555,'2105989','Lajeado Novo','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(556,'2106003','Lima Campos','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(557,'2106102','Loreto','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(558,'2106201','Luís Domingues','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(559,'2106300','Magalhães de Almeida','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(560,'2106326','Maracaçumé','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(561,'2106359','Marajá do Sena','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(562,'2106375','Maranhãozinho','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(563,'2106409','Mata Roma','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(564,'2106508','Matinha','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(565,'2106607','Matões','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(566,'2106631','Matões do Norte','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(567,'2106672','Milagres do Maranhão','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(568,'2106706','Mirador','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(569,'2106755','Miranda do Norte','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(570,'2106805','Mirinzal','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(571,'2106904','Monção','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(572,'2107001','Montes Altos','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(573,'2107100','Morros','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(574,'2107209','Nina Rodrigues','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(575,'2107258','Nova Colinas','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(576,'2107308','Nova Iorque','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(577,'2107357','Nova Olinda do Maranhão','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(578,'2107407','Olho D\'Água das Cunhãs','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(579,'2107456','Olinda Nova do Maranhão','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(580,'2107506','Paço do Lumiar','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(581,'2107605','Palmeirândia','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(582,'2107704','Paraibano','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(583,'2107803','Parnarama','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(584,'2107902','Passagem Franca','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(585,'2108009','Pastos Bons','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(586,'2108058','Paulino Neves','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(587,'2108108','Paulo Ramos','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(588,'2108207','Pedreiras','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(589,'2108256','Pedro do Rosário','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(590,'2108306','Penalva','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(591,'2108405','Peri Mirim','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(592,'2108454','Peritoró','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(593,'2108504','Pindaré-Mirim','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(594,'2108603','Pinheiro','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(595,'2108702','Pio XII','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(596,'2108801','Pirapemas','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(597,'2108900','Poção de Pedras','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(598,'2109007','Porto Franco','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(599,'2109056','Porto Rico do Maranhão','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(600,'2109106','Presidente Dutra','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(601,'2109205','Presidente Juscelino','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(602,'2109239','Presidente Médici','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(603,'2109270','Presidente Sarney','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(604,'2109304','Presidente Vargas','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(605,'2109403','Primeira Cruz','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(606,'2109452','Raposa','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(607,'2109502','Riachão','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(608,'2109551','Ribamar Fiquene','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(609,'2109601','Rosário','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(610,'2109700','Sambaíba','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(611,'2109759','Santa Filomena do Maranhão','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(612,'2109809','Santa Helena','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(613,'2109908','Santa Inês','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(614,'2110005','Santa Luzia','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(615,'2110039','Santa Luzia do Paruá','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(616,'2110104','Santa Quitéria do Maranhão','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(617,'2110203','Santa Rita','MA','2024-09-03 10:31:02','2024-09-03 10:31:02'),(618,'2110237','Santana do Maranhão','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(619,'2110278','Santo Amaro do Maranhão','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(620,'2110302','Santo Antônio dos Lopes','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(621,'2110401','São Benedito do Rio Preto','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(622,'2110500','São Bento','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(623,'2110609','São Bernardo','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(624,'2110658','São Domingos do Azeitão','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(625,'2110708','São Domingos do Maranhão','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(626,'2110807','São Félix de Balsas','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(627,'2110856','São Francisco do Brejão','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(628,'2110906','São Francisco do Maranhão','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(629,'2111003','São João Batista','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(630,'2111029','São João do Carú','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(631,'2111052','São João do Paraíso','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(632,'2111078','São João do Soter','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(633,'2111102','São João dos Patos','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(634,'2111201','São José de Ribamar','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(635,'2111250','São José dos Basílios','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(636,'2111300','São Luís','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(637,'2111409','São Luís Gonzaga do Maranhão','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(638,'2111508','São Mateus do Maranhão','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(639,'2111532','São Pedro da Água Branca','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(640,'2111573','São Pedro dos Crentes','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(641,'2111607','São Raimundo das Mangabeiras','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(642,'2111631','São Raimundo do Doca Bezerra','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(643,'2111672','São Roberto','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(644,'2111706','São Vicente Ferrer','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(645,'2111722','Satubinha','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(646,'2111748','Senador Alexandre Costa','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(647,'2111763','Senador La Rocque','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(648,'2111789','Serrano do Maranhão','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(649,'2111805','Sítio Novo','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(650,'2111904','Sucupira do Norte','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(651,'2111953','Sucupira do Riachão','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(652,'2112001','Tasso Fragoso','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(653,'2112100','Timbiras','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(654,'2112209','Timon','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(655,'2112233','Trizidela do Vale','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(656,'2112274','Tufilândia','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(657,'2112308','Tuntum','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(658,'2112407','Turiaçu','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(659,'2112456','Turilândia','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(660,'2112506','Tutóia','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(661,'2112605','Urbano Santos','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(662,'2112704','Vargem Grande','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(663,'2112803','Viana','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(664,'2112852','Vila Nova dos Martírios','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(665,'2112902','Vitória do Mearim','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(666,'2113009','Vitorino Freire','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(667,'2114007','Zé Doca','MA','2024-09-03 10:31:03','2024-09-03 10:31:03'),(668,'2200053','Acauã','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(669,'2200103','Agricolândia','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(670,'2200202','Água Branca','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(671,'2200251','Alagoinha do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(672,'2200277','Alegrete do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(673,'2200301','Alto Longá','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(674,'2200400','Altos','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(675,'2200459','Alvorada do Gurguéia','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(676,'2200509','Amarante','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(677,'2200608','Angical do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(678,'2200707','Anísio de Abreu','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(679,'2200806','Antônio Almeida','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(680,'2200905','Aroazes','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(681,'2200954','Aroeiras do Itaim','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(682,'2201002','Arraial','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(683,'2201051','Assunção do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(684,'2201101','Avelino Lopes','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(685,'2201150','Baixa Grande do Ribeiro','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(686,'2201176','Barra D\'Alcântara','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(687,'2201200','Barras','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(688,'2201309','Barreiras do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(689,'2201408','Barro Duro','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(690,'2201507','Batalha','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(691,'2201556','Bela Vista do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(692,'2201572','Belém do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(693,'2201606','Beneditinos','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(694,'2201705','Bertolínia','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(695,'2201739','Betânia do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(696,'2201770','Boa Hora','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(697,'2201804','Bocaina','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(698,'2201903','Bom Jesus','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(699,'2201919','Bom Princípio do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(700,'2201929','Bonfim do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(701,'2201945','Boqueirão do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(702,'2201960','Brasileira','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(703,'2201988','Brejo do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(704,'2202000','Buriti dos Lopes','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(705,'2202026','Buriti dos Montes','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(706,'2202059','Cabeceiras do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(707,'2202075','Cajazeiras do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(708,'2202083','Cajueiro da Praia','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(709,'2202091','Caldeirão Grande do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(710,'2202109','Campinas do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(711,'2202117','Campo Alegre do Fidalgo','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(712,'2202133','Campo Grande do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(713,'2202174','Campo Largo do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(714,'2202208','Campo Maior','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(715,'2202251','Canavieira','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(716,'2202307','Canto do Buriti','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(717,'2202406','Capitão de Campos','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(718,'2202455','Capitão Gervásio Oliveira','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(719,'2202505','Caracol','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(720,'2202539','Caraúbas do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(721,'2202554','Caridade do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(722,'2202604','Castelo do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(723,'2202653','Caxingó','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(724,'2202703','Cocal','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(725,'2202711','Cocal de Telha','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(726,'2202729','Cocal dos Alves','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(727,'2202737','Coivaras','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(728,'2202752','Colônia do Gurguéia','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(729,'2202778','Colônia do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(730,'2202802','Conceição do Canindé','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(731,'2202851','Coronel José Dias','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(732,'2202901','Corrente','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(733,'2203008','Cristalândia do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(734,'2203107','Cristino Castro','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(735,'2203206','Curimatá','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(736,'2203230','Currais','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(737,'2203255','Curralinhos','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(738,'2203271','Curral Novo do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(739,'2203305','Demerval Lobão','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(740,'2203354','Dirceu Arcoverde','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(741,'2203404','Dom Expedito Lopes','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(742,'2203420','Domingos Mourão','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(743,'2203453','Dom Inocêncio','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(744,'2203503','Elesbão Veloso','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(745,'2203602','Eliseu Martins','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(746,'2203701','Esperantina','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(747,'2203750','Fartura do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(748,'2203800','Flores do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(749,'2203859','Floresta do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(750,'2203909','Floriano','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(751,'2204006','Francinópolis','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(752,'2204105','Francisco Ayres','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(753,'2204154','Francisco Macedo','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(754,'2204204','Francisco Santos','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(755,'2204303','Fronteiras','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(756,'2204352','Geminiano','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(757,'2204402','Gilbués','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(758,'2204501','Guadalupe','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(759,'2204550','Guaribas','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(760,'2204600','Hugo Napoleão','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(761,'2204659','Ilha Grande','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(762,'2204709','Inhuma','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(763,'2204808','Ipiranga do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(764,'2204907','Isaías Coelho','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(765,'2205003','Itainópolis','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(766,'2205102','Itaueira','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(767,'2205151','Jacobina do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(768,'2205201','Jaicós','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(769,'2205250','Jardim do Mulato','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(770,'2205276','Jatobá do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(771,'2205300','Jerumenha','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(772,'2205359','João Costa','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(773,'2205409','Joaquim Pires','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(774,'2205458','Joca Marques','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(775,'2205508','José de Freitas','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(776,'2205516','Juazeiro do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(777,'2205524','Júlio Borges','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(778,'2205532','Jurema','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(779,'2205540','Lagoinha do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(780,'2205557','Lagoa Alegre','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(781,'2205565','Lagoa do Barro do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(782,'2205573','Lagoa de São Francisco','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(783,'2205581','Lagoa do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(784,'2205599','Lagoa do Sítio','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(785,'2205607','Landri Sales','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(786,'2205706','Luís Correia','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(787,'2205805','Luzilândia','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(788,'2205854','Madeiro','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(789,'2205904','Manoel Emídio','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(790,'2205953','Marcolândia','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(791,'2206001','Marcos Parente','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(792,'2206050','Massapê do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(793,'2206100','Matias Olímpio','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(794,'2206209','Miguel Alves','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(795,'2206308','Miguel Leão','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(796,'2206357','Milton Brandão','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(797,'2206407','Monsenhor Gil','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(798,'2206506','Monsenhor Hipólito','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(799,'2206605','Monte Alegre do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(800,'2206654','Morro Cabeça no Tempo','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(801,'2206670','Morro do Chapéu do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(802,'2206696','Murici dos Portelas','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(803,'2206704','Nazaré do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(804,'2206720','Nazária','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(805,'2206753','Nossa Senhora de Nazaré','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(806,'2206803','Nossa Senhora dos Remédios','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(807,'2206902','Novo Oriente do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(808,'2206951','Novo Santo Antônio','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(809,'2207009','Oeiras','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(810,'2207108','Olho D\'Água do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(811,'2207207','Padre Marcos','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(812,'2207306','Paes Landim','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(813,'2207355','Pajeú do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(814,'2207405','Palmeira do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(815,'2207504','Palmeirais','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(816,'2207553','Paquetá','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(817,'2207603','Parnaguá','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(818,'2207702','Parnaíba','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(819,'2207751','Passagem Franca do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(820,'2207777','Patos do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(821,'2207793','Pau D\'Arco do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(822,'2207801','Paulistana','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(823,'2207850','Pavussu','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(824,'2207900','Pedro II','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(825,'2207934','Pedro Laurentino','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(826,'2207959','Nova Santa Rita','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(827,'2208007','Picos','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(828,'2208106','Pimenteiras','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(829,'2208205','Pio IX','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(830,'2208304','Piracuruca','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(831,'2208403','Piripiri','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(832,'2208502','Porto','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(833,'2208551','Porto Alegre do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(834,'2208601','Prata do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(835,'2208650','Queimada Nova','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(836,'2208700','Redenção do Gurguéia','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(837,'2208809','Regeneração','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(838,'2208858','Riacho Frio','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(839,'2208874','Ribeira do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(840,'2208908','Ribeiro Gonçalves','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(841,'2209005','Rio Grande do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(842,'2209104','Santa Cruz do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(843,'2209153','Santa Cruz dos Milagres','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(844,'2209203','Santa Filomena','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(845,'2209302','Santa Luz','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(846,'2209351','Santana do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(847,'2209377','Santa Rosa do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(848,'2209401','Santo Antônio de Lisboa','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(849,'2209450','Santo Antônio dos Milagres','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(850,'2209500','Santo Inácio do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(851,'2209559','São Braz do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(852,'2209609','São Félix do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(853,'2209658','São Francisco de Assis do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(854,'2209708','São Francisco do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(855,'2209757','São Gonçalo do Gurguéia','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(856,'2209807','São Gonçalo do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(857,'2209856','São João da Canabrava','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(858,'2209872','São João da Fronteira','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(859,'2209906','São João da Serra','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(860,'2209955','São João da Varjota','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(861,'2209971','São João do Arraial','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(862,'2210003','São João do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(863,'2210052','São José do Divino','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(864,'2210102','São José do Peixe','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(865,'2210201','São José do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(866,'2210300','São Julião','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(867,'2210359','São Lourenço do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(868,'2210375','São Luis do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(869,'2210383','São Miguel da Baixa Grande','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(870,'2210391','São Miguel do Fidalgo','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(871,'2210409','São Miguel do Tapuio','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(872,'2210508','São Pedro do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(873,'2210607','São Raimundo Nonato','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(874,'2210623','Sebastião Barros','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(875,'2210631','Sebastião Leal','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(876,'2210656','Sigefredo Pacheco','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(877,'2210706','Simões','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(878,'2210805','Simplício Mendes','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(879,'2210904','Socorro do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(880,'2210938','Sussuapara','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(881,'2210953','Tamboril do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(882,'2210979','Tanque do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(883,'2211001','Teresina','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(884,'2211100','União','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(885,'2211209','Uruçuí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(886,'2211308','Valença do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(887,'2211357','Várzea Branca','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(888,'2211407','Várzea Grande','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(889,'2211506','Vera Mendes','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(890,'2211605','Vila Nova do Piauí','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(891,'2211704','Wall Ferraz','PI','2024-09-03 10:31:03','2024-09-03 10:31:03'),(892,'2300101','Abaiara','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(893,'2300150','Acarape','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(894,'2300200','Acaraú','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(895,'2300309','Acopiara','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(896,'2300408','Aiuaba','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(897,'2300507','Alcântaras','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(898,'2300606','Altaneira','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(899,'2300705','Alto Santo','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(900,'2300754','Amontada','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(901,'2300804','Antonina do Norte','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(902,'2300903','Apuiarés','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(903,'2301000','Aquiraz','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(904,'2301109','Aracati','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(905,'2301208','Aracoiaba','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(906,'2301257','Ararendá','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(907,'2301307','Araripe','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(908,'2301406','Aratuba','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(909,'2301505','Arneiroz','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(910,'2301604','Assaré','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(911,'2301703','Aurora','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(912,'2301802','Baixio','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(913,'2301851','Banabuiú','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(914,'2301901','Barbalha','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(915,'2301950','Barreira','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(916,'2302008','Barro','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(917,'2302057','Barroquinha','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(918,'2302107','Baturité','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(919,'2302206','Beberibe','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(920,'2302305','Bela Cruz','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(921,'2302404','Boa Viagem','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(922,'2302503','Brejo Santo','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(923,'2302602','Camocim','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(924,'2302701','Campos Sales','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(925,'2302800','Canindé','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(926,'2302909','Capistrano','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(927,'2303006','Caridade','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(928,'2303105','Cariré','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(929,'2303204','Caririaçu','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(930,'2303303','Cariús','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(931,'2303402','Carnaubal','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(932,'2303501','Cascavel','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(933,'2303600','Catarina','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(934,'2303659','Catunda','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(935,'2303709','Caucaia','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(936,'2303808','Cedro','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(937,'2303907','Chaval','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(938,'2303931','Choró','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(939,'2303956','Chorozinho','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(940,'2304004','Coreaú','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(941,'2304103','Crateús','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(942,'2304202','Crato','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(943,'2304236','Croatá','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(944,'2304251','Cruz','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(945,'2304269','Deputado Irapuan Pinheiro','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(946,'2304277','Ererê','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(947,'2304285','Eusébio','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(948,'2304301','Farias Brito','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(949,'2304350','Forquilha','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(950,'2304400','Fortaleza','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(951,'2304459','Fortim','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(952,'2304509','Frecheirinha','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(953,'2304608','General Sampaio','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(954,'2304657','Graça','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(955,'2304707','Granja','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(956,'2304806','Granjeiro','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(957,'2304905','Groaíras','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(958,'2304954','Guaiúba','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(959,'2305001','Guaraciaba do Norte','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(960,'2305100','Guaramiranga','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(961,'2305209','Hidrolândia','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(962,'2305233','Horizonte','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(963,'2305266','Ibaretama','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(964,'2305308','Ibiapina','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(965,'2305332','Ibicuitinga','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(966,'2305357','Icapuí','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(967,'2305407','Icó','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(968,'2305506','Iguatu','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(969,'2305605','Independência','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(970,'2305654','Ipaporanga','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(971,'2305704','Ipaumirim','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(972,'2305803','Ipu','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(973,'2305902','Ipueiras','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(974,'2306009','Iracema','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(975,'2306108','Irauçuba','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(976,'2306207','Itaiçaba','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(977,'2306256','Itaitinga','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(978,'2306306','Itapagé','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(979,'2306405','Itapipoca','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(980,'2306504','Itapiúna','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(981,'2306553','Itarema','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(982,'2306603','Itatira','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(983,'2306702','Jaguaretama','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(984,'2306801','Jaguaribara','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(985,'2306900','Jaguaribe','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(986,'2307007','Jaguaruana','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(987,'2307106','Jardim','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(988,'2307205','Jati','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(989,'2307254','Jijoca de Jericoacoara','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(990,'2307304','Juazeiro do Norte','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(991,'2307403','Jucás','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(992,'2307502','Lavras da Mangabeira','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(993,'2307601','Limoeiro do Norte','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(994,'2307635','Madalena','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(995,'2307650','Maracanaú','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(996,'2307700','Maranguape','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(997,'2307809','Marco','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(998,'2307908','Martinópole','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(999,'2308005','Massapê','CE','2024-09-03 10:31:03','2024-09-03 10:31:03'),(1000,'2308104','Mauriti','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1001,'2308203','Meruoca','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1002,'2308302','Milagres','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1003,'2308351','Milhã','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1004,'2308377','Miraíma','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1005,'2308401','Missão Velha','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1006,'2308500','Mombaça','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1007,'2308609','Monsenhor Tabosa','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1008,'2308708','Morada Nova','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1009,'2308807','Moraújo','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1010,'2308906','Morrinhos','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1011,'2309003','Mucambo','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1012,'2309102','Mulungu','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1013,'2309201','Nova Olinda','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1014,'2309300','Nova Russas','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1015,'2309409','Novo Oriente','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1016,'2309458','Ocara','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1017,'2309508','Orós','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1018,'2309607','Pacajus','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1019,'2309706','Pacatuba','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1020,'2309805','Pacoti','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1021,'2309904','Pacujá','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1022,'2310001','Palhano','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1023,'2310100','Palmácia','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1024,'2310209','Paracuru','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1025,'2310258','Paraipaba','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1026,'2310308','Parambu','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1027,'2310407','Paramoti','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1028,'2310506','Pedra Branca','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1029,'2310605','Penaforte','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1030,'2310704','Pentecoste','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1031,'2310803','Pereiro','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1032,'2310852','Pindoretama','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1033,'2310902','Piquet Carneiro','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1034,'2310951','Pires Ferreira','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1035,'2311009','Poranga','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1036,'2311108','Porteiras','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1037,'2311207','Potengi','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1038,'2311231','Potiretama','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1039,'2311264','Quiterianópolis','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1040,'2311306','Quixadá','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1041,'2311355','Quixelô','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1042,'2311405','Quixeramobim','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1043,'2311504','Quixeré','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1044,'2311603','Redenção','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1045,'2311702','Reriutaba','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1046,'2311801','Russas','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1047,'2311900','Saboeiro','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1048,'2311959','Salitre','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1049,'2312007','Santana do Acaraú','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1050,'2312106','Santana do Cariri','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1051,'2312205','Santa Quitéria','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1052,'2312304','São Benedito','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1053,'2312403','São Gonçalo do Amarante','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1054,'2312502','São João do Jaguaribe','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1055,'2312601','São Luís do Curu','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1056,'2312700','Senador Pompeu','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1057,'2312809','Senador Sá','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1058,'2312908','Sobral','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1059,'2313005','Solonópole','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1060,'2313104','Tabuleiro do Norte','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1061,'2313203','Tamboril','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1062,'2313252','Tarrafas','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1063,'2313302','Tauá','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1064,'2313351','Tejuçuoca','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1065,'2313401','Tianguá','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1066,'2313500','Trairi','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1067,'2313559','Tururu','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1068,'2313609','Ubajara','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1069,'2313708','Umari','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1070,'2313757','Umirim','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1071,'2313807','Uruburetama','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1072,'2313906','Uruoca','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1073,'2313955','Varjota','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1074,'2314003','Várzea Alegre','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1075,'2314102','Viçosa do Ceará','CE','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1076,'2400109','Acari','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1077,'2400208','Açu','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1078,'2400307','Afonso Bezerra','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1079,'2400406','Água Nova','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1080,'2400505','Alexandria','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1081,'2400604','Almino Afonso','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1082,'2400703','Alto do Rodrigues','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1083,'2400802','Angicos','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1084,'2400901','Antônio Martins','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1085,'2401008','Apodi','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1086,'2401107','Areia Branca','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1087,'2401206','Arês','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1088,'2401305','Augusto Severo','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1089,'2401404','Baía Formosa','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1090,'2401453','Baraúna','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1091,'2401503','Barcelona','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1092,'2401602','Bento Fernandes','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1093,'2401651','Bodó','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1094,'2401701','Bom Jesus','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1095,'2401800','Brejinho','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1096,'2401859','Caiçara do Norte','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1097,'2401909','Caiçara do Rio do Vento','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1098,'2402006','Caicó','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1099,'2402105','Campo Redondo','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1100,'2402204','Canguaretama','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1101,'2402303','Caraúbas','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1102,'2402402','Carnaúba dos Dantas','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1103,'2402501','Carnaubais','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1104,'2402600','Ceará-Mirim','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1105,'2402709','Cerro Corá','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1106,'2402808','Coronel Ezequiel','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1107,'2402907','Coronel João Pessoa','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1108,'2403004','Cruzeta','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1109,'2403103','Currais Novos','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1110,'2403202','Doutor Severiano','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1111,'2403251','Parnamirim','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1112,'2403301','Encanto','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1113,'2403400','Equador','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1114,'2403509','Espírito Santo','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1115,'2403608','Extremoz','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1116,'2403707','Felipe Guerra','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1117,'2403756','Fernando Pedroza','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1118,'2403806','Florânia','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1119,'2403905','Francisco Dantas','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1120,'2404002','Frutuoso Gomes','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1121,'2404101','Galinhos','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1122,'2404200','Goianinha','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1123,'2404309','Governador Dix-Sept Rosado','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1124,'2404408','Grossos','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1125,'2404507','Guamaré','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1126,'2404606','Ielmo Marinho','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1127,'2404705','Ipanguaçu','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1128,'2404804','Ipueira','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1129,'2404853','Itajá','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1130,'2404903','Itaú','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1131,'2405009','Jaçanã','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1132,'2405108','Jandaíra','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1133,'2405207','Janduís','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1134,'2405306','Januário Cicco','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1135,'2405405','Japi','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1136,'2405504','Jardim de Angicos','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1137,'2405603','Jardim de Piranhas','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1138,'2405702','Jardim do Seridó','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1139,'2405801','João Câmara','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1140,'2405900','João Dias','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1141,'2406007','José da Penha','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1142,'2406106','Jucurutu','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1143,'2406155','Jundiá','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1144,'2406205','Lagoa D\'Anta','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1145,'2406304','Lagoa de Pedras','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1146,'2406403','Lagoa de Velhos','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1147,'2406502','Lagoa Nova','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1148,'2406601','Lagoa Salgada','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1149,'2406700','Lajes','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1150,'2406809','Lajes Pintadas','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1151,'2406908','Lucrécia','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1152,'2407005','Luís Gomes','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1153,'2407104','Macaíba','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1154,'2407203','Macau','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1155,'2407252','Major Sales','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1156,'2407302','Marcelino Vieira','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1157,'2407401','Martins','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1158,'2407500','Maxaranguape','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1159,'2407609','Messias Targino','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1160,'2407708','Montanhas','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1161,'2407807','Monte Alegre','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1162,'2407906','Monte das Gameleiras','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1163,'2408003','Mossoró','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1164,'2408102','Natal','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1165,'2408201','Nísia Floresta','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1166,'2408300','Nova Cruz','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1167,'2408409','Olho-D\'Água do Borges','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1168,'2408508','Ouro Branco','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1169,'2408607','Paraná','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1170,'2408706','Paraú','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1171,'2408805','Parazinho','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1172,'2408904','Parelhas','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1173,'2408953','Rio do Fogo','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1174,'2409100','Passa e Fica','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1175,'2409209','Passagem','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1176,'2409308','Patu','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1177,'2409332','Santa Maria','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1178,'2409407','Pau dos Ferros','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1179,'2409506','Pedra Grande','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1180,'2409605','Pedra Preta','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1181,'2409704','Pedro Avelino','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1182,'2409803','Pedro Velho','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1183,'2409902','Pendências','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1184,'2410009','Pilões','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1185,'2410108','Poço Branco','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1186,'2410207','Portalegre','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1187,'2410256','Porto do Mangue','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1188,'2410306','Presidente Juscelino','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1189,'2410405','Pureza','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1190,'2410504','Rafael Fernandes','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1191,'2410603','Rafael Godeiro','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1192,'2410702','Riacho da Cruz','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1193,'2410801','Riacho de Santana','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1194,'2410900','Riachuelo','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1195,'2411007','Rodolfo Fernandes','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1196,'2411056','Tibau','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1197,'2411106','Ruy Barbosa','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1198,'2411205','Santa Cruz','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1199,'2411403','Santana do Matos','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1200,'2411429','Santana do Seridó','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1201,'2411502','Santo Antônio','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1202,'2411601','São Bento do Norte','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1203,'2411700','São Bento do Trairí','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1204,'2411809','São Fernando','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1205,'2411908','São Francisco do Oeste','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1206,'2412005','São Gonçalo do Amarante','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1207,'2412104','São João do Sabugi','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1208,'2412203','São José de Mipibu','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1209,'2412302','São José do Campestre','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1210,'2412401','São José do Seridó','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1211,'2412500','São Miguel','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1212,'2412559','São Miguel do Gostoso','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1213,'2412609','São Paulo do Potengi','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1214,'2412708','São Pedro','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1215,'2412807','São Rafael','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1216,'2412906','São Tomé','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1217,'2413003','São Vicente','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1218,'2413102','Senador Elói de Souza','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1219,'2413201','Senador Georgino Avelino','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1220,'2413300','Serra de São Bento','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1221,'2413359','Serra do Mel','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1222,'2413409','Serra Negra do Norte','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1223,'2413508','Serrinha','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1224,'2413557','Serrinha dos Pintos','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1225,'2413607','Severiano Melo','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1226,'2413706','Sítio Novo','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1227,'2413805','Taboleiro Grande','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1228,'2413904','Taipu','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1229,'2414001','Tangará','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1230,'2414100','Tenente Ananias','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1231,'2414159','Tenente Laurentino Cruz','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1232,'2414209','Tibau do Sul','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1233,'2414308','Timbaúba dos Batistas','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1234,'2414407','Touros','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1235,'2414456','Triunfo Potiguar','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1236,'2414506','Umarizal','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1237,'2414605','Upanema','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1238,'2414704','Várzea','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1239,'2414753','Venha-Ver','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1240,'2414803','Vera Cruz','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1241,'2414902','Viçosa','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1242,'2415008','Vila Flor','RN','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1243,'2500106','Água Branca','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1244,'2500205','Aguiar','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1245,'2500304','Alagoa Grande','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1246,'2500403','Alagoa Nova','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1247,'2500502','Alagoinha','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1248,'2500536','Alcantil','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1249,'2500577','Algodão de Jandaíra','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1250,'2500601','Alhandra','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1251,'2500700','São João do Rio do Peixe','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1252,'2500734','Amparo','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1253,'2500775','Aparecida','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1254,'2500809','Araçagi','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1255,'2500908','Arara','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1256,'2501005','Araruna','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1257,'2501104','Areia','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1258,'2501153','Areia de Baraúnas','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1259,'2501203','Areial','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1260,'2501302','Aroeiras','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1261,'2501351','Assunção','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1262,'2501401','Baía da Traição','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1263,'2501500','Bananeiras','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1264,'2501534','Baraúna','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1265,'2501575','Barra de Santana','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1266,'2501609','Barra de Santa Rosa','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1267,'2501708','Barra de São Miguel','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1268,'2501807','Bayeux','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1269,'2501906','Belém','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1270,'2502003','Belém do Brejo do Cruz','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1271,'2502052','Bernardino Batista','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1272,'2502102','Boa Ventura','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1273,'2502151','Boa Vista','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1274,'2502201','Bom Jesus','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1275,'2502300','Bom Sucesso','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1276,'2502409','Bonito de Santa Fé','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1277,'2502508','Boqueirão','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1278,'2502607','Igaracy','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1279,'2502706','Borborema','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1280,'2502805','Brejo do Cruz','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1281,'2502904','Brejo dos Santos','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1282,'2503001','Caaporã','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1283,'2503100','Cabaceiras','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1284,'2503209','Cabedelo','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1285,'2503308','Cachoeira dos Índios','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1286,'2503407','Cacimba de Areia','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1287,'2503506','Cacimba de Dentro','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1288,'2503555','Cacimbas','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1289,'2503605','Caiçara','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1290,'2503704','Cajazeiras','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1291,'2503753','Cajazeirinhas','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1292,'2503803','Caldas Brandão','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1293,'2503902','Camalaú','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1294,'2504009','Campina Grande','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1295,'2504033','Capim','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1296,'2504074','Caraúbas','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1297,'2504108','Carrapateira','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1298,'2504157','Casserengue','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1299,'2504207','Catingueira','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1300,'2504306','Catolé do Rocha','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1301,'2504355','Caturité','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1302,'2504405','Conceição','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1303,'2504504','Condado','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1304,'2504603','Conde','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1305,'2504702','Congo','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1306,'2504801','Coremas','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1307,'2504850','Coxixola','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1308,'2504900','Cruz do Espírito Santo','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1309,'2505006','Cubati','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1310,'2505105','Cuité','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1311,'2505204','Cuitegi','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1312,'2505238','Cuité de Mamanguape','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1313,'2505279','Curral de Cima','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1314,'2505303','Curral Velho','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1315,'2505352','Damião','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1316,'2505402','Desterro','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1317,'2505501','Vista Serrana','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1318,'2505600','Diamante','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1319,'2505709','Dona Inês','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1320,'2505808','Duas Estradas','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1321,'2505907','Emas','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1322,'2506004','Esperança','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1323,'2506103','Fagundes','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1324,'2506202','Frei Martinho','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1325,'2506251','Gado Bravo','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1326,'2506301','Guarabira','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1327,'2506400','Gurinhém','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1328,'2506509','Gurjão','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1329,'2506608','Ibiara','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1330,'2506707','Imaculada','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1331,'2506806','Ingá','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1332,'2506905','Itabaiana','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1333,'2507002','Itaporanga','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1334,'2507101','Itapororoca','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1335,'2507200','Itatuba','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1336,'2507309','Jacaraú','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1337,'2507408','Jericó','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1338,'2507507','João Pessoa','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1339,'2507606','Juarez Távora','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1340,'2507705','Juazeirinho','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1341,'2507804','Junco do Seridó','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1342,'2507903','Juripiranga','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1343,'2508000','Juru','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1344,'2508109','Lagoa','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1345,'2508208','Lagoa de Dentro','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1346,'2508307','Lagoa Seca','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1347,'2508406','Lastro','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1348,'2508505','Livramento','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1349,'2508554','Logradouro','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1350,'2508604','Lucena','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1351,'2508703','Mãe D\'Água','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1352,'2508802','Malta','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1353,'2508901','Mamanguape','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1354,'2509008','Manaíra','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1355,'2509057','Marcação','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1356,'2509107','Mari','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1357,'2509156','Marizópolis','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1358,'2509206','Massaranduba','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1359,'2509305','Mataraca','PB','2024-09-03 10:31:04','2024-09-03 10:31:04'),(1360,'2509339','Matinhas','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1361,'2509370','Mato Grosso','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1362,'2509396','Maturéia','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1363,'2509404','Mogeiro','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1364,'2509503','Montadas','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1365,'2509602','Monte Horebe','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1366,'2509701','Monteiro','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1367,'2509800','Mulungu','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1368,'2509909','Natuba','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1369,'2510006','Nazarezinho','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1370,'2510105','Nova Floresta','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1371,'2510204','Nova Olinda','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1372,'2510303','Nova Palmeira','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1373,'2510402','Olho D\'Água','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1374,'2510501','Olivedos','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1375,'2510600','Ouro Velho','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1376,'2510659','Parari','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1377,'2510709','Passagem','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1378,'2510808','Patos','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1379,'2510907','Paulista','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1380,'2511004','Pedra Branca','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1381,'2511103','Pedra Lavrada','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1382,'2511202','Pedras de Fogo','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1383,'2511301','Piancó','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1384,'2511400','Picuí','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1385,'2511509','Pilar','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1386,'2511608','Pilões','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1387,'2511707','Pilõezinhos','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1388,'2511806','Pirpirituba','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1389,'2511905','Pitimbu','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1390,'2512002','Pocinhos','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1391,'2512036','Poço Dantas','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1392,'2512077','Poço de José de Moura','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1393,'2512101','Pombal','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1394,'2512200','Prata','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1395,'2512309','Princesa Isabel','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1396,'2512408','Puxinanã','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1397,'2512507','Queimadas','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1398,'2512606','Quixabá','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1399,'2512705','Remígio','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1400,'2512721','Pedro Régis','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1401,'2512747','Riachão','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1402,'2512754','Riachão do Bacamarte','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1403,'2512762','Riachão do Poço','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1404,'2512788','Riacho de Santo Antônio','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1405,'2512804','Riacho dos Cavalos','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1406,'2512903','Rio Tinto','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1407,'2513000','Salgadinho','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1408,'2513109','Salgado de São Félix','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1409,'2513158','Santa Cecília','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1410,'2513208','Santa Cruz','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1411,'2513307','Santa Helena','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1412,'2513356','Santa Inês','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1413,'2513406','Santa Luzia','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1414,'2513505','Santana de Mangueira','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1415,'2513604','Santana dos Garrotes','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1416,'2513653','Joca Claudino','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1417,'2513703','Santa Rita','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1418,'2513802','Santa Teresinha','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1419,'2513851','Santo André','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1420,'2513901','São Bento','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1421,'2513927','São Bentinho','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1422,'2513943','São Domingos do Cariri','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1423,'2513968','São Domingos','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1424,'2513984','São Francisco','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1425,'2514008','São João do Cariri','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1426,'2514107','São João do Tigre','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1427,'2514206','São José da Lagoa Tapada','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1428,'2514305','São José de Caiana','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1429,'2514404','São José de Espinharas','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1430,'2514453','São José dos Ramos','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1431,'2514503','São José de Piranhas','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1432,'2514552','São José de Princesa','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1433,'2514602','São José do Bonfim','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1434,'2514651','São José do Brejo do Cruz','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1435,'2514701','São José do Sabugi','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1436,'2514800','São José dos Cordeiros','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1437,'2514909','São Mamede','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1438,'2515005','São Miguel de Taipu','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1439,'2515104','São Sebastião de Lagoa de Roça','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1440,'2515203','São Sebastião do Umbuzeiro','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1441,'2515302','Sapé','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1442,'2515401','São Vicente do Seridó','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1443,'2515500','Serra Branca','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1444,'2515609','Serra da Raiz','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1445,'2515708','Serra Grande','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1446,'2515807','Serra Redonda','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1447,'2515906','Serraria','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1448,'2515930','Sertãozinho','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1449,'2515971','Sobrado','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1450,'2516003','Solânea','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1451,'2516102','Soledade','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1452,'2516151','Sossêgo','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1453,'2516201','Sousa','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1454,'2516300','Sumé','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1455,'2516409','Tacima','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1456,'2516508','Taperoá','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1457,'2516607','Tavares','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1458,'2516706','Teixeira','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1459,'2516755','Tenório','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1460,'2516805','Triunfo','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1461,'2516904','Uiraúna','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1462,'2517001','Umbuzeiro','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1463,'2517100','Várzea','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1464,'2517209','Vieirópolis','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1465,'2517407','Zabelê','PB','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1466,'2600054','Abreu e Lima','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1467,'2600104','Afogados da Ingazeira','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1468,'2600203','Afrânio','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1469,'2600302','Agrestina','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1470,'2600401','Água Preta','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1471,'2600500','Águas Belas','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1472,'2600609','Alagoinha','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1473,'2600708','Aliança','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1474,'2600807','Altinho','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1475,'2600906','Amaraji','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1476,'2601003','Angelim','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1477,'2601052','Araçoiaba','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1478,'2601102','Araripina','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1479,'2601201','Arcoverde','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1480,'2601300','Barra de Guabiraba','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1481,'2601409','Barreiros','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1482,'2601508','Belém de Maria','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1483,'2601607','Belém do São Francisco','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1484,'2601706','Belo Jardim','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1485,'2601805','Betânia','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1486,'2601904','Bezerros','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1487,'2602001','Bodocó','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1488,'2602100','Bom Conselho','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1489,'2602209','Bom Jardim','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1490,'2602308','Bonito','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1491,'2602407','Brejão','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1492,'2602506','Brejinho','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1493,'2602605','Brejo da Madre de Deus','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1494,'2602704','Buenos Aires','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1495,'2602803','Buíque','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1496,'2602902','Cabo de Santo Agostinho','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1497,'2603009','Cabrobó','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1498,'2603108','Cachoeirinha','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1499,'2603207','Caetés','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1500,'2603306','Calçado','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1501,'2603405','Calumbi','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1502,'2603454','Camaragibe','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1503,'2603504','Camocim de São Félix','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1504,'2603603','Camutanga','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1505,'2603702','Canhotinho','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1506,'2603801','Capoeiras','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1507,'2603900','Carnaíba','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1508,'2603926','Carnaubeira da Penha','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1509,'2604007','Carpina','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1510,'2604106','Caruaru','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1511,'2604155','Casinhas','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1512,'2604205','Catende','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1513,'2604304','Cedro','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1514,'2604403','Chã de Alegria','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1515,'2604502','Chã Grande','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1516,'2604601','Condado','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1517,'2604700','Correntes','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1518,'2604809','Cortês','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1519,'2604908','Cumaru','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1520,'2605004','Cupira','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1521,'2605103','Custódia','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1522,'2605152','Dormentes','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1523,'2605202','Escada','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1524,'2605301','Exu','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1525,'2605400','Feira Nova','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1526,'2605459','Fernando de Noronha','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1527,'2605509','Ferreiros','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1528,'2605608','Flores','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1529,'2605707','Floresta','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1530,'2605806','Frei Miguelinho','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1531,'2605905','Gameleira','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1532,'2606002','Garanhuns','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1533,'2606101','Glória do Goitá','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1534,'2606200','Goiana','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1535,'2606309','Granito','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1536,'2606408','Gravatá','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1537,'2606507','Iati','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1538,'2606606','Ibimirim','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1539,'2606705','Ibirajuba','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1540,'2606804','Igarassu','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1541,'2606903','Iguaraci','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1542,'2607000','Inajá','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1543,'2607109','Ingazeira','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1544,'2607208','Ipojuca','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1545,'2607307','Ipubi','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1546,'2607406','Itacuruba','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1547,'2607505','Itaíba','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1548,'2607604','Ilha de Itamaracá','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1549,'2607653','Itambé','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1550,'2607703','Itapetim','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1551,'2607752','Itapissuma','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1552,'2607802','Itaquitinga','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1553,'2607901','Jaboatão dos Guararapes','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1554,'2607950','Jaqueira','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1555,'2608008','Jataúba','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1556,'2608057','Jatobá','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1557,'2608107','João Alfredo','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1558,'2608206','Joaquim Nabuco','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1559,'2608255','Jucati','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1560,'2608305','Jupi','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1561,'2608404','Jurema','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1562,'2608453','Lagoa do Carro','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1563,'2608503','Lagoa de Itaenga','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1564,'2608602','Lagoa do Ouro','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1565,'2608701','Lagoa dos Gatos','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1566,'2608750','Lagoa Grande','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1567,'2608800','Lajedo','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1568,'2608909','Limoeiro','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1569,'2609006','Macaparana','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1570,'2609105','Machados','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1571,'2609154','Manari','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1572,'2609204','Maraial','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1573,'2609303','Mirandiba','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1574,'2609402','Moreno','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1575,'2609501','Nazaré da Mata','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1576,'2609600','Olinda','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1577,'2609709','Orobó','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1578,'2609808','Orocó','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1579,'2609907','Ouricuri','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1580,'2610004','Palmares','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1581,'2610103','Palmeirina','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1582,'2610202','Panelas','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1583,'2610301','Paranatama','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1584,'2610400','Parnamirim','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1585,'2610509','Passira','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1586,'2610608','Paudalho','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1587,'2610707','Paulista','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1588,'2610806','Pedra','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1589,'2610905','Pesqueira','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1590,'2611002','Petrolândia','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1591,'2611101','Petrolina','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1592,'2611200','Poção','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1593,'2611309','Pombos','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1594,'2611408','Primavera','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1595,'2611507','Quipapá','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1596,'2611533','Quixaba','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1597,'2611606','Recife','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1598,'2611705','Riacho das Almas','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1599,'2611804','Ribeirão','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1600,'2611903','Rio Formoso','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1601,'2612000','Sairé','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1602,'2612109','Salgadinho','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1603,'2612208','Salgueiro','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1604,'2612307','Saloá','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1605,'2612406','Sanharó','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1606,'2612455','Santa Cruz','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1607,'2612471','Santa Cruz da Baixa Verde','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1608,'2612505','Santa Cruz do Capibaribe','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1609,'2612554','Santa Filomena','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1610,'2612604','Santa Maria da Boa Vista','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1611,'2612703','Santa Maria do Cambucá','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1612,'2612802','Santa Terezinha','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1613,'2612901','São Benedito do Sul','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1614,'2613008','São Bento do Una','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1615,'2613107','São Caitano','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1616,'2613206','São João','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1617,'2613305','São Joaquim do Monte','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1618,'2613404','São José da Coroa Grande','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1619,'2613503','São José do Belmonte','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1620,'2613602','São José do Egito','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1621,'2613701','São Lourenço da Mata','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1622,'2613800','São Vicente Ferrer','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1623,'2613909','Serra Talhada','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1624,'2614006','Serrita','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1625,'2614105','Sertânia','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1626,'2614204','Sirinhaém','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1627,'2614303','Moreilândia','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1628,'2614402','Solidão','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1629,'2614501','Surubim','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1630,'2614600','Tabira','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1631,'2614709','Tacaimbó','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1632,'2614808','Tacaratu','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1633,'2614857','Tamandaré','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1634,'2615003','Taquaritinga do Norte','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1635,'2615102','Terezinha','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1636,'2615201','Terra Nova','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1637,'2615300','Timbaúba','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1638,'2615409','Toritama','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1639,'2615508','Tracunhaém','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1640,'2615607','Trindade','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1641,'2615706','Triunfo','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1642,'2615805','Tupanatinga','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1643,'2615904','Tuparetama','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1644,'2616001','Venturosa','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1645,'2616100','Verdejante','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1646,'2616183','Vertente do Lério','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1647,'2616209','Vertentes','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1648,'2616308','Vicência','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1649,'2616407','Vitória de Santo Antão','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1650,'2616506','Xexéu','PE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1651,'2700102','Água Branca','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1652,'2700201','Anadia','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1653,'2700300','Arapiraca','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1654,'2700409','Atalaia','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1655,'2700508','Barra de Santo Antônio','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1656,'2700607','Barra de São Miguel','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1657,'2700706','Batalha','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1658,'2700805','Belém','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1659,'2700904','Belo Monte','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1660,'2701001','Boca da Mata','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1661,'2701100','Branquinha','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1662,'2701209','Cacimbinhas','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1663,'2701308','Cajueiro','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1664,'2701357','Campestre','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1665,'2701407','Campo Alegre','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1666,'2701506','Campo Grande','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1667,'2701605','Canapi','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1668,'2701704','Capela','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1669,'2701803','Carneiros','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1670,'2701902','Chã Preta','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1671,'2702009','Coité do Nóia','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1672,'2702108','Colônia Leopoldina','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1673,'2702207','Coqueiro Seco','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1674,'2702306','Coruripe','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1675,'2702355','Craíbas','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1676,'2702405','Delmiro Gouveia','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1677,'2702504','Dois Riachos','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1678,'2702553','Estrela de Alagoas','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1679,'2702603','Feira Grande','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1680,'2702702','Feliz Deserto','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1681,'2702801','Flexeiras','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1682,'2702900','Girau do Ponciano','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1683,'2703007','Ibateguara','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1684,'2703106','Igaci','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1685,'2703205','Igreja Nova','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1686,'2703304','Inhapi','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1687,'2703403','Jacaré dos Homens','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1688,'2703502','Jacuípe','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1689,'2703601','Japaratinga','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1690,'2703700','Jaramataia','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1691,'2703759','Jequiá da Praia','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1692,'2703809','Joaquim Gomes','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1693,'2703908','Jundiá','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1694,'2704005','Junqueiro','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1695,'2704104','Lagoa da Canoa','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1696,'2704203','Limoeiro de Anadia','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1697,'2704302','Maceió','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1698,'2704401','Major Isidoro','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1699,'2704500','Maragogi','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1700,'2704609','Maravilha','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1701,'2704708','Marechal Deodoro','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1702,'2704807','Maribondo','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1703,'2704906','Mar Vermelho','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1704,'2705002','Mata Grande','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1705,'2705101','Matriz de Camaragibe','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1706,'2705200','Messias','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1707,'2705309','Minador do Negrão','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1708,'2705408','Monteirópolis','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1709,'2705507','Murici','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1710,'2705606','Novo Lino','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1711,'2705705','Olho D\'Água das Flores','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1712,'2705804','Olho D\'Água do Casado','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1713,'2705903','Olho D\'Água Grande','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1714,'2706000','Olivença','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1715,'2706109','Ouro Branco','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1716,'2706208','Palestina','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1717,'2706307','Palmeira dos Índios','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1718,'2706406','Pão de Açúcar','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1719,'2706422','Pariconha','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1720,'2706448','Paripueira','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1721,'2706505','Passo de Camaragibe','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1722,'2706604','Paulo Jacinto','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1723,'2706703','Penedo','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1724,'2706802','Piaçabuçu','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1725,'2706901','Pilar','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1726,'2707008','Pindoba','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1727,'2707107','Piranhas','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1728,'2707206','Poço das Trincheiras','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1729,'2707305','Porto Calvo','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1730,'2707404','Porto de Pedras','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1731,'2707503','Porto Real do Colégio','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1732,'2707602','Quebrangulo','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1733,'2707701','Rio Largo','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1734,'2707800','Roteiro','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1735,'2707909','Santa Luzia do Norte','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1736,'2708006','Santana do Ipanema','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1737,'2708105','Santana do Mundaú','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1738,'2708204','São Brás','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1739,'2708303','São José da Laje','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1740,'2708402','São José da Tapera','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1741,'2708501','São Luís do Quitunde','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1742,'2708600','São Miguel dos Campos','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1743,'2708709','São Miguel dos Milagres','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1744,'2708808','São Sebastião','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1745,'2708907','Satuba','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1746,'2708956','Senador Rui Palmeira','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1747,'2709004','Tanque D\'Arca','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1748,'2709103','Taquarana','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1749,'2709152','Teotônio Vilela','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1750,'2709202','Traipu','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1751,'2709301','União dos Palmares','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1752,'2709400','Viçosa','AL','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1753,'2800100','Amparo de São Francisco','SE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1754,'2800209','Aquidabã','SE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1755,'2800308','Aracaju','SE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1756,'2800407','Arauá','SE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1757,'2800506','Areia Branca','SE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1758,'2800605','Barra dos Coqueiros','SE','2024-09-03 10:31:05','2024-09-03 10:31:05'),(1759,'2800670','Boquim','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1760,'2800704','Brejo Grande','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1761,'2801009','Campo do Brito','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1762,'2801108','Canhoba','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1763,'2801207','Canindé de São Francisco','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1764,'2801306','Capela','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1765,'2801405','Carira','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1766,'2801504','Carmópolis','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1767,'2801603','Cedro de São João','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1768,'2801702','Cristinápolis','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1769,'2801900','Cumbe','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1770,'2802007','Divina Pastora','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1771,'2802106','Estância','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1772,'2802205','Feira Nova','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1773,'2802304','Frei Paulo','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1774,'2802403','Gararu','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1775,'2802502','General Maynard','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1776,'2802601','Gracho Cardoso','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1777,'2802700','Ilha das Flores','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1778,'2802809','Indiaroba','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1779,'2802908','Itabaiana','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1780,'2803005','Itabaianinha','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1781,'2803104','Itabi','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1782,'2803203','Itaporanga D\'Ajuda','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1783,'2803302','Japaratuba','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1784,'2803401','Japoatã','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1785,'2803500','Lagarto','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1786,'2803609','Laranjeiras','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1787,'2803708','Macambira','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1788,'2803807','Malhada dos Bois','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1789,'2803906','Malhador','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1790,'2804003','Maruim','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1791,'2804102','Moita Bonita','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1792,'2804201','Monte Alegre de Sergipe','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1793,'2804300','Muribeca','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1794,'2804409','Neópolis','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1795,'2804458','Nossa Senhora Aparecida','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1796,'2804508','Nossa Senhora da Glória','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1797,'2804607','Nossa Senhora das Dores','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1798,'2804706','Nossa Senhora de Lourdes','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1799,'2804805','Nossa Senhora do Socorro','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1800,'2804904','Pacatuba','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1801,'2805000','Pedra Mole','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1802,'2805109','Pedrinhas','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1803,'2805208','Pinhão','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1804,'2805307','Pirambu','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1805,'2805406','Poço Redondo','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1806,'2805505','Poço Verde','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1807,'2805604','Porto da Folha','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1808,'2805703','Propriá','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1809,'2805802','Riachão do Dantas','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1810,'2805901','Riachuelo','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1811,'2806008','Ribeirópolis','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1812,'2806107','Rosário do Catete','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1813,'2806206','Salgado','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1814,'2806305','Santa Luzia do Itanhy','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1815,'2806404','Santana do São Francisco','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1816,'2806503','Santa Rosa de Lima','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1817,'2806602','Santo Amaro das Brotas','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1818,'2806701','São Cristóvão','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1819,'2806800','São Domingos','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1820,'2806909','São Francisco','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1821,'2807006','São Miguel do Aleixo','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1822,'2807105','Simão Dias','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1823,'2807204','Siriri','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1824,'2807303','Telha','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1825,'2807402','Tobias Barreto','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1826,'2807501','Tomar do Geru','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1827,'2807600','Umbaúba','SE','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1828,'2900108','Abaíra','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1829,'2900207','Abaré','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1830,'2900306','Acajutiba','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1831,'2900355','Adustina','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1832,'2900405','Água Fria','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1833,'2900504','Érico Cardoso','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1834,'2900603','Aiquara','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1835,'2900702','Alagoinhas','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1836,'2900801','Alcobaça','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1837,'2900900','Almadina','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1838,'2901007','Amargosa','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1839,'2901106','Amélia Rodrigues','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1840,'2901155','América Dourada','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1841,'2901205','Anagé','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1842,'2901304','Andaraí','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1843,'2901353','Andorinha','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1844,'2901403','Angical','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1845,'2901502','Anguera','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1846,'2901601','Antas','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1847,'2901700','Antônio Cardoso','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1848,'2901809','Antônio Gonçalves','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1849,'2901908','Aporá','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1850,'2901957','Apuarema','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1851,'2902005','Aracatu','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1852,'2902054','Araças','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1853,'2902104','Araci','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1854,'2902203','Aramari','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1855,'2902252','Arataca','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1856,'2902302','Aratuípe','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1857,'2902401','Aurelino Leal','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1858,'2902500','Baianópolis','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1859,'2902609','Baixa Grande','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1860,'2902658','Banzaê','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1861,'2902708','Barra','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1862,'2902807','Barra da Estiva','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1863,'2902906','Barra do Choça','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1864,'2903003','Barra do Mendes','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1865,'2903102','Barra do Rocha','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1866,'2903201','Barreiras','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1867,'2903235','Barro Alto','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1868,'2903276','Barrocas','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1869,'2903300','Barro Preto','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1870,'2903409','Belmonte','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1871,'2903508','Belo Campo','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1872,'2903607','Biritinga','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1873,'2903706','Boa Nova','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1874,'2903805','Boa Vista do Tupim','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1875,'2903904','Bom Jesus da Lapa','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1876,'2903953','Bom Jesus da Serra','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1877,'2904001','Boninal','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1878,'2904050','Bonito','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1879,'2904100','Boquira','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1880,'2904209','Botuporã','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1881,'2904308','Brejões','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1882,'2904407','Brejolândia','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1883,'2904506','Brotas de Macaúbas','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1884,'2904605','Brumado','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1885,'2904704','Buerarema','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1886,'2904753','Buritirama','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1887,'2904803','Caatiba','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1888,'2904852','Cabaceiras do Paraguaçu','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1889,'2904902','Cachoeira','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1890,'2905008','Caculé','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1891,'2905107','Caém','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1892,'2905156','Caetanos','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1893,'2905206','Caetité','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1894,'2905305','Cafarnaum','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1895,'2905404','Cairu','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1896,'2905503','Caldeirão Grande','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1897,'2905602','Camacan','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1898,'2905701','Camaçari','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1899,'2905800','Camamu','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1900,'2905909','Campo Alegre de Lourdes','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1901,'2906006','Campo Formoso','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1902,'2906105','Canápolis','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1903,'2906204','Canarana','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1904,'2906303','Canavieiras','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1905,'2906402','Candeal','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1906,'2906501','Candeias','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1907,'2906600','Candiba','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1908,'2906709','Cândido Sales','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1909,'2906808','Cansanção','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1910,'2906824','Canudos','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1911,'2906857','Capela do Alto Alegre','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1912,'2906873','Capim Grosso','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1913,'2906899','Caraíbas','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1914,'2906907','Caravelas','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1915,'2907004','Cardeal da Silva','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1916,'2907103','Carinhanha','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1917,'2907202','Casa Nova','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1918,'2907301','Castro Alves','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1919,'2907400','Catolândia','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1920,'2907509','Catu','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1921,'2907558','Caturama','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1922,'2907608','Central','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1923,'2907707','Chorrochó','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1924,'2907806','Cícero Dantas','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1925,'2907905','Cipó','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1926,'2908002','Coaraci','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1927,'2908101','Cocos','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1928,'2908200','Conceição da Feira','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1929,'2908309','Conceição do Almeida','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1930,'2908408','Conceição do Coité','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1931,'2908507','Conceição do Jacuípe','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1932,'2908606','Conde','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1933,'2908705','Condeúba','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1934,'2908804','Contendas do Sincorá','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1935,'2908903','Coração de Maria','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1936,'2909000','Cordeiros','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1937,'2909109','Coribe','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1938,'2909208','Coronel João Sá','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1939,'2909307','Correntina','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1940,'2909406','Cotegipe','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1941,'2909505','Cravolândia','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1942,'2909604','Crisópolis','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1943,'2909703','Cristópolis','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1944,'2909802','Cruz das Almas','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1945,'2909901','Curaçá','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1946,'2910008','Dário Meira','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1947,'2910057','Dias D\'Ávila','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1948,'2910107','Dom Basílio','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1949,'2910206','Dom Macedo Costa','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1950,'2910305','Elísio Medrado','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1951,'2910404','Encruzilhada','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1952,'2910503','Entre Rios','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1953,'2910602','Esplanada','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1954,'2910701','Euclides da Cunha','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1955,'2910727','Eunápolis','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1956,'2910750','Fátima','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1957,'2910776','Feira da Mata','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1958,'2910800','Feira de Santana','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1959,'2910859','Filadélfia','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1960,'2910909','Firmino Alves','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1961,'2911006','Floresta Azul','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1962,'2911105','Formosa do Rio Preto','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1963,'2911204','Gandu','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1964,'2911253','Gavião','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1965,'2911303','Gentio do Ouro','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1966,'2911402','Glória','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1967,'2911501','Gongogi','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1968,'2911600','Governador Mangabeira','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1969,'2911659','Guajeru','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1970,'2911709','Guanambi','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1971,'2911808','Guaratinga','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1972,'2911857','Heliópolis','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1973,'2911907','Iaçu','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1974,'2912004','Ibiassucê','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1975,'2912103','Ibicaraí','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1976,'2912202','Ibicoara','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1977,'2912301','Ibicuí','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1978,'2912400','Ibipeba','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1979,'2912509','Ibipitanga','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1980,'2912608','Ibiquera','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1981,'2912707','Ibirapitanga','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1982,'2912806','Ibirapuã','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1983,'2912905','Ibirataia','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1984,'2913002','Ibitiara','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1985,'2913101','Ibititá','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1986,'2913200','Ibotirama','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1987,'2913309','Ichu','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1988,'2913408','Igaporã','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1989,'2913457','Igrapiúna','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1990,'2913507','Iguaí','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1991,'2913606','Ilhéus','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1992,'2913705','Inhambupe','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1993,'2913804','Ipecaetá','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1994,'2913903','Ipiaú','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1995,'2914000','Ipirá','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1996,'2914109','Ipupiara','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1997,'2914208','Irajuba','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1998,'2914307','Iramaia','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(1999,'2914406','Iraquara','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2000,'2914505','Irará','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2001,'2914604','Irecê','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2002,'2914653','Itabela','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2003,'2914703','Itaberaba','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2004,'2914802','Itabuna','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2005,'2914901','Itacaré','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2006,'2915007','Itaeté','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2007,'2915106','Itagi','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2008,'2915205','Itagibá','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2009,'2915304','Itagimirim','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2010,'2915353','Itaguaçu da Bahia','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2011,'2915403','Itaju do Colônia','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2012,'2915502','Itajuípe','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2013,'2915601','Itamaraju','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2014,'2915700','Itamari','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2015,'2915809','Itambé','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2016,'2915908','Itanagra','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2017,'2916005','Itanhém','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2018,'2916104','Itaparica','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2019,'2916203','Itapé','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2020,'2916302','Itapebi','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2021,'2916401','Itapetinga','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2022,'2916500','Itapicuru','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2023,'2916609','Itapitanga','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2024,'2916708','Itaquara','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2025,'2916807','Itarantim','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2026,'2916856','Itatim','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2027,'2916906','Itiruçu','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2028,'2917003','Itiúba','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2029,'2917102','Itororó','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2030,'2917201','Ituaçu','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2031,'2917300','Ituberá','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2032,'2917334','Iuiú','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2033,'2917359','Jaborandi','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2034,'2917409','Jacaraci','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2035,'2917508','Jacobina','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2036,'2917607','Jaguaquara','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2037,'2917706','Jaguarari','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2038,'2917805','Jaguaripe','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2039,'2917904','Jandaíra','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2040,'2918001','Jequié','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2041,'2918100','Jeremoabo','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2042,'2918209','Jiquiriçá','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2043,'2918308','Jitaúna','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2044,'2918357','João Dourado','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2045,'2918407','Juazeiro','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2046,'2918456','Jucuruçu','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2047,'2918506','Jussara','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2048,'2918555','Jussari','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2049,'2918605','Jussiape','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2050,'2918704','Lafaiete Coutinho','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2051,'2918753','Lagoa Real','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2052,'2918803','Laje','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2053,'2918902','Lajedão','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2054,'2919009','Lajedinho','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2055,'2919058','Lajedo do Tabocal','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2056,'2919108','Lamarão','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2057,'2919157','Lapão','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2058,'2919207','Lauro de Freitas','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2059,'2919306','Lençóis','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2060,'2919405','Licínio de Almeida','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2061,'2919504','Livramento de Nossa Senhora','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2062,'2919553','Luís Eduardo Magalhães','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2063,'2919603','Macajuba','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2064,'2919702','Macarani','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2065,'2919801','Macaúbas','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2066,'2919900','Macururé','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2067,'2919926','Madre de Deus','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2068,'2919959','Maetinga','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2069,'2920007','Maiquinique','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2070,'2920106','Mairi','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2071,'2920205','Malhada','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2072,'2920304','Malhada de Pedras','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2073,'2920403','Manoel Vitorino','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2074,'2920452','Mansidão','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2075,'2920502','Maracás','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2076,'2920601','Maragogipe','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2077,'2920700','Maraú','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2078,'2920809','Marcionílio Souza','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2079,'2920908','Mascote','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2080,'2921005','Mata de São João','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2081,'2921054','Matina','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2082,'2921104','Medeiros Neto','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2083,'2921203','Miguel Calmon','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2084,'2921302','Milagres','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2085,'2921401','Mirangaba','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2086,'2921450','Mirante','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2087,'2921500','Monte Santo','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2088,'2921609','Morpará','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2089,'2921708','Morro do Chapéu','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2090,'2921807','Mortugaba','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2091,'2921906','Mucugê','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2092,'2922003','Mucuri','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2093,'2922052','Mulungu do Morro','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2094,'2922102','Mundo Novo','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2095,'2922201','Muniz Ferreira','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2096,'2922250','Muquém de São Francisco','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2097,'2922300','Muritiba','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2098,'2922409','Mutuípe','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2099,'2922508','Nazaré','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2100,'2922607','Nilo Peçanha','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2101,'2922656','Nordestina','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2102,'2922706','Nova Canaã','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2103,'2922730','Nova Fátima','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2104,'2922755','Nova Ibiá','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2105,'2922805','Nova Itarana','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2106,'2922854','Nova Redenção','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2107,'2922904','Nova Soure','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2108,'2923001','Nova Viçosa','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2109,'2923035','Novo Horizonte','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2110,'2923050','Novo Triunfo','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2111,'2923100','Olindina','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2112,'2923209','Oliveira dos Brejinhos','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2113,'2923308','Ouriçangas','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2114,'2923357','Ourolândia','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2115,'2923407','Palmas de Monte Alto','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2116,'2923506','Palmeiras','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2117,'2923605','Paramirim','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2118,'2923704','Paratinga','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2119,'2923803','Paripiranga','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2120,'2923902','Pau Brasil','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2121,'2924009','Paulo Afonso','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2122,'2924058','Pé de Serra','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2123,'2924108','Pedrão','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2124,'2924207','Pedro Alexandre','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2125,'2924306','Piatã','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2126,'2924405','Pilão Arcado','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2127,'2924504','Pindaí','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2128,'2924603','Pindobaçu','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2129,'2924652','Pintadas','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2130,'2924678','Piraí do Norte','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2131,'2924702','Piripá','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2132,'2924801','Piritiba','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2133,'2924900','Planaltino','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2134,'2925006','Planalto','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2135,'2925105','Poções','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2136,'2925204','Pojuca','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2137,'2925253','Ponto Novo','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2138,'2925303','Porto Seguro','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2139,'2925402','Potiraguá','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2140,'2925501','Prado','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2141,'2925600','Presidente Dutra','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2142,'2925709','Presidente Jânio Quadros','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2143,'2925758','Presidente Tancredo Neves','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2144,'2925808','Queimadas','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2145,'2925907','Quijingue','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2146,'2925931','Quixabeira','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2147,'2925956','Rafael Jambeiro','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2148,'2926004','Remanso','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2149,'2926103','Retirolândia','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2150,'2926202','Riachão das Neves','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2151,'2926301','Riachão do Jacuípe','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2152,'2926400','Riacho de Santana','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2153,'2926509','Ribeira do Amparo','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2154,'2926608','Ribeira do Pombal','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2155,'2926657','Ribeirão do Largo','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2156,'2926707','Rio de Contas','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2157,'2926806','Rio do Antônio','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2158,'2926905','Rio do Pires','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2159,'2927002','Rio Real','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2160,'2927101','Rodelas','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2161,'2927200','Ruy Barbosa','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2162,'2927309','Salinas da Margarida','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2163,'2927408','Salvador','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2164,'2927507','Santa Bárbara','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2165,'2927606','Santa Brígida','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2166,'2927705','Santa Cruz Cabrália','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2167,'2927804','Santa Cruz da Vitória','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2168,'2927903','Santa Inês','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2169,'2928000','Santaluz','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2170,'2928059','Santa Luzia','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2171,'2928109','Santa Maria da Vitória','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2172,'2928208','Santana','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2173,'2928307','Santanópolis','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2174,'2928406','Santa Rita de Cássia','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2175,'2928505','Santa Teresinha','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2176,'2928604','Santo Amaro','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2177,'2928703','Santo Antônio de Jesus','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2178,'2928802','Santo Estêvão','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2179,'2928901','São Desidério','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2180,'2928950','São Domingos','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2181,'2929008','São Félix','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2182,'2929057','São Félix do Coribe','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2183,'2929107','São Felipe','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2184,'2929206','São Francisco do Conde','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2185,'2929255','São Gabriel','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2186,'2929305','São Gonçalo dos Campos','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2187,'2929354','São José da Vitória','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2188,'2929370','São José do Jacuípe','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2189,'2929404','São Miguel das Matas','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2190,'2929503','São Sebastião do Passé','BA','2024-09-03 10:31:06','2024-09-03 10:31:06'),(2191,'2929602','Sapeaçu','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2192,'2929701','Sátiro Dias','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2193,'2929750','Saubara','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2194,'2929800','Saúde','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2195,'2929909','Seabra','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2196,'2930006','Sebastião Laranjeiras','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2197,'2930105','Senhor do Bonfim','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2198,'2930154','Serra do Ramalho','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2199,'2930204','Sento Sé','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2200,'2930303','Serra Dourada','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2201,'2930402','Serra Preta','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2202,'2930501','Serrinha','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2203,'2930600','Serrolândia','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2204,'2930709','Simões Filho','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2205,'2930758','Sítio do Mato','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2206,'2930766','Sítio do Quinto','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2207,'2930774','Sobradinho','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2208,'2930808','Souto Soares','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2209,'2930907','Tabocas do Brejo Velho','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2210,'2931004','Tanhaçu','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2211,'2931053','Tanque Novo','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2212,'2931103','Tanquinho','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2213,'2931202','Taperoá','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2214,'2931301','Tapiramutá','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2215,'2931350','Teixeira de Freitas','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2216,'2931400','Teodoro Sampaio','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2217,'2931509','Teofilândia','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2218,'2931608','Teolândia','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2219,'2931707','Terra Nova','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2220,'2931806','Tremedal','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2221,'2931905','Tucano','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2222,'2932002','Uauá','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2223,'2932101','Ubaíra','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2224,'2932200','Ubaitaba','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2225,'2932309','Ubatã','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2226,'2932408','Uibaí','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2227,'2932457','Umburanas','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2228,'2932507','Una','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2229,'2932606','Urandi','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2230,'2932705','Uruçuca','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2231,'2932804','Utinga','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2232,'2932903','Valença','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2233,'2933000','Valente','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2234,'2933059','Várzea da Roça','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2235,'2933109','Várzea do Poço','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2236,'2933158','Várzea Nova','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2237,'2933174','Varzedo','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2238,'2933208','Vera Cruz','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2239,'2933257','Vereda','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2240,'2933307','Vitória da Conquista','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2241,'2933406','Wagner','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2242,'2933455','Wanderley','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2243,'2933505','Wenceslau Guimarães','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2244,'2933604','Xique-Xique','BA','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2245,'3100104','Abadia dos Dourados','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2246,'3100203','Abaeté','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2247,'3100302','Abre Campo','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2248,'3100401','Acaiaca','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2249,'3100500','Açucena','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2250,'3100609','Água Boa','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2251,'3100708','Água Comprida','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2252,'3100807','Aguanil','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2253,'3100906','Águas Formosas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2254,'3101003','Águas Vermelhas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2255,'3101102','Aimorés','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2256,'3101201','Aiuruoca','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2257,'3101300','Alagoa','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2258,'3101409','Albertina','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2259,'3101508','Além Paraíba','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2260,'3101607','Alfenas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2261,'3101631','Alfredo Vasconcelos','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2262,'3101706','Almenara','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2263,'3101805','Alpercata','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2264,'3101904','Alpinópolis','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2265,'3102001','Alterosa','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2266,'3102050','Alto Caparaó','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2267,'3102100','Alto Rio Doce','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2268,'3102209','Alvarenga','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2269,'3102308','Alvinópolis','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2270,'3102407','Alvorada de Minas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2271,'3102506','Amparo do Serra','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2272,'3102605','Andradas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2273,'3102704','Cachoeira de Pajeú','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2274,'3102803','Andrelândia','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2275,'3102852','Angelândia','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2276,'3102902','Antônio Carlos','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2277,'3103009','Antônio Dias','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2278,'3103108','Antônio Prado de Minas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2279,'3103207','Araçaí','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2280,'3103306','Aracitaba','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2281,'3103405','Araçuaí','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2282,'3103504','Araguari','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2283,'3103603','Arantina','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2284,'3103702','Araponga','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2285,'3103751','Araporã','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2286,'3103801','Arapuá','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2287,'3103900','Araújos','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2288,'3104007','Araxá','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2289,'3104106','Arceburgo','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2290,'3104205','Arcos','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2291,'3104304','Areado','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2292,'3104403','Argirita','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2293,'3104452','Aricanduva','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2294,'3104502','Arinos','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2295,'3104601','Astolfo Dutra','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2296,'3104700','Ataléia','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2297,'3104809','Augusto de Lima','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2298,'3104908','Baependi','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2299,'3105004','Baldim','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2300,'3105103','Bambuí','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2301,'3105202','Bandeira','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2302,'3105301','Bandeira do Sul','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2303,'3105400','Barão de Cocais','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2304,'3105509','Barão de Monte Alto','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2305,'3105608','Barbacena','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2306,'3105707','Barra Longa','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2307,'3105905','Barroso','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2308,'3106002','Bela Vista de Minas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2309,'3106101','Belmiro Braga','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2310,'3106200','Belo Horizonte','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2311,'3106309','Belo Oriente','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2312,'3106408','Belo Vale','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2313,'3106507','Berilo','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2314,'3106606','Bertópolis','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2315,'3106655','Berizal','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2316,'3106705','Betim','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2317,'3106804','Bias Fortes','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2318,'3106903','Bicas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2319,'3107000','Biquinhas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2320,'3107109','Boa Esperança','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2321,'3107208','Bocaina de Minas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2322,'3107307','Bocaiúva','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2323,'3107406','Bom Despacho','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2324,'3107505','Bom Jardim de Minas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2325,'3107604','Bom Jesus da Penha','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2326,'3107703','Bom Jesus do Amparo','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2327,'3107802','Bom Jesus do Galho','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2328,'3107901','Bom Repouso','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2329,'3108008','Bom Sucesso','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2330,'3108107','Bonfim','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2331,'3108206','Bonfinópolis de Minas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2332,'3108255','Bonito de Minas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2333,'3108305','Borda da Mata','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2334,'3108404','Botelhos','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2335,'3108503','Botumirim','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2336,'3108552','Brasilândia de Minas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2337,'3108602','Brasília de Minas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2338,'3108701','Brás Pires','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2339,'3108800','Braúnas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2340,'3108909','Brazópolis','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2341,'3109006','Brumadinho','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2342,'3109105','Bueno Brandão','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2343,'3109204','Buenópolis','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2344,'3109253','Bugre','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2345,'3109303','Buritis','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2346,'3109402','Buritizeiro','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2347,'3109451','Cabeceira Grande','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2348,'3109501','Cabo Verde','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2349,'3109600','Cachoeira da Prata','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2350,'3109709','Cachoeira de Minas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2351,'3109808','Cachoeira Dourada','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2352,'3109907','Caetanópolis','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2353,'3110004','Caeté','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2354,'3110103','Caiana','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2355,'3110202','Cajuri','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2356,'3110301','Caldas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2357,'3110400','Camacho','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2358,'3110509','Camanducaia','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2359,'3110608','Cambuí','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2360,'3110707','Cambuquira','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2361,'3110806','Campanário','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2362,'3110905','Campanha','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2363,'3111002','Campestre','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2364,'3111101','Campina Verde','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2365,'3111150','Campo Azul','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2366,'3111200','Campo Belo','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2367,'3111309','Campo do Meio','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2368,'3111408','Campo Florido','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2369,'3111507','Campos Altos','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2370,'3111606','Campos Gerais','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2371,'3111705','Canaã','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2372,'3111804','Canápolis','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2373,'3111903','Cana Verde','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2374,'3112000','Candeias','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2375,'3112059','Cantagalo','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2376,'3112109','Caparaó','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2377,'3112208','Capela Nova','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2378,'3112307','Capelinha','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2379,'3112406','Capetinga','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2380,'3112505','Capim Branco','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2381,'3112604','Capinópolis','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2382,'3112653','Capitão Andrade','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2383,'3112703','Capitão Enéas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2384,'3112802','Capitólio','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2385,'3112901','Caputira','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2386,'3113008','Caraí','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2387,'3113107','Caranaíba','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2388,'3113206','Carandaí','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2389,'3113305','Carangola','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2390,'3113404','Caratinga','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2391,'3113503','Carbonita','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2392,'3113602','Careaçu','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2393,'3113701','Carlos Chagas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2394,'3113800','Carmésia','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2395,'3113909','Carmo da Cachoeira','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2396,'3114006','Carmo da Mata','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2397,'3114105','Carmo de Minas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2398,'3114204','Carmo do Cajuru','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2399,'3114303','Carmo do Paranaíba','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2400,'3114402','Carmo do Rio Claro','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2401,'3114501','Carmópolis de Minas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2402,'3114550','Carneirinho','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2403,'3114600','Carrancas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2404,'3114709','Carvalhópolis','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2405,'3114808','Carvalhos','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2406,'3114907','Casa Grande','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2407,'3115003','Cascalho Rico','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2408,'3115102','Cássia','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2409,'3115201','Conceição da Barra de Minas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2410,'3115300','Cataguases','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2411,'3115359','Catas Altas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2412,'3115409','Catas Altas da Noruega','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2413,'3115458','Catuji','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2414,'3115474','Catuti','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2415,'3115508','Caxambu','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2416,'3115607','Cedro do Abaeté','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2417,'3115706','Central de Minas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2418,'3115805','Centralina','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2419,'3115904','Chácara','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2420,'3116001','Chalé','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2421,'3116100','Chapada do Norte','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2422,'3116159','Chapada Gaúcha','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2423,'3116209','Chiador','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2424,'3116308','Cipotânea','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2425,'3116407','Claraval','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2426,'3116506','Claro dos Poções','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2427,'3116605','Cláudio','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2428,'3116704','Coimbra','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2429,'3116803','Coluna','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2430,'3116902','Comendador Gomes','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2431,'3117009','Comercinho','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2432,'3117108','Conceição da Aparecida','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2433,'3117207','Conceição das Pedras','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2434,'3117306','Conceição das Alagoas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2435,'3117405','Conceição de Ipanema','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2436,'3117504','Conceição do Mato Dentro','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2437,'3117603','Conceição do Pará','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2438,'3117702','Conceição do Rio Verde','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2439,'3117801','Conceição dos Ouros','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2440,'3117836','Cônego Marinho','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2441,'3117876','Confins','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2442,'3117900','Congonhal','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2443,'3118007','Congonhas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2444,'3118106','Congonhas do Norte','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2445,'3118205','Conquista','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2446,'3118304','Conselheiro Lafaiete','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2447,'3118403','Conselheiro Pena','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2448,'3118502','Consolação','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2449,'3118601','Contagem','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2450,'3118700','Coqueiral','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2451,'3118809','Coração de Jesus','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2452,'3118908','Cordisburgo','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2453,'3119005','Cordislândia','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2454,'3119104','Corinto','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2455,'3119203','Coroaci','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2456,'3119302','Coromandel','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2457,'3119401','Coronel Fabriciano','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2458,'3119500','Coronel Murta','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2459,'3119609','Coronel Pacheco','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2460,'3119708','Coronel Xavier Chaves','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2461,'3119807','Córrego Danta','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2462,'3119906','Córrego do Bom Jesus','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2463,'3119955','Córrego Fundo','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2464,'3120003','Córrego Novo','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2465,'3120102','Couto de Magalhães de Minas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2466,'3120151','Crisólita','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2467,'3120201','Cristais','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2468,'3120300','Cristália','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2469,'3120409','Cristiano Otoni','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2470,'3120508','Cristina','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2471,'3120607','Crucilândia','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2472,'3120706','Cruzeiro da Fortaleza','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2473,'3120805','Cruzília','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2474,'3120839','Cuparaque','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2475,'3120870','Curral de Dentro','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2476,'3120904','Curvelo','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2477,'3121001','Datas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2478,'3121100','Delfim Moreira','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2479,'3121209','Delfinópolis','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2480,'3121258','Delta','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2481,'3121308','Descoberto','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2482,'3121407','Desterro de Entre Rios','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2483,'3121506','Desterro do Melo','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2484,'3121605','Diamantina','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2485,'3121704','Diogo de Vasconcelos','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2486,'3121803','Dionísio','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2487,'3121902','Divinésia','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2488,'3122009','Divino','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2489,'3122108','Divino das Laranjeiras','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2490,'3122207','Divinolândia de Minas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2491,'3122306','Divinópolis','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2492,'3122355','Divisa Alegre','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2493,'3122405','Divisa Nova','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2494,'3122454','Divisópolis','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2495,'3122470','Dom Bosco','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2496,'3122504','Dom Cavati','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2497,'3122603','Dom Joaquim','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2498,'3122702','Dom Silvério','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2499,'3122801','Dom Viçoso','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2500,'3122900','Dona Eusébia','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2501,'3123007','Dores de Campos','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2502,'3123106','Dores de Guanhães','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2503,'3123205','Dores do Indaiá','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2504,'3123304','Dores do Turvo','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2505,'3123403','Doresópolis','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2506,'3123502','Douradoquara','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2507,'3123528','Durandé','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2508,'3123601','Elói Mendes','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2509,'3123700','Engenheiro Caldas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2510,'3123809','Engenheiro Navarro','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2511,'3123858','Entre Folhas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2512,'3123908','Entre Rios de Minas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2513,'3124005','Ervália','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2514,'3124104','Esmeraldas','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2515,'3124203','Espera Feliz','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2516,'3124302','Espinosa','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2517,'3124401','Espírito Santo do Dourado','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2518,'3124500','Estiva','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2519,'3124609','Estrela Dalva','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2520,'3124708','Estrela do Indaiá','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2521,'3124807','Estrela do Sul','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2522,'3124906','Eugenópolis','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2523,'3125002','Ewbank da Câmara','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2524,'3125101','Extrema','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2525,'3125200','Fama','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2526,'3125309','Faria Lemos','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2527,'3125408','Felício dos Santos','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2528,'3125507','São Gonçalo do Rio Preto','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2529,'3125606','Felisburgo','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2530,'3125705','Felixlândia','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2531,'3125804','Fernandes Tourinho','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2532,'3125903','Ferros','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2533,'3125952','Fervedouro','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2534,'3126000','Florestal','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2535,'3126109','Formiga','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2536,'3126208','Formoso','MG','2024-09-03 10:31:07','2024-09-03 10:31:07'),(2537,'3126307','Fortaleza de Minas','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2538,'3126406','Fortuna de Minas','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2539,'3126505','Francisco Badaró','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2540,'3126604','Francisco Dumont','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2541,'3126703','Francisco Sá','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2542,'3126752','Franciscópolis','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2543,'3126802','Frei Gaspar','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2544,'3126901','Frei Inocêncio','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2545,'3126950','Frei Lagonegro','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2546,'3127008','Fronteira','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2547,'3127057','Fronteira dos Vales','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2548,'3127073','Fruta de Leite','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2549,'3127107','Frutal','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2550,'3127206','Funilândia','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2551,'3127305','Galiléia','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2552,'3127339','Gameleiras','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2553,'3127354','Glaucilândia','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2554,'3127370','Goiabeira','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2555,'3127388','Goianá','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2556,'3127404','Gonçalves','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2557,'3127503','Gonzaga','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2558,'3127602','Gouveia','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2559,'3127701','Governador Valadares','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2560,'3127800','Grão Mogol','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2561,'3127909','Grupiara','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2562,'3128006','Guanhães','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2563,'3128105','Guapé','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2564,'3128204','Guaraciaba','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2565,'3128253','Guaraciama','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2566,'3128303','Guaranésia','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2567,'3128402','Guarani','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2568,'3128501','Guarará','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2569,'3128600','Guarda-Mor','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2570,'3128709','Guaxupé','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2571,'3128808','Guidoval','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2572,'3128907','Guimarânia','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2573,'3129004','Guiricema','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2574,'3129103','Gurinhatã','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2575,'3129202','Heliodora','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2576,'3129301','Iapu','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2577,'3129400','Ibertioga','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2578,'3129509','Ibiá','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2579,'3129608','Ibiaí','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2580,'3129657','Ibiracatu','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2581,'3129707','Ibiraci','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2582,'3129806','Ibirité','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2583,'3129905','Ibitiúra de Minas','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2584,'3130002','Ibituruna','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2585,'3130051','Icaraí de Minas','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2586,'3130101','Igarapé','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2587,'3130200','Igaratinga','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2588,'3130309','Iguatama','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2589,'3130408','Ijaci','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2590,'3130507','Ilicínea','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2591,'3130556','Imbé de Minas','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2592,'3130606','Inconfidentes','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2593,'3130655','Indaiabira','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2594,'3130705','Indianópolis','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2595,'3130804','Ingaí','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2596,'3130903','Inhapim','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2597,'3131000','Inhaúma','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2598,'3131109','Inimutaba','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2599,'3131158','Ipaba','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2600,'3131208','Ipanema','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2601,'3131307','Ipatinga','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2602,'3131406','Ipiaçu','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2603,'3131505','Ipuiúna','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2604,'3131604','Iraí de Minas','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2605,'3131703','Itabira','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2606,'3131802','Itabirinha','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2607,'3131901','Itabirito','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2608,'3132008','Itacambira','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2609,'3132107','Itacarambi','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2610,'3132206','Itaguara','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2611,'3132305','Itaipé','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2612,'3132404','Itajubá','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2613,'3132503','Itamarandiba','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2614,'3132602','Itamarati de Minas','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2615,'3132701','Itambacuri','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2616,'3132800','Itambé do Mato Dentro','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2617,'3132909','Itamogi','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2618,'3133006','Itamonte','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2619,'3133105','Itanhandu','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2620,'3133204','Itanhomi','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2621,'3133303','Itaobim','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2622,'3133402','Itapagipe','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2623,'3133501','Itapecerica','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2624,'3133600','Itapeva','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2625,'3133709','Itatiaiuçu','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2626,'3133758','Itaú de Minas','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2627,'3133808','Itaúna','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2628,'3133907','Itaverava','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2629,'3134004','Itinga','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2630,'3134103','Itueta','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2631,'3134202','Ituiutaba','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2632,'3134301','Itumirim','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2633,'3134400','Iturama','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2634,'3134509','Itutinga','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2635,'3134608','Jaboticatubas','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2636,'3134707','Jacinto','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2637,'3134806','Jacuí','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2638,'3134905','Jacutinga','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2639,'3135001','Jaguaraçu','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2640,'3135050','Jaíba','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2641,'3135076','Jampruca','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2642,'3135100','Janaúba','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2643,'3135209','Januária','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2644,'3135308','Japaraíba','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2645,'3135357','Japonvar','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2646,'3135407','Jeceaba','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2647,'3135456','Jenipapo de Minas','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2648,'3135506','Jequeri','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2649,'3135605','Jequitaí','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2650,'3135704','Jequitibá','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2651,'3135803','Jequitinhonha','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2652,'3135902','Jesuânia','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2653,'3136009','Joaíma','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2654,'3136108','Joanésia','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2655,'3136207','João Monlevade','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2656,'3136306','João Pinheiro','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2657,'3136405','Joaquim Felício','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2658,'3136504','Jordânia','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2659,'3136520','José Gonçalves de Minas','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2660,'3136553','José Raydan','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2661,'3136579','Josenópolis','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2662,'3136603','Nova União','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2663,'3136652','Juatuba','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2664,'3136702','Juiz de Fora','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2665,'3136801','Juramento','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2666,'3136900','Juruaia','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2667,'3136959','Juvenília','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2668,'3137007','Ladainha','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2669,'3137106','Lagamar','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2670,'3137205','Lagoa da Prata','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2671,'3137304','Lagoa dos Patos','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2672,'3137403','Lagoa Dourada','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2673,'3137502','Lagoa Formosa','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2674,'3137536','Lagoa Grande','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2675,'3137601','Lagoa Santa','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2676,'3137700','Lajinha','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2677,'3137809','Lambari','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2678,'3137908','Lamim','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2679,'3138005','Laranjal','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2680,'3138104','Lassance','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2681,'3138203','Lavras','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2682,'3138302','Leandro Ferreira','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2683,'3138351','Leme do Prado','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2684,'3138401','Leopoldina','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2685,'3138500','Liberdade','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2686,'3138609','Lima Duarte','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2687,'3138625','Limeira do Oeste','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2688,'3138658','Lontra','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2689,'3138674','Luisburgo','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2690,'3138682','Luislândia','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2691,'3138708','Luminárias','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2692,'3138807','Luz','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2693,'3138906','Machacalis','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2694,'3139003','Machado','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2695,'3139102','Madre de Deus de Minas','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2696,'3139201','Malacacheta','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2697,'3139250','Mamonas','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2698,'3139300','Manga','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2699,'3139409','Manhuaçu','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2700,'3139508','Manhumirim','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2701,'3139607','Mantena','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2702,'3139706','Maravilhas','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2703,'3139805','Mar de Espanha','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2704,'3139904','Maria da Fé','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2705,'3140001','Mariana','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2706,'3140100','Marilac','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2707,'3140159','Mário Campos','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2708,'3140209','Maripá de Minas','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2709,'3140308','Marliéria','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2710,'3140407','Marmelópolis','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2711,'3140506','Martinho Campos','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2712,'3140530','Martins Soares','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2713,'3140555','Mata Verde','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2714,'3140605','Materlândia','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2715,'3140704','Mateus Leme','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2716,'3140803','Matias Barbosa','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2717,'3140852','Matias Cardoso','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2718,'3140902','Matipó','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2719,'3141009','Mato Verde','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2720,'3141108','Matozinhos','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2721,'3141207','Matutina','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2722,'3141306','Medeiros','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2723,'3141405','Medina','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2724,'3141504','Mendes Pimentel','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2725,'3141603','Mercês','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2726,'3141702','Mesquita','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2727,'3141801','Minas Novas','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2728,'3141900','Minduri','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2729,'3142007','Mirabela','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2730,'3142106','Miradouro','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2731,'3142205','Miraí','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2732,'3142254','Miravânia','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2733,'3142304','Moeda','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2734,'3142403','Moema','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2735,'3142502','Monjolos','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2736,'3142601','Monsenhor Paulo','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2737,'3142700','Montalvânia','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2738,'3142809','Monte Alegre de Minas','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2739,'3142908','Monte Azul','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2740,'3143005','Monte Belo','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2741,'3143104','Monte Carmelo','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2742,'3143153','Monte Formoso','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2743,'3143203','Monte Santo de Minas','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2744,'3143302','Montes Claros','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2745,'3143401','Monte Sião','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2746,'3143450','Montezuma','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2747,'3143500','Morada Nova de Minas','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2748,'3143609','Morro da Garça','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2749,'3143708','Morro do Pilar','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2750,'3143807','Munhoz','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2751,'3143906','Muriaé','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2752,'3144003','Mutum','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2753,'3144102','Muzambinho','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2754,'3144201','Nacip Raydan','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2755,'3144300','Nanuque','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2756,'3144359','Naque','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2757,'3144375','Natalândia','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2758,'3144409','Natércia','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2759,'3144508','Nazareno','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2760,'3144607','Nepomuceno','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2761,'3144656','Ninheira','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2762,'3144672','Nova Belém','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2763,'3144706','Nova Era','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2764,'3144805','Nova Lima','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2765,'3144904','Nova Módica','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2766,'3145000','Nova Ponte','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2767,'3145059','Nova Porteirinha','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2768,'3145109','Nova Resende','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2769,'3145208','Nova Serrana','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2770,'3145307','Novo Cruzeiro','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2771,'3145356','Novo Oriente de Minas','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2772,'3145372','Novorizonte','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2773,'3145406','Olaria','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2774,'3145455','Olhos-D\'Água','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2775,'3145505','Olímpio Noronha','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2776,'3145604','Oliveira','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2777,'3145703','Oliveira Fortes','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2778,'3145802','Onça de Pitangui','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2779,'3145851','Oratórios','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2780,'3145877','Orizânia','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2781,'3145901','Ouro Branco','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2782,'3146008','Ouro Fino','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2783,'3146107','Ouro Preto','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2784,'3146206','Ouro Verde de Minas','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2785,'3146255','Padre Carvalho','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2786,'3146305','Padre Paraíso','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2787,'3146404','Paineiras','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2788,'3146503','Pains','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2789,'3146552','Pai Pedro','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2790,'3146602','Paiva','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2791,'3146701','Palma','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2792,'3146750','Palmópolis','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2793,'3146909','Papagaios','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2794,'3147006','Paracatu','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2795,'3147105','Pará de Minas','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2796,'3147204','Paraguaçu','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2797,'3147303','Paraisópolis','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2798,'3147402','Paraopeba','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2799,'3147501','Passabém','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2800,'3147600','Passa Quatro','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2801,'3147709','Passa Tempo','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2802,'3147808','Passa-Vinte','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2803,'3147907','Passos','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2804,'3147956','Patis','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2805,'3148004','Patos de Minas','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2806,'3148103','Patrocínio','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2807,'3148202','Patrocínio do Muriaé','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2808,'3148301','Paula Cândido','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2809,'3148400','Paulistas','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2810,'3148509','Pavão','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2811,'3148608','Peçanha','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2812,'3148707','Pedra Azul','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2813,'3148756','Pedra Bonita','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2814,'3148806','Pedra do Anta','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2815,'3148905','Pedra do Indaiá','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2816,'3149002','Pedra Dourada','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2817,'3149101','Pedralva','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2818,'3149150','Pedras de Maria da Cruz','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2819,'3149200','Pedrinópolis','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2820,'3149309','Pedro Leopoldo','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2821,'3149408','Pedro Teixeira','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2822,'3149507','Pequeri','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2823,'3149606','Pequi','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2824,'3149705','Perdigão','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2825,'3149804','Perdizes','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2826,'3149903','Perdões','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2827,'3149952','Periquito','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2828,'3150000','Pescador','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2829,'3150109','Piau','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2830,'3150158','Piedade de Caratinga','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2831,'3150208','Piedade de Ponte Nova','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2832,'3150307','Piedade do Rio Grande','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2833,'3150406','Piedade dos Gerais','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2834,'3150505','Pimenta','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2835,'3150539','Pingo-D\'Água','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2836,'3150570','Pintópolis','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2837,'3150604','Piracema','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2838,'3150703','Pirajuba','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2839,'3150802','Piranga','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2840,'3150901','Piranguçu','MG','2024-09-03 10:31:08','2024-09-03 10:31:08'),(2841,'3151008','Piranguinho','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2842,'3151107','Pirapetinga','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2843,'3151206','Pirapora','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2844,'3151305','Piraúba','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2845,'3151404','Pitangui','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2846,'3151503','Piumhi','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2847,'3151602','Planura','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2848,'3151701','Poço Fundo','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2849,'3151800','Poços de Caldas','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2850,'3151909','Pocrane','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2851,'3152006','Pompéu','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2852,'3152105','Ponte Nova','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2853,'3152131','Ponto Chique','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2854,'3152170','Ponto dos Volantes','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2855,'3152204','Porteirinha','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2856,'3152303','Porto Firme','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2857,'3152402','Poté','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2858,'3152501','Pouso Alegre','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2859,'3152600','Pouso Alto','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2860,'3152709','Prados','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2861,'3152808','Prata','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2862,'3152907','Pratápolis','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2863,'3153004','Pratinha','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2864,'3153103','Presidente Bernardes','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2865,'3153202','Presidente Juscelino','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2866,'3153301','Presidente Kubitschek','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2867,'3153400','Presidente Olegário','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2868,'3153509','Alto Jequitibá','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2869,'3153608','Prudente de Morais','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2870,'3153707','Quartel Geral','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2871,'3153806','Queluzito','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2872,'3153905','Raposos','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2873,'3154002','Raul Soares','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2874,'3154101','Recreio','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2875,'3154150','Reduto','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2876,'3154200','Resende Costa','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2877,'3154309','Resplendor','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2878,'3154408','Ressaquinha','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2879,'3154457','Riachinho','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2880,'3154507','Riacho dos Machados','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2881,'3154606','Ribeirão das Neves','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2882,'3154705','Ribeirão Vermelho','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2883,'3154804','Rio Acima','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2884,'3154903','Rio Casca','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2885,'3155009','Rio Doce','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2886,'3155108','Rio do Prado','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2887,'3155207','Rio Espera','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2888,'3155306','Rio Manso','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2889,'3155405','Rio Novo','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2890,'3155504','Rio Paranaíba','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2891,'3155603','Rio Pardo de Minas','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2892,'3155702','Rio Piracicaba','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2893,'3155801','Rio Pomba','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2894,'3155900','Rio Preto','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2895,'3156007','Rio Vermelho','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2896,'3156106','Ritápolis','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2897,'3156205','Rochedo de Minas','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2898,'3156304','Rodeiro','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2899,'3156403','Romaria','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2900,'3156452','Rosário da Limeira','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2901,'3156502','Rubelita','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2902,'3156601','Rubim','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2903,'3156700','Sabará','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2904,'3156809','Sabinópolis','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2905,'3156908','Sacramento','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2906,'3157005','Salinas','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2907,'3157104','Salto da Divisa','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2908,'3157203','Santa Bárbara','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2909,'3157252','Santa Bárbara do Leste','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2910,'3157278','Santa Bárbara do Monte Verde','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2911,'3157302','Santa Bárbara do Tugúrio','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2912,'3157336','Santa Cruz de Minas','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2913,'3157377','Santa Cruz de Salinas','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2914,'3157401','Santa Cruz do Escalvado','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2915,'3157500','Santa Efigênia de Minas','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2916,'3157609','Santa Fé de Minas','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2917,'3157658','Santa Helena de Minas','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2918,'3157708','Santa Juliana','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2919,'3157807','Santa Luzia','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2920,'3157906','Santa Margarida','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2921,'3158003','Santa Maria de Itabira','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2922,'3158102','Santa Maria do Salto','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2923,'3158201','Santa Maria do Suaçuí','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2924,'3158300','Santana da Vargem','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2925,'3158409','Santana de Cataguases','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2926,'3158508','Santana de Pirapama','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2927,'3158607','Santana do Deserto','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2928,'3158706','Santana do Garambéu','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2929,'3158805','Santana do Jacaré','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2930,'3158904','Santana do Manhuaçu','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2931,'3158953','Santana do Paraíso','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2932,'3159001','Santana do Riacho','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2933,'3159100','Santana dos Montes','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2934,'3159209','Santa Rita de Caldas','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2935,'3159308','Santa Rita de Jacutinga','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2936,'3159357','Santa Rita de Minas','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2937,'3159407','Santa Rita de Ibitipoca','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2938,'3159506','Santa Rita do Itueto','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2939,'3159605','Santa Rita do Sapucaí','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2940,'3159704','Santa Rosa da Serra','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2941,'3159803','Santa Vitória','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2942,'3159902','Santo Antônio do Amparo','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2943,'3160009','Santo Antônio do Aventureiro','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2944,'3160108','Santo Antônio do Grama','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2945,'3160207','Santo Antônio do Itambé','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2946,'3160306','Santo Antônio do Jacinto','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2947,'3160405','Santo Antônio do Monte','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2948,'3160454','Santo Antônio do Retiro','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2949,'3160504','Santo Antônio do Rio Abaixo','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2950,'3160603','Santo Hipólito','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2951,'3160702','Santos Dumont','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2952,'3160801','São Bento Abade','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2953,'3160900','São Brás do Suaçuí','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2954,'3160959','São Domingos das Dores','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2955,'3161007','São Domingos do Prata','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2956,'3161056','São Félix de Minas','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2957,'3161106','São Francisco','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2958,'3161205','São Francisco de Paula','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2959,'3161304','São Francisco de Sales','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2960,'3161403','São Francisco do Glória','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2961,'3161502','São Geraldo','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2962,'3161601','São Geraldo da Piedade','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2963,'3161650','São Geraldo do Baixio','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2964,'3161700','São Gonçalo do Abaeté','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2965,'3161809','São Gonçalo do Pará','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2966,'3161908','São Gonçalo do Rio Abaixo','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2967,'3162005','São Gonçalo do Sapucaí','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2968,'3162104','São Gotardo','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2969,'3162203','São João Batista do Glória','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2970,'3162252','São João da Lagoa','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2971,'3162302','São João da Mata','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2972,'3162401','São João da Ponte','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2973,'3162450','São João das Missões','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2974,'3162500','São João del Rei','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2975,'3162559','São João do Manhuaçu','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2976,'3162575','São João do Manteninha','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2977,'3162609','São João do Oriente','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2978,'3162658','São João do Pacuí','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2979,'3162708','São João do Paraíso','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2980,'3162807','São João Evangelista','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2981,'3162906','São João Nepomuceno','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2982,'3162922','São Joaquim de Bicas','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2983,'3162948','São José da Barra','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2984,'3162955','São José da Lapa','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2985,'3163003','São José da Safira','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2986,'3163102','São José da Varginha','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2987,'3163201','São José do Alegre','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2988,'3163300','São José do Divino','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2989,'3163409','São José do Goiabal','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2990,'3163508','São José do Jacuri','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2991,'3163607','São José do Mantimento','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2992,'3163706','São Lourenço','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2993,'3163805','São Miguel do Anta','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2994,'3163904','São Pedro da União','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2995,'3164001','São Pedro dos Ferros','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2996,'3164100','São Pedro do Suaçuí','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2997,'3164209','São Romão','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2998,'3164308','São Roque de Minas','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(2999,'3164407','São Sebastião da Bela Vista','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3000,'3164431','São Sebastião da Vargem Alegre','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3001,'3164472','São Sebastião do Anta','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3002,'3164506','São Sebastião do Maranhão','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3003,'3164605','São Sebastião do Oeste','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3004,'3164704','São Sebastião do Paraíso','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3005,'3164803','São Sebastião do Rio Preto','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3006,'3164902','São Sebastião do Rio Verde','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3007,'3165008','São Tiago','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3008,'3165107','São Tomás de Aquino','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3009,'3165206','São Thomé das Letras','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3010,'3165305','São Vicente de Minas','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3011,'3165404','Sapucaí-Mirim','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3012,'3165503','Sardoá','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3013,'3165537','Sarzedo','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3014,'3165552','Setubinha','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3015,'3165560','Sem-Peixe','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3016,'3165578','Senador Amaral','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3017,'3165602','Senador Cortes','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3018,'3165701','Senador Firmino','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3019,'3165800','Senador José Bento','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3020,'3165909','Senador Modestino Gonçalves','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3021,'3166006','Senhora de Oliveira','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3022,'3166105','Senhora do Porto','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3023,'3166204','Senhora dos Remédios','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3024,'3166303','Sericita','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3025,'3166402','Seritinga','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3026,'3166501','Serra Azul de Minas','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3027,'3166600','Serra da Saudade','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3028,'3166709','Serra dos Aimorés','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3029,'3166808','Serra do Salitre','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3030,'3166907','Serrania','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3031,'3166956','Serranópolis de Minas','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3032,'3167004','Serranos','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3033,'3167103','Serro','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3034,'3167202','Sete Lagoas','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3035,'3167301','Silveirânia','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3036,'3167400','Silvianópolis','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3037,'3167509','Simão Pereira','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3038,'3167608','Simonésia','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3039,'3167707','Sobrália','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3040,'3167806','Soledade de Minas','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3041,'3167905','Tabuleiro','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3042,'3168002','Taiobeiras','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3043,'3168051','Taparuba','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3044,'3168101','Tapira','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3045,'3168200','Tapiraí','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3046,'3168309','Taquaraçu de Minas','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3047,'3168408','Tarumirim','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3048,'3168507','Teixeiras','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3049,'3168606','Teófilo Otoni','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3050,'3168705','Timóteo','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3051,'3168804','Tiradentes','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3052,'3168903','Tiros','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3053,'3169000','Tocantins','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3054,'3169059','Tocos do Moji','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3055,'3169109','Toledo','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3056,'3169208','Tombos','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3057,'3169307','Três Corações','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3058,'3169356','Três Marias','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3059,'3169406','Três Pontas','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3060,'3169505','Tumiritinga','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3061,'3169604','Tupaciguara','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3062,'3169703','Turmalina','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3063,'3169802','Turvolândia','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3064,'3169901','Ubá','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3065,'3170008','Ubaí','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3066,'3170057','Ubaporanga','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3067,'3170107','Uberaba','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3068,'3170206','Uberlândia','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3069,'3170305','Umburatiba','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3070,'3170404','Unaí','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3071,'3170438','União de Minas','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3072,'3170479','Uruana de Minas','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3073,'3170503','Urucânia','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3074,'3170529','Urucuia','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3075,'3170578','Vargem Alegre','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3076,'3170602','Vargem Bonita','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3077,'3170651','Vargem Grande do Rio Pardo','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3078,'3170701','Varginha','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3079,'3170750','Varjão de Minas','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3080,'3170800','Várzea da Palma','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3081,'3170909','Varzelândia','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3082,'3171006','Vazante','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3083,'3171030','Verdelândia','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3084,'3171071','Veredinha','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3085,'3171105','Veríssimo','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3086,'3171154','Vermelho Novo','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3087,'3171204','Vespasiano','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3088,'3171303','Viçosa','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3089,'3171402','Vieiras','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3090,'3171501','Mathias Lobato','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3091,'3171600','Virgem da Lapa','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3092,'3171709','Virgínia','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3093,'3171808','Virginópolis','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3094,'3171907','Virgolândia','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3095,'3172004','Visconde do Rio Branco','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3096,'3172103','Volta Grande','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3097,'3172202','Wenceslau Braz','MG','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3098,'3200102','Afonso Cláudio','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3099,'3200136','Águia Branca','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3100,'3200169','Água Doce do Norte','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3101,'3200201','Alegre','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3102,'3200300','Alfredo Chaves','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3103,'3200359','Alto Rio Novo','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3104,'3200409','Anchieta','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3105,'3200508','Apiacá','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3106,'3200607','Aracruz','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3107,'3200706','Atilio Vivacqua','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3108,'3200805','Baixo Guandu','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3109,'3200904','Barra de São Francisco','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3110,'3201001','Boa Esperança','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3111,'3201100','Bom Jesus do Norte','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3112,'3201159','Brejetuba','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3113,'3201209','Cachoeiro de Itapemirim','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3114,'3201308','Cariacica','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3115,'3201407','Castelo','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3116,'3201506','Colatina','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3117,'3201605','Conceição da Barra','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3118,'3201704','Conceição do Castelo','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3119,'3201803','Divino de São Lourenço','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3120,'3201902','Domingos Martins','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3121,'3202009','Dores do Rio Preto','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3122,'3202108','Ecoporanga','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3123,'3202207','Fundão','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3124,'3202256','Governador Lindenberg','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3125,'3202306','Guaçuí','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3126,'3202405','Guarapari','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3127,'3202454','Ibatiba','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3128,'3202504','Ibiraçu','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3129,'3202553','Ibitirama','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3130,'3202603','Iconha','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3131,'3202652','Irupi','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3132,'3202702','Itaguaçu','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3133,'3202801','Itapemirim','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3134,'3202900','Itarana','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3135,'3203007','Iúna','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3136,'3203056','Jaguaré','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3137,'3203106','Jerônimo Monteiro','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3138,'3203130','João Neiva','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3139,'3203163','Laranja da Terra','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3140,'3203205','Linhares','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3141,'3203304','Mantenópolis','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3142,'3203320','Marataízes','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3143,'3203346','Marechal Floriano','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3144,'3203353','Marilândia','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3145,'3203403','Mimoso do Sul','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3146,'3203502','Montanha','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3147,'3203601','Mucurici','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3148,'3203700','Muniz Freire','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3149,'3203809','Muqui','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3150,'3203908','Nova Venécia','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3151,'3204005','Pancas','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3152,'3204054','Pedro Canário','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3153,'3204104','Pinheiros','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3154,'3204203','Piúma','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3155,'3204252','Ponto Belo','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3156,'3204302','Presidente Kennedy','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3157,'3204351','Rio Bananal','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3158,'3204401','Rio Novo do Sul','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3159,'3204500','Santa Leopoldina','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3160,'3204559','Santa Maria de Jetibá','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3161,'3204609','Santa Teresa','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3162,'3204658','São Domingos do Norte','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3163,'3204708','São Gabriel da Palha','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3164,'3204807','São José do Calçado','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3165,'3204906','São Mateus','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3166,'3204955','São Roque do Canaã','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3167,'3205002','Serra','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3168,'3205010','Sooretama','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3169,'3205036','Vargem Alta','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3170,'3205069','Venda Nova do Imigrante','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3171,'3205101','Viana','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3172,'3205150','Vila Pavão','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3173,'3205176','Vila Valério','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3174,'3205200','Vila Velha','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3175,'3205309','Vitória','ES','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3176,'3300100','Angra dos Reis','RJ','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3177,'3300159','Aperibé','RJ','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3178,'3300209','Araruama','RJ','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3179,'3300225','Areal','RJ','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3180,'3300233','Armação dos Búzios','RJ','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3181,'3300258','Arraial do Cabo','RJ','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3182,'3300308','Barra do Piraí','RJ','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3183,'3300407','Barra Mansa','RJ','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3184,'3300456','Belford Roxo','RJ','2024-09-03 10:31:09','2024-09-03 10:31:09'),(3185,'3300506','Bom Jardim','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3186,'3300605','Bom Jesus do Itabapoana','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3187,'3300704','Cabo Frio','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3188,'3300803','Cachoeiras de Macacu','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3189,'3300902','Cambuci','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3190,'3300936','Carapebus','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3191,'3300951','Comendador Levy Gasparian','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3192,'3301009','Campos dos Goytacazes','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3193,'3301108','Cantagalo','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3194,'3301157','Cardoso Moreira','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3195,'3301207','Carmo','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3196,'3301306','Casimiro de Abreu','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3197,'3301405','Conceição de Macabu','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3198,'3301504','Cordeiro','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3199,'3301603','Duas Barras','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3200,'3301702','Duque de Caxias','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3201,'3301801','Engenheiro Paulo de Frontin','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3202,'3301850','Guapimirim','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3203,'3301876','Iguaba Grande','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3204,'3301900','Itaboraí','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3205,'3302007','Itaguaí','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3206,'3302056','Italva','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3207,'3302106','Itaocara','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3208,'3302205','Itaperuna','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3209,'3302254','Itatiaia','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3210,'3302270','Japeri','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3211,'3302304','Laje do Muriaé','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3212,'3302403','Macaé','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3213,'3302452','Macuco','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3214,'3302502','Magé','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3215,'3302601','Mangaratiba','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3216,'3302700','Maricá','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3217,'3302809','Mendes','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3218,'3302858','Mesquita','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3219,'3302908','Miguel Pereira','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3220,'3303005','Miracema','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3221,'3303104','Natividade','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3222,'3303203','Nilópolis','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3223,'3303302','Niterói','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3224,'3303401','Nova Friburgo','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3225,'3303500','Nova Iguaçu','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3226,'3303609','Paracambi','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3227,'3303708','Paraíba do Sul','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3228,'3303807','Paraty','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3229,'3303856','Paty do Alferes','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3230,'3303906','Petrópolis','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3231,'3303955','Pinheiral','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3232,'3304003','Piraí','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3233,'3304102','Porciúncula','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3234,'3304110','Porto Real','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3235,'3304128','Quatis','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3236,'3304144','Queimados','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3237,'3304151','Quissamã','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3238,'3304201','Resende','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3239,'3304300','Rio Bonito','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3240,'3304409','Rio Claro','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3241,'3304508','Rio das Flores','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3242,'3304524','Rio das Ostras','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3243,'3304557','Rio de Janeiro','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3244,'3304607','Santa Maria Madalena','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3245,'3304706','Santo Antônio de Pádua','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3246,'3304755','São Francisco de Itabapoana','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3247,'3304805','São Fidélis','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3248,'3304904','São Gonçalo','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3249,'3305000','São João da Barra','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3250,'3305109','São João de Meriti','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3251,'3305133','São José de Ubá','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3252,'3305158','São José do Vale do Rio Preto','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3253,'3305208','São Pedro da Aldeia','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3254,'3305307','São Sebastião do Alto','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3255,'3305406','Sapucaia','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3256,'3305505','Saquarema','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3257,'3305554','Seropédica','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3258,'3305604','Silva Jardim','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3259,'3305703','Sumidouro','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3260,'3305752','Tanguá','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3261,'3305802','Teresópolis','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3262,'3305901','Trajano de Moraes','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3263,'3306008','Três Rios','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3264,'3306107','Valença','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3265,'3306156','Varre-Sai','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3266,'3306206','Vassouras','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3267,'3306305','Volta Redonda','RJ','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3268,'3500105','Adamantina','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3269,'3500204','Adolfo','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3270,'3500303','Aguaí','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3271,'3500402','Águas da Prata','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3272,'3500501','Águas de Lindóia','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3273,'3500550','Águas de Santa Bárbara','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3274,'3500600','Águas de São Pedro','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3275,'3500709','Agudos','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3276,'3500758','Alambari','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3277,'3500808','Alfredo Marcondes','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3278,'3500907','Altair','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3279,'3501004','Altinópolis','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3280,'3501103','Alto Alegre','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3281,'3501152','Alumínio','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3282,'3501202','Álvares Florence','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3283,'3501301','Álvares Machado','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3284,'3501400','Álvaro de Carvalho','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3285,'3501509','Alvinlândia','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3286,'3501608','Americana','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3287,'3501707','Américo Brasiliense','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3288,'3501806','Américo de Campos','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3289,'3501905','Amparo','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3290,'3502002','Analândia','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3291,'3502101','Andradina','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3292,'3502200','Angatuba','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3293,'3502309','Anhembi','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3294,'3502408','Anhumas','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3295,'3502507','Aparecida','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3296,'3502606','Aparecida D\'Oeste','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3297,'3502705','Apiaí','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3298,'3502754','Araçariguama','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3299,'3502804','Araçatuba','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3300,'3502903','Araçoiaba da Serra','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3301,'3503000','Aramina','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3302,'3503109','Arandu','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3303,'3503158','Arapeí','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3304,'3503208','Araraquara','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3305,'3503307','Araras','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3306,'3503356','Arco-Íris','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3307,'3503406','Arealva','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3308,'3503505','Areias','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3309,'3503604','Areiópolis','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3310,'3503703','Ariranha','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3311,'3503802','Artur Nogueira','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3312,'3503901','Arujá','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3313,'3503950','Aspásia','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3314,'3504008','Assis','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3315,'3504107','Atibaia','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3316,'3504206','Auriflama','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3317,'3504305','Avaí','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3318,'3504404','Avanhandava','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3319,'3504503','Avaré','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3320,'3504602','Bady Bassitt','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3321,'3504701','Balbinos','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3322,'3504800','Bálsamo','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3323,'3504909','Bananal','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3324,'3505005','Barão de Antonina','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3325,'3505104','Barbosa','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3326,'3505203','Bariri','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3327,'3505302','Barra Bonita','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3328,'3505351','Barra do Chapéu','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3329,'3505401','Barra do Turvo','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3330,'3505500','Barretos','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3331,'3505609','Barrinha','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3332,'3505708','Barueri','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3333,'3505807','Bastos','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3334,'3505906','Batatais','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3335,'3506003','Bauru','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3336,'3506102','Bebedouro','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3337,'3506201','Bento de Abreu','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3338,'3506300','Bernardino de Campos','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3339,'3506359','Bertioga','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3340,'3506409','Bilac','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3341,'3506508','Birigui','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3342,'3506607','Biritiba-Mirim','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3343,'3506706','Boa Esperança do Sul','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3344,'3506805','Bocaina','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3345,'3506904','Bofete','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3346,'3507001','Boituva','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3347,'3507100','Bom Jesus dos Perdões','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3348,'3507159','Bom Sucesso de Itararé','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3349,'3507209','Borá','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3350,'3507308','Boracéia','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3351,'3507407','Borborema','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3352,'3507456','Borebi','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3353,'3507506','Botucatu','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3354,'3507605','Bragança Paulista','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3355,'3507704','Braúna','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3356,'3507753','Brejo Alegre','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3357,'3507803','Brodowski','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3358,'3507902','Brotas','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3359,'3508009','Buri','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3360,'3508108','Buritama','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3361,'3508207','Buritizal','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3362,'3508306','Cabrália Paulista','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3363,'3508405','Cabreúva','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3364,'3508504','Caçapava','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3365,'3508603','Cachoeira Paulista','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3366,'3508702','Caconde','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3367,'3508801','Cafelândia','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3368,'3508900','Caiabu','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3369,'3509007','Caieiras','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3370,'3509106','Caiuá','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3371,'3509205','Cajamar','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3372,'3509254','Cajati','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3373,'3509304','Cajobi','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3374,'3509403','Cajuru','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3375,'3509452','Campina do Monte Alegre','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3376,'3509502','Campinas','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3377,'3509601','Campo Limpo Paulista','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3378,'3509700','Campos do Jordão','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3379,'3509809','Campos Novos Paulista','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3380,'3509908','Cananéia','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3381,'3509957','Canas','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3382,'3510005','Cândido Mota','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3383,'3510104','Cândido Rodrigues','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3384,'3510153','Canitar','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3385,'3510203','Capão Bonito','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3386,'3510302','Capela do Alto','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3387,'3510401','Capivari','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3388,'3510500','Caraguatatuba','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3389,'3510609','Carapicuíba','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3390,'3510708','Cardoso','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3391,'3510807','Casa Branca','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3392,'3510906','Cássia dos Coqueiros','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3393,'3511003','Castilho','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3394,'3511102','Catanduva','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3395,'3511201','Catiguá','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3396,'3511300','Cedral','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3397,'3511409','Cerqueira César','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3398,'3511508','Cerquilho','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3399,'3511607','Cesário Lange','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3400,'3511706','Charqueada','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3401,'3511904','Clementina','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3402,'3512001','Colina','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3403,'3512100','Colômbia','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3404,'3512209','Conchal','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3405,'3512308','Conchas','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3406,'3512407','Cordeirópolis','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3407,'3512506','Coroados','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3408,'3512605','Coronel Macedo','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3409,'3512704','Corumbataí','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3410,'3512803','Cosmópolis','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3411,'3512902','Cosmorama','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3412,'3513009','Cotia','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3413,'3513108','Cravinhos','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3414,'3513207','Cristais Paulista','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3415,'3513306','Cruzália','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3416,'3513405','Cruzeiro','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3417,'3513504','Cubatão','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3418,'3513603','Cunha','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3419,'3513702','Descalvado','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3420,'3513801','Diadema','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3421,'3513850','Dirce Reis','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3422,'3513900','Divinolândia','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3423,'3514007','Dobrada','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3424,'3514106','Dois Córregos','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3425,'3514205','Dolcinópolis','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3426,'3514304','Dourado','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3427,'3514403','Dracena','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3428,'3514502','Duartina','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3429,'3514601','Dumont','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3430,'3514700','Echaporã','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3431,'3514809','Eldorado','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3432,'3514908','Elias Fausto','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3433,'3514924','Elisiário','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3434,'3514957','Embaúba','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3435,'3515004','Embu das Artes','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3436,'3515103','Embu-Guaçu','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3437,'3515129','Emilianópolis','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3438,'3515152','Engenheiro Coelho','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3439,'3515186','Espírito Santo do Pinhal','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3440,'3515194','Espírito Santo do Turvo','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3441,'3515202','Estrela D\'Oeste','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3442,'3515301','Estrela do Norte','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3443,'3515350','Euclides da Cunha Paulista','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3444,'3515400','Fartura','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3445,'3515509','Fernandópolis','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3446,'3515608','Fernando Prestes','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3447,'3515657','Fernão','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3448,'3515707','Ferraz de Vasconcelos','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3449,'3515806','Flora Rica','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3450,'3515905','Floreal','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3451,'3516002','Flórida Paulista','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3452,'3516101','Florínia','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3453,'3516200','Franca','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3454,'3516309','Francisco Morato','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3455,'3516408','Franco da Rocha','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3456,'3516507','Gabriel Monteiro','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3457,'3516606','Gália','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3458,'3516705','Garça','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3459,'3516804','Gastão Vidigal','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3460,'3516853','Gavião Peixoto','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3461,'3516903','General Salgado','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3462,'3517000','Getulina','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3463,'3517109','Glicério','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3464,'3517208','Guaiçara','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3465,'3517307','Guaimbê','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3466,'3517406','Guaíra','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3467,'3517505','Guapiaçu','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3468,'3517604','Guapiara','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3469,'3517703','Guará','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3470,'3517802','Guaraçaí','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3471,'3517901','Guaraci','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3472,'3518008','Guarani D\'Oeste','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3473,'3518107','Guarantã','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3474,'3518206','Guararapes','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3475,'3518305','Guararema','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3476,'3518404','Guaratinguetá','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3477,'3518503','Guareí','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3478,'3518602','Guariba','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3479,'3518701','Guarujá','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3480,'3518800','Guarulhos','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3481,'3518859','Guatapará','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3482,'3518909','Guzolândia','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3483,'3519006','Herculândia','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3484,'3519055','Holambra','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3485,'3519071','Hortolândia','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3486,'3519105','Iacanga','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3487,'3519204','Iacri','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3488,'3519253','Iaras','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3489,'3519303','Ibaté','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3490,'3519402','Ibirá','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3491,'3519501','Ibirarema','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3492,'3519600','Ibitinga','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3493,'3519709','Ibiúna','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3494,'3519808','Icém','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3495,'3519907','Iepê','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3496,'3520004','Igaraçu do Tietê','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3497,'3520103','Igarapava','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3498,'3520202','Igaratá','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3499,'3520301','Iguape','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3500,'3520400','Ilhabela','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3501,'3520426','Ilha Comprida','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3502,'3520442','Ilha Solteira','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3503,'3520509','Indaiatuba','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3504,'3520608','Indiana','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3505,'3520707','Indiaporã','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3506,'3520806','Inúbia Paulista','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3507,'3520905','Ipaussu','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3508,'3521002','Iperó','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3509,'3521101','Ipeúna','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3510,'3521150','Ipiguá','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3511,'3521200','Iporanga','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3512,'3521309','Ipuã','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3513,'3521408','Iracemápolis','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3514,'3521507','Irapuã','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3515,'3521606','Irapuru','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3516,'3521705','Itaberá','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3517,'3521804','Itaí','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3518,'3521903','Itajobi','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3519,'3522000','Itaju','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3520,'3522109','Itanhaém','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3521,'3522158','Itaóca','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3522,'3522208','Itapecerica da Serra','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3523,'3522307','Itapetininga','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3524,'3522406','Itapeva','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3525,'3522505','Itapevi','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3526,'3522604','Itapira','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3527,'3522653','Itapirapuã Paulista','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3528,'3522703','Itápolis','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3529,'3522802','Itaporanga','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3530,'3522901','Itapuí','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3531,'3523008','Itapura','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3532,'3523107','Itaquaquecetuba','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3533,'3523206','Itararé','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3534,'3523305','Itariri','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3535,'3523404','Itatiba','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3536,'3523503','Itatinga','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3537,'3523602','Itirapina','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3538,'3523701','Itirapuã','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3539,'3523800','Itobi','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3540,'3523909','Itu','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3541,'3524006','Itupeva','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3542,'3524105','Ituverava','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3543,'3524204','Jaborandi','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3544,'3524303','Jaboticabal','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3545,'3524402','Jacareí','SP','2024-09-03 10:31:10','2024-09-03 10:31:10'),(3546,'3524501','Jaci','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3547,'3524600','Jacupiranga','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3548,'3524709','Jaguariúna','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3549,'3524808','Jales','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3550,'3524907','Jambeiro','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3551,'3525003','Jandira','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3552,'3525102','Jardinópolis','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3553,'3525201','Jarinu','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3554,'3525300','Jaú','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3555,'3525409','Jeriquara','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3556,'3525508','Joanópolis','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3557,'3525607','João Ramalho','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3558,'3525706','José Bonifácio','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3559,'3525805','Júlio Mesquita','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3560,'3525854','Jumirim','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3561,'3525904','Jundiaí','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3562,'3526001','Junqueirópolis','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3563,'3526100','Juquiá','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3564,'3526209','Juquitiba','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3565,'3526308','Lagoinha','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3566,'3526407','Laranjal Paulista','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3567,'3526506','Lavínia','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3568,'3526605','Lavrinhas','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3569,'3526704','Leme','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3570,'3526803','Lençóis Paulista','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3571,'3526902','Limeira','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3572,'3527009','Lindóia','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3573,'3527108','Lins','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3574,'3527207','Lorena','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3575,'3527256','Lourdes','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3576,'3527306','Louveira','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3577,'3527405','Lucélia','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3578,'3527504','Lucianópolis','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3579,'3527603','Luís Antônio','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3580,'3527702','Luiziânia','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3581,'3527801','Lupércio','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3582,'3527900','Lutécia','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3583,'3528007','Macatuba','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3584,'3528106','Macaubal','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3585,'3528205','Macedônia','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3586,'3528304','Magda','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3587,'3528403','Mairinque','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3588,'3528502','Mairiporã','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3589,'3528601','Manduri','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3590,'3528700','Marabá Paulista','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3591,'3528809','Maracaí','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3592,'3528858','Marapoama','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3593,'3528908','Mariápolis','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3594,'3529005','Marília','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3595,'3529104','Marinópolis','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3596,'3529203','Martinópolis','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3597,'3529302','Matão','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3598,'3529401','Mauá','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3599,'3529500','Mendonça','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3600,'3529609','Meridiano','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3601,'3529658','Mesópolis','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3602,'3529708','Miguelópolis','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3603,'3529807','Mineiros do Tietê','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3604,'3529906','Miracatu','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3605,'3530003','Mira Estrela','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3606,'3530102','Mirandópolis','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3607,'3530201','Mirante do Paranapanema','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3608,'3530300','Mirassol','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3609,'3530409','Mirassolândia','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3610,'3530508','Mococa','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3611,'3530607','Mogi das Cruzes','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3612,'3530706','Mogi Guaçu','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3613,'3530805','Moji Mirim','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3614,'3530904','Mombuca','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3615,'3531001','Monções','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3616,'3531100','Mongaguá','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3617,'3531209','Monte Alegre do Sul','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3618,'3531308','Monte Alto','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3619,'3531407','Monte Aprazível','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3620,'3531506','Monte Azul Paulista','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3621,'3531605','Monte Castelo','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3622,'3531704','Monteiro Lobato','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3623,'3531803','Monte Mor','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3624,'3531902','Morro Agudo','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3625,'3532009','Morungaba','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3626,'3532058','Motuca','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3627,'3532108','Murutinga do Sul','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3628,'3532157','Nantes','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3629,'3532207','Narandiba','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3630,'3532306','Natividade da Serra','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3631,'3532405','Nazaré Paulista','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3632,'3532504','Neves Paulista','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3633,'3532603','Nhandeara','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3634,'3532702','Nipoã','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3635,'3532801','Nova Aliança','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3636,'3532827','Nova Campina','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3637,'3532843','Nova Canaã Paulista','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3638,'3532868','Nova Castilho','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3639,'3532900','Nova Europa','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3640,'3533007','Nova Granada','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3641,'3533106','Nova Guataporanga','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3642,'3533205','Nova Independência','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3643,'3533254','Novais','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3644,'3533304','Nova Luzitânia','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3645,'3533403','Nova Odessa','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3646,'3533502','Novo Horizonte','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3647,'3533601','Nuporanga','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3648,'3533700','Ocauçu','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3649,'3533809','Óleo','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3650,'3533908','Olímpia','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3651,'3534005','Onda Verde','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3652,'3534104','Oriente','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3653,'3534203','Orindiúva','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3654,'3534302','Orlândia','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3655,'3534401','Osasco','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3656,'3534500','Oscar Bressane','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3657,'3534609','Osvaldo Cruz','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3658,'3534708','Ourinhos','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3659,'3534757','Ouroeste','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3660,'3534807','Ouro Verde','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3661,'3534906','Pacaembu','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3662,'3535002','Palestina','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3663,'3535101','Palmares Paulista','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3664,'3535200','Palmeira D\'Oeste','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3665,'3535309','Palmital','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3666,'3535408','Panorama','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3667,'3535507','Paraguaçu Paulista','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3668,'3535606','Paraibuna','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3669,'3535705','Paraíso','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3670,'3535804','Paranapanema','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3671,'3535903','Paranapuã','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3672,'3536000','Parapuã','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3673,'3536109','Pardinho','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3674,'3536208','Pariquera-Açu','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3675,'3536257','Parisi','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3676,'3536307','Patrocínio Paulista','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3677,'3536406','Paulicéia','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3678,'3536505','Paulínia','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3679,'3536570','Paulistânia','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3680,'3536604','Paulo de Faria','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3681,'3536703','Pederneiras','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3682,'3536802','Pedra Bela','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3683,'3536901','Pedranópolis','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3684,'3537008','Pedregulho','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3685,'3537107','Pedreira','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3686,'3537156','Pedrinhas Paulista','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3687,'3537206','Pedro de Toledo','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3688,'3537305','Penápolis','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3689,'3537404','Pereira Barreto','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3690,'3537503','Pereiras','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3691,'3537602','Peruíbe','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3692,'3537701','Piacatu','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3693,'3537800','Piedade','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3694,'3537909','Pilar do Sul','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3695,'3538006','Pindamonhangaba','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3696,'3538105','Pindorama','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3697,'3538204','Pinhalzinho','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3698,'3538303','Piquerobi','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3699,'3538501','Piquete','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3700,'3538600','Piracaia','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3701,'3538709','Piracicaba','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3702,'3538808','Piraju','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3703,'3538907','Pirajuí','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3704,'3539004','Pirangi','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3705,'3539103','Pirapora do Bom Jesus','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3706,'3539202','Pirapozinho','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3707,'3539301','Pirassununga','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3708,'3539400','Piratininga','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3709,'3539509','Pitangueiras','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3710,'3539608','Planalto','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3711,'3539707','Platina','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3712,'3539806','Poá','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3713,'3539905','Poloni','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3714,'3540002','Pompéia','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3715,'3540101','Pongaí','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3716,'3540200','Pontal','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3717,'3540259','Pontalinda','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3718,'3540309','Pontes Gestal','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3719,'3540408','Populina','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3720,'3540507','Porangaba','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3721,'3540606','Porto Feliz','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3722,'3540705','Porto Ferreira','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3723,'3540754','Potim','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3724,'3540804','Potirendaba','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3725,'3540853','Pracinha','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3726,'3540903','Pradópolis','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3727,'3541000','Praia Grande','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3728,'3541059','Pratânia','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3729,'3541109','Presidente Alves','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3730,'3541208','Presidente Bernardes','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3731,'3541307','Presidente Epitácio','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3732,'3541406','Presidente Prudente','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3733,'3541505','Presidente Venceslau','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3734,'3541604','Promissão','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3735,'3541653','Quadra','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3736,'3541703','Quatá','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3737,'3541802','Queiroz','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3738,'3541901','Queluz','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3739,'3542008','Quintana','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3740,'3542107','Rafard','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3741,'3542206','Rancharia','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3742,'3542305','Redenção da Serra','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3743,'3542404','Regente Feijó','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3744,'3542503','Reginópolis','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3745,'3542602','Registro','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3746,'3542701','Restinga','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3747,'3542800','Ribeira','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3748,'3542909','Ribeirão Bonito','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3749,'3543006','Ribeirão Branco','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3750,'3543105','Ribeirão Corrente','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3751,'3543204','Ribeirão do Sul','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3752,'3543238','Ribeirão dos Índios','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3753,'3543253','Ribeirão Grande','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3754,'3543303','Ribeirão Pires','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3755,'3543402','Ribeirão Preto','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3756,'3543501','Riversul','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3757,'3543600','Rifaina','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3758,'3543709','Rincão','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3759,'3543808','Rinópolis','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3760,'3543907','Rio Claro','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3761,'3544004','Rio das Pedras','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3762,'3544103','Rio Grande da Serra','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3763,'3544202','Riolândia','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3764,'3544251','Rosana','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3765,'3544301','Roseira','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3766,'3544400','Rubiácea','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3767,'3544509','Rubinéia','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3768,'3544608','Sabino','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3769,'3544707','Sagres','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3770,'3544806','Sales','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3771,'3544905','Sales Oliveira','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3772,'3545001','Salesópolis','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3773,'3545100','Salmourão','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3774,'3545159','Saltinho','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3775,'3545209','Salto','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3776,'3545308','Salto de Pirapora','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3777,'3545407','Salto Grande','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3778,'3545506','Sandovalina','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3779,'3545605','Santa Adélia','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3780,'3545704','Santa Albertina','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3781,'3545803','Santa Bárbara D\'Oeste','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3782,'3546009','Santa Branca','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3783,'3546108','Santa Clara D\'Oeste','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3784,'3546207','Santa Cruz da Conceição','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3785,'3546256','Santa Cruz da Esperança','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3786,'3546306','Santa Cruz das Palmeiras','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3787,'3546405','Santa Cruz do Rio Pardo','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3788,'3546504','Santa Ernestina','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3789,'3546603','Santa Fé do Sul','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3790,'3546702','Santa Gertrudes','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3791,'3546801','Santa Isabel','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3792,'3546900','Santa Lúcia','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3793,'3547007','Santa Maria da Serra','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3794,'3547106','Santa Mercedes','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3795,'3547205','Santana da Ponte Pensa','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3796,'3547304','Santana de Parnaíba','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3797,'3547403','Santa Rita D\'Oeste','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3798,'3547502','Santa Rita do Passa Quatro','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3799,'3547601','Santa Rosa de Viterbo','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3800,'3547650','Santa Salete','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3801,'3547700','Santo Anastácio','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3802,'3547809','Santo André','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3803,'3547908','Santo Antônio da Alegria','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3804,'3548005','Santo Antônio de Posse','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3805,'3548054','Santo Antônio do Aracanguá','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3806,'3548104','Santo Antônio do Jardim','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3807,'3548203','Santo Antônio do Pinhal','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3808,'3548302','Santo Expedito','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3809,'3548401','Santópolis do Aguapeí','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3810,'3548500','Santos','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3811,'3548609','São Bento do Sapucaí','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3812,'3548708','São Bernardo do Campo','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3813,'3548807','São Caetano do Sul','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3814,'3548906','São Carlos','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3815,'3549003','São Francisco','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3816,'3549102','São João da Boa Vista','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3817,'3549201','São João das Duas Pontes','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3818,'3549250','São João de Iracema','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3819,'3549300','São João do Pau D\'Alho','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3820,'3549409','São Joaquim da Barra','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3821,'3549508','São José da Bela Vista','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3822,'3549607','São José do Barreiro','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3823,'3549706','São José do Rio Pardo','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3824,'3549805','São José do Rio Preto','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3825,'3549904','São José dos Campos','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3826,'3549953','São Lourenço da Serra','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3827,'3550001','São Luís do Paraitinga','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3828,'3550100','São Manuel','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3829,'3550209','São Miguel Arcanjo','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3830,'3550308','São Paulo','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3831,'3550407','São Pedro','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3832,'3550506','São Pedro do Turvo','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3833,'3550605','São Roque','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3834,'3550704','São Sebastião','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3835,'3550803','São Sebastião da Grama','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3836,'3550902','São Simão','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3837,'3551009','São Vicente','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3838,'3551108','Sarapuí','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3839,'3551207','Sarutaiá','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3840,'3551306','Sebastianópolis do Sul','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3841,'3551405','Serra Azul','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3842,'3551504','Serrana','SP','2024-09-03 10:31:11','2024-09-03 10:31:11'),(3843,'3551603','Serra Negra','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3844,'3551702','Sertãozinho','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3845,'3551801','Sete Barras','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3846,'3551900','Severínia','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3847,'3552007','Silveiras','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3848,'3552106','Socorro','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3849,'3552205','Sorocaba','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3850,'3552304','Sud Mennucci','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3851,'3552403','Sumaré','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3852,'3552502','Suzano','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3853,'3552551','Suzanápolis','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3854,'3552601','Tabapuã','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3855,'3552700','Tabatinga','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3856,'3552809','Taboão da Serra','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3857,'3552908','Taciba','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3858,'3553005','Taguaí','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3859,'3553104','Taiaçu','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3860,'3553203','Taiúva','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3861,'3553302','Tambaú','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3862,'3553401','Tanabi','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3863,'3553500','Tapiraí','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3864,'3553609','Tapiratiba','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3865,'3553658','Taquaral','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3866,'3553708','Taquaritinga','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3867,'3553807','Taquarituba','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3868,'3553856','Taquarivaí','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3869,'3553906','Tarabai','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3870,'3553955','Tarumã','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3871,'3554003','Tatuí','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3872,'3554102','Taubaté','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3873,'3554201','Tejupá','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3874,'3554300','Teodoro Sampaio','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3875,'3554409','Terra Roxa','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3876,'3554508','Tietê','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3877,'3554607','Timburi','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3878,'3554656','Torre de Pedra','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3879,'3554706','Torrinha','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3880,'3554755','Trabiju','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3881,'3554805','Tremembé','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3882,'3554904','Três Fronteiras','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3883,'3554953','Tuiuti','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3884,'3555000','Tupã','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3885,'3555109','Tupi Paulista','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3886,'3555208','Turiúba','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3887,'3555307','Turmalina','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3888,'3555356','Ubarana','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3889,'3555406','Ubatuba','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3890,'3555505','Ubirajara','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3891,'3555604','Uchoa','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3892,'3555703','União Paulista','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3893,'3555802','Urânia','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3894,'3555901','Uru','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3895,'3556008','Urupês','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3896,'3556107','Valentim Gentil','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3897,'3556206','Valinhos','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3898,'3556305','Valparaíso','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3899,'3556354','Vargem','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3900,'3556404','Vargem Grande do Sul','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3901,'3556453','Vargem Grande Paulista','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3902,'3556503','Várzea Paulista','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3903,'3556602','Vera Cruz','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3904,'3556701','Vinhedo','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3905,'3556800','Viradouro','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3906,'3556909','Vista Alegre do Alto','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3907,'3556958','Vitória Brasil','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3908,'3557006','Votorantim','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3909,'3557105','Votuporanga','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3910,'3557154','Zacarias','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3911,'3557204','Chavantes','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3912,'3557303','Estiva Gerbi','SP','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3913,'4100103','Abatiá','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3914,'4100202','Adrianópolis','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3915,'4100301','Agudos do Sul','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3916,'4100400','Almirante Tamandaré','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3917,'4100459','Altamira do Paraná','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3918,'4100509','Altônia','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3919,'4100608','Alto Paraná','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3920,'4100707','Alto Piquiri','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3921,'4100806','Alvorada do Sul','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3922,'4100905','Amaporã','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3923,'4101002','Ampére','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3924,'4101051','Anahy','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3925,'4101101','Andirá','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3926,'4101150','Ângulo','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3927,'4101200','Antonina','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3928,'4101309','Antônio Olinto','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3929,'4101408','Apucarana','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3930,'4101507','Arapongas','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3931,'4101606','Arapoti','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3932,'4101655','Arapuã','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3933,'4101705','Araruna','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3934,'4101804','Araucária','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3935,'4101853','Ariranha do Ivaí','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3936,'4101903','Assaí','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3937,'4102000','Assis Chateaubriand','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3938,'4102109','Astorga','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3939,'4102208','Atalaia','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3940,'4102307','Balsa Nova','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3941,'4102406','Bandeirantes','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3942,'4102505','Barbosa Ferraz','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3943,'4102604','Barracão','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3944,'4102703','Barra do Jacaré','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3945,'4102752','Bela Vista da Caroba','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3946,'4102802','Bela Vista do Paraíso','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3947,'4102901','Bituruna','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3948,'4103008','Boa Esperança','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3949,'4103024','Boa Esperança do Iguaçu','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3950,'4103040','Boa Ventura de São Roque','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3951,'4103057','Boa Vista da Aparecida','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3952,'4103107','Bocaiúva do Sul','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3953,'4103156','Bom Jesus do Sul','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3954,'4103206','Bom Sucesso','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3955,'4103222','Bom Sucesso do Sul','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3956,'4103305','Borrazópolis','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3957,'4103354','Braganey','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3958,'4103370','Brasilândia do Sul','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3959,'4103404','Cafeara','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3960,'4103453','Cafelândia','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3961,'4103479','Cafezal do Sul','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3962,'4103503','Califórnia','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3963,'4103602','Cambará','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3964,'4103701','Cambé','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3965,'4103800','Cambira','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3966,'4103909','Campina da Lagoa','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3967,'4103958','Campina do Simão','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3968,'4104006','Campina Grande do Sul','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3969,'4104055','Campo Bonito','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3970,'4104105','Campo do Tenente','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3971,'4104204','Campo Largo','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3972,'4104253','Campo Magro','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3973,'4104303','Campo Mourão','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3974,'4104402','Cândido de Abreu','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3975,'4104428','Candói','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3976,'4104451','Cantagalo','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3977,'4104501','Capanema','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3978,'4104600','Capitão Leônidas Marques','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3979,'4104659','Carambeí','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3980,'4104709','Carlópolis','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3981,'4104808','Cascavel','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3982,'4104907','Castro','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3983,'4105003','Catanduvas','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3984,'4105102','Centenário do Sul','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3985,'4105201','Cerro Azul','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3986,'4105300','Céu Azul','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3987,'4105409','Chopinzinho','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3988,'4105508','Cianorte','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3989,'4105607','cidades Gaúcha','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3990,'4105706','Clevelândia','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3991,'4105805','Colombo','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3992,'4105904','Colorado','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3993,'4106001','Congonhinhas','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3994,'4106100','Conselheiro Mairinck','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3995,'4106209','Contenda','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3996,'4106308','Corbélia','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3997,'4106407','Cornélio Procópio','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3998,'4106456','Coronel Domingos Soares','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(3999,'4106506','Coronel Vivida','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4000,'4106555','Corumbataí do Sul','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4001,'4106571','Cruzeiro do Iguaçu','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4002,'4106605','Cruzeiro do Oeste','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4003,'4106704','Cruzeiro do Sul','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4004,'4106803','Cruz Machado','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4005,'4106852','Cruzmaltina','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4006,'4106902','Curitiba','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4007,'4107009','Curiúva','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4008,'4107108','Diamante do Norte','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4009,'4107124','Diamante do Sul','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4010,'4107157','Diamante D\'Oeste','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4011,'4107207','Dois Vizinhos','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4012,'4107256','Douradina','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4013,'4107306','Doutor Camargo','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4014,'4107405','Enéas Marques','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4015,'4107504','Engenheiro Beltrão','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4016,'4107520','Esperança Nova','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4017,'4107538','Entre Rios do Oeste','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4018,'4107546','Espigão Alto do Iguaçu','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4019,'4107553','Farol','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4020,'4107603','Faxinal','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4021,'4107652','Fazenda Rio Grande','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4022,'4107702','Fênix','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4023,'4107736','Fernandes Pinheiro','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4024,'4107751','Figueira','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4025,'4107801','Floraí','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4026,'4107850','Flor da Serra do Sul','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4027,'4107900','Floresta','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4028,'4108007','Florestópolis','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4029,'4108106','Flórida','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4030,'4108205','Formosa do Oeste','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4031,'4108304','Foz do Iguaçu','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4032,'4108320','Francisco Alves','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4033,'4108403','Francisco Beltrão','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4034,'4108452','Foz do Jordão','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4035,'4108502','General Carneiro','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4036,'4108551','Godoy Moreira','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4037,'4108601','Goioerê','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4038,'4108650','Goioxim','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4039,'4108700','Grandes Rios','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4040,'4108809','Guaíra','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4041,'4108908','Guairaçá','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4042,'4108957','Guamiranga','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4043,'4109005','Guapirama','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4044,'4109104','Guaporema','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4045,'4109203','Guaraci','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4046,'4109302','Guaraniaçu','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4047,'4109401','Guarapuava','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4048,'4109500','Guaraqueçaba','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4049,'4109609','Guaratuba','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4050,'4109658','Honório Serpa','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4051,'4109708','Ibaiti','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4052,'4109757','Ibema','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4053,'4109807','Ibiporã','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4054,'4109906','Icaraíma','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4055,'4110003','Iguaraçu','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4056,'4110052','Iguatu','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4057,'4110078','Imbaú','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4058,'4110102','Imbituva','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4059,'4110201','Inácio Martins','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4060,'4110300','Inajá','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4061,'4110409','Indianópolis','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4062,'4110508','Ipiranga','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4063,'4110607','Iporã','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4064,'4110656','Iracema do Oeste','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4065,'4110706','Irati','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4066,'4110805','Iretama','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4067,'4110904','Itaguajé','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4068,'4110953','Itaipulândia','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4069,'4111001','Itambaracá','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4070,'4111100','Itambé','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4071,'4111209','Itapejara D\'Oeste','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4072,'4111258','Itaperuçu','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4073,'4111308','Itaúna do Sul','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4074,'4111407','Ivaí','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4075,'4111506','Ivaiporã','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4076,'4111555','Ivaté','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4077,'4111605','Ivatuba','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4078,'4111704','Jaboti','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4079,'4111803','Jacarezinho','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4080,'4111902','Jaguapitã','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4081,'4112009','Jaguariaíva','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4082,'4112108','Jandaia do Sul','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4083,'4112207','Janiópolis','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4084,'4112306','Japira','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4085,'4112405','Japurá','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4086,'4112504','Jardim Alegre','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4087,'4112603','Jardim Olinda','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4088,'4112702','Jataizinho','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4089,'4112751','Jesuítas','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4090,'4112801','Joaquim Távora','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4091,'4112900','Jundiaí do Sul','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4092,'4112959','Juranda','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4093,'4113007','Jussara','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4094,'4113106','Kaloré','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4095,'4113205','Lapa','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4096,'4113254','Laranjal','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4097,'4113304','Laranjeiras do Sul','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4098,'4113403','Leópolis','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4099,'4113429','Lidianópolis','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4100,'4113452','Lindoeste','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4101,'4113502','Loanda','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4102,'4113601','Lobato','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4103,'4113700','Londrina','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4104,'4113734','Luiziana','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4105,'4113759','Lunardelli','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4106,'4113809','Lupionópolis','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4107,'4113908','Mallet','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4108,'4114005','Mamborê','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4109,'4114104','Mandaguaçu','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4110,'4114203','Mandaguari','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4111,'4114302','Mandirituba','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4112,'4114351','Manfrinópolis','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4113,'4114401','Mangueirinha','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4114,'4114500','Manoel Ribas','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4115,'4114609','Marechal Cândido Rondon','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4116,'4114708','Maria Helena','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4117,'4114807','Marialva','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4118,'4114906','Marilândia do Sul','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4119,'4115002','Marilena','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4120,'4115101','Mariluz','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4121,'4115200','Maringá','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4122,'4115309','Mariópolis','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4123,'4115358','Maripá','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4124,'4115408','Marmeleiro','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4125,'4115457','Marquinho','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4126,'4115507','Marumbi','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4127,'4115606','Matelândia','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4128,'4115705','Matinhos','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4129,'4115739','Mato Rico','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4130,'4115754','Mauá da Serra','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4131,'4115804','Medianeira','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4132,'4115853','Mercedes','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4133,'4115903','Mirador','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4134,'4116000','Miraselva','PR','2024-09-03 10:31:12','2024-09-03 10:31:12'),(4135,'4116059','Missal','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4136,'4116109','Moreira Sales','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4137,'4116208','Morretes','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4138,'4116307','Munhoz de Melo','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4139,'4116406','Nossa Senhora das Graças','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4140,'4116505','Nova Aliança do Ivaí','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4141,'4116604','Nova América da Colina','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4142,'4116703','Nova Aurora','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4143,'4116802','Nova Cantu','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4144,'4116901','Nova Esperança','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4145,'4116950','Nova Esperança do Sudoeste','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4146,'4117008','Nova Fátima','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4147,'4117057','Nova Laranjeiras','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4148,'4117107','Nova Londrina','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4149,'4117206','Nova Olímpia','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4150,'4117214','Nova Santa Bárbara','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4151,'4117222','Nova Santa Rosa','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4152,'4117255','Nova Prata do Iguaçu','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4153,'4117271','Nova Tebas','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4154,'4117297','Novo Itacolomi','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4155,'4117305','Ortigueira','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4156,'4117404','Ourizona','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4157,'4117453','Ouro Verde do Oeste','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4158,'4117503','Paiçandu','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4159,'4117602','Palmas','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4160,'4117701','Palmeira','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4161,'4117800','Palmital','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4162,'4117909','Palotina','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4163,'4118006','Paraíso do Norte','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4164,'4118105','Paranacity','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4165,'4118204','Paranaguá','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4166,'4118303','Paranapoema','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4167,'4118402','Paranavaí','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4168,'4118451','Pato Bragado','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4169,'4118501','Pato Branco','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4170,'4118600','Paula Freitas','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4171,'4118709','Paulo Frontin','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4172,'4118808','Peabiru','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4173,'4118857','Perobal','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4174,'4118907','Pérola','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4175,'4119004','Pérola D\'Oeste','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4176,'4119103','Piên','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4177,'4119152','Pinhais','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4178,'4119202','Pinhalão','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4179,'4119251','Pinhal de São Bento','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4180,'4119301','Pinhão','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4181,'4119400','Piraí do Sul','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4182,'4119509','Piraquara','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4183,'4119608','Pitanga','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4184,'4119657','Pitangueiras','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4185,'4119707','Planaltina do Paraná','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4186,'4119806','Planalto','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4187,'4119905','Ponta Grossa','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4188,'4119954','Pontal do Paraná','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4189,'4120002','Porecatu','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4190,'4120101','Porto Amazonas','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4191,'4120150','Porto Barreiro','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4192,'4120200','Porto Rico','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4193,'4120309','Porto Vitória','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4194,'4120333','Prado Ferreira','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4195,'4120358','Pranchita','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4196,'4120408','Presidente Castelo Branco','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4197,'4120507','Primeiro de Maio','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4198,'4120606','Prudentópolis','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4199,'4120655','Quarto Centenário','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4200,'4120705','Quatiguá','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4201,'4120804','Quatro Barras','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4202,'4120853','Quatro Pontes','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4203,'4120903','Quedas do Iguaçu','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4204,'4121000','Querência do Norte','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4205,'4121109','Quinta do Sol','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4206,'4121208','Quitandinha','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4207,'4121257','Ramilândia','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4208,'4121307','Rancho Alegre','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4209,'4121356','Rancho Alegre D\'Oeste','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4210,'4121406','Realeza','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4211,'4121505','Rebouças','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4212,'4121604','Renascença','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4213,'4121703','Reserva','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4214,'4121752','Reserva do Iguaçu','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4215,'4121802','Ribeirão Claro','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4216,'4121901','Ribeirão do Pinhal','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4217,'4122008','Rio Azul','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4218,'4122107','Rio Bom','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4219,'4122156','Rio Bonito do Iguaçu','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4220,'4122172','Rio Branco do Ivaí','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4221,'4122206','Rio Branco do Sul','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4222,'4122305','Rio Negro','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4223,'4122404','Rolândia','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4224,'4122503','Roncador','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4225,'4122602','Rondon','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4226,'4122651','Rosário do Ivaí','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4227,'4122701','Sabáudia','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4228,'4122800','Salgado Filho','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4229,'4122909','Salto do Itararé','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4230,'4123006','Salto do Lontra','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4231,'4123105','Santa Amélia','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4232,'4123204','Santa Cecília do Pavão','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4233,'4123303','Santa Cruz de Monte Castelo','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4234,'4123402','Santa Fé','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4235,'4123501','Santa Helena','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4236,'4123600','Santa Inês','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4237,'4123709','Santa Isabel do Ivaí','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4238,'4123808','Santa Izabel do Oeste','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4239,'4123824','Santa Lúcia','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4240,'4123857','Santa Maria do Oeste','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4241,'4123907','Santa Mariana','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4242,'4123956','Santa Mônica','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4243,'4124004','Santana do Itararé','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4244,'4124020','Santa Tereza do Oeste','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4245,'4124053','Santa Terezinha de Itaipu','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4246,'4124103','Santo Antônio da Platina','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4247,'4124202','Santo Antônio do Caiuá','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4248,'4124301','Santo Antônio do Paraíso','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4249,'4124400','Santo Antônio do Sudoeste','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4250,'4124509','Santo Inácio','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4251,'4124608','São Carlos do Ivaí','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4252,'4124707','São Jerônimo da Serra','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4253,'4124806','São João','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4254,'4124905','São João do Caiuá','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4255,'4125001','São João do Ivaí','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4256,'4125100','São João do Triunfo','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4257,'4125209','São Jorge D\'Oeste','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4258,'4125308','São Jorge do Ivaí','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4259,'4125357','São Jorge do Patrocínio','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4260,'4125407','São José da Boa Vista','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4261,'4125456','São José das Palmeiras','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4262,'4125506','São José dos Pinhais','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4263,'4125555','São Manoel do Paraná','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4264,'4125605','São Mateus do Sul','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4265,'4125704','São Miguel do Iguaçu','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4266,'4125753','São Pedro do Iguaçu','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4267,'4125803','São Pedro do Ivaí','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4268,'4125902','São Pedro do Paraná','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4269,'4126009','São Sebastião da Amoreira','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4270,'4126108','São Tomé','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4271,'4126207','Sapopema','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4272,'4126256','Sarandi','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4273,'4126272','Saudade do Iguaçu','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4274,'4126306','Sengés','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4275,'4126355','Serranópolis do Iguaçu','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4276,'4126405','Sertaneja','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4277,'4126504','Sertanópolis','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4278,'4126603','Siqueira Campos','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4279,'4126652','Sulina','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4280,'4126678','Tamarana','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4281,'4126702','Tamboara','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4282,'4126801','Tapejara','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4283,'4126900','Tapira','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4284,'4127007','Teixeira Soares','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4285,'4127106','Telêmaco Borba','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4286,'4127205','Terra Boa','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4287,'4127304','Terra Rica','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4288,'4127403','Terra Roxa','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4289,'4127502','Tibagi','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4290,'4127601','Tijucas do Sul','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4291,'4127700','Toledo','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4292,'4127809','Tomazina','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4293,'4127858','Três Barras do Paraná','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4294,'4127882','Tunas do Paraná','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4295,'4127908','Tuneiras do Oeste','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4296,'4127957','Tupãssi','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4297,'4127965','Turvo','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4298,'4128005','Ubiratã','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4299,'4128104','Umuarama','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4300,'4128203','União da Vitória','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4301,'4128302','Uniflor','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4302,'4128401','Uraí','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4303,'4128500','Wenceslau Braz','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4304,'4128534','Ventania','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4305,'4128559','Vera Cruz do Oeste','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4306,'4128609','Verê','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4307,'4128625','Alto Paraíso','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4308,'4128633','Doutor Ulysses','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4309,'4128658','Virmond','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4310,'4128708','Vitorino','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4311,'4128807','Xambrê','PR','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4312,'4200051','Abdon Batista','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4313,'4200101','Abelardo Luz','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4314,'4200200','Agrolândia','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4315,'4200309','Agronômica','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4316,'4200408','Água Doce','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4317,'4200507','Águas de Chapecó','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4318,'4200556','Águas Frias','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4319,'4200606','Águas Mornas','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4320,'4200705','Alfredo Wagner','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4321,'4200754','Alto Bela Vista','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4322,'4200804','Anchieta','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4323,'4200903','Angelina','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4324,'4201000','Anita Garibaldi','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4325,'4201109','Anitápolis','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4326,'4201208','Antônio Carlos','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4327,'4201257','Apiúna','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4328,'4201273','Arabutã','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4329,'4201307','Araquari','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4330,'4201406','Araranguá','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4331,'4201505','Armazém','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4332,'4201604','Arroio Trinta','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4333,'4201653','Arvoredo','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4334,'4201703','Ascurra','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4335,'4201802','Atalanta','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4336,'4201901','Aurora','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4337,'4201950','Balneário Arroio do Silva','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4338,'4202008','Balneário Camboriú','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4339,'4202057','Balneário Barra do Sul','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4340,'4202073','Balneário Gaivota','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4341,'4202081','Bandeirante','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4342,'4202099','Barra Bonita','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4343,'4202107','Barra Velha','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4344,'4202131','Bela Vista do Toldo','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4345,'4202156','Belmonte','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4346,'4202206','Benedito Novo','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4347,'4202305','Biguaçu','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4348,'4202404','Blumenau','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4349,'4202438','Bocaina do Sul','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4350,'4202453','Bombinhas','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4351,'4202503','Bom Jardim da Serra','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4352,'4202537','Bom Jesus','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4353,'4202578','Bom Jesus do Oeste','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4354,'4202602','Bom Retiro','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4355,'4202701','Botuverá','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4356,'4202800','Braço do Norte','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4357,'4202859','Braço do Trombudo','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4358,'4202875','Brunópolis','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4359,'4202909','Brusque','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4360,'4203006','Caçador','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4361,'4203105','Caibi','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4362,'4203154','Calmon','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4363,'4203204','Camboriú','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4364,'4203253','Capão Alto','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4365,'4203303','Campo Alegre','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4366,'4203402','Campo Belo do Sul','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4367,'4203501','Campo Erê','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4368,'4203600','Campos Novos','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4369,'4203709','Canelinha','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4370,'4203808','Canoinhas','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4371,'4203907','Capinzal','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4372,'4203956','Capivari de Baixo','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4373,'4204004','Catanduvas','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4374,'4204103','Caxambu do Sul','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4375,'4204152','Celso Ramos','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4376,'4204178','Cerro Negro','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4377,'4204194','Chapadão do Lageado','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4378,'4204202','Chapecó','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4379,'4204251','Cocal do Sul','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4380,'4204301','Concórdia','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4381,'4204350','Cordilheira Alta','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4382,'4204400','Coronel Freitas','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4383,'4204459','Coronel Martins','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4384,'4204509','Corupá','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4385,'4204558','Correia Pinto','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4386,'4204608','Criciúma','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4387,'4204707','Cunha Porã','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4388,'4204756','Cunhataí','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4389,'4204806','Curitibanos','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4390,'4204905','Descanso','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4391,'4205001','Dionísio Cerqueira','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4392,'4205100','Dona Emma','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4393,'4205159','Doutor Pedrinho','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4394,'4205175','Entre Rios','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4395,'4205191','Ermo','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4396,'4205209','Erval Velho','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4397,'4205308','Faxinal dos Guedes','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4398,'4205357','Flor do Sertão','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4399,'4205407','Florianópolis','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4400,'4205431','Formosa do Sul','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4401,'4205456','Forquilhinha','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4402,'4205506','Fraiburgo','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4403,'4205555','Frei Rogério','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4404,'4205605','Galvão','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4405,'4205704','Garopaba','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4406,'4205803','Garuva','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4407,'4205902','Gaspar','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4408,'4206009','Governador Celso Ramos','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4409,'4206108','Grão Pará','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4410,'4206207','Gravatal','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4411,'4206306','Guabiruba','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4412,'4206405','Guaraciaba','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4413,'4206504','Guaramirim','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4414,'4206603','Guarujá do Sul','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4415,'4206652','Guatambú','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4416,'4206702','Herval D\'Oeste','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4417,'4206751','Ibiam','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4418,'4206801','Ibicaré','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4419,'4206900','Ibirama','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4420,'4207007','Içara','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4421,'4207106','Ilhota','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4422,'4207205','Imaruí','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4423,'4207304','Imbituba','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4424,'4207403','Imbuia','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4425,'4207502','Indaial','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4426,'4207577','Iomerê','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4427,'4207601','Ipira','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4428,'4207650','Iporã do Oeste','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4429,'4207684','Ipuaçu','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4430,'4207700','Ipumirim','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4431,'4207759','Iraceminha','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4432,'4207809','Irani','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4433,'4207858','Irati','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4434,'4207908','Irineópolis','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4435,'4208005','Itá','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4436,'4208104','Itaiópolis','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4437,'4208203','Itajaí','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4438,'4208302','Itapema','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4439,'4208401','Itapiranga','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4440,'4208450','Itapoá','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4441,'4208500','Ituporanga','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4442,'4208609','Jaborá','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4443,'4208708','Jacinto Machado','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4444,'4208807','Jaguaruna','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4445,'4208906','Jaraguá do Sul','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4446,'4208955','Jardinópolis','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4447,'4209003','Joaçaba','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4448,'4209102','Joinville','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4449,'4209151','José Boiteux','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4450,'4209177','Jupiá','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4451,'4209201','Lacerdópolis','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4452,'4209300','Lages','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4453,'4209409','Laguna','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4454,'4209458','Lajeado Grande','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4455,'4209508','Laurentino','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4456,'4209607','Lauro Muller','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4457,'4209706','Lebon Régis','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4458,'4209805','Leoberto Leal','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4459,'4209854','Lindóia do Sul','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4460,'4209904','Lontras','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4461,'4210001','Luiz Alves','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4462,'4210035','Luzerna','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4463,'4210050','Macieira','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4464,'4210100','Mafra','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4465,'4210209','Major Gercino','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4466,'4210308','Major Vieira','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4467,'4210407','Maracajá','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4468,'4210506','Maravilha','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4469,'4210555','Marema','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4470,'4210605','Massaranduba','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4471,'4210704','Matos Costa','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4472,'4210803','Meleiro','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4473,'4210852','Mirim Doce','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4474,'4210902','Modelo','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4475,'4211009','Mondaí','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4476,'4211058','Monte Carlo','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4477,'4211108','Monte Castelo','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4478,'4211207','Morro da Fumaça','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4479,'4211256','Morro Grande','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4480,'4211306','Navegantes','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4481,'4211405','Nova Erechim','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4482,'4211454','Nova Itaberaba','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4483,'4211504','Nova Trento','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4484,'4211603','Nova Veneza','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4485,'4211652','Novo Horizonte','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4486,'4211702','Orleans','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4487,'4211751','Otacílio Costa','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4488,'4211801','Ouro','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4489,'4211850','Ouro Verde','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4490,'4211876','Paial','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4491,'4211892','Painel','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4492,'4211900','Palhoça','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4493,'4212007','Palma Sola','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4494,'4212056','Palmeira','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4495,'4212106','Palmitos','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4496,'4212205','Papanduva','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4497,'4212239','Paraíso','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4498,'4212254','Passo de Torres','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4499,'4212270','Passos Maia','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4500,'4212304','Paulo Lopes','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4501,'4212403','Pedras Grandes','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4502,'4212502','Penha','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4503,'4212601','Peritiba','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4504,'4212650','Pescaria Brava','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4505,'4212700','Petrolândia','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4506,'4212809','Balneário Piçarras','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4507,'4212908','Pinhalzinho','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4508,'4213005','Pinheiro Preto','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4509,'4213104','Piratuba','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4510,'4213153','Planalto Alegre','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4511,'4213203','Pomerode','SC','2024-09-03 10:31:13','2024-09-03 10:31:13'),(4512,'4213302','Ponte Alta','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4513,'4213351','Ponte Alta do Norte','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4514,'4213401','Ponte Serrada','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4515,'4213500','Porto Belo','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4516,'4213609','Porto União','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4517,'4213708','Pouso Redondo','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4518,'4213807','Praia Grande','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4519,'4213906','Presidente Castello Branco','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4520,'4214003','Presidente Getúlio','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4521,'4214102','Presidente Nereu','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4522,'4214151','Princesa','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4523,'4214201','Quilombo','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4524,'4214300','Rancho Queimado','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4525,'4214409','Rio das Antas','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4526,'4214508','Rio do Campo','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4527,'4214607','Rio do Oeste','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4528,'4214706','Rio dos Cedros','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4529,'4214805','Rio do Sul','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4530,'4214904','Rio Fortuna','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4531,'4215000','Rio Negrinho','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4532,'4215059','Rio Rufino','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4533,'4215075','Riqueza','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4534,'4215109','Rodeio','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4535,'4215208','Romelândia','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4536,'4215307','Salete','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4537,'4215356','Saltinho','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4538,'4215406','Salto Veloso','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4539,'4215455','Sangão','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4540,'4215505','Santa Cecília','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4541,'4215554','Santa Helena','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4542,'4215604','Santa Rosa de Lima','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4543,'4215653','Santa Rosa do Sul','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4544,'4215679','Santa Terezinha','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4545,'4215687','Santa Terezinha do Progresso','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4546,'4215695','Santiago do Sul','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4547,'4215703','Santo Amaro da Imperatriz','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4548,'4215752','São Bernardino','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4549,'4215802','São Bento do Sul','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4550,'4215901','São Bonifácio','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4551,'4216008','São Carlos','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4552,'4216057','São Cristovão do Sul','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4553,'4216107','São Domingos','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4554,'4216206','São Francisco do Sul','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4555,'4216255','São João do Oeste','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4556,'4216305','São João Batista','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4557,'4216354','São João do Itaperiú','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4558,'4216404','São João do Sul','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4559,'4216503','São Joaquim','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4560,'4216602','São José','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4561,'4216701','São José do Cedro','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4562,'4216800','São José do Cerrito','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4563,'4216909','São Lourenço do Oeste','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4564,'4217006','São Ludgero','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4565,'4217105','São Martinho','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4566,'4217154','São Miguel da Boa Vista','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4567,'4217204','São Miguel do Oeste','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4568,'4217253','São Pedro de Alcântara','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4569,'4217303','Saudades','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4570,'4217402','Schroeder','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4571,'4217501','Seara','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4572,'4217550','Serra Alta','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4573,'4217600','Siderópolis','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4574,'4217709','Sombrio','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4575,'4217758','Sul Brasil','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4576,'4217808','Taió','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4577,'4217907','Tangará','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4578,'4217956','Tigrinhos','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4579,'4218004','Tijucas','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4580,'4218103','Timbé do Sul','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4581,'4218202','Timbó','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4582,'4218251','Timbó Grande','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4583,'4218301','Três Barras','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4584,'4218350','Treviso','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4585,'4218400','Treze de Maio','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4586,'4218509','Treze Tílias','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4587,'4218608','Trombudo Central','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4588,'4218707','Tubarão','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4589,'4218756','Tunápolis','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4590,'4218806','Turvo','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4591,'4218855','União do Oeste','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4592,'4218905','Urubici','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4593,'4218954','Urupema','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4594,'4219002','Urussanga','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4595,'4219101','Vargeão','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4596,'4219150','Vargem','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4597,'4219176','Vargem Bonita','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4598,'4219200','Vidal Ramos','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4599,'4219309','Videira','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4600,'4219358','Vitor Meireles','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4601,'4219408','Witmarsum','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4602,'4219507','Xanxerê','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4603,'4219606','Xavantina','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4604,'4219705','Xaxim','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4605,'4219853','Zortéa','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4606,'4220000','Balneário Rincão','SC','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4607,'4300034','Aceguá','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4608,'4300059','Água Santa','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4609,'4300109','Agudo','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4610,'4300208','Ajuricaba','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4611,'4300307','Alecrim','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4612,'4300406','Alegrete','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4613,'4300455','Alegria','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4614,'4300471','Almirante Tamandaré do Sul','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4615,'4300505','Alpestre','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4616,'4300554','Alto Alegre','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4617,'4300570','Alto Feliz','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4618,'4300604','Alvorada','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4619,'4300638','Amaral Ferrador','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4620,'4300646','Ametista do Sul','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4621,'4300661','André da Rocha','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4622,'4300703','Anta Gorda','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4623,'4300802','Antônio Prado','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4624,'4300851','Arambaré','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4625,'4300877','Araricá','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4626,'4300901','Aratiba','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4627,'4301008','Arroio do Meio','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4628,'4301057','Arroio do Sal','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4629,'4301073','Arroio do Padre','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4630,'4301107','Arroio dos Ratos','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4631,'4301206','Arroio do Tigre','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4632,'4301305','Arroio Grande','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4633,'4301404','Arvorezinha','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4634,'4301503','Augusto Pestana','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4635,'4301552','Áurea','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4636,'4301602','Bagé','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4637,'4301636','Balneário Pinhal','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4638,'4301651','Barão','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4639,'4301701','Barão de Cotegipe','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4640,'4301750','Barão do Triunfo','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4641,'4301800','Barracão','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4642,'4301859','Barra do Guarita','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4643,'4301875','Barra do Quaraí','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4644,'4301909','Barra do Ribeiro','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4645,'4301925','Barra do Rio Azul','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4646,'4301958','Barra Funda','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4647,'4302006','Barros Cassal','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4648,'4302055','Benjamin Constant do Sul','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4649,'4302105','Bento Gonçalves','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4650,'4302154','Boa Vista das Missões','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4651,'4302204','Boa Vista do Buricá','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4652,'4302220','Boa Vista do Cadeado','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4653,'4302238','Boa Vista do Incra','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4654,'4302253','Boa Vista do Sul','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4655,'4302303','Bom Jesus','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4656,'4302352','Bom Princípio','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4657,'4302378','Bom Progresso','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4658,'4302402','Bom Retiro do Sul','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4659,'4302451','Boqueirão do Leão','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4660,'4302501','Bossoroca','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4661,'4302584','Bozano','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4662,'4302600','Braga','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4663,'4302659','Brochier','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4664,'4302709','Butiá','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4665,'4302808','Caçapava do Sul','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4666,'4302907','Cacequi','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4667,'4303004','Cachoeira do Sul','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4668,'4303103','Cachoeirinha','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4669,'4303202','Cacique Doble','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4670,'4303301','Caibaté','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4671,'4303400','Caiçara','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4672,'4303509','Camaquã','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4673,'4303558','Camargo','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4674,'4303608','Cambará do Sul','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4675,'4303673','Campestre da Serra','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4676,'4303707','Campina das Missões','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4677,'4303806','Campinas do Sul','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4678,'4303905','Campo Bom','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4679,'4304002','Campo Novo','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4680,'4304101','Campos Borges','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4681,'4304200','Candelária','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4682,'4304309','Cândido Godói','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4683,'4304358','Candiota','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4684,'4304408','Canela','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4685,'4304507','Canguçu','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4686,'4304606','Canoas','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4687,'4304614','Canudos do Vale','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4688,'4304622','Capão Bonito do Sul','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4689,'4304630','Capão da Canoa','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4690,'4304655','Capão do Cipó','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4691,'4304663','Capão do Leão','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4692,'4304671','Capivari do Sul','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4693,'4304689','Capela de Santana','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4694,'4304697','Capitão','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4695,'4304705','Carazinho','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4696,'4304713','Caraá','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4697,'4304804','Carlos Barbosa','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4698,'4304853','Carlos Gomes','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4699,'4304903','Casca','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4700,'4304952','Caseiros','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4701,'4305009','Catuípe','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4702,'4305108','Caxias do Sul','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4703,'4305116','Centenário','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4704,'4305124','Cerrito','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4705,'4305132','Cerro Branco','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4706,'4305157','Cerro Grande','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4707,'4305173','Cerro Grande do Sul','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4708,'4305207','Cerro Largo','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4709,'4305306','Chapada','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4710,'4305355','Charqueadas','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4711,'4305371','Charrua','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4712,'4305405','Chiapetta','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4713,'4305439','Chuí','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4714,'4305447','Chuvisca','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4715,'4305454','Cidreira','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4716,'4305504','Ciríaco','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4717,'4305587','Colinas','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4718,'4305603','Colorado','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4719,'4305702','Condor','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4720,'4305801','Constantina','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4721,'4305835','Coqueiro Baixo','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4722,'4305850','Coqueiros do Sul','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4723,'4305871','Coronel Barros','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4724,'4305900','Coronel Bicaco','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4725,'4305934','Coronel Pilar','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4726,'4305959','Cotiporã','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4727,'4305975','Coxilha','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4728,'4306007','Crissiumal','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4729,'4306056','Cristal','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4730,'4306072','Cristal do Sul','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4731,'4306106','Cruz Alta','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4732,'4306130','Cruzaltense','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4733,'4306205','Cruzeiro do Sul','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4734,'4306304','David Canabarro','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4735,'4306320','Derrubadas','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4736,'4306353','Dezesseis de Novembro','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4737,'4306379','Dilermando de Aguiar','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4738,'4306403','Dois Irmãos','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4739,'4306429','Dois Irmãos das Missões','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4740,'4306452','Dois Lajeados','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4741,'4306502','Dom Feliciano','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4742,'4306551','Dom Pedro de Alcântara','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4743,'4306601','Dom Pedrito','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4744,'4306700','Dona Francisca','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4745,'4306734','Doutor Maurício Cardoso','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4746,'4306759','Doutor Ricardo','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4747,'4306767','Eldorado do Sul','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4748,'4306809','Encantado','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4749,'4306908','Encruzilhada do Sul','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4750,'4306924','Engenho Velho','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4751,'4306932','Entre-Ijuís','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4752,'4306957','Entre Rios do Sul','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4753,'4306973','Erebango','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4754,'4307005','Erechim','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4755,'4307054','Ernestina','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4756,'4307104','Herval','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4757,'4307203','Erval Grande','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4758,'4307302','Erval Seco','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4759,'4307401','Esmeralda','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4760,'4307450','Esperança do Sul','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4761,'4307500','Espumoso','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4762,'4307559','Estação','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4763,'4307609','Estância Velha','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4764,'4307708','Esteio','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4765,'4307807','Estrela','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4766,'4307815','Estrela Velha','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4767,'4307831','Eugênio de Castro','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4768,'4307864','Fagundes Varela','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4769,'4307906','Farroupilha','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4770,'4308003','Faxinal do Soturno','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4771,'4308052','Faxinalzinho','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4772,'4308078','Fazenda Vilanova','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4773,'4308102','Feliz','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4774,'4308201','Flores da Cunha','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4775,'4308250','Floriano Peixoto','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4776,'4308300','Fontoura Xavier','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4777,'4308409','Formigueiro','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4778,'4308433','Forquetinha','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4779,'4308458','Fortaleza dos Valos','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4780,'4308508','Frederico Westphalen','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4781,'4308607','Garibaldi','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4782,'4308656','Garruchos','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4783,'4308706','Gaurama','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4784,'4308805','General Câmara','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4785,'4308854','Gentil','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4786,'4308904','Getúlio Vargas','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4787,'4309001','Giruá','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4788,'4309050','Glorinha','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4789,'4309100','Gramado','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4790,'4309126','Gramado dos Loureiros','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4791,'4309159','Gramado Xavier','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4792,'4309209','Gravataí','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4793,'4309258','Guabiju','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4794,'4309308','Guaíba','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4795,'4309407','Guaporé','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4796,'4309506','Guarani das Missões','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4797,'4309555','Harmonia','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4798,'4309571','Herveiras','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4799,'4309605','Horizontina','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4800,'4309654','Hulha Negra','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4801,'4309704','Humaitá','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4802,'4309753','Ibarama','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4803,'4309803','Ibiaçá','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4804,'4309902','Ibiraiaras','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4805,'4309951','Ibirapuitã','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4806,'4310009','Ibirubá','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4807,'4310108','Igrejinha','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4808,'4310207','Ijuí','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4809,'4310306','Ilópolis','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4810,'4310330','Imbé','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4811,'4310363','Imigrante','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4812,'4310405','Independência','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4813,'4310413','Inhacorá','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4814,'4310439','Ipê','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4815,'4310462','Ipiranga do Sul','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4816,'4310504','Iraí','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4817,'4310538','Itaara','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4818,'4310553','Itacurubi','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4819,'4310579','Itapuca','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4820,'4310603','Itaqui','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4821,'4310652','Itati','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4822,'4310702','Itatiba do Sul','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4823,'4310751','Ivorá','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4824,'4310801','Ivoti','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4825,'4310850','Jaboticaba','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4826,'4310876','Jacuizinho','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4827,'4310900','Jacutinga','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4828,'4311007','Jaguarão','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4829,'4311106','Jaguari','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4830,'4311122','Jaquirana','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4831,'4311130','Jari','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4832,'4311155','Jóia','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4833,'4311205','Júlio de Castilhos','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4834,'4311239','Lagoa Bonita do Sul','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4835,'4311254','Lagoão','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4836,'4311270','Lagoa dos Três Cantos','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4837,'4311304','Lagoa Vermelha','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4838,'4311403','Lajeado','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4839,'4311429','Lajeado do Bugre','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4840,'4311502','Lavras do Sul','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4841,'4311601','Liberato Salzano','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4842,'4311627','Lindolfo Collor','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4843,'4311643','Linha Nova','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4844,'4311700','Machadinho','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4845,'4311718','Maçambará','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4846,'4311734','Mampituba','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4847,'4311759','Manoel Viana','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4848,'4311775','Maquiné','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4849,'4311791','Maratá','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4850,'4311809','Marau','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4851,'4311908','Marcelino Ramos','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4852,'4311981','Mariana Pimentel','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4853,'4312005','Mariano Moro','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4854,'4312054','Marques de Souza','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4855,'4312104','Mata','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4856,'4312138','Mato Castelhano','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4857,'4312153','Mato Leitão','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4858,'4312179','Mato Queimado','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4859,'4312203','Maximiliano de Almeida','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4860,'4312252','Minas do Leão','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4861,'4312302','Miraguaí','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4862,'4312351','Montauri','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4863,'4312377','Monte Alegre dos Campos','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4864,'4312385','Monte Belo do Sul','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4865,'4312401','Montenegro','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4866,'4312427','Mormaço','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4867,'4312443','Morrinhos do Sul','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4868,'4312450','Morro Redondo','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4869,'4312476','Morro Reuter','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4870,'4312500','Mostardas','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4871,'4312609','Muçum','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4872,'4312617','Muitos Capões','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4873,'4312625','Muliterno','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4874,'4312658','Não-Me-Toque','RS','2024-09-03 10:31:14','2024-09-03 10:31:14'),(4875,'4312674','Nicolau Vergueiro','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4876,'4312708','Nonoai','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4877,'4312757','Nova Alvorada','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4878,'4312807','Nova Araçá','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4879,'4312906','Nova Bassano','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4880,'4312955','Nova Boa Vista','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4881,'4313003','Nova Bréscia','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4882,'4313011','Nova Candelária','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4883,'4313037','Nova Esperança do Sul','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4884,'4313060','Nova Hartz','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4885,'4313086','Nova Pádua','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4886,'4313102','Nova Palma','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4887,'4313201','Nova Petrópolis','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4888,'4313300','Nova Prata','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4889,'4313334','Nova Ramada','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4890,'4313359','Nova Roma do Sul','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4891,'4313375','Nova Santa Rita','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4892,'4313391','Novo Cabrais','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4893,'4313409','Novo Hamburgo','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4894,'4313425','Novo Machado','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4895,'4313441','Novo Tiradentes','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4896,'4313466','Novo Xingu','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4897,'4313490','Novo Barreiro','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4898,'4313508','Osório','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4899,'4313607','Paim Filho','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4900,'4313656','Palmares do Sul','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4901,'4313706','Palmeira das Missões','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4902,'4313805','Palmitinho','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4903,'4313904','Panambi','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4904,'4313953','Pantano Grande','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4905,'4314001','Paraí','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4906,'4314027','Paraíso do Sul','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4907,'4314035','Pareci Novo','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4908,'4314050','Parobé','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4909,'4314068','Passa Sete','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4910,'4314076','Passo do Sobrado','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4911,'4314100','Passo Fundo','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4912,'4314134','Paulo Bento','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4913,'4314159','Paverama','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4914,'4314175','Pedras Altas','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4915,'4314209','Pedro Osório','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4916,'4314308','Pejuçara','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4917,'4314407','Pelotas','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4918,'4314423','Picada Café','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4919,'4314456','Pinhal','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4920,'4314464','Pinhal da Serra','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4921,'4314472','Pinhal Grande','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4922,'4314498','Pinheirinho do Vale','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4923,'4314506','Pinheiro Machado','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4924,'4314548','Pinto Bandeira','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4925,'4314555','Pirapó','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4926,'4314605','Piratini','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4927,'4314704','Planalto','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4928,'4314753','Poço das Antas','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4929,'4314779','Pontão','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4930,'4314787','Ponte Preta','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4931,'4314803','Portão','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4932,'4314902','Porto Alegre','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4933,'4315008','Porto Lucena','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4934,'4315057','Porto Mauá','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4935,'4315073','Porto Vera Cruz','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4936,'4315107','Porto Xavier','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4937,'4315131','Pouso Novo','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4938,'4315149','Presidente Lucena','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4939,'4315156','Progresso','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4940,'4315172','Protásio Alves','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4941,'4315206','Putinga','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4942,'4315305','Quaraí','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4943,'4315313','Quatro Irmãos','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4944,'4315321','Quevedos','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4945,'4315354','Quinze de Novembro','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4946,'4315404','Redentora','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4947,'4315453','Relvado','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4948,'4315503','Restinga Seca','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4949,'4315552','Rio dos Índios','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4950,'4315602','Rio Grande','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4951,'4315701','Rio Pardo','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4952,'4315750','Riozinho','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4953,'4315800','Roca Sales','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4954,'4315909','Rodeio Bonito','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4955,'4315958','Rolador','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4956,'4316006','Rolante','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4957,'4316105','Ronda Alta','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4958,'4316204','Rondinha','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4959,'4316303','Roque Gonzales','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4960,'4316402','Rosário do Sul','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4961,'4316428','Sagrada Família','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4962,'4316436','Saldanha Marinho','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4963,'4316451','Salto do Jacuí','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4964,'4316477','Salvador das Missões','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4965,'4316501','Salvador do Sul','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4966,'4316600','Sananduva','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4967,'4316709','Santa Bárbara do Sul','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4968,'4316733','Santa Cecília do Sul','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4969,'4316758','Santa Clara do Sul','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4970,'4316808','Santa Cruz do Sul','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4971,'4316907','Santa Maria','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4972,'4316956','Santa Maria do Herval','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4973,'4316972','Santa Margarida do Sul','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4974,'4317004','Santana da Boa Vista','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4975,'4317103','Sant\'Ana do Livramento','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4976,'4317202','Santa Rosa','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4977,'4317251','Santa Tereza','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4978,'4317301','Santa Vitória do Palmar','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4979,'4317400','Santiago','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4980,'4317509','Santo Ângelo','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4981,'4317558','Santo Antônio do Palma','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4982,'4317608','Santo Antônio da Patrulha','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4983,'4317707','Santo Antônio das Missões','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4984,'4317756','Santo Antônio do Planalto','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4985,'4317806','Santo Augusto','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4986,'4317905','Santo Cristo','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4987,'4317954','Santo Expedito do Sul','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4988,'4318002','São Borja','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4989,'4318051','São Domingos do Sul','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4990,'4318101','São Francisco de Assis','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4991,'4318200','São Francisco de Paula','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4992,'4318309','São Gabriel','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4993,'4318408','São Jerônimo','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4994,'4318424','São João da Urtiga','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4995,'4318432','São João do Polêsine','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4996,'4318440','São Jorge','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4997,'4318457','São José das Missões','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4998,'4318465','São José do Herval','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(4999,'4318481','São José do Hortêncio','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5000,'4318499','São José do Inhacorá','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5001,'4318507','São José do Norte','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5002,'4318606','São José do Ouro','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5003,'4318614','São José do Sul','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5004,'4318622','São José dos Ausentes','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5005,'4318705','São Leopoldo','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5006,'4318804','São Lourenço do Sul','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5007,'4318903','São Luiz Gonzaga','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5008,'4319000','São Marcos','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5009,'4319109','São Martinho','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5010,'4319125','São Martinho da Serra','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5011,'4319158','São Miguel das Missões','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5012,'4319208','São Nicolau','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5013,'4319307','São Paulo das Missões','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5014,'4319356','São Pedro da Serra','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5015,'4319364','São Pedro das Missões','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5016,'4319372','São Pedro do Butiá','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5017,'4319406','São Pedro do Sul','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5018,'4319505','São Sebastião do Caí','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5019,'4319604','São Sepé','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5020,'4319703','São Valentim','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5021,'4319711','São Valentim do Sul','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5022,'4319737','São Valério do Sul','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5023,'4319752','São Vendelino','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5024,'4319802','São Vicente do Sul','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5025,'4319901','Sapiranga','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5026,'4320008','Sapucaia do Sul','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5027,'4320107','Sarandi','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5028,'4320206','Seberi','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5029,'4320230','Sede Nova','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5030,'4320263','Segredo','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5031,'4320305','Selbach','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5032,'4320321','Senador Salgado Filho','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5033,'4320354','Sentinela do Sul','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5034,'4320404','Serafina Corrêa','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5035,'4320453','Sério','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5036,'4320503','Sertão','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5037,'4320552','Sertão Santana','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5038,'4320578','Sete de Setembro','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5039,'4320602','Severiano de Almeida','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5040,'4320651','Silveira Martins','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5041,'4320677','Sinimbu','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5042,'4320701','Sobradinho','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5043,'4320800','Soledade','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5044,'4320859','Tabaí','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5045,'4320909','Tapejara','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5046,'4321006','Tapera','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5047,'4321105','Tapes','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5048,'4321204','Taquara','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5049,'4321303','Taquari','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5050,'4321329','Taquaruçu do Sul','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5051,'4321352','Tavares','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5052,'4321402','Tenente Portela','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5053,'4321436','Terra de Areia','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5054,'4321451','Teutônia','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5055,'4321469','Tio Hugo','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5056,'4321477','Tiradentes do Sul','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5057,'4321493','Toropi','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5058,'4321501','Torres','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5059,'4321600','Tramandaí','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5060,'4321626','Travesseiro','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5061,'4321634','Três Arroios','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5062,'4321667','Três Cachoeiras','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5063,'4321709','Três Coroas','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5064,'4321808','Três de Maio','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5065,'4321832','Três Forquilhas','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5066,'4321857','Três Palmeiras','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5067,'4321907','Três Passos','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5068,'4321956','Trindade do Sul','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5069,'4322004','Triunfo','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5070,'4322103','Tucunduva','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5071,'4322152','Tunas','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5072,'4322186','Tupanci do Sul','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5073,'4322202','Tupanciretã','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5074,'4322251','Tupandi','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5075,'4322301','Tuparendi','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5076,'4322327','Turuçu','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5077,'4322343','Ubiretama','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5078,'4322350','União da Serra','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5079,'4322376','Unistalda','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5080,'4322400','Uruguaiana','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5081,'4322509','Vacaria','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5082,'4322525','Vale Verde','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5083,'4322533','Vale do Sol','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5084,'4322541','Vale Real','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5085,'4322558','Vanini','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5086,'4322608','Venâncio Aires','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5087,'4322707','Vera Cruz','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5088,'4322806','Veranópolis','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5089,'4322855','Vespasiano Correa','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5090,'4322905','Viadutos','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5091,'4323002','Viamão','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5092,'4323101','Vicente Dutra','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5093,'4323200','Victor Graeff','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5094,'4323309','Vila Flores','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5095,'4323358','Vila Lângaro','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5096,'4323408','Vila Maria','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5097,'4323457','Vila Nova do Sul','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5098,'4323507','Vista Alegre','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5099,'4323606','Vista Alegre do Prata','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5100,'4323705','Vista Gaúcha','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5101,'4323754','Vitória das Missões','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5102,'4323770','Westfalia','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5103,'4323804','Xangri-lá','RS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5104,'5000203','Água Clara','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5105,'5000252','Alcinópolis','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5106,'5000609','Amambai','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5107,'5000708','Anastácio','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5108,'5000807','Anaurilândia','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5109,'5000856','Angélica','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5110,'5000906','Antônio João','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5111,'5001003','Aparecida do Taboado','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5112,'5001102','Aquidauana','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5113,'5001243','Aral Moreira','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5114,'5001508','Bandeirantes','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5115,'5001904','Bataguassu','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5116,'5002001','Batayporã','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5117,'5002100','Bela Vista','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5118,'5002159','Bodoquena','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5119,'5002209','Bonito','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5120,'5002308','Brasilândia','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5121,'5002407','Caarapó','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5122,'5002605','Camapuã','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5123,'5002704','Campo Grande','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5124,'5002803','Caracol','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5125,'5002902','Cassilândia','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5126,'5002951','Chapadão do Sul','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5127,'5003108','Corguinho','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5128,'5003157','Coronel Sapucaia','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5129,'5003207','Corumbá','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5130,'5003256','Costa Rica','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5131,'5003306','Coxim','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5132,'5003454','Deodápolis','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5133,'5003488','Dois Irmãos do Buriti','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5134,'5003504','Douradina','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5135,'5003702','Dourados','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5136,'5003751','Eldorado','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5137,'5003801','Fátima do Sul','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5138,'5003900','Figueirão','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5139,'5004007','Glória de Dourados','MS','2024-09-03 10:31:15','2024-09-03 10:31:15'),(5140,'5004106','Guia Lopes da Laguna','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5141,'5004304','Iguatemi','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5142,'5004403','Inocência','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5143,'5004502','Itaporã','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5144,'5004601','Itaquiraí','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5145,'5004700','Ivinhema','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5146,'5004809','Japorã','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5147,'5004908','Jaraguari','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5148,'5005004','Jardim','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5149,'5005103','Jateí','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5150,'5005152','Juti','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5151,'5005202','Ladário','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5152,'5005251','Laguna Carapã','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5153,'5005400','Maracaju','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5154,'5005608','Miranda','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5155,'5005681','Mundo Novo','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5156,'5005707','Naviraí','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5157,'5005806','Nioaque','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5158,'5006002','Nova Alvorada do Sul','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5159,'5006200','Nova Andradina','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5160,'5006259','Novo Horizonte do Sul','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5161,'5006275','Paraíso das Águas','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5162,'5006309','Paranaíba','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5163,'5006358','Paranhos','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5164,'5006408','Pedro Gomes','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5165,'5006606','Ponta Porã','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5166,'5006903','Porto Murtinho','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5167,'5007109','Ribas do Rio Pardo','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5168,'5007208','Rio Brilhante','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5169,'5007307','Rio Negro','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5170,'5007406','Rio Verde de Mato Grosso','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5171,'5007505','Rochedo','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5172,'5007554','Santa Rita do Pardo','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5173,'5007695','São Gabriel do Oeste','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5174,'5007703','Sete Quedas','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5175,'5007802','Selvíria','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5176,'5007901','Sidrolândia','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5177,'5007935','Sonora','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5178,'5007950','Tacuru','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5179,'5007976','Taquarussu','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5180,'5008008','Terenos','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5181,'5008305','Três Lagoas','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5182,'5008404','Vicentina','MS','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5183,'5100102','Acorizal','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5184,'5100201','Água Boa','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5185,'5100250','Alta Floresta','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5186,'5100300','Alto Araguaia','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5187,'5100359','Alto Boa Vista','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5188,'5100409','Alto Garças','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5189,'5100508','Alto Paraguai','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5190,'5100607','Alto Taquari','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5191,'5100805','Apiacás','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5192,'5101001','Araguaiana','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5193,'5101209','Araguainha','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5194,'5101258','Araputanga','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5195,'5101308','Arenápolis','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5196,'5101407','Aripuanã','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5197,'5101605','Barão de Melgaço','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5198,'5101704','Barra do Bugres','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5199,'5101803','Barra do Garças','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5200,'5101852','Bom Jesus do Araguaia','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5201,'5101902','Brasnorte','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5202,'5102504','Cáceres','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5203,'5102603','Campinápolis','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5204,'5102637','Campo Novo do Parecis','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5205,'5102678','Campo Verde','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5206,'5102686','Campos de Júlio','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5207,'5102694','Canabrava do Norte','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5208,'5102702','Canarana','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5209,'5102793','Carlinda','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5210,'5102850','Castanheira','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5211,'5103007','Chapada dos Guimarães','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5212,'5103056','Cláudia','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5213,'5103106','Cocalinho','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5214,'5103205','Colíder','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5215,'5103254','Colniza','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5216,'5103304','Comodoro','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5217,'5103353','Confresa','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5218,'5103361','Conquista D\'Oeste','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5219,'5103379','Cotriguaçu','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5220,'5103403','Cuiabá','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5221,'5103437','Curvelândia','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5222,'5103452','Denise','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5223,'5103502','Diamantino','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5224,'5103601','Dom Aquino','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5225,'5103700','Feliz Natal','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5226,'5103809','Figueirópolis D\'Oeste','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5227,'5103858','Gaúcha do Norte','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5228,'5103908','General Carneiro','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5229,'5103957','Glória D\'Oeste','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5230,'5104104','Guarantã do Norte','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5231,'5104203','Guiratinga','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5232,'5104500','Indiavaí','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5233,'5104526','Ipiranga do Norte','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5234,'5104542','Itanhangá','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5235,'5104559','Itaúba','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5236,'5104609','Itiquira','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5237,'5104807','Jaciara','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5238,'5104906','Jangada','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5239,'5105002','Jauru','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5240,'5105101','Juara','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5241,'5105150','Juína','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5242,'5105176','Juruena','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5243,'5105200','Juscimeira','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5244,'5105234','Lambari D\'Oeste','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5245,'5105259','Lucas do Rio Verde','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5246,'5105309','Luciara','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5247,'5105507','Vila Bela da Santíssima Trindade','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5248,'5105580','Marcelândia','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5249,'5105606','Matupá','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5250,'5105622','Mirassol D\'Oeste','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5251,'5105903','Nobres','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5252,'5106000','Nortelândia','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5253,'5106109','Nossa Senhora do Livramento','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5254,'5106158','Nova Bandeirantes','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5255,'5106174','Nova Nazaré','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5256,'5106182','Nova Lacerda','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5257,'5106190','Nova Santa Helena','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5258,'5106208','Nova Brasilândia','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5259,'5106216','Nova Canaã do Norte','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5260,'5106224','Nova Mutum','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5261,'5106232','Nova Olímpia','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5262,'5106240','Nova Ubiratã','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5263,'5106257','Nova Xavantina','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5264,'5106265','Novo Mundo','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5265,'5106273','Novo Horizonte do Norte','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5266,'5106281','Novo São Joaquim','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5267,'5106299','Paranaíta','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5268,'5106307','Paranatinga','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5269,'5106315','Novo Santo Antônio','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5270,'5106372','Pedra Preta','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5271,'5106422','Peixoto de Azevedo','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5272,'5106455','Planalto da Serra','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5273,'5106505','Poconé','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5274,'5106653','Pontal do Araguaia','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5275,'5106703','Ponte Branca','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5276,'5106752','Pontes e Lacerda','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5277,'5106778','Porto Alegre do Norte','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5278,'5106802','Porto dos Gaúchos','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5279,'5106828','Porto Esperidião','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5280,'5106851','Porto Estrela','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5281,'5107008','Poxoréo','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5282,'5107040','Primavera do Leste','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5283,'5107065','Querência','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5284,'5107107','São José dos Quatro Marcos','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5285,'5107156','Reserva do Cabaçal','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5286,'5107180','Ribeirão Cascalheira','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5287,'5107198','Ribeirãozinho','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5288,'5107206','Rio Branco','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5289,'5107248','Santa Carmem','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5290,'5107263','Santo Afonso','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5291,'5107297','São José do Povo','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5292,'5107305','São José do Rio Claro','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5293,'5107354','São José do Xingu','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5294,'5107404','São Pedro da Cipa','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5295,'5107578','Rondolândia','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5296,'5107602','Rondonópolis','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5297,'5107701','Rosário Oeste','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5298,'5107743','Santa Cruz do Xingu','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5299,'5107750','Salto do Céu','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5300,'5107768','Santa Rita do Trivelato','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5301,'5107776','Santa Terezinha','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5302,'5107792','Santo Antônio do Leste','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5303,'5107800','Santo Antônio do Leverger','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5304,'5107859','São Félix do Araguaia','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5305,'5107875','Sapezal','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5306,'5107883','Serra Nova Dourada','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5307,'5107909','Sinop','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5308,'5107925','Sorriso','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5309,'5107941','Tabaporã','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5310,'5107958','Tangará da Serra','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5311,'5108006','Tapurah','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5312,'5108055','Terra Nova do Norte','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5313,'5108105','Tesouro','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5314,'5108204','Torixoréu','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5315,'5108303','União do Sul','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5316,'5108352','Vale de São Domingos','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5317,'5108402','Várzea Grande','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5318,'5108501','Vera','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5319,'5108600','Vila Rica','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5320,'5108808','Nova Guarita','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5321,'5108857','Nova Marilândia','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5322,'5108907','Nova Maringá','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5323,'5108956','Nova Monte Verde','MT','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5324,'5200050','Abadia de Goiás','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5325,'5200100','Abadiânia','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5326,'5200134','Acreúna','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5327,'5200159','Adelândia','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5328,'5200175','Água Fria de Goiás','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5329,'5200209','Água Limpa','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5330,'5200258','Águas Lindas de Goiás','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5331,'5200308','Alexânia','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5332,'5200506','Aloândia','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5333,'5200555','Alto Horizonte','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5334,'5200605','Alto Paraíso de Goiás','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5335,'5200803','Alvorada do Norte','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5336,'5200829','Amaralina','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5337,'5200852','Americano do Brasil','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5338,'5200902','Amorinópolis','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5339,'5201108','Anápolis','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5340,'5201207','Anhanguera','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5341,'5201306','Anicuns','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5342,'5201405','Aparecida de Goiânia','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5343,'5201454','Aparecida do Rio Doce','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5344,'5201504','Aporé','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5345,'5201603','Araçu','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5346,'5201702','Aragarças','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5347,'5201801','Aragoiânia','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5348,'5202155','Araguapaz','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5349,'5202353','Arenópolis','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5350,'5202502','Aruanã','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5351,'5202601','Aurilândia','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5352,'5202809','Avelinópolis','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5353,'5203104','Baliza','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5354,'5203203','Barro Alto','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5355,'5203302','Bela Vista de Goiás','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5356,'5203401','Bom Jardim de Goiás','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5357,'5203500','Bom Jesus de Goiás','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5358,'5203559','Bonfinópolis','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5359,'5203575','Bonópolis','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5360,'5203609','Brazabrantes','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5361,'5203807','Britânia','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5362,'5203906','Buriti Alegre','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5363,'5203939','Buriti de Goiás','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5364,'5203962','Buritinópolis','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5365,'5204003','Cabeceiras','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5366,'5204102','Cachoeira Alta','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5367,'5204201','Cachoeira de Goiás','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5368,'5204250','Cachoeira Dourada','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5369,'5204300','Caçu','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5370,'5204409','Caiapônia','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5371,'5204508','Caldas Novas','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5372,'5204557','Caldazinha','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5373,'5204607','Campestre de Goiás','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5374,'5204656','Campinaçu','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5375,'5204706','Campinorte','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5376,'5204805','Campo Alegre de Goiás','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5377,'5204854','Campo Limpo de Goiás','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5378,'5204904','Campos Belos','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5379,'5204953','Campos Verdes','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5380,'5205000','Carmo do Rio Verde','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5381,'5205059','Castelândia','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5382,'5205109','Catalão','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5383,'5205208','Caturaí','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5384,'5205307','Cavalcante','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5385,'5205406','Ceres','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5386,'5205455','Cezarina','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5387,'5205471','Chapadão do Céu','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5388,'5205497','cidades Ocidental','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5389,'5205513','Cocalzinho de Goiás','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5390,'5205521','Colinas do Sul','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5391,'5205703','Córrego do Ouro','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5392,'5205802','Corumbá de Goiás','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5393,'5205901','Corumbaíba','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5394,'5206206','Cristalina','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5395,'5206305','Cristianópolis','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5396,'5206404','Crixás','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5397,'5206503','Cromínia','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5398,'5206602','Cumari','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5399,'5206701','Damianópolis','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5400,'5206800','Damolândia','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5401,'5206909','Davinópolis','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5402,'5207105','Diorama','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5403,'5207253','Doverlândia','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5404,'5207352','Edealina','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5405,'5207402','Edéia','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5406,'5207501','Estrela do Norte','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5407,'5207535','Faina','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5408,'5207600','Fazenda Nova','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5409,'5207808','Firminópolis','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5410,'5207907','Flores de Goiás','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5411,'5208004','Formosa','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5412,'5208103','Formoso','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5413,'5208152','Gameleira de Goiás','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5414,'5208301','Divinópolis de Goiás','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5415,'5208400','Goianápolis','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5416,'5208509','Goiandira','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5417,'5208608','Goianésia','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5418,'5208707','Goiânia','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5419,'5208806','Goianira','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5420,'5208905','Goiás','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5421,'5209101','Goiatuba','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5422,'5209150','Gouvelândia','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5423,'5209200','Guapó','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5424,'5209291','Guaraíta','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5425,'5209408','Guarani de Goiás','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5426,'5209457','Guarinos','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5427,'5209606','Heitoraí','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5428,'5209705','Hidrolândia','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5429,'5209804','Hidrolina','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5430,'5209903','Iaciara','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5431,'5209937','Inaciolândia','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5432,'5209952','Indiara','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5433,'5210000','Inhumas','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5434,'5210109','Ipameri','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5435,'5210158','Ipiranga de Goiás','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5436,'5210208','Iporá','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5437,'5210307','Israelândia','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5438,'5210406','Itaberaí','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5439,'5210562','Itaguari','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5440,'5210604','Itaguaru','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5441,'5210802','Itajá','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5442,'5210901','Itapaci','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5443,'5211008','Itapirapuã','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5444,'5211206','Itapuranga','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5445,'5211305','Itarumã','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5446,'5211404','Itauçu','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5447,'5211503','Itumbiara','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5448,'5211602','Ivolândia','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5449,'5211701','Jandaia','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5450,'5211800','Jaraguá','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5451,'5211909','Jataí','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5452,'5212006','Jaupaci','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5453,'5212055','Jesúpolis','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5454,'5212105','Joviânia','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5455,'5212204','Jussara','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5456,'5212253','Lagoa Santa','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5457,'5212303','Leopoldo de Bulhões','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5458,'5212501','Luziânia','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5459,'5212600','Mairipotaba','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5460,'5212709','Mambaí','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5461,'5212808','Mara Rosa','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5462,'5212907','Marzagão','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5463,'5212956','Matrinchã','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5464,'5213004','Maurilândia','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5465,'5213053','Mimoso de Goiás','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5466,'5213087','Minaçu','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5467,'5213103','Mineiros','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5468,'5213400','Moiporá','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5469,'5213509','Monte Alegre de Goiás','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5470,'5213707','Montes Claros de Goiás','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5471,'5213756','Montividiu','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5472,'5213772','Montividiu do Norte','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5473,'5213806','Morrinhos','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5474,'5213855','Morro Agudo de Goiás','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5475,'5213905','Mossâmedes','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5476,'5214002','Mozarlândia','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5477,'5214051','Mundo Novo','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5478,'5214101','Mutunópolis','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5479,'5214408','Nazário','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5480,'5214507','Nerópolis','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5481,'5214606','Niquelândia','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5482,'5214705','Nova América','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5483,'5214804','Nova Aurora','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5484,'5214838','Nova Crixás','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5485,'5214861','Nova Glória','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5486,'5214879','Nova Iguaçu de Goiás','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5487,'5214903','Nova Roma','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5488,'5215009','Nova Veneza','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5489,'5215207','Novo Brasil','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5490,'5215231','Novo Gama','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5491,'5215256','Novo Planalto','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5492,'5215306','Orizona','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5493,'5215405','Ouro Verde de Goiás','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5494,'5215504','Ouvidor','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5495,'5215603','Padre Bernardo','GO','2024-09-03 10:31:16','2024-09-03 10:31:16'),(5496,'5215652','Palestina de Goiás','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5497,'5215702','Palmeiras de Goiás','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5498,'5215801','Palmelo','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5499,'5215900','Palminópolis','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5500,'5216007','Panamá','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5501,'5216304','Paranaiguara','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5502,'5216403','Paraúna','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5503,'5216452','Perolândia','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5504,'5216809','Petrolina de Goiás','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5505,'5216908','Pilar de Goiás','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5506,'5217104','Piracanjuba','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5507,'5217203','Piranhas','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5508,'5217302','Pirenópolis','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5509,'5217401','Pires do Rio','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5510,'5217609','Planaltina','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5511,'5217708','Pontalina','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5512,'5218003','Porangatu','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5513,'5218052','Porteirão','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5514,'5218102','Portelândia','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5515,'5218300','Posse','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5516,'5218391','Professor Jamil','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5517,'5218508','Quirinópolis','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5518,'5218607','Rialma','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5519,'5218706','Rianápolis','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5520,'5218789','Rio Quente','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5521,'5218805','Rio Verde','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5522,'5218904','Rubiataba','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5523,'5219001','Sanclerlândia','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5524,'5219100','Santa Bárbara de Goiás','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5525,'5219209','Santa Cruz de Goiás','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5526,'5219258','Santa Fé de Goiás','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5527,'5219308','Santa Helena de Goiás','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5528,'5219357','Santa Isabel','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5529,'5219407','Santa Rita do Araguaia','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5530,'5219456','Santa Rita do Novo Destino','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5531,'5219506','Santa Rosa de Goiás','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5532,'5219605','Santa Tereza de Goiás','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5533,'5219704','Santa Terezinha de Goiás','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5534,'5219712','Santo Antônio da Barra','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5535,'5219738','Santo Antônio de Goiás','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5536,'5219753','Santo Antônio do Descoberto','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5537,'5219803','São Domingos','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5538,'5219902','São Francisco de Goiás','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5539,'5220009','São João D\'Aliança','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5540,'5220058','São João da Paraúna','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5541,'5220108','São Luís de Montes Belos','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5542,'5220157','São Luíz do Norte','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5543,'5220207','São Miguel do Araguaia','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5544,'5220264','São Miguel do Passa Quatro','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5545,'5220280','São Patrício','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5546,'5220405','São Simão','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5547,'5220454','Senador Canedo','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5548,'5220504','Serranópolis','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5549,'5220603','Silvânia','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5550,'5220686','Simolândia','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5551,'5220702','Sítio D\'Abadia','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5552,'5221007','Taquaral de Goiás','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5553,'5221080','Teresina de Goiás','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5554,'5221197','Terezópolis de Goiás','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5555,'5221304','Três Ranchos','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5556,'5221403','Trindade','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5557,'5221452','Trombas','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5558,'5221502','Turvânia','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5559,'5221551','Turvelândia','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5560,'5221577','Uirapuru','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5561,'5221601','Uruaçu','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5562,'5221700','Uruana','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5563,'5221809','Urutaí','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5564,'5221858','Valparaíso de Goiás','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5565,'5221908','Varjão','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5566,'5222005','Vianópolis','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5567,'5222054','Vicentinópolis','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5568,'5222203','Vila Boa','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5569,'5222302','Vila Propício','GO','2024-09-03 10:31:17','2024-09-03 10:31:17'),(5570,'5300108','Brasília','DF','2024-09-03 10:31:17','2024-09-03 10:31:17');
/*!40000 ALTER TABLE `cidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciots`
--

--DROP TABLE IF EXISTS `ciots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciots` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `mdfe_id` bigint unsigned NOT NULL,
  `cpf_cnpj` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ciots_mdfe_id_foreign` (`mdfe_id`),
  CONSTRAINT `ciots_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciots`
--

LOCK TABLES `ciots` WRITE;
/*!40000 ALTER TABLE `ciots` DISABLE KEYS */;
/*!40000 ALTER TABLE `ciots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

--DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `razao_social` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_fantasia` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cpf_cnpj` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ie` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contribuinte` tinyint(1) NOT NULL DEFAULT '0',
  `consumidor_final` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cidade_id` bigint unsigned DEFAULT NULL,
  `rua` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complemento` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `token` int DEFAULT NULL,
  `uid` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `senha` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valor_cashback` decimal(10,2) NOT NULL DEFAULT '0.00',
  `valor_credito` decimal(10,2) NOT NULL DEFAULT '0.00',
  `nuvem_shop_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientes_empresa_id_foreign` (`empresa_id`),
  KEY `clientes_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `clientes_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
  CONSTRAINT `clientes_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comissao_vendas`
--

--DROP TABLE IF EXISTS `comissao_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comissao_vendas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `funcionario_id` bigint unsigned DEFAULT NULL,
  `nfe_id` int DEFAULT NULL,
  `nfce_id` int DEFAULT NULL,
  `tabela` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `valor_venda` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comissao_vendas_empresa_id_foreign` (`empresa_id`),
  KEY `comissao_vendas_funcionario_id_foreign` (`funcionario_id`),
  CONSTRAINT `comissao_vendas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `comissao_vendas_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comissao_vendas`
--

LOCK TABLES `comissao_vendas` WRITE;
/*!40000 ALTER TABLE `comissao_vendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `comissao_vendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `componente_ctes`
--

--DROP TABLE IF EXISTS `componente_ctes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `componente_ctes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cte_id` bigint unsigned NOT NULL,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `componente_ctes_cte_id_foreign` (`cte_id`),
  CONSTRAINT `componente_ctes_cte_id_foreign` FOREIGN KEY (`cte_id`) REFERENCES `ctes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componente_ctes`
--

LOCK TABLES `componente_ctes` WRITE;
/*!40000 ALTER TABLE `componente_ctes` DISABLE KEYS */;
/*!40000 ALTER TABLE `componente_ctes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_gerals`
--

--DROP TABLE IF EXISTS `config_gerals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_gerals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `balanca_valor_peso` enum('peso','valor') COLLATE utf8mb4_unicode_ci NOT NULL,
  `balanca_digito_verificador` int DEFAULT NULL,
  `confirmar_itens_prevenda` tinyint(1) NOT NULL DEFAULT '0',
  `gerenciar_estoque` tinyint(1) NOT NULL DEFAULT '0',
  `notificacoes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `margem_combo` decimal(5,2) NOT NULL DEFAULT '50.00',
  `percentual_desconto_orcamento` decimal(5,2) DEFAULT NULL,
  `percentual_lucro_produto` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tipos_pagamento_pdv` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha_manipula_valor` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abrir_modal_cartao` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `config_gerals_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `config_gerals_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_gerals`
--

LOCK TABLES `config_gerals` WRITE;
/*!40000 ALTER TABLE `config_gerals` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_gerals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracao_cardapios`
--

--DROP TABLE IF EXISTS `configuracao_cardapios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuracao_cardapios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `nome_restaurante` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao_restaurante_pt` text COLLATE utf8mb4_unicode_ci,
  `descricao_restaurante_en` text COLLATE utf8mb4_unicode_ci,
  `descricao_restaurante_es` text COLLATE utf8mb4_unicode_ci,
  `logo` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fav_icon` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rua` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade_id` bigint unsigned NOT NULL,
  `api_token` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_instagran` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_facebook` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_whatsapp` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intercionalizar` tinyint(1) NOT NULL DEFAULT '0',
  `valor_pizza` enum('divide','valor_maior') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'divide',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `configuracao_cardapios_empresa_id_foreign` (`empresa_id`),
  KEY `configuracao_cardapios_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `configuracao_cardapios_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
  CONSTRAINT `configuracao_cardapios_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracao_cardapios`
--

LOCK TABLES `configuracao_cardapios` WRITE;
/*!40000 ALTER TABLE `configuracao_cardapios` DISABLE KEYS */;
/*!40000 ALTER TABLE `configuracao_cardapios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracao_supers`
--

--DROP TABLE IF EXISTS `configuracao_supers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuracao_supers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cpf_cnpj` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mercadopago_public_key` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mercadopago_access_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_key` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_whatsapp` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usuario_correios` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo_acesso_correios` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cartao_postagem_correios` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_correios` text COLLATE utf8mb4_unicode_ci,
  `token_expira_correios` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dr_correios` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contrato_correios` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_auth_nfse` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeout_nfe` int NOT NULL DEFAULT '8',
  `timeout_nfce` int NOT NULL DEFAULT '8',
  `timeout_cte` int NOT NULL DEFAULT '8',
  `timeout_mdfe` int NOT NULL DEFAULT '8',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `configuracao_supers_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracao_supers`
--

LOCK TABLES `configuracao_supers` WRITE;
/*!40000 ALTER TABLE `configuracao_supers` DISABLE KEYS */;
/*!40000 ALTER TABLE `configuracao_supers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumo_reservas`
--

--DROP TABLE IF EXISTS `consumo_reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumo_reservas`
--

LOCK TABLES `consumo_reservas` WRITE;
/*!40000 ALTER TABLE `consumo_reservas` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumo_reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta_boletos`
--

--DROP TABLE IF EXISTS `conta_boletos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conta_boletos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `banco` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agencia` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conta` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `titular` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `padrao` tinyint(1) NOT NULL DEFAULT '0',
  `usar_logo` tinyint(1) NOT NULL DEFAULT '0',
  `documento` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rua` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade_id` bigint unsigned DEFAULT NULL,
  `carteira` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `convenio` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `juros` decimal(10,2) DEFAULT NULL,
  `multa` decimal(10,2) DEFAULT NULL,
  `juros_apos` int DEFAULT NULL,
  `tipo` enum('Cnab400','Cnab240') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `conta_boletos_empresa_id_foreign` (`empresa_id`),
  KEY `conta_boletos_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `conta_boletos_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
  CONSTRAINT `conta_boletos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta_boletos`
--

LOCK TABLES `conta_boletos` WRITE;
/*!40000 ALTER TABLE `conta_boletos` DISABLE KEYS */;
/*!40000 ALTER TABLE `conta_boletos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta_empresas`
--

--DROP TABLE IF EXISTS `conta_empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conta_empresas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banco` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agencia` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conta` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plano_conta_id` int DEFAULT NULL,
  `saldo` decimal(16,2) DEFAULT NULL,
  `saldo_inicial` decimal(16,2) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `conta_empresas_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `conta_empresas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta_empresas`
--

LOCK TABLES `conta_empresas` WRITE;
/*!40000 ALTER TABLE `conta_empresas` DISABLE KEYS */;
/*!40000 ALTER TABLE `conta_empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta_pagars`
--

--DROP TABLE IF EXISTS `conta_pagars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conta_pagars` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `nfe_id` bigint unsigned DEFAULT NULL,
  `fornecedor_id` bigint unsigned DEFAULT NULL,
  `descricao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arquivo` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valor_integral` decimal(16,7) NOT NULL,
  `valor_pago` decimal(16,7) DEFAULT NULL,
  `data_vencimento` date NOT NULL,
  `data_pagamento` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `observacao` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caixa_id` bigint unsigned DEFAULT NULL,
  `local_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `conta_pagars_empresa_id_foreign` (`empresa_id`),
  KEY `conta_pagars_nfe_id_foreign` (`nfe_id`),
  KEY `conta_pagars_fornecedor_id_foreign` (`fornecedor_id`),
  KEY `conta_pagars_caixa_id_foreign` (`caixa_id`),
  CONSTRAINT `conta_pagars_caixa_id_foreign` FOREIGN KEY (`caixa_id`) REFERENCES `caixas` (`id`),
  CONSTRAINT `conta_pagars_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `conta_pagars_fornecedor_id_foreign` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedors` (`id`),
  CONSTRAINT `conta_pagars_nfe_id_foreign` FOREIGN KEY (`nfe_id`) REFERENCES `nves` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta_pagars`
--

LOCK TABLES `conta_pagars` WRITE;
/*!40000 ALTER TABLE `conta_pagars` DISABLE KEYS */;
/*!40000 ALTER TABLE `conta_pagars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta_recebers`
--

--DROP TABLE IF EXISTS `conta_recebers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conta_recebers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `nfe_id` bigint unsigned DEFAULT NULL,
  `nfce_id` bigint unsigned DEFAULT NULL,
  `cliente_id` bigint unsigned DEFAULT NULL,
  `descricao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arquivo` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valor_integral` decimal(16,7) NOT NULL,
  `valor_recebido` decimal(16,7) DEFAULT NULL,
  `data_vencimento` date NOT NULL,
  `data_recebimento` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `observacao` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caixa_id` bigint unsigned DEFAULT NULL,
  `local_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `conta_recebers_empresa_id_foreign` (`empresa_id`),
  KEY `conta_recebers_nfe_id_foreign` (`nfe_id`),
  KEY `conta_recebers_nfce_id_foreign` (`nfce_id`),
  KEY `conta_recebers_cliente_id_foreign` (`cliente_id`),
  KEY `conta_recebers_caixa_id_foreign` (`caixa_id`),
  CONSTRAINT `conta_recebers_caixa_id_foreign` FOREIGN KEY (`caixa_id`) REFERENCES `caixas` (`id`),
  CONSTRAINT `conta_recebers_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `conta_recebers_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `conta_recebers_nfce_id_foreign` FOREIGN KEY (`nfce_id`) REFERENCES `nfces` (`id`),
  CONSTRAINT `conta_recebers_nfe_id_foreign` FOREIGN KEY (`nfe_id`) REFERENCES `nves` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta_recebers`
--

LOCK TABLES `conta_recebers` WRITE;
/*!40000 ALTER TABLE `conta_recebers` DISABLE KEYS */;
/*!40000 ALTER TABLE `conta_recebers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contador_empresas`
--

--DROP TABLE IF EXISTS `contador_empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contador_empresas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `contador_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contador_empresas_empresa_id_foreign` (`empresa_id`),
  KEY `contador_empresas_contador_id_foreign` (`contador_id`),
  CONSTRAINT `contador_empresas_contador_id_foreign` FOREIGN KEY (`contador_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `contador_empresas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contador_empresas`
--

LOCK TABLES `contador_empresas` WRITE;
/*!40000 ALTER TABLE `contador_empresas` DISABLE KEYS */;
/*!40000 ALTER TABLE `contador_empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contigencias`
--

--DROP TABLE IF EXISTS `contigencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contigencias` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `tipo` enum('SVCAN','SVCRS','OFFLINE') COLLATE utf8mb4_unicode_ci NOT NULL,
  `motivo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_retorno` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `documento` enum('NFe','NFCe','CTe','MDFe') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contigencias_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `contigencias_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contigencias`
--

LOCK TABLES `contigencias` WRITE;
/*!40000 ALTER TABLE `contigencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `contigencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotacaos`
--

--DROP TABLE IF EXISTS `cotacaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cotacaos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `fornecedor_id` bigint unsigned NOT NULL,
  `responsavel` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hash_link` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referencia` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao_resposta` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observacao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `valor_total` decimal(10,2) DEFAULT NULL,
  `desconto` decimal(10,2) DEFAULT NULL,
  `estado` enum('nova','respondida','aprovada','rejeitada') COLLATE utf8mb4_unicode_ci NOT NULL,
  `escolhida` tinyint(1) NOT NULL DEFAULT '0',
  `data_resposta` timestamp NULL DEFAULT NULL,
  `nfe_id` int DEFAULT NULL,
  `valor_frete` decimal(10,2) DEFAULT NULL,
  `observacao_frete` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `previsao_entrega` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cotacaos_empresa_id_foreign` (`empresa_id`),
  KEY `cotacaos_fornecedor_id_foreign` (`fornecedor_id`),
  CONSTRAINT `cotacaos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `cotacaos_fornecedor_id_foreign` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotacaos`
--

LOCK TABLES `cotacaos` WRITE;
/*!40000 ALTER TABLE `cotacaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotacaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credito_clientes`
--

--DROP TABLE IF EXISTS `credito_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credito_clientes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` bigint unsigned NOT NULL,
  `valor` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `credito_clientes_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `credito_clientes_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credito_clientes`
--

LOCK TABLES `credito_clientes` WRITE;
/*!40000 ALTER TABLE `credito_clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `credito_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cte_os`
--

--DROP TABLE IF EXISTS `cte_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cte_os` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `emitente_id` bigint unsigned DEFAULT NULL,
  `tomador_id` bigint unsigned DEFAULT NULL,
  `municipio_envio` bigint unsigned DEFAULT NULL,
  `municipio_inicio` bigint unsigned DEFAULT NULL,
  `municipio_fim` bigint unsigned DEFAULT NULL,
  `veiculo_id` bigint unsigned DEFAULT NULL,
  `usuario_id` bigint unsigned DEFAULT NULL,
  `modal` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cst` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00',
  `perc_icms` decimal(5,2) NOT NULL DEFAULT '0.00',
  `valor_transporte` decimal(10,2) NOT NULL,
  `valor_receber` decimal(10,2) NOT NULL,
  `descricao_servico` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `quantidade_carga` decimal(12,4) NOT NULL,
  `natureza_id` bigint unsigned DEFAULT NULL,
  `tomador` int NOT NULL,
  `sequencia_cce` int NOT NULL,
  `observacao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_emissao` int NOT NULL DEFAULT '0',
  `chave` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_emissao` enum('novo','aprovado','cancelado','rejeitado') COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_emissao` timestamp NULL DEFAULT NULL,
  `data_viagem` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `horario_viagem` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cfop` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recibo` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `local_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cte_os_empresa_id_foreign` (`empresa_id`),
  KEY `cte_os_emitente_id_foreign` (`emitente_id`),
  KEY `cte_os_tomador_id_foreign` (`tomador_id`),
  KEY `cte_os_municipio_envio_foreign` (`municipio_envio`),
  KEY `cte_os_municipio_inicio_foreign` (`municipio_inicio`),
  KEY `cte_os_municipio_fim_foreign` (`municipio_fim`),
  KEY `cte_os_veiculo_id_foreign` (`veiculo_id`),
  KEY `cte_os_usuario_id_foreign` (`usuario_id`),
  KEY `cte_os_natureza_id_foreign` (`natureza_id`),
  CONSTRAINT `cte_os_emitente_id_foreign` FOREIGN KEY (`emitente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `cte_os_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `cte_os_municipio_envio_foreign` FOREIGN KEY (`municipio_envio`) REFERENCES `cidades` (`id`),
  CONSTRAINT `cte_os_municipio_fim_foreign` FOREIGN KEY (`municipio_fim`) REFERENCES `cidades` (`id`),
  CONSTRAINT `cte_os_municipio_inicio_foreign` FOREIGN KEY (`municipio_inicio`) REFERENCES `cidades` (`id`),
  CONSTRAINT `cte_os_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`),
  CONSTRAINT `cte_os_tomador_id_foreign` FOREIGN KEY (`tomador_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `cte_os_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`),
  CONSTRAINT `cte_os_veiculo_id_foreign` FOREIGN KEY (`veiculo_id`) REFERENCES `veiculos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cte_os`
--

LOCK TABLES `cte_os` WRITE;
/*!40000 ALTER TABLE `cte_os` DISABLE KEYS */;
/*!40000 ALTER TABLE `cte_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctes`
--

--DROP TABLE IF EXISTS `ctes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ctes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `remetente_id` bigint unsigned NOT NULL,
  `destinatario_id` bigint unsigned NOT NULL,
  `recebedor_id` bigint unsigned DEFAULT NULL,
  `expedidor_id` bigint unsigned DEFAULT NULL,
  `veiculo_id` bigint unsigned DEFAULT NULL,
  `natureza_id` bigint unsigned DEFAULT NULL,
  `tomador` int NOT NULL,
  `municipio_envio` bigint unsigned NOT NULL,
  `municipio_inicio` bigint unsigned NOT NULL,
  `municipio_fim` bigint unsigned NOT NULL,
  `logradouro_tomador` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_tomador` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bairro_tomador` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cep_tomador` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `municipio_tomador` bigint unsigned NOT NULL,
  `valor_transporte` decimal(10,2) NOT NULL,
  `valor_receber` decimal(10,2) NOT NULL,
  `valor_carga` decimal(10,2) NOT NULL,
  `produto_predominante` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_prevista_entrega` date NOT NULL,
  `observacao` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sequencia_cce` int NOT NULL DEFAULT '0',
  `chave` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recibo` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_serie` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` int NOT NULL,
  `estado` enum('novo','rejeitado','cancelado','aprovado') COLLATE utf8mb4_unicode_ci NOT NULL,
  `motivo_rejeicao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `retira` tinyint(1) NOT NULL,
  `detalhes_retira` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modal` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ambiente` int NOT NULL,
  `tpDoc` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descOutros` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nDoc` int NOT NULL,
  `vDocFisc` decimal(10,2) NOT NULL,
  `globalizado` int NOT NULL,
  `cst` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00',
  `perc_icms` decimal(5,2) NOT NULL DEFAULT '0.00',
  `perc_red_bc` decimal(5,2) NOT NULL DEFAULT '0.00',
  `status_pagamento` tinyint(1) NOT NULL DEFAULT '0',
  `cfop` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api` tinyint(1) NOT NULL DEFAULT '0',
  `local_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ctes_empresa_id_foreign` (`empresa_id`),
  KEY `ctes_remetente_id_foreign` (`remetente_id`),
  KEY `ctes_destinatario_id_foreign` (`destinatario_id`),
  KEY `ctes_recebedor_id_foreign` (`recebedor_id`),
  KEY `ctes_expedidor_id_foreign` (`expedidor_id`),
  KEY `ctes_veiculo_id_foreign` (`veiculo_id`),
  KEY `ctes_natureza_id_foreign` (`natureza_id`),
  KEY `ctes_municipio_envio_foreign` (`municipio_envio`),
  KEY `ctes_municipio_inicio_foreign` (`municipio_inicio`),
  KEY `ctes_municipio_fim_foreign` (`municipio_fim`),
  KEY `ctes_municipio_tomador_foreign` (`municipio_tomador`),
  CONSTRAINT `ctes_destinatario_id_foreign` FOREIGN KEY (`destinatario_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `ctes_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `ctes_expedidor_id_foreign` FOREIGN KEY (`expedidor_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `ctes_municipio_envio_foreign` FOREIGN KEY (`municipio_envio`) REFERENCES `cidades` (`id`),
  CONSTRAINT `ctes_municipio_fim_foreign` FOREIGN KEY (`municipio_fim`) REFERENCES `cidades` (`id`),
  CONSTRAINT `ctes_municipio_inicio_foreign` FOREIGN KEY (`municipio_inicio`) REFERENCES `cidades` (`id`),
  CONSTRAINT `ctes_municipio_tomador_foreign` FOREIGN KEY (`municipio_tomador`) REFERENCES `cidades` (`id`),
  CONSTRAINT `ctes_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`),
  CONSTRAINT `ctes_recebedor_id_foreign` FOREIGN KEY (`recebedor_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `ctes_remetente_id_foreign` FOREIGN KEY (`remetente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `ctes_veiculo_id_foreign` FOREIGN KEY (`veiculo_id`) REFERENCES `veiculos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctes`
--

LOCK TABLES `ctes` WRITE;
/*!40000 ALTER TABLE `ctes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ctes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupom_desconto_clientes`
--

--DROP TABLE IF EXISTS `cupom_desconto_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupom_desconto_clientes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` bigint unsigned NOT NULL,
  `empresa_id` bigint unsigned NOT NULL,
  `cupom_id` bigint unsigned NOT NULL,
  `pedido_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cupom_desconto_clientes_cliente_id_foreign` (`cliente_id`),
  KEY `cupom_desconto_clientes_empresa_id_foreign` (`empresa_id`),
  KEY `cupom_desconto_clientes_cupom_id_foreign` (`cupom_id`),
  KEY `cupom_desconto_clientes_pedido_id_foreign` (`pedido_id`),
  CONSTRAINT `cupom_desconto_clientes_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `cupom_desconto_clientes_cupom_id_foreign` FOREIGN KEY (`cupom_id`) REFERENCES `cupom_descontos` (`id`),
  CONSTRAINT `cupom_desconto_clientes_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `cupom_desconto_clientes_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedido_deliveries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupom_desconto_clientes`
--

LOCK TABLES `cupom_desconto_clientes` WRITE;
/*!40000 ALTER TABLE `cupom_desconto_clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cupom_desconto_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupom_descontos`
--

--DROP TABLE IF EXISTS `cupom_descontos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupom_descontos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `cliente_id` bigint unsigned DEFAULT NULL,
  `tipo_desconto` enum('valor','percentual') COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valor` decimal(10,4) NOT NULL,
  `valor_minimo_pedido` decimal(12,4) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `expiracao` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cupom_descontos_empresa_id_foreign` (`empresa_id`),
  KEY `cupom_descontos_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `cupom_descontos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `cupom_descontos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupom_descontos`
--

LOCK TABLES `cupom_descontos` WRITE;
/*!40000 ALTER TABLE `cupom_descontos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cupom_descontos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destaque_market_places`
--

--DROP TABLE IF EXISTS `destaque_market_places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destaque_market_places` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `produto_id` bigint unsigned DEFAULT NULL,
  `servico_id` bigint unsigned DEFAULT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valor` decimal(12,4) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `imagem` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `destaque_market_places_empresa_id_foreign` (`empresa_id`),
  KEY `destaque_market_places_produto_id_foreign` (`produto_id`),
  KEY `destaque_market_places_servico_id_foreign` (`servico_id`),
  CONSTRAINT `destaque_market_places_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `destaque_market_places_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `destaque_market_places_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destaque_market_places`
--

LOCK TABLES `destaque_market_places` WRITE;
/*!40000 ALTER TABLE `destaque_market_places` DISABLE KEYS */;
/*!40000 ALTER TABLE `destaque_market_places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dia_semanas`
--

--DROP TABLE IF EXISTS `dia_semanas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dia_semanas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `funcionario_id` bigint unsigned DEFAULT NULL,
  `dia` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dia_semanas_funcionario_id_foreign` (`funcionario_id`),
  KEY `dia_semanas_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `dia_semanas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `dia_semanas_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dia_semanas`
--

LOCK TABLES `dia_semanas` WRITE;
/*!40000 ALTER TABLE `dia_semanas` DISABLE KEYS */;
/*!40000 ALTER TABLE `dia_semanas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `difals`
--

--DROP TABLE IF EXISTS `difals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `difals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cfop` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pICMSUFDest` decimal(6,2) NOT NULL,
  `pICMSInter` decimal(6,2) NOT NULL,
  `pICMSInterPart` decimal(6,2) NOT NULL,
  `pFCPUFDest` decimal(6,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `difals_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `difals_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `difals`
--

LOCK TABLES `difals` WRITE;
/*!40000 ALTER TABLE `difals` DISABLE KEYS */;
/*!40000 ALTER TABLE `difals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_configs`
--

--DROP TABLE IF EXISTS `ecommerce_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loja_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao_breve` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rua` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade_id` bigint unsigned NOT NULL,
  `telefone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_facebook` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_whatsapp` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_instagram` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frete_gratis_valor` decimal(10,2) DEFAULT NULL,
  `mercadopago_public_key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mercadopago_access_token` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `habilitar_retirada` tinyint(1) NOT NULL DEFAULT '0',
  `notificacao_novo_pedido` tinyint(1) NOT NULL DEFAULT '1',
  `desconto_padrao_boleto` decimal(4,2) DEFAULT NULL,
  `desconto_padrao_pix` decimal(4,2) DEFAULT NULL,
  `desconto_padrao_cartao` decimal(4,2) DEFAULT NULL,
  `tipos_pagamento` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '[]',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `politica_privacidade` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `termos_condicoes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dados_deposito` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_configs_empresa_id_foreign` (`empresa_id`),
  KEY `ecommerce_configs_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `ecommerce_configs_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
  CONSTRAINT `ecommerce_configs_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_configs`
--

LOCK TABLES `ecommerce_configs` WRITE;
/*!40000 ALTER TABLE `ecommerce_configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

--DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_fantasia` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cpf_cnpj` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aut_xml` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ie` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `celular` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arquivo` blob,
  `senha` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `cep` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rua` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bairro` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complemento` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cidade_id` bigint unsigned DEFAULT NULL,
  `natureza_id_pdv` int DEFAULT NULL,
  `numero_ultima_nfe_producao` int DEFAULT NULL,
  `numero_ultima_nfe_homologacao` int DEFAULT NULL,
  `numero_serie_nfe` int DEFAULT NULL,
  `numero_ultima_nfce_producao` int DEFAULT NULL,
  `numero_ultima_nfce_homologacao` int DEFAULT NULL,
  `numero_serie_nfce` int DEFAULT NULL,
  `numero_ultima_cte_producao` int DEFAULT NULL,
  `numero_ultima_cte_homologacao` int DEFAULT NULL,
  `numero_serie_cte` int DEFAULT NULL,
  `numero_ultima_mdfe_producao` int DEFAULT NULL,
  `numero_ultima_mdfe_homologacao` int DEFAULT NULL,
  `numero_serie_mdfe` int DEFAULT NULL,
  `numero_ultima_nfse` int DEFAULT NULL,
  `numero_serie_nfse` int DEFAULT NULL,
  `csc` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `csc_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ambiente` int NOT NULL,
  `tributacao` enum('MEI','Simples Nacional','Regime Normal','Simples Nacional, excesso sublimite de receita bruta') COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_nfse` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tipo_contador` tinyint(1) NOT NULL DEFAULT '0',
  `limite_cadastro_empresas` int NOT NULL DEFAULT '0',
  `percentual_comissao` decimal(10,2) NOT NULL DEFAULT '0.00',
  `empresa_selecionada` int DEFAULT NULL,
  `exclusao_icms_pis_cofins` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `empresas_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `empresas_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco_deliveries`
--

--DROP TABLE IF EXISTS `endereco_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco_deliveries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cidade_id` bigint unsigned NOT NULL,
  `cliente_id` bigint unsigned NOT NULL,
  `bairro_id` bigint unsigned NOT NULL,
  `rua` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referencia` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cep` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` enum('casa','trabalho') COLLATE utf8mb4_unicode_ci NOT NULL,
  `padrao` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `endereco_deliveries_cidade_id_foreign` (`cidade_id`),
  KEY `endereco_deliveries_cliente_id_foreign` (`cliente_id`),
  KEY `endereco_deliveries_bairro_id_foreign` (`bairro_id`),
  CONSTRAINT `endereco_deliveries_bairro_id_foreign` FOREIGN KEY (`bairro_id`) REFERENCES `bairro_deliveries` (`id`),
  CONSTRAINT `endereco_deliveries_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
  CONSTRAINT `endereco_deliveries_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco_deliveries`
--

LOCK TABLES `endereco_deliveries` WRITE;
/*!40000 ALTER TABLE `endereco_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco_ecommerces`
--

--DROP TABLE IF EXISTS `endereco_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco_ecommerces` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cidade_id` bigint unsigned NOT NULL,
  `cliente_id` bigint unsigned NOT NULL,
  `rua` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referencia` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cep` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `padrao` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `endereco_ecommerces_cidade_id_foreign` (`cidade_id`),
  KEY `endereco_ecommerces_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `endereco_ecommerces_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
  CONSTRAINT `endereco_ecommerces_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco_ecommerces`
--

LOCK TABLES `endereco_ecommerces` WRITE;
/*!40000 ALTER TABLE `endereco_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoques`
--

--DROP TABLE IF EXISTS `estoques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoques` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` bigint unsigned DEFAULT NULL,
  `produto_variacao_id` bigint unsigned DEFAULT NULL,
  `quantidade` decimal(14,4) NOT NULL,
  `local_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estoques_produto_id_foreign` (`produto_id`),
  KEY `estoques_produto_variacao_id_foreign` (`produto_variacao_id`),
  CONSTRAINT `estoques_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `estoques_produto_variacao_id_foreign` FOREIGN KEY (`produto_variacao_id`) REFERENCES `produto_variacaos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoques`
--

LOCK TABLES `estoques` WRITE;
/*!40000 ALTER TABLE `estoques` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento_salarios`
--

--DROP TABLE IF EXISTS `evento_salarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento_salarios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` enum('semanal','mensal','anual') COLLATE utf8mb4_unicode_ci NOT NULL,
  `metodo` enum('informado','fixo') COLLATE utf8mb4_unicode_ci NOT NULL,
  `condicao` enum('soma','diminui') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_valor` enum('fixo','percentual') COLLATE utf8mb4_unicode_ci NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `empresa_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `evento_salarios_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `evento_salarios_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento_salarios`
--

LOCK TABLES `evento_salarios` WRITE;
/*!40000 ALTER TABLE `evento_salarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `evento_salarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

--DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fatura_cotacaos`
--

--DROP TABLE IF EXISTS `fatura_cotacaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fatura_cotacaos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cotacao_id` bigint unsigned DEFAULT NULL,
  `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_vencimento` date NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fatura_cotacaos_cotacao_id_foreign` (`cotacao_id`),
  CONSTRAINT `fatura_cotacaos_cotacao_id_foreign` FOREIGN KEY (`cotacao_id`) REFERENCES `cotacaos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fatura_cotacaos`
--

LOCK TABLES `fatura_cotacaos` WRITE;
/*!40000 ALTER TABLE `fatura_cotacaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `fatura_cotacaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fatura_nfces`
--

--DROP TABLE IF EXISTS `fatura_nfces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fatura_nfces` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nfce_id` bigint unsigned DEFAULT NULL,
  `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_vencimento` date NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fatura_nfces_nfce_id_foreign` (`nfce_id`),
  CONSTRAINT `fatura_nfces_nfce_id_foreign` FOREIGN KEY (`nfce_id`) REFERENCES `nfces` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fatura_nfces`
--

LOCK TABLES `fatura_nfces` WRITE;
/*!40000 ALTER TABLE `fatura_nfces` DISABLE KEYS */;
/*!40000 ALTER TABLE `fatura_nfces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fatura_nves`
--

--DROP TABLE IF EXISTS `fatura_nves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fatura_nves` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nfe_id` bigint unsigned DEFAULT NULL,
  `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_vencimento` date NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fatura_nves_nfe_id_foreign` (`nfe_id`),
  CONSTRAINT `fatura_nves_nfe_id_foreign` FOREIGN KEY (`nfe_id`) REFERENCES `nves` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fatura_nves`
--

LOCK TABLES `fatura_nves` WRITE;
/*!40000 ALTER TABLE `fatura_nves` DISABLE KEYS */;
/*!40000 ALTER TABLE `fatura_nves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fatura_pre_vendas`
--

--DROP TABLE IF EXISTS `fatura_pre_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fatura_pre_vendas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pre_venda_id` bigint unsigned NOT NULL,
  `valor_parcela` decimal(16,7) NOT NULL,
  `tipo_pagamento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vencimento` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fatura_pre_vendas_pre_venda_id_foreign` (`pre_venda_id`),
  CONSTRAINT `fatura_pre_vendas_pre_venda_id_foreign` FOREIGN KEY (`pre_venda_id`) REFERENCES `pre_vendas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fatura_pre_vendas`
--

LOCK TABLES `fatura_pre_vendas` WRITE;
/*!40000 ALTER TABLE `fatura_pre_vendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `fatura_pre_vendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fatura_reservas`
--

--DROP TABLE IF EXISTS `fatura_reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fatura_reservas`
--

LOCK TABLES `fatura_reservas` WRITE;
/*!40000 ALTER TABLE `fatura_reservas` DISABLE KEYS */;
/*!40000 ALTER TABLE `fatura_reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financeiro_contadors`
--

--DROP TABLE IF EXISTS `financeiro_contadors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financeiro_contadors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `contador_id` bigint unsigned DEFAULT NULL,
  `percentual_comissao` decimal(5,2) NOT NULL,
  `valor_comissao` decimal(10,2) NOT NULL,
  `total_venda` decimal(10,2) NOT NULL,
  `mes` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ano` int NOT NULL,
  `tipo_pagamento` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observacao` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_pagamento` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `financeiro_contadors_contador_id_foreign` (`contador_id`),
  CONSTRAINT `financeiro_contadors_contador_id_foreign` FOREIGN KEY (`contador_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financeiro_contadors`
--

LOCK TABLES `financeiro_contadors` WRITE;
/*!40000 ALTER TABLE `financeiro_contadors` DISABLE KEYS */;
/*!40000 ALTER TABLE `financeiro_contadors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financeiro_planos`
--

--DROP TABLE IF EXISTS `financeiro_planos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financeiro_planos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `plano_id` bigint unsigned DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL,
  `tipo_pagamento` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_pagamento` enum('pendente','recebido','cancelado') COLLATE utf8mb4_unicode_ci NOT NULL,
  `plano_empresa_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `financeiro_planos_empresa_id_foreign` (`empresa_id`),
  KEY `financeiro_planos_plano_id_foreign` (`plano_id`),
  CONSTRAINT `financeiro_planos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `financeiro_planos_plano_id_foreign` FOREIGN KEY (`plano_id`) REFERENCES `planos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financeiro_planos`
--

LOCK TABLES `financeiro_planos` WRITE;
/*!40000 ALTER TABLE `financeiro_planos` DISABLE KEYS */;
/*!40000 ALTER TABLE `financeiro_planos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedors`
--

--DROP TABLE IF EXISTS `fornecedors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `razao_social` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_fantasia` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf_cnpj` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ie` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contribuinte` tinyint(1) NOT NULL DEFAULT '0',
  `consumidor_final` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cidade_id` bigint unsigned DEFAULT NULL,
  `rua` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complemento` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fornecedors_empresa_id_foreign` (`empresa_id`),
  KEY `fornecedors_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `fornecedors_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
  CONSTRAINT `fornecedors_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedors`
--

LOCK TABLES `fornecedors` WRITE;
/*!40000 ALTER TABLE `fornecedors` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frigobars`
--

--DROP TABLE IF EXISTS `frigobars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frigobars`
--

LOCK TABLES `frigobars` WRITE;
/*!40000 ALTER TABLE `frigobars` DISABLE KEYS */;
/*!40000 ALTER TABLE `frigobars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionamento_deliveries`
--

--DROP TABLE IF EXISTS `funcionamento_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionamento_deliveries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `inicio` time NOT NULL,
  `fim` time NOT NULL,
  `dia` enum('segunda','terca','quarta','quinta','sexta','sabado','domingo') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `funcionamento_deliveries_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `funcionamento_deliveries_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionamento_deliveries`
--

LOCK TABLES `funcionamento_deliveries` WRITE;
/*!40000 ALTER TABLE `funcionamento_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionamento_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionamentos`
--

--DROP TABLE IF EXISTS `funcionamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionamentos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `funcionario_id` bigint unsigned DEFAULT NULL,
  `inicio` time NOT NULL,
  `fim` time NOT NULL,
  `dia_id` enum('segunda','terca','quarta','quinta','sexta','sabado','domingo') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `funcionamentos_funcionario_id_foreign` (`funcionario_id`),
  CONSTRAINT `funcionamentos_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionamentos`
--

LOCK TABLES `funcionamentos` WRITE;
/*!40000 ALTER TABLE `funcionamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario_eventos`
--

--DROP TABLE IF EXISTS `funcionario_eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario_eventos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `funcionario_id` bigint unsigned NOT NULL,
  `evento_id` bigint unsigned DEFAULT NULL,
  `condicao` enum('soma','diminui') COLLATE utf8mb4_unicode_ci NOT NULL,
  `metodo` enum('informado','fixo') COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `funcionario_eventos_funcionario_id_foreign` (`funcionario_id`),
  KEY `funcionario_eventos_evento_id_foreign` (`evento_id`),
  CONSTRAINT `funcionario_eventos_evento_id_foreign` FOREIGN KEY (`evento_id`) REFERENCES `evento_salarios` (`id`),
  CONSTRAINT `funcionario_eventos_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario_eventos`
--

LOCK TABLES `funcionario_eventos` WRITE;
/*!40000 ALTER TABLE `funcionario_eventos` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario_eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario_os`
--

--DROP TABLE IF EXISTS `funcionario_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario_os` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint unsigned DEFAULT NULL,
  `ordem_servico_id` bigint unsigned DEFAULT NULL,
  `funcionario_id` bigint unsigned DEFAULT NULL,
  `funcao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `funcionario_os_usuario_id_foreign` (`usuario_id`),
  KEY `funcionario_os_ordem_servico_id_foreign` (`ordem_servico_id`),
  KEY `funcionario_os_funcionario_id_foreign` (`funcionario_id`),
  CONSTRAINT `funcionario_os_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`),
  CONSTRAINT `funcionario_os_ordem_servico_id_foreign` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servicos` (`id`),
  CONSTRAINT `funcionario_os_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario_os`
--

LOCK TABLES `funcionario_os` WRITE;
/*!40000 ALTER TABLE `funcionario_os` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario_servicos`
--

--DROP TABLE IF EXISTS `funcionario_servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario_servicos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `funcionario_id` bigint unsigned DEFAULT NULL,
  `servico_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `funcionario_servicos_empresa_id_foreign` (`empresa_id`),
  KEY `funcionario_servicos_funcionario_id_foreign` (`funcionario_id`),
  KEY `funcionario_servicos_servico_id_foreign` (`servico_id`),
  CONSTRAINT `funcionario_servicos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `funcionario_servicos_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `servicos` (`id`),
  CONSTRAINT `funcionario_servicos_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario_servicos`
--

LOCK TABLES `funcionario_servicos` WRITE;
/*!40000 ALTER TABLE `funcionario_servicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario_servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

--DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `nome` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf_cnpj` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cidade_id` bigint unsigned DEFAULT NULL,
  `rua` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cep` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bairro` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usuario_id` bigint unsigned DEFAULT NULL,
  `comissao` decimal(10,2) DEFAULT NULL,
  `salario` decimal(10,2) NOT NULL DEFAULT '0.00',
  `codigo` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `funcionarios_empresa_id_foreign` (`empresa_id`),
  KEY `funcionarios_cidade_id_foreign` (`cidade_id`),
  KEY `funcionarios_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `funcionarios_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
  CONSTRAINT `funcionarios_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `funcionarios_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galeria_produtos`
--

--DROP TABLE IF EXISTS `galeria_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galeria_produtos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` bigint unsigned NOT NULL,
  `imagem` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galeria_produtos_produto_id_foreign` (`produto_id`),
  CONSTRAINT `galeria_produtos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galeria_produtos`
--

LOCK TABLES `galeria_produtos` WRITE;
/*!40000 ALTER TABLE `galeria_produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `galeria_produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospede_reservas`
--

--DROP TABLE IF EXISTS `hospede_reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospede_reservas`
--

LOCK TABLES `hospede_reservas` WRITE;
/*!40000 ALTER TABLE `hospede_reservas` DISABLE KEYS */;
/*!40000 ALTER TABLE `hospede_reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibpts`
--

--DROP TABLE IF EXISTS `ibpts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ibpts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `versao` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibpts`
--

LOCK TABLES `ibpts` WRITE;
/*!40000 ALTER TABLE `ibpts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibpts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_descargas`
--

--DROP TABLE IF EXISTS `info_descargas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info_descargas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `mdfe_id` bigint unsigned NOT NULL,
  `cidade_id` bigint unsigned NOT NULL,
  `tp_unid_transp` int NOT NULL,
  `id_unid_transp` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantidade_rateio` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `info_descargas_mdfe_id_foreign` (`mdfe_id`),
  KEY `info_descargas_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `info_descargas_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
  CONSTRAINT `info_descargas_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_descargas`
--

LOCK TABLES `info_descargas` WRITE;
/*!40000 ALTER TABLE `info_descargas` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_descargas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interrupcoes`
--

--DROP TABLE IF EXISTS `interrupcoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interrupcoes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `funcionario_id` bigint unsigned DEFAULT NULL,
  `inicio` time NOT NULL,
  `fim` time NOT NULL,
  `dia_id` enum('segunda','terca','quarta','quinta','sexta','sabado','domingo') COLLATE utf8mb4_unicode_ci NOT NULL,
  `motivo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `interrupcoes_funcionario_id_foreign` (`funcionario_id`),
  KEY `interrupcoes_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `interrupcoes_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `interrupcoes_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interrupcoes`
--

LOCK TABLES `interrupcoes` WRITE;
/*!40000 ALTER TABLE `interrupcoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `interrupcoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inutilizacaos`
--

--DROP TABLE IF EXISTS `inutilizacaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inutilizacaos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `numero_inicial` int NOT NULL,
  `numero_final` int NOT NULL,
  `numero_serie` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modelo` enum('55','65') COLLATE utf8mb4_unicode_ci NOT NULL,
  `justificativa` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` enum('novo','aprovado','rejeitado') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inutilizacaos_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `inutilizacaos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inutilizacaos`
--

LOCK TABLES `inutilizacaos` WRITE;
/*!40000 ALTER TABLE `inutilizacaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `inutilizacaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_adicional_deliveries`
--

--DROP TABLE IF EXISTS `item_adicional_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_adicional_deliveries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_pedido_id` bigint unsigned NOT NULL,
  `adicional_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_adicional_deliveries_item_pedido_id_foreign` (`item_pedido_id`),
  KEY `item_adicional_deliveries_adicional_id_foreign` (`adicional_id`),
  CONSTRAINT `item_adicional_deliveries_adicional_id_foreign` FOREIGN KEY (`adicional_id`) REFERENCES `adicionals` (`id`),
  CONSTRAINT `item_adicional_deliveries_item_pedido_id_foreign` FOREIGN KEY (`item_pedido_id`) REFERENCES `item_pedido_deliveries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_adicional_deliveries`
--

LOCK TABLES `item_adicional_deliveries` WRITE;
/*!40000 ALTER TABLE `item_adicional_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_adicional_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_adicionals`
--

--DROP TABLE IF EXISTS `item_adicionals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_adicionals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_pedido_id` bigint unsigned NOT NULL,
  `adicional_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_adicionals_item_pedido_id_foreign` (`item_pedido_id`),
  KEY `item_adicionals_adicional_id_foreign` (`adicional_id`),
  CONSTRAINT `item_adicionals_adicional_id_foreign` FOREIGN KEY (`adicional_id`) REFERENCES `adicionals` (`id`),
  CONSTRAINT `item_adicionals_item_pedido_id_foreign` FOREIGN KEY (`item_pedido_id`) REFERENCES `item_pedidos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_adicionals`
--

LOCK TABLES `item_adicionals` WRITE;
/*!40000 ALTER TABLE `item_adicionals` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_adicionals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_agendamentos`
--

--DROP TABLE IF EXISTS `item_agendamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_agendamentos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `servico_id` bigint unsigned DEFAULT NULL,
  `agendamento_id` bigint unsigned DEFAULT NULL,
  `quantidade` int NOT NULL,
  `valor` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_agendamentos_servico_id_foreign` (`servico_id`),
  KEY `item_agendamentos_agendamento_id_foreign` (`agendamento_id`),
  CONSTRAINT `item_agendamentos_agendamento_id_foreign` FOREIGN KEY (`agendamento_id`) REFERENCES `agendamentos` (`id`),
  CONSTRAINT `item_agendamentos_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_agendamentos`
--

LOCK TABLES `item_agendamentos` WRITE;
/*!40000 ALTER TABLE `item_agendamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_agendamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_carrinho_adicional_deliveries`
--

--DROP TABLE IF EXISTS `item_carrinho_adicional_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_carrinho_adicional_deliveries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_carrinho_id` bigint unsigned NOT NULL,
  `adicional_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_carrinho_adicional_deliveries_item_carrinho_id_foreign` (`item_carrinho_id`),
  KEY `item_carrinho_adicional_deliveries_adicional_id_foreign` (`adicional_id`),
  CONSTRAINT `item_carrinho_adicional_deliveries_adicional_id_foreign` FOREIGN KEY (`adicional_id`) REFERENCES `adicionals` (`id`),
  CONSTRAINT `item_carrinho_adicional_deliveries_item_carrinho_id_foreign` FOREIGN KEY (`item_carrinho_id`) REFERENCES `item_carrinho_deliveries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_carrinho_adicional_deliveries`
--

LOCK TABLES `item_carrinho_adicional_deliveries` WRITE;
/*!40000 ALTER TABLE `item_carrinho_adicional_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_carrinho_adicional_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_carrinho_deliveries`
--

--DROP TABLE IF EXISTS `item_carrinho_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_carrinho_deliveries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `carrinho_id` bigint unsigned NOT NULL,
  `produto_id` bigint unsigned NOT NULL,
  `tamanho_id` bigint unsigned DEFAULT NULL,
  `quantidade` decimal(8,3) NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `sub_total` decimal(10,3) NOT NULL,
  `observacao` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_carrinho_deliveries_carrinho_id_foreign` (`carrinho_id`),
  KEY `item_carrinho_deliveries_produto_id_foreign` (`produto_id`),
  KEY `item_carrinho_deliveries_tamanho_id_foreign` (`tamanho_id`),
  CONSTRAINT `item_carrinho_deliveries_carrinho_id_foreign` FOREIGN KEY (`carrinho_id`) REFERENCES `carrinho_deliveries` (`id`),
  CONSTRAINT `item_carrinho_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `item_carrinho_deliveries_tamanho_id_foreign` FOREIGN KEY (`tamanho_id`) REFERENCES `tamanho_pizzas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_carrinho_deliveries`
--

LOCK TABLES `item_carrinho_deliveries` WRITE;
/*!40000 ALTER TABLE `item_carrinho_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_carrinho_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_carrinhos`
--

--DROP TABLE IF EXISTS `item_carrinhos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_carrinhos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `carrinho_id` bigint unsigned NOT NULL,
  `produto_id` bigint unsigned NOT NULL,
  `variacao_id` bigint unsigned DEFAULT NULL,
  `quantidade` decimal(8,3) NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `sub_total` decimal(10,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_carrinhos_carrinho_id_foreign` (`carrinho_id`),
  KEY `item_carrinhos_produto_id_foreign` (`produto_id`),
  KEY `item_carrinhos_variacao_id_foreign` (`variacao_id`),
  CONSTRAINT `item_carrinhos_carrinho_id_foreign` FOREIGN KEY (`carrinho_id`) REFERENCES `carrinhos` (`id`),
  CONSTRAINT `item_carrinhos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `item_carrinhos_variacao_id_foreign` FOREIGN KEY (`variacao_id`) REFERENCES `produto_variacaos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_carrinhos`
--

LOCK TABLES `item_carrinhos` WRITE;
/*!40000 ALTER TABLE `item_carrinhos` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_carrinhos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_conta_empresas`
--

--DROP TABLE IF EXISTS `item_conta_empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_conta_empresas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `conta_id` bigint unsigned DEFAULT NULL,
  `descricao` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caixa_id` int DEFAULT NULL,
  `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(16,2) DEFAULT NULL,
  `saldo_atual` decimal(16,2) DEFAULT NULL,
  `tipo` enum('entrada','saida') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_conta_empresas_conta_id_foreign` (`conta_id`),
  CONSTRAINT `item_conta_empresas_conta_id_foreign` FOREIGN KEY (`conta_id`) REFERENCES `conta_empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_conta_empresas`
--

LOCK TABLES `item_conta_empresas` WRITE;
/*!40000 ALTER TABLE `item_conta_empresas` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_conta_empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_cotacaos`
--

--DROP TABLE IF EXISTS `item_cotacaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_cotacaos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cotacao_id` bigint unsigned DEFAULT NULL,
  `produto_id` bigint unsigned DEFAULT NULL,
  `valor_unitario` decimal(12,3) DEFAULT NULL,
  `quantidade` decimal(12,3) NOT NULL,
  `sub_total` decimal(12,3) DEFAULT NULL,
  `observacao` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_cotacaos_cotacao_id_foreign` (`cotacao_id`),
  KEY `item_cotacaos_produto_id_foreign` (`produto_id`),
  CONSTRAINT `item_cotacaos_cotacao_id_foreign` FOREIGN KEY (`cotacao_id`) REFERENCES `cotacaos` (`id`),
  CONSTRAINT `item_cotacaos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_cotacaos`
--

LOCK TABLES `item_cotacaos` WRITE;
/*!40000 ALTER TABLE `item_cotacaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_cotacaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_ibpts`
--

--DROP TABLE IF EXISTS `item_ibpts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_ibpts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ibpt_id` bigint unsigned DEFAULT NULL,
  `codigo` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nacional_federal` decimal(5,2) NOT NULL,
  `importado_federal` decimal(5,2) NOT NULL,
  `estadual` decimal(5,2) NOT NULL,
  `municipal` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_ibpts_ibpt_id_foreign` (`ibpt_id`),
  CONSTRAINT `item_ibpts_ibpt_id_foreign` FOREIGN KEY (`ibpt_id`) REFERENCES `ibpts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_ibpts`
--

LOCK TABLES `item_ibpts` WRITE;
/*!40000 ALTER TABLE `item_ibpts` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_ibpts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_lista_precos`
--

--DROP TABLE IF EXISTS `item_lista_precos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_lista_precos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lista_id` bigint unsigned DEFAULT NULL,
  `produto_id` bigint unsigned DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL,
  `percentual_lucro` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_lista_precos_lista_id_foreign` (`lista_id`),
  KEY `item_lista_precos_produto_id_foreign` (`produto_id`),
  CONSTRAINT `item_lista_precos_lista_id_foreign` FOREIGN KEY (`lista_id`) REFERENCES `lista_precos` (`id`),
  CONSTRAINT `item_lista_precos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_lista_precos`
--

LOCK TABLES `item_lista_precos` WRITE;
/*!40000 ALTER TABLE `item_lista_precos` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_lista_precos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_nfces`
--

--DROP TABLE IF EXISTS `item_nfces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_nfces` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nfce_id` bigint unsigned DEFAULT NULL,
  `produto_id` bigint unsigned DEFAULT NULL,
  `variacao_id` bigint unsigned DEFAULT NULL,
  `quantidade` decimal(7,3) NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `perc_icms` decimal(5,2) NOT NULL DEFAULT '0.00',
  `perc_pis` decimal(5,2) NOT NULL DEFAULT '0.00',
  `perc_cofins` decimal(5,2) NOT NULL DEFAULT '0.00',
  `perc_ipi` decimal(5,2) NOT NULL DEFAULT '0.00',
  `cest` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cst_csosn` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '102',
  `cst_pis` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '49',
  `cst_cofins` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '49',
  `cst_ipi` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '99',
  `perc_red_bc` decimal(5,2) NOT NULL DEFAULT '0.00',
  `cfop` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ncm` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cEnq` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pST` decimal(10,2) DEFAULT NULL,
  `vBCSTRet` decimal(10,2) DEFAULT NULL,
  `origem` int NOT NULL DEFAULT '0',
  `codigo_beneficio_fiscal` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_nfces_nfce_id_foreign` (`nfce_id`),
  KEY `item_nfces_produto_id_foreign` (`produto_id`),
  KEY `item_nfces_variacao_id_foreign` (`variacao_id`),
  CONSTRAINT `item_nfces_nfce_id_foreign` FOREIGN KEY (`nfce_id`) REFERENCES `nfces` (`id`),
  CONSTRAINT `item_nfces_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `item_nfces_variacao_id_foreign` FOREIGN KEY (`variacao_id`) REFERENCES `produto_variacaos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_nfces`
--

LOCK TABLES `item_nfces` WRITE;
/*!40000 ALTER TABLE `item_nfces` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_nfces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_nota_servicos`
--

--DROP TABLE IF EXISTS `item_nota_servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_nota_servicos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nota_servico_id` bigint unsigned DEFAULT NULL,
  `servico_id` bigint unsigned DEFAULT NULL,
  `discriminacao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_servico` decimal(16,7) NOT NULL,
  `codigo_cnae` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo_servico` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo_tributacao_municipio` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exigibilidade_iss` int NOT NULL,
  `iss_retido` int NOT NULL,
  `data_competencia` date DEFAULT NULL,
  `estado_local_prestacao_servico` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cidade_local_prestacao_servico` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valor_deducoes` decimal(16,7) DEFAULT NULL,
  `desconto_incondicional` decimal(16,7) DEFAULT NULL,
  `desconto_condicional` decimal(16,7) DEFAULT NULL,
  `outras_retencoes` decimal(16,7) DEFAULT NULL,
  `aliquota_iss` decimal(7,2) DEFAULT NULL,
  `aliquota_pis` decimal(7,2) DEFAULT NULL,
  `aliquota_cofins` decimal(7,2) DEFAULT NULL,
  `aliquota_inss` decimal(7,2) DEFAULT NULL,
  `aliquota_ir` decimal(7,2) DEFAULT NULL,
  `aliquota_csll` decimal(7,2) DEFAULT NULL,
  `intermediador` enum('n','f','j') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `documento_intermediador` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nome_intermediador` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `im_intermediador` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `responsavel_retencao_iss` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_nota_servicos_nota_servico_id_foreign` (`nota_servico_id`),
  KEY `item_nota_servicos_servico_id_foreign` (`servico_id`),
  CONSTRAINT `item_nota_servicos_nota_servico_id_foreign` FOREIGN KEY (`nota_servico_id`) REFERENCES `nota_servicos` (`id`),
  CONSTRAINT `item_nota_servicos_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_nota_servicos`
--

LOCK TABLES `item_nota_servicos` WRITE;
/*!40000 ALTER TABLE `item_nota_servicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_nota_servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_nves`
--

--DROP TABLE IF EXISTS `item_nves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_nves` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nfe_id` bigint unsigned DEFAULT NULL,
  `produto_id` bigint unsigned DEFAULT NULL,
  `variacao_id` bigint unsigned DEFAULT NULL,
  `quantidade` decimal(6,2) NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `perc_icms` decimal(10,2) NOT NULL DEFAULT '0.00',
  `perc_pis` decimal(10,2) NOT NULL DEFAULT '0.00',
  `perc_cofins` decimal(10,2) NOT NULL DEFAULT '0.00',
  `perc_ipi` decimal(10,2) NOT NULL DEFAULT '0.00',
  `cst_csosn` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cst_pis` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cst_cofins` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cst_ipi` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cest` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vbc_icms` decimal(10,2) NOT NULL DEFAULT '0.00',
  `vbc_pis` decimal(10,2) NOT NULL DEFAULT '0.00',
  `vbc_cofins` decimal(10,2) NOT NULL DEFAULT '0.00',
  `vbc_ipi` decimal(10,2) NOT NULL DEFAULT '0.00',
  `perc_red_bc` decimal(10,2) DEFAULT NULL,
  `cfop` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ncm` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cEnq` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pST` decimal(10,2) DEFAULT NULL,
  `vBCSTRet` decimal(10,2) DEFAULT NULL,
  `origem` int NOT NULL DEFAULT '0',
  `codigo_beneficio_fiscal` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lote` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_nves_nfe_id_foreign` (`nfe_id`),
  KEY `item_nves_produto_id_foreign` (`produto_id`),
  KEY `item_nves_variacao_id_foreign` (`variacao_id`),
  CONSTRAINT `item_nves_nfe_id_foreign` FOREIGN KEY (`nfe_id`) REFERENCES `nves` (`id`),
  CONSTRAINT `item_nves_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `item_nves_variacao_id_foreign` FOREIGN KEY (`variacao_id`) REFERENCES `produto_variacaos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_nves`
--

LOCK TABLES `item_nves` WRITE;
/*!40000 ALTER TABLE `item_nves` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_nves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pedido_deliveries`
--

--DROP TABLE IF EXISTS `item_pedido_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pedido_deliveries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` bigint unsigned NOT NULL,
  `pedido_id` bigint unsigned NOT NULL,
  `tamanho_id` bigint unsigned DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `estado` enum('novo','pendente','preparando','finalizado') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'novo',
  `quantidade` decimal(8,2) NOT NULL,
  `valor_unitario` decimal(12,2) NOT NULL,
  `sub_total` decimal(12,2) NOT NULL,
  `observacao` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_pedido_deliveries_produto_id_foreign` (`produto_id`),
  KEY `item_pedido_deliveries_pedido_id_foreign` (`pedido_id`),
  KEY `item_pedido_deliveries_tamanho_id_foreign` (`tamanho_id`),
  CONSTRAINT `item_pedido_deliveries_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedido_deliveries` (`id`),
  CONSTRAINT `item_pedido_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `item_pedido_deliveries_tamanho_id_foreign` FOREIGN KEY (`tamanho_id`) REFERENCES `tamanho_pizzas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedido_deliveries`
--

LOCK TABLES `item_pedido_deliveries` WRITE;
/*!40000 ALTER TABLE `item_pedido_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pedido_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pedido_ecommerces`
--

--DROP TABLE IF EXISTS `item_pedido_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pedido_ecommerces` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pedido_id` bigint unsigned NOT NULL,
  `produto_id` bigint unsigned NOT NULL,
  `variacao_id` bigint unsigned DEFAULT NULL,
  `quantidade` decimal(8,3) NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_pedido_ecommerces_pedido_id_foreign` (`pedido_id`),
  KEY `item_pedido_ecommerces_produto_id_foreign` (`produto_id`),
  KEY `item_pedido_ecommerces_variacao_id_foreign` (`variacao_id`),
  CONSTRAINT `item_pedido_ecommerces_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedido_ecommerces` (`id`),
  CONSTRAINT `item_pedido_ecommerces_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `item_pedido_ecommerces_variacao_id_foreign` FOREIGN KEY (`variacao_id`) REFERENCES `produto_variacaos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedido_ecommerces`
--

LOCK TABLES `item_pedido_ecommerces` WRITE;
/*!40000 ALTER TABLE `item_pedido_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pedido_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pedido_mercado_livres`
--

--DROP TABLE IF EXISTS `item_pedido_mercado_livres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pedido_mercado_livres` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pedido_id` bigint unsigned NOT NULL,
  `produto_id` bigint unsigned DEFAULT NULL,
  `item_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `condicao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variacao_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantidade` decimal(8,2) NOT NULL,
  `valor_unitario` decimal(12,2) NOT NULL,
  `sub_total` decimal(12,2) NOT NULL,
  `taxa_venda` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_pedido_mercado_livres_pedido_id_foreign` (`pedido_id`),
  KEY `item_pedido_mercado_livres_produto_id_foreign` (`produto_id`),
  CONSTRAINT `item_pedido_mercado_livres_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedido_mercado_livres` (`id`),
  CONSTRAINT `item_pedido_mercado_livres_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedido_mercado_livres`
--

LOCK TABLES `item_pedido_mercado_livres` WRITE;
/*!40000 ALTER TABLE `item_pedido_mercado_livres` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pedido_mercado_livres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pedidos`
--

--DROP TABLE IF EXISTS `item_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pedidos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pedido_id` bigint unsigned NOT NULL,
  `produto_id` bigint unsigned NOT NULL,
  `funcionario_id` bigint unsigned DEFAULT NULL,
  `observacao` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` enum('novo','pendente','preparando','finalizado') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'novo',
  `quantidade` decimal(8,3) NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `tempo_preparo` int DEFAULT NULL,
  `ponto_carne` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tamanho_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_pedidos_pedido_id_foreign` (`pedido_id`),
  KEY `item_pedidos_produto_id_foreign` (`produto_id`),
  KEY `item_pedidos_funcionario_id_foreign` (`funcionario_id`),
  KEY `item_pedidos_tamanho_id_foreign` (`tamanho_id`),
  CONSTRAINT `item_pedidos_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`),
  CONSTRAINT `item_pedidos_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  CONSTRAINT `item_pedidos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `item_pedidos_tamanho_id_foreign` FOREIGN KEY (`tamanho_id`) REFERENCES `tamanho_pizzas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedidos`
--

LOCK TABLES `item_pedidos` WRITE;
/*!40000 ALTER TABLE `item_pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pizza_carrinhos`
--

--DROP TABLE IF EXISTS `item_pizza_carrinhos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pizza_carrinhos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_carrinho_id` bigint unsigned NOT NULL,
  `produto_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_pizza_carrinhos_item_carrinho_id_foreign` (`item_carrinho_id`),
  KEY `item_pizza_carrinhos_produto_id_foreign` (`produto_id`),
  CONSTRAINT `item_pizza_carrinhos_item_carrinho_id_foreign` FOREIGN KEY (`item_carrinho_id`) REFERENCES `item_carrinho_deliveries` (`id`),
  CONSTRAINT `item_pizza_carrinhos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pizza_carrinhos`
--

LOCK TABLES `item_pizza_carrinhos` WRITE;
/*!40000 ALTER TABLE `item_pizza_carrinhos` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pizza_carrinhos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pizza_pedido_deliveries`
--

--DROP TABLE IF EXISTS `item_pizza_pedido_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pizza_pedido_deliveries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_pedido_id` bigint unsigned NOT NULL,
  `produto_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_pizza_pedido_deliveries_item_pedido_id_foreign` (`item_pedido_id`),
  KEY `item_pizza_pedido_deliveries_produto_id_foreign` (`produto_id`),
  CONSTRAINT `item_pizza_pedido_deliveries_item_pedido_id_foreign` FOREIGN KEY (`item_pedido_id`) REFERENCES `item_pedido_deliveries` (`id`),
  CONSTRAINT `item_pizza_pedido_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pizza_pedido_deliveries`
--

LOCK TABLES `item_pizza_pedido_deliveries` WRITE;
/*!40000 ALTER TABLE `item_pizza_pedido_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pizza_pedido_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pizza_pedidos`
--

--DROP TABLE IF EXISTS `item_pizza_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pizza_pedidos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_pedido_id` bigint unsigned NOT NULL,
  `produto_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_pizza_pedidos_item_pedido_id_foreign` (`item_pedido_id`),
  KEY `item_pizza_pedidos_produto_id_foreign` (`produto_id`),
  CONSTRAINT `item_pizza_pedidos_item_pedido_id_foreign` FOREIGN KEY (`item_pedido_id`) REFERENCES `item_pedidos` (`id`),
  CONSTRAINT `item_pizza_pedidos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pizza_pedidos`
--

LOCK TABLES `item_pizza_pedidos` WRITE;
/*!40000 ALTER TABLE `item_pizza_pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pizza_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pre_vendas`
--

--DROP TABLE IF EXISTS `item_pre_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pre_vendas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pre_venda_id` bigint unsigned NOT NULL,
  `produto_id` bigint unsigned NOT NULL,
  `variacao_id` bigint unsigned DEFAULT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `valor` decimal(16,7) NOT NULL,
  `observacao` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cfop` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_pre_vendas_pre_venda_id_foreign` (`pre_venda_id`),
  KEY `item_pre_vendas_produto_id_foreign` (`produto_id`),
  KEY `item_pre_vendas_variacao_id_foreign` (`variacao_id`),
  CONSTRAINT `item_pre_vendas_pre_venda_id_foreign` FOREIGN KEY (`pre_venda_id`) REFERENCES `pre_vendas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_pre_vendas_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `item_pre_vendas_variacao_id_foreign` FOREIGN KEY (`variacao_id`) REFERENCES `produto_variacaos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pre_vendas`
--

LOCK TABLES `item_pre_vendas` WRITE;
/*!40000 ALTER TABLE `item_pre_vendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pre_vendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_servico_nfces`
--

--DROP TABLE IF EXISTS `item_servico_nfces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_servico_nfces` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nfce_id` bigint unsigned NOT NULL,
  `servico_id` bigint unsigned NOT NULL,
  `quantidade` decimal(6,2) NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `observacao` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_servico_nfces_nfce_id_foreign` (`nfce_id`),
  KEY `item_servico_nfces_servico_id_foreign` (`servico_id`),
  CONSTRAINT `item_servico_nfces_nfce_id_foreign` FOREIGN KEY (`nfce_id`) REFERENCES `nfces` (`id`),
  CONSTRAINT `item_servico_nfces_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_servico_nfces`
--

LOCK TABLES `item_servico_nfces` WRITE;
/*!40000 ALTER TABLE `item_servico_nfces` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_servico_nfces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_transferencia_estoques`
--

--DROP TABLE IF EXISTS `item_transferencia_estoques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_transferencia_estoques`
--

LOCK TABLES `item_transferencia_estoques` WRITE;
/*!40000 ALTER TABLE `item_transferencia_estoques` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_transferencia_estoques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_trocas`
--

--DROP TABLE IF EXISTS `item_trocas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_trocas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `troca_id` bigint unsigned NOT NULL,
  `produto_id` bigint unsigned NOT NULL,
  `quantidade` decimal(7,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_trocas_troca_id_foreign` (`troca_id`),
  KEY `item_trocas_produto_id_foreign` (`produto_id`),
  CONSTRAINT `item_trocas_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `item_trocas_troca_id_foreign` FOREIGN KEY (`troca_id`) REFERENCES `trocas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_trocas`
--

LOCK TABLES `item_trocas` WRITE;
/*!40000 ALTER TABLE `item_trocas` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_trocas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_venda_suspensas`
--

--DROP TABLE IF EXISTS `item_venda_suspensas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_venda_suspensas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `venda_id` bigint unsigned DEFAULT NULL,
  `produto_id` bigint unsigned DEFAULT NULL,
  `variacao_id` bigint unsigned DEFAULT NULL,
  `quantidade` decimal(7,3) NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_venda_suspensas_venda_id_foreign` (`venda_id`),
  KEY `item_venda_suspensas_produto_id_foreign` (`produto_id`),
  KEY `item_venda_suspensas_variacao_id_foreign` (`variacao_id`),
  CONSTRAINT `item_venda_suspensas_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `item_venda_suspensas_variacao_id_foreign` FOREIGN KEY (`variacao_id`) REFERENCES `produto_variacaos` (`id`),
  CONSTRAINT `item_venda_suspensas_venda_id_foreign` FOREIGN KEY (`venda_id`) REFERENCES `venda_suspensas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_venda_suspensas`
--

LOCK TABLES `item_venda_suspensas` WRITE;
/*!40000 ALTER TABLE `item_venda_suspensas` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_venda_suspensas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lacre_transportes`
--

--DROP TABLE IF EXISTS `lacre_transportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lacre_transportes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `info_id` bigint unsigned NOT NULL,
  `numero` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lacre_transportes_info_id_foreign` (`info_id`),
  CONSTRAINT `lacre_transportes_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lacre_transportes`
--

LOCK TABLES `lacre_transportes` WRITE;
/*!40000 ALTER TABLE `lacre_transportes` DISABLE KEYS */;
/*!40000 ALTER TABLE `lacre_transportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lacre_unidade_cargas`
--

--DROP TABLE IF EXISTS `lacre_unidade_cargas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lacre_unidade_cargas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `info_id` bigint unsigned NOT NULL,
  `numero` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lacre_unidade_cargas_info_id_foreign` (`info_id`),
  CONSTRAINT `lacre_unidade_cargas_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lacre_unidade_cargas`
--

LOCK TABLES `lacre_unidade_cargas` WRITE;
/*!40000 ALTER TABLE `lacre_unidade_cargas` DISABLE KEYS */;
/*!40000 ALTER TABLE `lacre_unidade_cargas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_precos`
--

--DROP TABLE IF EXISTS `lista_precos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_precos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ajuste_sobre` enum('valor_compra','valor_venda') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` enum('incremento','reducao') COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentual_alteracao` decimal(5,2) NOT NULL,
  `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `funcionario_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lista_precos_empresa_id_foreign` (`empresa_id`),
  KEY `lista_precos_funcionario_id_foreign` (`funcionario_id`),
  CONSTRAINT `lista_precos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `lista_precos_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_precos`
--

LOCK TABLES `lista_precos` WRITE;
/*!40000 ALTER TABLE `lista_precos` DISABLE KEYS */;
/*!40000 ALTER TABLE `lista_precos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localizacaos`
--

--DROP TABLE IF EXISTS `localizacaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localizacaos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `descricao` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `nome` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nome_fantasia` mediumtext COLLATE utf8mb4_unicode_ci,
  `cpf_cnpj` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aut_xml` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ie` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `celular` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arquivo` blob,
  `senha` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cep` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rua` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bairro` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complemento` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cidade_id` bigint unsigned DEFAULT NULL,
  `numero_ultima_nfe_producao` int DEFAULT NULL,
  `numero_ultima_nfe_homologacao` int DEFAULT NULL,
  `numero_serie_nfe` int DEFAULT NULL,
  `numero_ultima_nfce_producao` int DEFAULT NULL,
  `numero_ultima_nfce_homologacao` int DEFAULT NULL,
  `numero_serie_nfce` int DEFAULT NULL,
  `numero_ultima_cte_producao` int DEFAULT NULL,
  `numero_ultima_cte_homologacao` int DEFAULT NULL,
  `numero_serie_cte` int DEFAULT NULL,
  `numero_ultima_mdfe_producao` int DEFAULT NULL,
  `numero_ultima_mdfe_homologacao` int DEFAULT NULL,
  `numero_serie_mdfe` int DEFAULT NULL,
  `numero_ultima_nfse` int DEFAULT NULL,
  `numero_serie_nfse` int DEFAULT NULL,
  `csc` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `csc_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ambiente` int NOT NULL,
  `tributacao` enum('MEI','Simples Nacional','Regime Normal') COLLATE utf8mb4_unicode_ci NOT NULL,
  `token_nfse` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `localizacaos_empresa_id_foreign` (`empresa_id`),
  KEY `localizacaos_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `localizacaos_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
  CONSTRAINT `localizacaos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localizacaos`
--

LOCK TABLES `localizacaos` WRITE;
/*!40000 ALTER TABLE `localizacaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `localizacaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manifesto_dves`
--

--DROP TABLE IF EXISTS `manifesto_dves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manifesto_dves` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `chave` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `documento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `num_prot` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_emissao` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequencia_evento` int NOT NULL,
  `fatura_salva` tinyint(1) NOT NULL,
  `tipo` int NOT NULL,
  `nsu` int NOT NULL,
  `compra_id` int NOT NULL DEFAULT '0',
  `nNf` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `manifesto_dves_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `manifesto_dves_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manifesto_dves`
--

LOCK TABLES `manifesto_dves` WRITE;
/*!40000 ALTER TABLE `manifesto_dves` DISABLE KEYS */;
/*!40000 ALTER TABLE `manifesto_dves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

--DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marcas_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `marcas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_place_configs`
--

--DROP TABLE IF EXISTS `market_place_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `market_place_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `cidade_id` bigint unsigned DEFAULT NULL,
  `loja_id` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rua` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempo_medio_entrega` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valor_entrega` decimal(10,2) DEFAULT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valor_entrega_gratis` decimal(10,2) DEFAULT NULL,
  `usar_bairros` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `notificacao_novo_pedido` tinyint(1) NOT NULL DEFAULT '1',
  `mercadopago_public_key` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mercadopago_access_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_divisao_pizza` enum('divide','valor_maior') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'divide',
  `logo` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fav_icon` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipos_pagamento` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '[]',
  `segmento` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '[]',
  `pedido_minimo` decimal(10,2) DEFAULT NULL,
  `avaliacao_media` decimal(10,2) NOT NULL,
  `api_token` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `autenticacao_sms` tinyint(1) NOT NULL DEFAULT '0',
  `confirmacao_pedido_cliente` tinyint(1) NOT NULL DEFAULT '0',
  `tipo_entrega` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cor_principal` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `funcionamento_descricao` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `market_place_configs_empresa_id_foreign` (`empresa_id`),
  KEY `market_place_configs_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `market_place_configs_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
  CONSTRAINT `market_place_configs_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_place_configs`
--

LOCK TABLES `market_place_configs` WRITE;
/*!40000 ALTER TABLE `market_place_configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_place_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdves`
--

--DROP TABLE IF EXISTS `mdves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mdves` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `uf_inicio` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf_fim` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `encerrado` tinyint(1) NOT NULL,
  `data_inicio_viagem` date NOT NULL,
  `carga_posterior` tinyint(1) NOT NULL,
  `cnpj_contratante` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `veiculo_tracao_id` bigint unsigned DEFAULT NULL,
  `veiculo_reboque_id` bigint unsigned DEFAULT NULL,
  `veiculo_reboque2_id` bigint unsigned DEFAULT NULL,
  `veiculo_reboque3_id` bigint unsigned DEFAULT NULL,
  `estado_emissao` enum('novo','aprovado','rejeitado','cancelado') COLLATE utf8mb4_unicode_ci NOT NULL,
  `mdfe_numero` int NOT NULL,
  `chave` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `protocolo` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seguradora_nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seguradora_cnpj` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_apolice` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_averbacao` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_carga` decimal(10,2) NOT NULL,
  `quantidade_carga` decimal(10,4) NOT NULL,
  `info_complementar` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `info_adicional_fisco` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `condutor_nome` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `condutor_cpf` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lac_rodo` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tp_emit` int NOT NULL,
  `tp_transp` int NOT NULL,
  `produto_pred_nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produto_pred_ncm` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produto_pred_cod_barras` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep_carrega` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep_descarrega` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tp_carga` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude_carregamento` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude_carregamento` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude_descarregamento` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude_descarregamento` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `local_id` int DEFAULT NULL,
  `tipo_modal` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdves_empresa_id_foreign` (`empresa_id`),
  KEY `mdves_veiculo_tracao_id_foreign` (`veiculo_tracao_id`),
  KEY `mdves_veiculo_reboque_id_foreign` (`veiculo_reboque_id`),
  KEY `mdves_veiculo_reboque2_id_foreign` (`veiculo_reboque2_id`),
  KEY `mdves_veiculo_reboque3_id_foreign` (`veiculo_reboque3_id`),
  CONSTRAINT `mdves_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `mdves_veiculo_reboque2_id_foreign` FOREIGN KEY (`veiculo_reboque2_id`) REFERENCES `veiculos` (`id`),
  CONSTRAINT `mdves_veiculo_reboque3_id_foreign` FOREIGN KEY (`veiculo_reboque3_id`) REFERENCES `veiculos` (`id`),
  CONSTRAINT `mdves_veiculo_reboque_id_foreign` FOREIGN KEY (`veiculo_reboque_id`) REFERENCES `veiculos` (`id`),
  CONSTRAINT `mdves_veiculo_tracao_id_foreign` FOREIGN KEY (`veiculo_tracao_id`) REFERENCES `veiculos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdves`
--

LOCK TABLES `mdves` WRITE;
/*!40000 ALTER TABLE `mdves` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medida_ctes`
--

--DROP TABLE IF EXISTS `medida_ctes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medida_ctes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cte_id` bigint unsigned NOT NULL,
  `cod_unidade` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_medida` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantidade` decimal(10,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medida_ctes_cte_id_foreign` (`cte_id`),
  CONSTRAINT `medida_ctes_cte_id_foreign` FOREIGN KEY (`cte_id`) REFERENCES `ctes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medida_ctes`
--

LOCK TABLES `medida_ctes` WRITE;
/*!40000 ALTER TABLE `medida_ctes` DISABLE KEYS */;
/*!40000 ALTER TABLE `medida_ctes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mercado_livre_configs`
--

--DROP TABLE IF EXISTS `mercado_livre_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mercado_livre_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `client_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refresh_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token_expira` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mercado_livre_configs_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `mercado_livre_configs_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mercado_livre_configs`
--

LOCK TABLES `mercado_livre_configs` WRITE;
/*!40000 ALTER TABLE `mercado_livre_configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mercado_livre_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mercado_livre_perguntas`
--

--DROP TABLE IF EXISTS `mercado_livre_perguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mercado_livre_perguntas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `texto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `resposta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mercado_livre_perguntas_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `mercado_livre_perguntas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mercado_livre_perguntas`
--

LOCK TABLES `mercado_livre_perguntas` WRITE;
/*!40000 ALTER TABLE `mercado_livre_perguntas` DISABLE KEYS */;
/*!40000 ALTER TABLE `mercado_livre_perguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

--DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2014_10_12_100000_create_password_resets_table',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2019_12_14_000001_create_personal_access_tokens_table',1),(6,'2022_05_20_113136_create_cidades_table',1),(7,'2022_05_23_155235_create_empresas_table',1),(8,'2022_05_24_013544_create_categoria_produtos_table',1),(9,'2022_05_24_151959_create_fornecedors_table',1),(10,'2022_05_24_153746_create_padrao_tributacao_produtos_table',1),(11,'2022_05_24_155235_create_caixas_table',1),(12,'2022_06_19_111405_create_marcas_table',1),(13,'2022_06_20_113816_create_planos_table',1),(14,'2022_06_20_114141_create_produtos_table',1),(15,'2022_06_20_114600_create_clientes_table',1),(16,'2022_06_20_115621_create_transportadoras_table',1),(17,'2022_06_20_153825_create_produto_variacaos_table',1),(18,'2023_05_22_172141_create_natureza_operacaos_table',1),(19,'2023_05_23_172141_create_nves_table',1),(20,'2023_05_23_172155_create_nfces_table',1),(21,'2023_06_20_114952_create_item_nves_table',1),(22,'2023_06_20_151658_create_fatura_nves_table',1),(23,'2023_06_21_150613_create_usuario_empresas_table',1),(24,'2023_07_02_105610_create_item_nfces_table',1),(25,'2023_07_05_131046_create_fatura_nfces_table',1),(26,'2023_07_06_153007_create_plano_empresas_table',1),(27,'2023_07_10_151925_create_pagamentos_table',1),(28,'2023_07_11_112157_create_configuracao_supers_table',1),(29,'2023_07_17_145600_create_inutilizacaos_table',1),(30,'2023_10_28_104158_create_veiculos_table',1),(31,'2023_10_29_102738_create_estoques_table',1),(32,'2023_10_29_102914_create_movimentacao_produtos_table',1),(33,'2023_10_29_103729_create_ctes_table',1),(34,'2023_10_29_104211_create_medida_ctes_table',1),(35,'2023_10_29_104221_create_componente_ctes_table',1),(36,'2023_10_30_153753_create_conta_pagars_table',1),(37,'2023_10_30_153800_create_conta_recebers_table',1),(38,'2023_11_01_081200_create_sangria_caixas_table',1),(39,'2023_11_01_081206_create_suprimento_caixas_table',1),(40,'2023_11_03_153420_create_chave_nfe_ctes_table',1),(41,'2023_11_10_141730_create_funcionarios_table',1),(42,'2023_11_13_151606_create_comissao_vendas_table',1),(43,'2023_11_24_105534_create_manifesto_dves_table',1),(44,'2023_11_27_140746_create_mdves_table',1),(45,'2023_11_27_162950_create_municipio_carregamentos_table',1),(46,'2023_11_27_163011_create_ciots_table',1),(47,'2023_11_27_163028_create_percursos_table',1),(48,'2023_11_27_163040_create_vale_pedagios_table',1),(49,'2023_11_27_163052_create_info_descargas_table',1),(50,'2023_11_27_163110_create_c_te_descargas_table',1),(51,'2023_11_27_163134_create_n_fe_descargas_table',1),(52,'2023_11_27_163147_create_lacre_transportes_table',1),(53,'2023_11_27_163158_create_lacre_unidade_cargas_table',1),(54,'2023_11_27_163208_create_unidade_cargas_table',1),(55,'2023_12_05_141539_create_categoria_servicos_table',1),(56,'2023_12_05_145247_create_dia_semanas_table',1),(57,'2023_12_06_135418_create_servicos_table',1),(58,'2023_12_06_144725_create_funcionamentos_table',1),(59,'2023_12_06_144741_create_interrupcoes_table',1),(60,'2023_12_12_112042_create_ordem_servicos_table',1),(61,'2023_12_12_113048_create_servico_os_table',1),(62,'2023_12_12_113656_create_relatorio_os_table',1),(63,'2023_12_12_113711_create_funcionario_os_table',1),(64,'2023_12_13_100300_create_produto_os_table',1),(65,'2023_12_15_095550_create_agendamentos_table',1),(66,'2023_12_15_100127_create_item_agendamentos_table',1),(67,'2023_12_18_160002_create_funcionario_servicos_table',1),(68,'2023_12_20_165824_create_tamanho_pizzas_table',1),(69,'2023_12_21_150227_create_adicionals_table',1),(70,'2023_12_21_150237_create_pedidos_table',1),(71,'2023_12_21_150243_create_item_pedidos_table',1),(72,'2023_12_21_150450_create_produto_adicionals_table',1),(73,'2023_12_26_113648_create_item_adicionals_table',1),(74,'2023_12_28_095938_create_carrossel_cardapios_table',1),(75,'2023_12_28_140654_create_produto_ingredientes_table',1),(76,'2023_12_29_094137_create_configuracao_cardapios_table',1),(77,'2024_01_02_165122_create_produto_composicaos_table',1),(78,'2024_01_03_104835_create_apontamentos_table',1),(79,'2024_01_04_091713_create_cte_os_table',1),(80,'2024_01_06_105130_create_notificao_cardapios_table',1),(81,'2024_01_08_170502_create_produto_pizza_valors_table',1),(82,'2024_01_10_094345_create_config_gerals_table',1),(83,'2024_01_11_004710_create_item_pizza_pedidos_table',1),(84,'2024_01_15_110444_create_pre_vendas_table',1),(85,'2024_01_15_110510_create_fatura_pre_vendas_table',1),(86,'2024_01_15_110526_create_item_pre_vendas_table',1),(87,'2024_01_18_163458_create_taxa_pagamentos_table',1),(88,'2024_01_23_155331_create_acesso_logs_table',1),(89,'2024_01_29_090134_create_motivo_interrupcaos_table',1),(90,'2024_01_30_082949_create_evento_salarios_table',1),(91,'2024_01_31_082926_create_apuracao_mensals_table',1),(92,'2024_01_31_082938_create_apuracao_mensal_eventos_table',1),(93,'2024_01_31_083022_create_funcionario_eventos_table',1),(94,'2024_02_01_175219_create_bairro_delivery_masters_table',1),(95,'2024_02_01_175224_create_bairro_deliveries_table',1),(96,'2024_02_03_091346_create_contador_empresas_table',1),(97,'2024_02_04_150252_create_plano_pendentes_table',1),(98,'2024_02_04_174204_create_difals_table',1),(99,'2024_02_05_113246_create_financeiro_contadors_table',1),(100,'2024_02_06_095641_create_market_place_configs_table',1),(101,'2024_02_09_193535_create_destaque_market_places_table',1),(102,'2024_02_09_193730_create_cupom_descontos_table',1),(103,'2024_02_10_102134_create_funcionamento_deliveries_table',1),(104,'2024_02_11_164301_create_motoboys_table',1),(105,'2024_02_11_230028_create_endereco_deliveries_table',1),(106,'2024_02_11_230831_create_pedido_deliveries_table',1),(107,'2024_02_11_231438_create_item_pedido_deliveries_table',1),(108,'2024_02_12_102619_create_item_adicional_deliveries_table',1),(109,'2024_02_12_102623_create_item_pizza_pedido_deliveries_table',1),(110,'2024_02_12_220040_create_motoboy_comissaos_table',1),(111,'2024_02_13_153900_create_cupom_desconto_clientes_table',1),(112,'2024_02_14_084625_create_cash_back_configs_table',1),(113,'2024_02_14_084735_create_cash_back_clientes_table',1),(114,'2024_02_23_194404_create_variacao_modelos_table',1),(115,'2024_02_23_194410_create_variacao_modelo_items_table',1),(116,'2024_03_02_100919_create_ecommerce_configs_table',1),(117,'2024_03_02_111611_create_galeria_produtos_table',1),(118,'2024_03_09_121107_create_endereco_ecommerces_table',1),(119,'2024_03_10_120603_create_carrinhos_table',1),(120,'2024_03_10_120607_create_item_carrinhos_table',1),(121,'2024_03_12_133550_create_sessions_table',1),(122,'2024_03_17_150828_create_pedido_ecommerces_table',1),(123,'2024_03_17_150841_create_item_pedido_ecommerces_table',1),(124,'2024_03_24_190933_create_cotacaos_table',1),(125,'2024_03_24_191224_create_item_cotacaos_table',1),(126,'2024_03_24_191517_create_fatura_cotacaos_table',1),(127,'2024_03_31_121948_create_nota_servicos_table',1),(128,'2024_03_31_122104_create_item_nota_servicos_table',1),(129,'2024_04_03_191609_create_lista_precos_table',1),(130,'2024_04_03_191911_create_item_lista_precos_table',1),(131,'2024_04_09_112642_create_ncms_table',1),(132,'2024_04_11_091648_create_tickets_table',1),(133,'2024_04_11_091932_create_ticket_mensagems_table',1),(134,'2024_04_11_092300_create_ticket_mensagem_anexos_table',1),(135,'2024_04_12_150530_create_notificacaos_table',1),(136,'2024_04_17_185819_create_carrinho_deliveries_table',1),(137,'2024_04_17_185839_create_item_carrinho_deliveries_table',1),(138,'2024_04_22_191708_create_ibpts_table',1),(139,'2024_04_22_191712_create_item_ibpts_table',1),(140,'2024_04_26_190538_create_item_carrinho_adicional_deliveries_table',1),(141,'2024_04_29_111839_create_item_pizza_carrinhos_table',1),(142,'2024_04_30_001535_create_nota_servico_configs_table',1),(143,'2024_05_08_145357_create_segmentos_table',1),(144,'2024_05_09_145200_create_segmento_empresas_table',1),(145,'2024_05_11_095900_create_mercado_livre_configs_table',1),(146,'2024_05_12_161817_create_categoria_mercado_livres_table',1),(147,'2024_05_13_192558_create_mercado_livre_perguntas_table',1),(148,'2024_05_13_230953_create_pedido_mercado_livres_table',1),(149,'2024_05_13_230957_create_item_pedido_mercado_livres_table',1),(150,'2024_05_20_161922_create_variacao_mercado_livres_table',1),(151,'2024_05_25_140650_create_plano_contas_table',1),(152,'2024_05_26_140440_create_conta_empresas_table',1),(153,'2024_05_26_140831_create_item_conta_empresas_table',1),(154,'2024_05_30_100725_create_produto_combos_table',1),(155,'2024_05_31_231523_create_item_servico_nfces_table',1),(156,'2024_06_03_134326_create_conta_boletos_table',1),(157,'2024_06_03_182735_create_boletos_table',1),(158,'2024_06_03_214825_create_remessa_boletos_table',1),(159,'2024_06_03_214937_create_remessa_boleto_items_table',1),(160,'2024_06_06_190823_create_video_suportes_table',1),(161,'2024_06_10_152353_create_nuvem_shop_configs_table',1),(162,'2024_06_10_152519_create_nuvem_shop_pedidos_table',1),(163,'2024_06_10_152626_create_nuvem_shop_item_pedidos_table',1),(164,'2024_06_11_144901_create_categoria_nuvem_shops_table',1),(165,'2024_06_17_151413_create_permission_tables',1),(166,'2024_06_21_094935_create_localizacaos_table',1),(167,'2024_06_21_113522_create_produto_localizacaos_table',1),(168,'2024_06_21_114911_create_usuario_localizacaos_table',1),(169,'2024_06_24_232419_create_financeiro_planos_table',1),(170,'2024_06_27_091834_create_modelo_etiquetas_table',1),(171,'2024_07_06_104854_create_transferencia_estoques_table',1),(172,'2024_07_06_105116_create_item_transferencia_estoques_table',1),(173,'2024_07_07_082043_create_reserva_configs_table',1),(174,'2024_07_07_082044_create_categoria_acomodacaos_table',1),(175,'2024_07_07_084023_create_acomodacaos_table',1),(176,'2024_07_07_095427_create_frigobars_table',1),(177,'2024_07_07_121439_create_reservas_table',1),(178,'2024_07_07_122035_create_consumo_reservas_table',1),(179,'2024_07_07_122230_create_notas_reservas_table',1),(180,'2024_07_07_122604_create_servico_reservas_table',1),(181,'2024_07_07_122913_create_padrao_frigobars_table',1),(182,'2024_07_07_164930_create_hospede_reservas_table',1),(183,'2024_07_09_112559_create_fatura_reservas_table',1),(184,'2024_07_29_182151_create_produto_fornecedors_table',1),(185,'2024_08_14_095314_create_venda_suspensas_table',1),(186,'2024_08_14_095318_create_item_venda_suspensas_table',1),(187,'2024_08_14_184446_create_trocas_table',1),(188,'2024_08_14_184450_create_item_trocas_table',1),(189,'2024_08_16_092516_create_credito_clientes_table',1),(190,'2024_08_18_110001_create_contigencias_table',1),(191,'2024_08_30_104205_create_woocommerce_configs_table',1),(192,'2024_08_30_111235_create_categoria_woocommerces_table',1),(193,'2024_08_31_152251_create_woocommerce_pedidos_table',1),(194,'2024_08_31_152257_create_woocommerce_item_pedidos_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

--DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

--DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo_etiquetas`
--

--DROP TABLE IF EXISTS `modelo_etiquetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelo_etiquetas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `nome` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `altura` decimal(7,2) NOT NULL,
  `largura` decimal(7,2) NOT NULL,
  `etiquestas_por_linha` int NOT NULL,
  `distancia_etiquetas_lateral` decimal(7,2) NOT NULL,
  `distancia_etiquetas_topo` decimal(7,2) NOT NULL,
  `quantidade_etiquetas` int NOT NULL,
  `tamanho_fonte` decimal(7,2) NOT NULL,
  `tamanho_codigo_barras` decimal(7,2) NOT NULL,
  `nome_empresa` tinyint(1) NOT NULL,
  `nome_produto` tinyint(1) NOT NULL,
  `valor_produto` tinyint(1) NOT NULL,
  `codigo_produto` tinyint(1) NOT NULL,
  `codigo_barras_numerico` tinyint(1) NOT NULL,
  `importado_super` tinyint(1) NOT NULL DEFAULT '0',
  `tipo` enum('simples','gondola') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modelo_etiquetas_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `modelo_etiquetas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo_etiquetas`
--

LOCK TABLES `modelo_etiquetas` WRITE;
/*!40000 ALTER TABLE `modelo_etiquetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `modelo_etiquetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motivo_interrupcaos`
--

--DROP TABLE IF EXISTS `motivo_interrupcaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motivo_interrupcaos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `motivo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `motivo_interrupcaos_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `motivo_interrupcaos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motivo_interrupcaos`
--

LOCK TABLES `motivo_interrupcaos` WRITE;
/*!40000 ALTER TABLE `motivo_interrupcaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `motivo_interrupcaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motoboy_comissaos`
--

--DROP TABLE IF EXISTS `motoboy_comissaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motoboy_comissaos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `pedido_id` bigint unsigned NOT NULL,
  `motoboy_id` bigint unsigned NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `valor_total_pedido` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `motoboy_comissaos_empresa_id_foreign` (`empresa_id`),
  KEY `motoboy_comissaos_pedido_id_foreign` (`pedido_id`),
  KEY `motoboy_comissaos_motoboy_id_foreign` (`motoboy_id`),
  CONSTRAINT `motoboy_comissaos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `motoboy_comissaos_motoboy_id_foreign` FOREIGN KEY (`motoboy_id`) REFERENCES `motoboys` (`id`),
  CONSTRAINT `motoboy_comissaos_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedido_deliveries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motoboy_comissaos`
--

LOCK TABLES `motoboy_comissaos` WRITE;
/*!40000 ALTER TABLE `motoboy_comissaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `motoboy_comissaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motoboys`
--

--DROP TABLE IF EXISTS `motoboys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motoboys` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `nome` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_comissao` decimal(10,2) NOT NULL,
  `tipo_comissao` enum('valor_fixo','percentual') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `motoboys_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `motoboys_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motoboys`
--

LOCK TABLES `motoboys` WRITE;
/*!40000 ALTER TABLE `motoboys` DISABLE KEYS */;
/*!40000 ALTER TABLE `motoboys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimentacao_produtos`
--

--DROP TABLE IF EXISTS `movimentacao_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimentacao_produtos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` bigint unsigned DEFAULT NULL,
  `quantidade` decimal(14,4) NOT NULL,
  `tipo` enum('incremento','reducao') COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo_transacao` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `tipo_transacao` enum('venda_nfe','venda_nfce','compra','alteracao_estoque') COLLATE utf8mb4_unicode_ci NOT NULL,
  `produto_variacao_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movimentacao_produtos_produto_id_foreign` (`produto_id`),
  KEY `movimentacao_produtos_produto_variacao_id_foreign` (`produto_variacao_id`),
  CONSTRAINT `movimentacao_produtos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `movimentacao_produtos_produto_variacao_id_foreign` FOREIGN KEY (`produto_variacao_id`) REFERENCES `produto_variacaos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimentacao_produtos`
--

LOCK TABLES `movimentacao_produtos` WRITE;
/*!40000 ALTER TABLE `movimentacao_produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimentacao_produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio_carregamentos`
--

--DROP TABLE IF EXISTS `municipio_carregamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipio_carregamentos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `mdfe_id` bigint unsigned NOT NULL,
  `cidade_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `municipio_carregamentos_mdfe_id_foreign` (`mdfe_id`),
  KEY `municipio_carregamentos_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `municipio_carregamentos_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
  CONSTRAINT `municipio_carregamentos_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio_carregamentos`
--

LOCK TABLES `municipio_carregamentos` WRITE;
/*!40000 ALTER TABLE `municipio_carregamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `municipio_carregamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `n_fe_descargas`
--

--DROP TABLE IF EXISTS `n_fe_descargas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `n_fe_descargas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `info_id` bigint unsigned NOT NULL,
  `chave` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seg_cod_barras` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `n_fe_descargas_info_id_foreign` (`info_id`),
  CONSTRAINT `n_fe_descargas_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `n_fe_descargas`
--

LOCK TABLES `n_fe_descargas` WRITE;
/*!40000 ALTER TABLE `n_fe_descargas` DISABLE KEYS */;
/*!40000 ALTER TABLE `n_fe_descargas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `natureza_operacaos`
--

--DROP TABLE IF EXISTS `natureza_operacaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `natureza_operacaos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `descricao` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cst_csosn` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cst_pis` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cst_cofins` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cst_ipi` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cfop_estadual` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cfop_outro_estado` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cfop_entrada_estadual` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cfop_entrada_outro_estado` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `perc_icms` decimal(5,2) NOT NULL DEFAULT '0.00',
  `perc_pis` decimal(5,2) NOT NULL DEFAULT '0.00',
  `perc_cofins` decimal(5,2) NOT NULL DEFAULT '0.00',
  `perc_ipi` decimal(5,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `natureza_operacaos_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `natureza_operacaos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `natureza_operacaos`
--

LOCK TABLES `natureza_operacaos` WRITE;
/*!40000 ALTER TABLE `natureza_operacaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `natureza_operacaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ncms`
--

--DROP TABLE IF EXISTS `ncms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ncms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ncms`
--

LOCK TABLES `ncms` WRITE;
/*!40000 ALTER TABLE `ncms` DISABLE KEYS */;
/*!40000 ALTER TABLE `ncms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nfces`
--

--DROP TABLE IF EXISTS `nfces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nfces` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `natureza_id` bigint unsigned DEFAULT NULL,
  `emissor_nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emissor_cpf_cnpj` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ambiente` int NOT NULL,
  `lista_id` int DEFAULT NULL,
  `funcionario_id` int DEFAULT NULL,
  `cliente_id` bigint unsigned DEFAULT NULL,
  `caixa_id` bigint unsigned DEFAULT NULL,
  `cliente_nome` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cliente_cpf_cnpj` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chave` varchar(44) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recibo` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_serie` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` int DEFAULT NULL,
  `motivo_rejeicao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` enum('novo','rejeitado','cancelado','aprovado') COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_sequencial` int DEFAULT NULL,
  `total` decimal(12,2) NOT NULL,
  `desconto` decimal(12,2) DEFAULT NULL,
  `valor_cashback` decimal(10,2) DEFAULT NULL,
  `acrescimo` decimal(12,2) DEFAULT NULL,
  `observacao` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api` tinyint(1) NOT NULL DEFAULT '0',
  `data_emissao` timestamp NULL DEFAULT NULL,
  `dinheiro_recebido` decimal(10,2) NOT NULL,
  `troco` decimal(10,2) NOT NULL,
  `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bandeira_cartao` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '99',
  `cnpj_cartao` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cAut_cartao` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gerar_conta_receber` tinyint(1) NOT NULL DEFAULT '0',
  `local_id` int DEFAULT NULL,
  `signed_xml` text COLLATE utf8mb4_unicode_ci,
  `user_id` int DEFAULT NULL,
  `contigencia` tinyint(1) NOT NULL DEFAULT '0',
  `reenvio_contigencia` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nfces_empresa_id_foreign` (`empresa_id`),
  KEY `nfces_natureza_id_foreign` (`natureza_id`),
  KEY `nfces_cliente_id_foreign` (`cliente_id`),
  KEY `nfces_caixa_id_foreign` (`caixa_id`),
  CONSTRAINT `nfces_caixa_id_foreign` FOREIGN KEY (`caixa_id`) REFERENCES `caixas` (`id`),
  CONSTRAINT `nfces_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `nfces_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `nfces_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfces`
--

LOCK TABLES `nfces` WRITE;
/*!40000 ALTER TABLE `nfces` DISABLE KEYS */;
/*!40000 ALTER TABLE `nfces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota_servico_configs`
--

--DROP TABLE IF EXISTS `nota_servico_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nota_servico_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `razao_social` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `documento` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regime` enum('simples','normal') COLLATE utf8mb4_unicode_ci NOT NULL,
  `ie` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `im` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cnae` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_prefeitura` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `senha_prefeitura` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rua` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complemento` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cep` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `cidade_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nota_servico_configs_empresa_id_foreign` (`empresa_id`),
  KEY `nota_servico_configs_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `nota_servico_configs_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
  CONSTRAINT `nota_servico_configs_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_servico_configs`
--

LOCK TABLES `nota_servico_configs` WRITE;
/*!40000 ALTER TABLE `nota_servico_configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota_servico_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota_servicos`
--

--DROP TABLE IF EXISTS `nota_servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nota_servicos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `cliente_id` bigint unsigned DEFAULT NULL,
  `cidade_id` bigint unsigned DEFAULT NULL,
  `valor_total` decimal(16,7) NOT NULL,
  `gerar_conta_receber` tinyint(1) NOT NULL DEFAULT '0',
  `data_vencimento` date DEFAULT NULL,
  `conta_receber_id` int DEFAULT NULL,
  `estado` enum('novo','rejeitado','aprovado','cancelado','processando') COLLATE utf8mb4_unicode_ci NOT NULL,
  `serie` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo_verificacao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_nfse` int NOT NULL,
  `url_xml` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_pdf_nfse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_pdf_rps` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `documento` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `razao_social` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `im` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ie` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cep` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rua` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complemento` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `natureza_operacao` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chave` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ambiente` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nota_servicos_empresa_id_foreign` (`empresa_id`),
  KEY `nota_servicos_cliente_id_foreign` (`cliente_id`),
  KEY `nota_servicos_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `nota_servicos_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
  CONSTRAINT `nota_servicos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `nota_servicos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_servicos`
--

LOCK TABLES `nota_servicos` WRITE;
/*!40000 ALTER TABLE `nota_servicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota_servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas_reservas`
--

--DROP TABLE IF EXISTS `notas_reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas_reservas`
--

LOCK TABLES `notas_reservas` WRITE;
/*!40000 ALTER TABLE `notas_reservas` DISABLE KEYS */;
/*!40000 ALTER TABLE `notas_reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacaos`
--

--DROP TABLE IF EXISTS `notificacaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificacaos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `tabela` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao_curta` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `titulo` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referencia` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `visualizada` tinyint(1) NOT NULL DEFAULT '0',
  `por_sistema` tinyint(1) NOT NULL DEFAULT '0',
  `prioridade` enum('baixa','media','alta') COLLATE utf8mb4_unicode_ci NOT NULL,
  `super` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notificacaos_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `notificacaos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacaos`
--

LOCK TABLES `notificacaos` WRITE;
/*!40000 ALTER TABLE `notificacaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificacaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificao_cardapios`
--

--DROP TABLE IF EXISTS `notificao_cardapios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificao_cardapios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `pedido_id` bigint unsigned DEFAULT NULL,
  `mesa` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comanda` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` enum('garcom','fechar_mesa') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avaliacao` int DEFAULT NULL,
  `observacao` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notificao_cardapios_empresa_id_foreign` (`empresa_id`),
  KEY `notificao_cardapios_pedido_id_foreign` (`pedido_id`),
  CONSTRAINT `notificao_cardapios_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `notificao_cardapios_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificao_cardapios`
--

LOCK TABLES `notificao_cardapios` WRITE;
/*!40000 ALTER TABLE `notificao_cardapios` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificao_cardapios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuvem_shop_configs`
--

--DROP TABLE IF EXISTS `nuvem_shop_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nuvem_shop_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `client_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_secret` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nuvem_shop_configs_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `nuvem_shop_configs_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuvem_shop_configs`
--

LOCK TABLES `nuvem_shop_configs` WRITE;
/*!40000 ALTER TABLE `nuvem_shop_configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuvem_shop_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuvem_shop_item_pedidos`
--

--DROP TABLE IF EXISTS `nuvem_shop_item_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nuvem_shop_item_pedidos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` bigint unsigned DEFAULT NULL,
  `pedido_id` bigint unsigned DEFAULT NULL,
  `quantidade` decimal(8,2) NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nuvem_shop_item_pedidos_produto_id_foreign` (`produto_id`),
  KEY `nuvem_shop_item_pedidos_pedido_id_foreign` (`pedido_id`),
  CONSTRAINT `nuvem_shop_item_pedidos_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `nuvem_shop_pedidos` (`id`),
  CONSTRAINT `nuvem_shop_item_pedidos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuvem_shop_item_pedidos`
--

LOCK TABLES `nuvem_shop_item_pedidos` WRITE;
/*!40000 ALTER TABLE `nuvem_shop_item_pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuvem_shop_item_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuvem_shop_pedidos`
--

--DROP TABLE IF EXISTS `nuvem_shop_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nuvem_shop_pedidos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `pedido_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rua` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `valor_frete` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `observacao` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cliente_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `documento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nfe_id` int DEFAULT NULL,
  `status_envio` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gateway` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_pagamento` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `venda_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nuvem_shop_pedidos_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `nuvem_shop_pedidos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuvem_shop_pedidos`
--

LOCK TABLES `nuvem_shop_pedidos` WRITE;
/*!40000 ALTER TABLE `nuvem_shop_pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuvem_shop_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nves`
--

--DROP TABLE IF EXISTS `nves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nves` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `natureza_id` bigint unsigned DEFAULT NULL,
  `emissor_nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emissor_cpf_cnpj` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aut_xml` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ambiente` int NOT NULL,
  `crt` int DEFAULT NULL,
  `cliente_id` bigint unsigned DEFAULT NULL,
  `fornecedor_id` bigint unsigned DEFAULT NULL,
  `caixa_id` bigint unsigned DEFAULT NULL,
  `transportadora_id` bigint unsigned DEFAULT NULL,
  `chave` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chave_importada` varchar(44) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recibo` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_serie` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` int NOT NULL,
  `numero_sequencial` int DEFAULT NULL,
  `sequencia_cce` int NOT NULL DEFAULT '0',
  `motivo_rejeicao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` enum('novo','rejeitado','cancelado','aprovado') COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `valor_produtos` decimal(12,2) DEFAULT NULL,
  `valor_frete` decimal(12,2) DEFAULT NULL,
  `desconto` decimal(12,2) DEFAULT NULL,
  `acrescimo` decimal(12,2) DEFAULT NULL,
  `observacao` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placa` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` int DEFAULT NULL,
  `qtd_volumes` int DEFAULT NULL,
  `numeracao_volumes` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `especie` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `peso_liquido` decimal(8,3) DEFAULT NULL,
  `peso_bruto` decimal(8,3) DEFAULT NULL,
  `api` tinyint(1) NOT NULL DEFAULT '0',
  `gerar_conta_receber` tinyint(1) NOT NULL DEFAULT '0',
  `gerar_conta_pagar` tinyint(1) NOT NULL DEFAULT '0',
  `referencia` varchar(44) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tpNF` int NOT NULL DEFAULT '1',
  `tpEmis` int NOT NULL DEFAULT '1',
  `finNFe` int NOT NULL DEFAULT '1',
  `data_emissao` timestamp NULL DEFAULT NULL,
  `orcamento` tinyint(1) NOT NULL DEFAULT '0',
  `ref_orcamento` int DEFAULT NULL,
  `data_emissao_saida` date DEFAULT NULL,
  `data_emissao_retroativa` date DEFAULT NULL,
  `data_entrega` date DEFAULT NULL,
  `bandeira_cartao` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cnpj_cartao` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cAut_cartao` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `local_id` int DEFAULT NULL,
  `signed_xml` text COLLATE utf8mb4_unicode_ci,
  `user_id` int DEFAULT NULL,
  `contigencia` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nves_empresa_id_foreign` (`empresa_id`),
  KEY `nves_natureza_id_foreign` (`natureza_id`),
  KEY `nves_cliente_id_foreign` (`cliente_id`),
  KEY `nves_fornecedor_id_foreign` (`fornecedor_id`),
  KEY `nves_caixa_id_foreign` (`caixa_id`),
  KEY `nves_transportadora_id_foreign` (`transportadora_id`),
  CONSTRAINT `nves_caixa_id_foreign` FOREIGN KEY (`caixa_id`) REFERENCES `caixas` (`id`),
  CONSTRAINT `nves_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `nves_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `nves_fornecedor_id_foreign` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedors` (`id`),
  CONSTRAINT `nves_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`),
  CONSTRAINT `nves_transportadora_id_foreign` FOREIGN KEY (`transportadora_id`) REFERENCES `transportadoras` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nves`
--

LOCK TABLES `nves` WRITE;
/*!40000 ALTER TABLE `nves` DISABLE KEYS */;
/*!40000 ALTER TABLE `nves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordem_servicos`
--

--DROP TABLE IF EXISTS `ordem_servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordem_servicos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `cliente_id` bigint unsigned DEFAULT NULL,
  `usuario_id` bigint unsigned DEFAULT NULL,
  `funcionario_id` bigint unsigned DEFAULT NULL,
  `estado` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pd',
  `descricao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `forma_pagamento` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'av',
  `valor` decimal(10,2) NOT NULL DEFAULT '0.00',
  `data_inicio` timestamp NOT NULL,
  `data_entrega` timestamp NULL DEFAULT NULL,
  `nfe_id` int NOT NULL DEFAULT '0',
  `codigo_sequencial` int DEFAULT NULL,
  `caixa_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ordem_servicos_empresa_id_foreign` (`empresa_id`),
  KEY `ordem_servicos_cliente_id_foreign` (`cliente_id`),
  KEY `ordem_servicos_usuario_id_foreign` (`usuario_id`),
  KEY `ordem_servicos_funcionario_id_foreign` (`funcionario_id`),
  KEY `ordem_servicos_caixa_id_foreign` (`caixa_id`),
  CONSTRAINT `ordem_servicos_caixa_id_foreign` FOREIGN KEY (`caixa_id`) REFERENCES `caixas` (`id`),
  CONSTRAINT `ordem_servicos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `ordem_servicos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `ordem_servicos_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`),
  CONSTRAINT `ordem_servicos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_servicos`
--

LOCK TABLES `ordem_servicos` WRITE;
/*!40000 ALTER TABLE `ordem_servicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordem_servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `padrao_frigobars`
--

--DROP TABLE IF EXISTS `padrao_frigobars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `padrao_frigobars`
--

LOCK TABLES `padrao_frigobars` WRITE;
/*!40000 ALTER TABLE `padrao_frigobars` DISABLE KEYS */;
/*!40000 ALTER TABLE `padrao_frigobars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `padrao_tributacao_produtos`
--

--DROP TABLE IF EXISTS `padrao_tributacao_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `padrao_tributacao_produtos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `descricao` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `perc_icms` decimal(10,2) NOT NULL DEFAULT '0.00',
  `perc_pis` decimal(10,2) NOT NULL DEFAULT '0.00',
  `perc_cofins` decimal(10,2) NOT NULL DEFAULT '0.00',
  `perc_ipi` decimal(10,2) NOT NULL DEFAULT '0.00',
  `cst_csosn` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cst_pis` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cst_cofins` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cst_ipi` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cfop_estadual` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cfop_outro_estado` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cfop_entrada_estadual` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cfop_entrada_outro_estado` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cEnq` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `perc_red_bc` decimal(5,2) DEFAULT NULL,
  `pST` decimal(5,2) DEFAULT NULL,
  `cest` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ncm` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo_beneficio_fiscal` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `padrao` tinyint(1) NOT NULL DEFAULT '0',
  `modBCST` int DEFAULT NULL,
  `pMVAST` decimal(5,2) DEFAULT NULL,
  `pICMSST` decimal(5,2) DEFAULT NULL,
  `redBCST` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `padrao_tributacao_produtos_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `padrao_tributacao_produtos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `padrao_tributacao_produtos`
--

LOCK TABLES `padrao_tributacao_produtos` WRITE;
/*!40000 ALTER TABLE `padrao_tributacao_produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `padrao_tributacao_produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamentos`
--

--DROP TABLE IF EXISTS `pagamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamentos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `plano_id` bigint unsigned DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL,
  `transacao_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forma_pagamento` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code_base64` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pagamentos_empresa_id_foreign` (`empresa_id`),
  KEY `pagamentos_plano_id_foreign` (`plano_id`),
  CONSTRAINT `pagamentos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `pagamentos_plano_id_foreign` FOREIGN KEY (`plano_id`) REFERENCES `planos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamentos`
--

LOCK TABLES `pagamentos` WRITE;
/*!40000 ALTER TABLE `pagamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

--DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

--DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_deliveries`
--

--DROP TABLE IF EXISTS `pedido_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_deliveries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `cliente_id` bigint unsigned DEFAULT NULL,
  `motoboy_id` bigint unsigned DEFAULT NULL,
  `comissao_motoboy` decimal(10,2) DEFAULT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `troco_para` decimal(10,2) DEFAULT NULL,
  `tipo_pagamento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` enum('novo','aprovado','cancelado','finalizado') COLLATE utf8mb4_unicode_ci NOT NULL,
  `motivo_estado` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `endereco_id` bigint unsigned DEFAULT NULL,
  `cupom_id` bigint unsigned DEFAULT NULL,
  `desconto` decimal(10,2) DEFAULT NULL,
  `valor_entrega` decimal(10,2) NOT NULL,
  `app` tinyint(1) NOT NULL,
  `qr_code_base64` text COLLATE utf8mb4_unicode_ci,
  `qr_code` text COLLATE utf8mb4_unicode_ci,
  `transacao_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_pagamento` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pedido_lido` tinyint(1) NOT NULL DEFAULT '0',
  `finalizado` tinyint(1) NOT NULL DEFAULT '0',
  `horario_cricao` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `horario_leitura` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `horario_entrega` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nfce_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_deliveries`
--

LOCK TABLES `pedido_deliveries` WRITE;
/*!40000 ALTER TABLE `pedido_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_ecommerces`
--

--DROP TABLE IF EXISTS `pedido_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_ecommerces` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` bigint unsigned NOT NULL,
  `empresa_id` bigint unsigned NOT NULL,
  `endereco_id` bigint unsigned DEFAULT NULL,
  `estado` enum('novo','preparando','em_trasporte','finalizado','recusado') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_pagamento` enum('cartao','pix','boleto','deposito') COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `valor_frete` decimal(10,2) DEFAULT NULL,
  `desconto` decimal(10,2) DEFAULT NULL,
  `tipo_frete` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rua_entrega` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_entrega` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referencia_entrega` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bairro_entrega` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cep_entrega` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cidade_entrega` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_boleto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code_base64` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hash_pedido` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_pagamento` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `transacao_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nfe_id` int DEFAULT NULL,
  `cupom_desconto` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_entrega` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo_rastreamento` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pedido_lido` tinyint(1) NOT NULL DEFAULT '0',
  `nome` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sobre_nome` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_documento` enum('cpf','cnpj') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_documento` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comprovante` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_ecommerces_cliente_id_foreign` (`cliente_id`),
  KEY `pedido_ecommerces_empresa_id_foreign` (`empresa_id`),
  KEY `pedido_ecommerces_endereco_id_foreign` (`endereco_id`),
  CONSTRAINT `pedido_ecommerces_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `pedido_ecommerces_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `pedido_ecommerces_endereco_id_foreign` FOREIGN KEY (`endereco_id`) REFERENCES `endereco_ecommerces` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_ecommerces`
--

LOCK TABLES `pedido_ecommerces` WRITE;
/*!40000 ALTER TABLE `pedido_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_mercado_livres`
--

--DROP TABLE IF EXISTS `pedido_mercado_livres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_mercado_livres` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `cliente_id` bigint unsigned DEFAULT NULL,
  `_id` bigint NOT NULL,
  `tipo_pagamento` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `valor_entrega` decimal(10,2) NOT NULL,
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seller_id` bigint NOT NULL,
  `entrega_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_pedido` timestamp NOT NULL,
  `comentario` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nfe_id` int DEFAULT NULL,
  `rua_entrega` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_entrega` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cep_entrega` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bairro_entrega` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cidade_entrega` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comentario_entrega` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo_rastreamento` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cliente_nome` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cliente_documento` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_mercado_livres_empresa_id_foreign` (`empresa_id`),
  KEY `pedido_mercado_livres_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `pedido_mercado_livres_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `pedido_mercado_livres_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_mercado_livres`
--

LOCK TABLES `pedido_mercado_livres` WRITE;
/*!40000 ALTER TABLE `pedido_mercado_livres` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_mercado_livres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

--DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `cliente_id` bigint unsigned DEFAULT NULL,
  `funcionario_id` bigint unsigned DEFAULT NULL,
  `cliente_nome` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cliente_fone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comanda` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mesa` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_fechamento` timestamp NULL DEFAULT NULL,
  `total` decimal(12,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `em_atendimento` tinyint(1) NOT NULL DEFAULT '1',
  `nfce_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedidos_empresa_id_foreign` (`empresa_id`),
  KEY `pedidos_cliente_id_foreign` (`cliente_id`),
  KEY `pedidos_funcionario_id_foreign` (`funcionario_id`),
  CONSTRAINT `pedidos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `pedidos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `pedidos_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `percursos`
--

--DROP TABLE IF EXISTS `percursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `percursos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `mdfe_id` bigint unsigned NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `percursos_mdfe_id_foreign` (`mdfe_id`),
  CONSTRAINT `percursos_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `percursos`
--

LOCK TABLES `percursos` WRITE;
/*!40000 ALTER TABLE `percursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `percursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

--DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (204,'troca_view','Visualiza troca','web','2024-09-03 10:31:00','2024-09-03 10:31:00'),(205,'troca_create','Cria troca','web','2024-09-03 10:31:00','2024-09-03 10:31:00'),(206,'troca_delete','Deleta troca','web','2024-09-03 10:31:00','2024-09-03 10:31:00'),(207,'contigencia_view','Visualiza contigência','web','2024-09-03 10:31:00','2024-09-03 10:31:00'),(208,'contigencia_create','Cria contigência','web','2024-09-03 10:31:00','2024-09-03 10:31:00'),(209,'woocommerce_view','Visualiza woocommerce','web','2024-09-03 10:31:00','2024-09-03 10:31:00');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

--DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plano_contas`
--

--DROP TABLE IF EXISTS `plano_contas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plano_contas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `plano_conta_id` bigint unsigned DEFAULT NULL,
  `descricao` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plano_contas_empresa_id_foreign` (`empresa_id`),
  KEY `plano_contas_plano_conta_id_foreign` (`plano_conta_id`),
  CONSTRAINT `plano_contas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `plano_contas_plano_conta_id_foreign` FOREIGN KEY (`plano_conta_id`) REFERENCES `plano_contas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plano_contas`
--

LOCK TABLES `plano_contas` WRITE;
/*!40000 ALTER TABLE `plano_contas` DISABLE KEYS */;
/*!40000 ALTER TABLE `plano_contas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plano_empresas`
--

--DROP TABLE IF EXISTS `plano_empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plano_empresas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `plano_id` bigint unsigned NOT NULL,
  `data_expiracao` date NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plano_empresas_empresa_id_foreign` (`empresa_id`),
  KEY `plano_empresas_plano_id_foreign` (`plano_id`),
  CONSTRAINT `plano_empresas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `plano_empresas_plano_id_foreign` FOREIGN KEY (`plano_id`) REFERENCES `planos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plano_empresas`
--

LOCK TABLES `plano_empresas` WRITE;
/*!40000 ALTER TABLE `plano_empresas` DISABLE KEYS */;
/*!40000 ALTER TABLE `plano_empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plano_pendentes`
--

--DROP TABLE IF EXISTS `plano_pendentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plano_pendentes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `contador_id` bigint unsigned NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `plano_id` bigint unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plano_pendentes_empresa_id_foreign` (`empresa_id`),
  KEY `plano_pendentes_contador_id_foreign` (`contador_id`),
  KEY `plano_pendentes_plano_id_foreign` (`plano_id`),
  CONSTRAINT `plano_pendentes_contador_id_foreign` FOREIGN KEY (`contador_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `plano_pendentes_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `plano_pendentes_plano_id_foreign` FOREIGN KEY (`plano_id`) REFERENCES `planos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plano_pendentes`
--

LOCK TABLES `plano_pendentes` WRITE;
/*!40000 ALTER TABLE `plano_pendentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `plano_pendentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planos`
--

--DROP TABLE IF EXISTS `planos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `maximo_nfes` int NOT NULL,
  `maximo_nfces` int NOT NULL,
  `maximo_ctes` int NOT NULL,
  `maximo_mdfes` int NOT NULL,
  `imagem` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visivel_clientes` tinyint(1) NOT NULL DEFAULT '1',
  `visivel_contadores` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `valor` decimal(10,2) NOT NULL,
  `valor_implantacao` decimal(10,2) NOT NULL DEFAULT '0.00',
  `intervalo_dias` int NOT NULL,
  `modulos` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_cadastro` tinyint(1) NOT NULL,
  `fiscal` tinyint(1) NOT NULL,
  `segmento_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planos`
--

LOCK TABLES `planos` WRITE;
/*!40000 ALTER TABLE `planos` DISABLE KEYS */;
/*!40000 ALTER TABLE `planos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pre_vendas`
--

--DROP TABLE IF EXISTS `pre_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_vendas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `cliente_id` bigint unsigned DEFAULT NULL,
  `lista_id` int DEFAULT NULL,
  `usuario_id` bigint unsigned NOT NULL,
  `funcionario_id` bigint unsigned DEFAULT NULL,
  `natureza_id` bigint unsigned NOT NULL,
  `valor_total` decimal(16,7) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `acrescimo` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observacao` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pedido_delivery_id` int DEFAULT NULL,
  `tipo_finalizado` enum('nfe','nfce') COLLATE utf8mb4_unicode_ci NOT NULL,
  `venda_id` int DEFAULT NULL,
  `codigo` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bandeira_cartao` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '99',
  `cnpj_cartao` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cAut_cartao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `descricao_pag_outros` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rascunho` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `local_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pre_vendas_empresa_id_foreign` (`empresa_id`),
  KEY `pre_vendas_cliente_id_foreign` (`cliente_id`),
  KEY `pre_vendas_usuario_id_foreign` (`usuario_id`),
  KEY `pre_vendas_funcionario_id_foreign` (`funcionario_id`),
  KEY `pre_vendas_natureza_id_foreign` (`natureza_id`),
  CONSTRAINT `pre_vendas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `pre_vendas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `pre_vendas_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`),
  CONSTRAINT `pre_vendas_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`),
  CONSTRAINT `pre_vendas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pre_vendas`
--

LOCK TABLES `pre_vendas` WRITE;
/*!40000 ALTER TABLE `pre_vendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `pre_vendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_adicionals`
--

--DROP TABLE IF EXISTS `produto_adicionals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_adicionals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` bigint unsigned DEFAULT NULL,
  `adicional_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_adicionals_produto_id_foreign` (`produto_id`),
  KEY `produto_adicionals_adicional_id_foreign` (`adicional_id`),
  CONSTRAINT `produto_adicionals_adicional_id_foreign` FOREIGN KEY (`adicional_id`) REFERENCES `adicionals` (`id`),
  CONSTRAINT `produto_adicionals_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_adicionals`
--

LOCK TABLES `produto_adicionals` WRITE;
/*!40000 ALTER TABLE `produto_adicionals` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_adicionals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_combos`
--

--DROP TABLE IF EXISTS `produto_combos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_combos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` bigint unsigned NOT NULL,
  `item_id` bigint unsigned NOT NULL,
  `quantidade` decimal(8,3) NOT NULL,
  `valor_compra` decimal(12,4) NOT NULL,
  `sub_total` decimal(12,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_combos_produto_id_foreign` (`produto_id`),
  KEY `produto_combos_item_id_foreign` (`item_id`),
  CONSTRAINT `produto_combos_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `produto_combos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_combos`
--

LOCK TABLES `produto_combos` WRITE;
/*!40000 ALTER TABLE `produto_combos` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_combos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_composicaos`
--

--DROP TABLE IF EXISTS `produto_composicaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_composicaos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` bigint unsigned DEFAULT NULL,
  `ingrediente_id` bigint unsigned DEFAULT NULL,
  `quantidade` decimal(8,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_composicaos_produto_id_foreign` (`produto_id`),
  KEY `produto_composicaos_ingrediente_id_foreign` (`ingrediente_id`),
  CONSTRAINT `produto_composicaos_ingrediente_id_foreign` FOREIGN KEY (`ingrediente_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `produto_composicaos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_composicaos`
--

LOCK TABLES `produto_composicaos` WRITE;
/*!40000 ALTER TABLE `produto_composicaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_composicaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_fornecedors`
--

--DROP TABLE IF EXISTS `produto_fornecedors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_fornecedors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` bigint unsigned DEFAULT NULL,
  `fornecedor_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_fornecedors_produto_id_foreign` (`produto_id`),
  KEY `produto_fornecedors_fornecedor_id_foreign` (`fornecedor_id`),
  CONSTRAINT `produto_fornecedors_fornecedor_id_foreign` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedors` (`id`),
  CONSTRAINT `produto_fornecedors_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_fornecedors`
--

LOCK TABLES `produto_fornecedors` WRITE;
/*!40000 ALTER TABLE `produto_fornecedors` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_fornecedors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_ingredientes`
--

--DROP TABLE IF EXISTS `produto_ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_ingredientes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` bigint unsigned DEFAULT NULL,
  `ingrediente` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_ingredientes_produto_id_foreign` (`produto_id`),
  CONSTRAINT `produto_ingredientes_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_ingredientes`
--

LOCK TABLES `produto_ingredientes` WRITE;
/*!40000 ALTER TABLE `produto_ingredientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_localizacaos`
--

--DROP TABLE IF EXISTS `produto_localizacaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_localizacaos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` bigint unsigned DEFAULT NULL,
  `localizacao_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_localizacaos_produto_id_foreign` (`produto_id`),
  KEY `produto_localizacaos_localizacao_id_foreign` (`localizacao_id`),
  CONSTRAINT `produto_localizacaos_localizacao_id_foreign` FOREIGN KEY (`localizacao_id`) REFERENCES `localizacaos` (`id`),
  CONSTRAINT `produto_localizacaos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_localizacaos`
--

LOCK TABLES `produto_localizacaos` WRITE;
/*!40000 ALTER TABLE `produto_localizacaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_localizacaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_os`
--

--DROP TABLE IF EXISTS `produto_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_os` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` bigint unsigned DEFAULT NULL,
  `ordem_servico_id` bigint unsigned DEFAULT NULL,
  `quantidade` int NOT NULL,
  `valor` decimal(10,2) NOT NULL DEFAULT '0.00',
  `subtotal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_os_produto_id_foreign` (`produto_id`),
  KEY `produto_os_ordem_servico_id_foreign` (`ordem_servico_id`),
  CONSTRAINT `produto_os_ordem_servico_id_foreign` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servicos` (`id`),
  CONSTRAINT `produto_os_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_os`
--

LOCK TABLES `produto_os` WRITE;
/*!40000 ALTER TABLE `produto_os` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_pizza_valors`
--

--DROP TABLE IF EXISTS `produto_pizza_valors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_pizza_valors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` bigint unsigned NOT NULL,
  `tamanho_id` bigint unsigned NOT NULL,
  `valor` decimal(12,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_pizza_valors_produto_id_foreign` (`produto_id`),
  KEY `produto_pizza_valors_tamanho_id_foreign` (`tamanho_id`),
  CONSTRAINT `produto_pizza_valors_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `produto_pizza_valors_tamanho_id_foreign` FOREIGN KEY (`tamanho_id`) REFERENCES `tamanho_pizzas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_pizza_valors`
--

LOCK TABLES `produto_pizza_valors` WRITE;
/*!40000 ALTER TABLE `produto_pizza_valors` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_pizza_valors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_variacaos`
--

--DROP TABLE IF EXISTS `produto_variacaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_variacaos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` bigint unsigned DEFAULT NULL,
  `descricao` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(12,4) NOT NULL,
  `codigo_barras` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referencia` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagem` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_variacaos_produto_id_foreign` (`produto_id`),
  CONSTRAINT `produto_variacaos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_variacaos`
--

LOCK TABLES `produto_variacaos` WRITE;
/*!40000 ALTER TABLE `produto_variacaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_variacaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

--DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `categoria_id` bigint unsigned DEFAULT NULL,
  `sub_categoria_id` bigint unsigned DEFAULT NULL,
  `padrao_id` bigint unsigned DEFAULT NULL,
  `marca_id` bigint unsigned DEFAULT NULL,
  `variacao_modelo_id` bigint unsigned DEFAULT NULL,
  `nome` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo_barras` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo_barras2` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo_barras3` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referencia` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ncm` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unidade` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagem` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `perc_icms` decimal(10,2) NOT NULL DEFAULT '0.00',
  `perc_pis` decimal(10,2) NOT NULL DEFAULT '0.00',
  `perc_cofins` decimal(10,2) NOT NULL DEFAULT '0.00',
  `perc_ipi` decimal(10,2) NOT NULL DEFAULT '0.00',
  `cest` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origem` int NOT NULL DEFAULT '0',
  `cst_csosn` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cst_pis` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cst_cofins` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cst_ipi` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `perc_red_bc` decimal(5,2) DEFAULT NULL,
  `pST` decimal(5,2) DEFAULT NULL,
  `valor_unitario` decimal(12,4) NOT NULL,
  `valor_compra` decimal(12,4) NOT NULL,
  `percentual_lucro` decimal(10,2) NOT NULL DEFAULT '0.00',
  `cfop_estadual` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cfop_outro_estado` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cfop_entrada_estadual` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cfop_entrada_outro_estado` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo_beneficio_fiscal` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cEnq` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gerenciar_estoque` tinyint(1) NOT NULL DEFAULT '0',
  `adRemICMSRet` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `pBio` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `tipo_servico` tinyint(1) NOT NULL DEFAULT '0',
  `indImport` int NOT NULL DEFAULT '0',
  `cUFOrig` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pOrig` decimal(5,2) NOT NULL DEFAULT '0.00',
  `codigo_anp` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `perc_glp` decimal(5,2) NOT NULL DEFAULT '0.00',
  `perc_gnn` decimal(5,2) NOT NULL DEFAULT '0.00',
  `perc_gni` decimal(5,2) NOT NULL DEFAULT '0.00',
  `valor_partida` decimal(10,2) NOT NULL DEFAULT '0.00',
  `unidade_tributavel` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `quantidade_tributavel` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `cardapio` tinyint(1) NOT NULL DEFAULT '0',
  `delivery` tinyint(1) NOT NULL DEFAULT '0',
  `reserva` tinyint(1) NOT NULL DEFAULT '0',
  `ecommerce` tinyint(1) NOT NULL DEFAULT '0',
  `nome_en` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nome_es` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descricao_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descricao_es` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valor_cardapio` decimal(12,4) DEFAULT NULL,
  `valor_delivery` decimal(12,4) DEFAULT NULL,
  `destaque_delivery` tinyint(1) DEFAULT NULL,
  `oferta_delivery` tinyint(1) DEFAULT NULL,
  `tempo_preparo` int DEFAULT NULL,
  `tipo_carne` tinyint(1) NOT NULL DEFAULT '0',
  `composto` tinyint(1) NOT NULL DEFAULT '0',
  `combo` tinyint(1) NOT NULL DEFAULT '0',
  `margem_combo` decimal(5,2) NOT NULL DEFAULT '0.00',
  `estoque_minimo` decimal(5,2) NOT NULL DEFAULT '0.00',
  `alerta_validade` int DEFAULT NULL,
  `referencia_balanca` int DEFAULT NULL,
  `valor_ecommerce` decimal(12,4) DEFAULT NULL,
  `destaque_ecommerce` tinyint(1) DEFAULT NULL,
  `percentual_desconto` int DEFAULT NULL,
  `descricao_ecommerce` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `texto_ecommerce` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `largura` decimal(8,2) DEFAULT NULL,
  `comprimento` decimal(8,2) DEFAULT NULL,
  `altura` decimal(8,2) DEFAULT NULL,
  `peso` decimal(12,3) DEFAULT NULL,
  `hash_ecommerce` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hash_delivery` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `texto_delivery` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mercado_livre_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mercado_livre_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mercado_livre_valor` decimal(12,4) DEFAULT NULL,
  `mercado_livre_categoria` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condicao_mercado_livre` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantidade_mercado_livre` int DEFAULT NULL,
  `mercado_livre_tipo_publicacao` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mercado_livre_youtube` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mercado_livre_descricao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mercado_livre_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `woocommerce_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `woocommerce_slug` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `woocommerce_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `woocommerce_valor` decimal(12,4) DEFAULT NULL,
  `woocommerce_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `woocommerce_status` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `woocommerce_descricao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `woocommerce_stock_status` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categorias_woocommerce` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `nuvem_shop_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nuvem_shop_valor` decimal(12,4) DEFAULT NULL,
  `texto_nuvem_shop` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `modBCST` int DEFAULT NULL,
  `pMVAST` decimal(5,2) DEFAULT NULL,
  `pICMSST` decimal(5,2) DEFAULT NULL,
  `redBCST` decimal(5,2) DEFAULT NULL,
  `valor_atacado` decimal(22,7) NOT NULL DEFAULT '0.0000000',
  `quantidade_atacado` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produtos_empresa_id_foreign` (`empresa_id`),
  KEY `produtos_categoria_id_foreign` (`categoria_id`),
  KEY `produtos_sub_categoria_id_foreign` (`sub_categoria_id`),
  KEY `produtos_padrao_id_foreign` (`padrao_id`),
  KEY `produtos_marca_id_foreign` (`marca_id`),
  CONSTRAINT `produtos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_produtos` (`id`),
  CONSTRAINT `produtos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `produtos_marca_id_foreign` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`),
  CONSTRAINT `produtos_padrao_id_foreign` FOREIGN KEY (`padrao_id`) REFERENCES `padrao_tributacao_produtos` (`id`),
  CONSTRAINT `produtos_sub_categoria_id_foreign` FOREIGN KEY (`sub_categoria_id`) REFERENCES `categoria_produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relatorio_os`
--

--DROP TABLE IF EXISTS `relatorio_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relatorio_os` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint unsigned DEFAULT NULL,
  `ordem_servico_id` bigint unsigned DEFAULT NULL,
  `texto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `relatorio_os_usuario_id_foreign` (`usuario_id`),
  KEY `relatorio_os_ordem_servico_id_foreign` (`ordem_servico_id`),
  CONSTRAINT `relatorio_os_ordem_servico_id_foreign` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servicos` (`id`),
  CONSTRAINT `relatorio_os_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relatorio_os`
--

LOCK TABLES `relatorio_os` WRITE;
/*!40000 ALTER TABLE `relatorio_os` DISABLE KEYS */;
/*!40000 ALTER TABLE `relatorio_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remessa_boleto_items`
--

--DROP TABLE IF EXISTS `remessa_boleto_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remessa_boleto_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `remessa_id` bigint unsigned DEFAULT NULL,
  `boleto_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `remessa_boleto_items_remessa_id_foreign` (`remessa_id`),
  KEY `remessa_boleto_items_boleto_id_foreign` (`boleto_id`),
  CONSTRAINT `remessa_boleto_items_boleto_id_foreign` FOREIGN KEY (`boleto_id`) REFERENCES `boletos` (`id`),
  CONSTRAINT `remessa_boleto_items_remessa_id_foreign` FOREIGN KEY (`remessa_id`) REFERENCES `remessa_boletos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remessa_boleto_items`
--

LOCK TABLES `remessa_boleto_items` WRITE;
/*!40000 ALTER TABLE `remessa_boleto_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `remessa_boleto_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remessa_boletos`
--

--DROP TABLE IF EXISTS `remessa_boletos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remessa_boletos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome_arquivo` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conta_boleto_id` int NOT NULL,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `remessa_boletos_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `remessa_boletos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remessa_boletos`
--

LOCK TABLES `remessa_boletos` WRITE;
/*!40000 ALTER TABLE `remessa_boletos` DISABLE KEYS */;
/*!40000 ALTER TABLE `remessa_boletos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva_configs`
--

--DROP TABLE IF EXISTS `reserva_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva_configs`
--

LOCK TABLES `reserva_configs` WRITE;
/*!40000 ALTER TABLE `reserva_configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserva_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

--DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

--DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
--INSERT INTO `role_has_permissions` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(92,1),(93,1),(94,1),(95,1),(96,1),(97,1),(98,1),(99,1),(100,1),(101,1),(102,1),(103,1),(104,1),(105,1),(106,1),(107,1),(108,1),(109,1),(110,1),(111,1),(112,1),(113,1),(114,1),(115,1),(116,1),(117,1),(118,1),(119,1),(120,1),(121,1),(122,1),(123,1),(124,1),(125,1),(126,1),(127,1),(128,1),(129,1),(130,1),(131,1),(132,1),(133,1),(134,1),(135,1),(136,1),(137,1),(138,1),(139,1),(140,1),(141,1),(142,1),(143,1),(144,1),(145,1),(146,1),(147,1),(148,1),(149,1),(150,1),(151,1),(152,1),(153,1),(154,1),(155,1),(156,1),(157,1),(158,1),(159,1),(160,1),(161,1),(162,1),(163,1),(164,1),(165,1),(166,1),(167,1),(168,1),(169,1),(170,1),(171,1),(172,1),(173,1),(174,1),(175,1),(176,1),(177,1),(178,1),(179,1),(180,1),(181,1),(182,1),(183,1),(184,1),(185,1),(186,1),(187,1),(188,1),(189,1),(190,1),(191,1),(192,1),(193,1),(194,1),(195,1),(196,1),(197,1),(198,1),(199,1),(200,1),(201,1),(202,1),(203,1),(204,1),(205,1),(206,1),(207,1),(208,1),(209,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2),(22,2),(23,2),(24,2),(25,2),(26,2),(27,2),(28,2),(29,2),(30,2),(31,2),(32,2),(33,2),(34,2),(35,2),(36,2),(37,2),(38,2),(39,2),(40,2),(41,2),(42,2),(43,2),(44,2),(45,2),(46,2),(47,2),(48,2),(49,2),(50,2),(51,2),(52,2),(53,2),(54,2),(55,2),(56,2),(57,2),(58,2),(59,2),(60,2),(61,2),(62,2),(63,2),(64,2),(65,2),(66,2),(67,2),(68,2),(69,2),(70,2),(71,2),(72,2),(73,2),(74,2),(75,2),(76,2),(77,2),(78,2),(79,2),(80,2),(81,2),(82,2),(83,2),(84,2),(85,2),(86,2),(87,2),(88,2),(89,2),(90,2),(91,2),(92,2),(93,2),(94,2),(95,2),(96,2),(97,2),(98,2),(99,2),(100,2),(101,2),(102,2),(103,2),(104,2),(105,2),(106,2),(107,2),(108,2),(109,2),(110,2),(111,2),(112,2),(113,2),(114,2),(115,2),(116,2),(117,2),(118,2),(119,2),(120,2),(121,2),(122,2),(123,2),(124,2),(125,2),(126,2),(127,2),(128,2),(129,2),(130,2),(131,2),(132,2),(133,2),(134,2),(135,2),(136,2),(137,2),(138,2),(139,2),(140,2),(141,2),(142,2),(143,2),(144,2),(145,2),(146,2),(147,2),(148,2),(149,2),(150,2),(151,2),(152,2),(153,2),(154,2),(155,2),(156,2),(157,2),(158,2),(159,2),(160,2),(161,2),(162,2),(163,2),(164,2),(165,2),(166,2),(167,2),(168,2),(169,2),(170,2),(171,2),(172,2),(173,2),(174,2),(175,2),(176,2),(177,2),(178,2),(179,2),(180,2),(181,2),(182,2),(183,2),(184,2),(185,2),(186,2),(187,2),(188,2),(189,2),(190,2),(191,2),(192,2),(193,2),(194,2),(195,2),(196,2),(197,2),(198,2),(199,2),(200,2),(201,2),(202,2),(203,2),(204,2),(205,2),(206,2),(207,2),(208,2),(209,2);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

--DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `type_user` smallint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`),
  KEY `roles_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `roles_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
--INSERT INTO `roles` VALUES (1,'gestor_plataforma','Gestor Plataforma','web',NULL,0,1,'2024-09-03 10:31:00','2024-09-03 10:31:00'),(2,'admin','Admin','web',NULL,0,2,'2024-09-03 10:31:00','2024-09-03 10:31:00');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sangria_caixas`
--

--DROP TABLE IF EXISTS `sangria_caixas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sangria_caixas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `caixa_id` bigint unsigned DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL,
  `observacao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conta_empresa_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sangria_caixas_caixa_id_foreign` (`caixa_id`),
  CONSTRAINT `sangria_caixas_caixa_id_foreign` FOREIGN KEY (`caixa_id`) REFERENCES `caixas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sangria_caixas`
--

LOCK TABLES `sangria_caixas` WRITE;
/*!40000 ALTER TABLE `sangria_caixas` DISABLE KEYS */;
/*!40000 ALTER TABLE `sangria_caixas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `segmento_empresas`
--

--DROP TABLE IF EXISTS `segmento_empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `segmento_empresas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `segmento_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `segmento_empresas_empresa_id_foreign` (`empresa_id`),
  KEY `segmento_empresas_segmento_id_foreign` (`segmento_id`),
  CONSTRAINT `segmento_empresas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `segmento_empresas_segmento_id_foreign` FOREIGN KEY (`segmento_id`) REFERENCES `segmentos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segmento_empresas`
--

LOCK TABLES `segmento_empresas` WRITE;
/*!40000 ALTER TABLE `segmento_empresas` DISABLE KEYS */;
/*!40000 ALTER TABLE `segmento_empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `segmentos`
--

--DROP TABLE IF EXISTS `segmentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `segmentos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segmentos`
--

LOCK TABLES `segmentos` WRITE;
/*!40000 ALTER TABLE `segmentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `segmentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico_os`
--

--DROP TABLE IF EXISTS `servico_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servico_os` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `servico_id` bigint unsigned DEFAULT NULL,
  `ordem_servico_id` bigint unsigned DEFAULT NULL,
  `quantidade` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `valor` decimal(10,2) NOT NULL DEFAULT '0.00',
  `subtotal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `servico_os_servico_id_foreign` (`servico_id`),
  KEY `servico_os_ordem_servico_id_foreign` (`ordem_servico_id`),
  CONSTRAINT `servico_os_ordem_servico_id_foreign` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servicos` (`id`),
  CONSTRAINT `servico_os_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico_os`
--

LOCK TABLES `servico_os` WRITE;
/*!40000 ALTER TABLE `servico_os` DISABLE KEYS */;
/*!40000 ALTER TABLE `servico_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico_reservas`
--

--DROP TABLE IF EXISTS `servico_reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico_reservas`
--

LOCK TABLES `servico_reservas` WRITE;
/*!40000 ALTER TABLE `servico_reservas` DISABLE KEYS */;
/*!40000 ALTER TABLE `servico_reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicos`
--

--DROP TABLE IF EXISTS `servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `nome` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `unidade_cobranca` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempo_servico` int NOT NULL,
  `tempo_adicional` int NOT NULL DEFAULT '0',
  `tempo_tolerancia` int NOT NULL DEFAULT '0',
  `valor_adicional` decimal(10,2) NOT NULL DEFAULT '0.00',
  `comissao` decimal(6,2) NOT NULL DEFAULT '0.00',
  `categoria_id` bigint unsigned NOT NULL,
  `codigo_servico` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aliquota_iss` decimal(6,2) DEFAULT NULL,
  `aliquota_pis` decimal(6,2) DEFAULT NULL,
  `aliquota_cofins` decimal(6,2) DEFAULT NULL,
  `aliquota_inss` decimal(6,2) DEFAULT NULL,
  `imagem` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `reserva` tinyint(1) NOT NULL DEFAULT '0',
  `padrao_reserva_nfse` tinyint(1) NOT NULL DEFAULT '0',
  `marketplace` tinyint(1) NOT NULL DEFAULT '0',
  `codigo_tributacao_municipio` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hash_delivery` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `destaque_marketplace` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `servicos_empresa_id_foreign` (`empresa_id`),
  KEY `servicos_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `servicos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_servicos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `servicos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicos`
--

LOCK TABLES `servicos` WRITE;
/*!40000 ALTER TABLE `servicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

--DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suprimento_caixas`
--

--DROP TABLE IF EXISTS `suprimento_caixas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suprimento_caixas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `caixa_id` bigint unsigned DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL,
  `observacao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conta_empresa_id` int DEFAULT NULL,
  `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `suprimento_caixas_caixa_id_foreign` (`caixa_id`),
  CONSTRAINT `suprimento_caixas_caixa_id_foreign` FOREIGN KEY (`caixa_id`) REFERENCES `caixas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suprimento_caixas`
--

LOCK TABLES `suprimento_caixas` WRITE;
/*!40000 ALTER TABLE `suprimento_caixas` DISABLE KEYS */;
/*!40000 ALTER TABLE `suprimento_caixas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tamanho_pizzas`
--

--DROP TABLE IF EXISTS `tamanho_pizzas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tamanho_pizzas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_en` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nome_es` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maximo_sabores` int NOT NULL,
  `quantidade_pedacos` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tamanho_pizzas_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `tamanho_pizzas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tamanho_pizzas`
--

LOCK TABLES `tamanho_pizzas` WRITE;
/*!40000 ALTER TABLE `tamanho_pizzas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tamanho_pizzas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxa_pagamentos`
--

--DROP TABLE IF EXISTS `taxa_pagamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxa_pagamentos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `taxa` decimal(7,3) NOT NULL,
  `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bandeira_cartao` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `taxa_pagamentos_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `taxa_pagamentos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxa_pagamentos`
--

LOCK TABLES `taxa_pagamentos` WRITE;
/*!40000 ALTER TABLE `taxa_pagamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxa_pagamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_mensagem_anexos`
--

--DROP TABLE IF EXISTS `ticket_mensagem_anexos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_mensagem_anexos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ticket_mensagem_id` bigint unsigned NOT NULL,
  `anexo` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_mensagem_anexos_ticket_mensagem_id_foreign` (`ticket_mensagem_id`),
  CONSTRAINT `ticket_mensagem_anexos_ticket_mensagem_id_foreign` FOREIGN KEY (`ticket_mensagem_id`) REFERENCES `ticket_mensagems` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_mensagem_anexos`
--

LOCK TABLES `ticket_mensagem_anexos` WRITE;
/*!40000 ALTER TABLE `ticket_mensagem_anexos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_mensagem_anexos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_mensagems`
--

--DROP TABLE IF EXISTS `ticket_mensagems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_mensagems` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint unsigned NOT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `resposta` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_mensagems_ticket_id_foreign` (`ticket_id`),
  CONSTRAINT `ticket_mensagems_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_mensagems`
--

LOCK TABLES `ticket_mensagems` WRITE;
/*!40000 ALTER TABLE `ticket_mensagems` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_mensagems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

--DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `assunto` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departamento` enum('financeiro','suporte') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('aberto','respondida','resolvido','aguardando') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tickets_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `tickets_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferencia_estoques`
--

--DROP TABLE IF EXISTS `transferencia_estoques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferencia_estoques`
--

LOCK TABLES `transferencia_estoques` WRITE;
/*!40000 ALTER TABLE `transferencia_estoques` DISABLE KEYS */;
/*!40000 ALTER TABLE `transferencia_estoques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportadoras`
--

--DROP TABLE IF EXISTS `transportadoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transportadoras` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `razao_social` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_fantasia` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf_cnpj` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ie` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade_id` bigint unsigned DEFAULT NULL,
  `rua` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complemento` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `antt` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transportadoras_empresa_id_foreign` (`empresa_id`),
  KEY `transportadoras_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `transportadoras_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
  CONSTRAINT `transportadoras_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportadoras`
--

LOCK TABLES `transportadoras` WRITE;
/*!40000 ALTER TABLE `transportadoras` DISABLE KEYS */;
/*!40000 ALTER TABLE `transportadoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trocas`
--

--DROP TABLE IF EXISTS `trocas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trocas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `nfce_id` bigint unsigned NOT NULL,
  `observacao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valor_troca` decimal(12,2) NOT NULL,
  `valor_original` decimal(12,2) NOT NULL,
  `numero_sequencial` int DEFAULT NULL,
  `codigo` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trocas_empresa_id_foreign` (`empresa_id`),
  KEY `trocas_nfce_id_foreign` (`nfce_id`),
  CONSTRAINT `trocas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `trocas_nfce_id_foreign` FOREIGN KEY (`nfce_id`) REFERENCES `nfces` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trocas`
--

LOCK TABLES `trocas` WRITE;
/*!40000 ALTER TABLE `trocas` DISABLE KEYS */;
/*!40000 ALTER TABLE `trocas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidade_cargas`
--

--DROP TABLE IF EXISTS `unidade_cargas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidade_cargas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `info_id` bigint unsigned NOT NULL,
  `id_unidade_carga` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantidade_rateio` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unidade_cargas_info_id_foreign` (`info_id`),
  CONSTRAINT `unidade_cargas_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidade_cargas`
--

LOCK TABLES `unidade_cargas` WRITE;
/*!40000 ALTER TABLE `unidade_cargas` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidade_cargas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

--DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagem` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '1',
  `sidebar_active` tinyint(1) NOT NULL DEFAULT '1',
  `notificacao_cardapio` tinyint(1) NOT NULL DEFAULT '0',
  `notificacao_marketplace` tinyint(1) NOT NULL DEFAULT '0',
  `notificacao_ecommerce` tinyint(1) NOT NULL DEFAULT '0',
  `tipo_contador` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_empresas`
--

--DROP TABLE IF EXISTS `usuario_empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_empresas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned DEFAULT NULL,
  `usuario_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_empresas_empresa_id_foreign` (`empresa_id`),
  KEY `usuario_empresas_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `usuario_empresas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `usuario_empresas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_empresas`
--

LOCK TABLES `usuario_empresas` WRITE;
/*!40000 ALTER TABLE `usuario_empresas` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_localizacaos`
--

--DROP TABLE IF EXISTS `usuario_localizacaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_localizacaos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint unsigned DEFAULT NULL,
  `localizacao_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_localizacaos_usuario_id_foreign` (`usuario_id`),
  KEY `usuario_localizacaos_localizacao_id_foreign` (`localizacao_id`),
  CONSTRAINT `usuario_localizacaos_localizacao_id_foreign` FOREIGN KEY (`localizacao_id`) REFERENCES `localizacaos` (`id`),
  CONSTRAINT `usuario_localizacaos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_localizacaos`
--

LOCK TABLES `usuario_localizacaos` WRITE;
/*!40000 ALTER TABLE `usuario_localizacaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_localizacaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vale_pedagios`
--

--DROP TABLE IF EXISTS `vale_pedagios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vale_pedagios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `mdfe_id` bigint unsigned NOT NULL,
  `cnpj_fornecedor` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnpj_fornecedor_pagador` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_compra` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vale_pedagios_mdfe_id_foreign` (`mdfe_id`),
  CONSTRAINT `vale_pedagios_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vale_pedagios`
--

LOCK TABLES `vale_pedagios` WRITE;
/*!40000 ALTER TABLE `vale_pedagios` DISABLE KEYS */;
/*!40000 ALTER TABLE `vale_pedagios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variacao_mercado_livres`
--

--DROP TABLE IF EXISTS `variacao_mercado_livres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variacao_mercado_livres` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` bigint unsigned DEFAULT NULL,
  `_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantidade` decimal(10,2) NOT NULL,
  `valor` decimal(12,2) NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variacao_mercado_livres_produto_id_foreign` (`produto_id`),
  CONSTRAINT `variacao_mercado_livres_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variacao_mercado_livres`
--

LOCK TABLES `variacao_mercado_livres` WRITE;
/*!40000 ALTER TABLE `variacao_mercado_livres` DISABLE KEYS */;
/*!40000 ALTER TABLE `variacao_mercado_livres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variacao_modelo_items`
--

--DROP TABLE IF EXISTS `variacao_modelo_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variacao_modelo_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `variacao_modelo_id` bigint unsigned NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variacao_modelo_items_variacao_modelo_id_foreign` (`variacao_modelo_id`),
  CONSTRAINT `variacao_modelo_items_variacao_modelo_id_foreign` FOREIGN KEY (`variacao_modelo_id`) REFERENCES `variacao_modelos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variacao_modelo_items`
--

LOCK TABLES `variacao_modelo_items` WRITE;
/*!40000 ALTER TABLE `variacao_modelo_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `variacao_modelo_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variacao_modelos`
--

--DROP TABLE IF EXISTS `variacao_modelos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variacao_modelos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `empresa_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variacao_modelos_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `variacao_modelos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variacao_modelos`
--

LOCK TABLES `variacao_modelos` WRITE;
/*!40000 ALTER TABLE `variacao_modelos` DISABLE KEYS */;
/*!40000 ALTER TABLE `variacao_modelos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculos`
--

--DROP TABLE IF EXISTS `veiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `placa` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cor` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marca` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modelo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rntrc` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taf` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `renavam` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_registro_estadual` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_carroceria` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_rodado` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tara` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacidade` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proprietario_documento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proprietario_nome` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proprietario_ie` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proprietario_uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proprietario_tp` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `veiculos_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `veiculos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculos`
--

LOCK TABLES `veiculos` WRITE;
/*!40000 ALTER TABLE `veiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `veiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda_suspensas`
--

--DROP TABLE IF EXISTS `venda_suspensas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda_suspensas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `cliente_id` bigint unsigned DEFAULT NULL,
  `total` decimal(12,2) NOT NULL,
  `desconto` decimal(12,2) DEFAULT NULL,
  `acrescimo` decimal(12,2) DEFAULT NULL,
  `observacao` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `local_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `funcionario_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `venda_suspensas_empresa_id_foreign` (`empresa_id`),
  KEY `venda_suspensas_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `venda_suspensas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `venda_suspensas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda_suspensas`
--

LOCK TABLES `venda_suspensas` WRITE;
/*!40000 ALTER TABLE `venda_suspensas` DISABLE KEYS */;
/*!40000 ALTER TABLE `venda_suspensas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_suportes`
--

--DROP TABLE IF EXISTS `video_suportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video_suportes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pagina` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_video` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_servidor` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_suportes`
--

LOCK TABLES `video_suportes` WRITE;
/*!40000 ALTER TABLE `video_suportes` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_suportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `woocommerce_configs`
--

--DROP TABLE IF EXISTS `woocommerce_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `woocommerce_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `consumer_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `woocommerce_configs_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `woocommerce_configs_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `woocommerce_configs`
--

LOCK TABLES `woocommerce_configs` WRITE;
/*!40000 ALTER TABLE `woocommerce_configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `woocommerce_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `woocommerce_item_pedidos`
--

--DROP TABLE IF EXISTS `woocommerce_item_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `woocommerce_item_pedidos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pedido_id` bigint unsigned NOT NULL,
  `produto_id` bigint unsigned DEFAULT NULL,
  `item_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantidade` decimal(8,2) NOT NULL,
  `valor_unitario` decimal(12,2) NOT NULL,
  `sub_total` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `woocommerce_item_pedidos_pedido_id_foreign` (`pedido_id`),
  KEY `woocommerce_item_pedidos_produto_id_foreign` (`produto_id`),
  CONSTRAINT `woocommerce_item_pedidos_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `woocommerce_pedidos` (`id`),
  CONSTRAINT `woocommerce_item_pedidos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `woocommerce_item_pedidos`
--

LOCK TABLES `woocommerce_item_pedidos` WRITE;
/*!40000 ALTER TABLE `woocommerce_item_pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `woocommerce_item_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `woocommerce_pedidos`
--

--DROP TABLE IF EXISTS `woocommerce_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `woocommerce_pedidos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` bigint unsigned NOT NULL,
  `cliente_id` bigint unsigned DEFAULT NULL,
  `pedido_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rua` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bairro` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cidade` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cep` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `valor_frete` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `observacao` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `documento` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nfe_id` int DEFAULT NULL,
  `tipo_pagamento` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_pedido` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `venda_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `woocommerce_pedidos_empresa_id_foreign` (`empresa_id`),
  KEY `woocommerce_pedidos_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `woocommerce_pedidos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `woocommerce_pedidos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `woocommerce_pedidos`
--

LOCK TABLES `woocommerce_pedidos` WRITE;
/*!40000 ALTER TABLE `woocommerce_pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `woocommerce_pedidos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;



Novidade! Atalhos do teclado … Os atalhos de teclado do Drive foram atualizados para oferecer navegação por letras iniciais
CREATE TABLE `acesso_logs` (
                               `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                               `usuario_id` bigint unsigned DEFAULT NULL,
                               `ip` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                               `created_at` timestamp NULL DEFAULT NULL,
                               `updated_at` timestamp NULL DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               KEY `acesso_logs_usuario_id_foreign` (`usuario_id`),
                               CONSTRAINT `acesso_logs_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `motivo_interrupcaos` (
                                       `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                       `empresa_id` bigint unsigned NOT NULL,
                                       `motivo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `created_at` timestamp NULL DEFAULT NULL,
                                       `updated_at` timestamp NULL DEFAULT NULL,
                                       PRIMARY KEY (`id`),
                                       KEY `motivo_interrupcaos_empresa_id_foreign` (`empresa_id`),
                                       CONSTRAINT `motivo_interrupcaos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `evento_salarios` (
                                   `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                   `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `tipo` enum('semanal','mensal','anual') COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `metodo` enum('informado','fixo') COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `condicao` enum('soma','diminui') COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `tipo_valor` enum('fixo','percentual') COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `ativo` tinyint(1) NOT NULL DEFAULT '1',
                                   `empresa_id` bigint unsigned NOT NULL,
                                   `created_at` timestamp NULL DEFAULT NULL,
                                   `updated_at` timestamp NULL DEFAULT NULL,
                                   PRIMARY KEY (`id`),
                                   KEY `evento_salarios_empresa_id_foreign` (`empresa_id`),
                                   CONSTRAINT `evento_salarios_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `apuracao_mensals` (
                                    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                    `funcionario_id` bigint unsigned NOT NULL,
                                    `mes` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `ano` int NOT NULL,
                                    `valor_final` decimal(10,2) NOT NULL,
                                    `forma_pagamento` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `observacao` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `conta_pagar_id` int NOT NULL DEFAULT '0',
                                    `created_at` timestamp NULL DEFAULT NULL,
                                    `updated_at` timestamp NULL DEFAULT NULL,
                                    PRIMARY KEY (`id`),
                                    KEY `apuracao_mensals_funcionario_id_foreign` (`funcionario_id`),
                                    CONSTRAINT `apuracao_mensals_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `apuracao_mensal_eventos` (
                                           `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                           `apuracao_id` bigint unsigned DEFAULT NULL,
                                           `evento_id` bigint unsigned DEFAULT NULL,
                                           `valor` decimal(8,2) NOT NULL,
                                           `metodo` enum('informado','fixo') COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `condicao` enum('soma','diminui') COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `created_at` timestamp NULL DEFAULT NULL,
                                           `updated_at` timestamp NULL DEFAULT NULL,
                                           PRIMARY KEY (`id`),
                                           KEY `apuracao_mensal_eventos_apuracao_id_foreign` (`apuracao_id`),
                                           KEY `apuracao_mensal_eventos_evento_id_foreign` (`evento_id`),
                                           CONSTRAINT `apuracao_mensal_eventos_apuracao_id_foreign` FOREIGN KEY (`apuracao_id`) REFERENCES `apuracao_mensals` (`id`),
                                           CONSTRAINT `apuracao_mensal_eventos_evento_id_foreign` FOREIGN KEY (`evento_id`) REFERENCES `evento_salarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `funcionario_eventos` (
                                       `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                       `funcionario_id` bigint unsigned NOT NULL,
                                       `evento_id` bigint unsigned DEFAULT NULL,
                                       `condicao` enum('soma','diminui') COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `metodo` enum('informado','fixo') COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `valor` decimal(10,2) NOT NULL,
                                       `ativo` tinyint(1) NOT NULL DEFAULT '1',
                                       `created_at` timestamp NULL DEFAULT NULL,
                                       `updated_at` timestamp NULL DEFAULT NULL,
                                       PRIMARY KEY (`id`),
                                       KEY `funcionario_eventos_funcionario_id_foreign` (`funcionario_id`),
                                       KEY `funcionario_eventos_evento_id_foreign` (`evento_id`),
                                       CONSTRAINT `funcionario_eventos_evento_id_foreign` FOREIGN KEY (`evento_id`) REFERENCES `evento_salarios` (`id`),
                                       CONSTRAINT `funcionario_eventos_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `bairro_delivery_masters` (
                                           `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                           `nome` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `cidade_id` bigint unsigned DEFAULT NULL,
                                           `created_at` timestamp NULL DEFAULT NULL,
                                           `updated_at` timestamp NULL DEFAULT NULL,
                                           PRIMARY KEY (`id`),
                                           KEY `bairro_delivery_masters_cidade_id_foreign` (`cidade_id`),
                                           CONSTRAINT `bairro_delivery_masters_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `bairro_deliveries` (
                                     `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                     `empresa_id` bigint unsigned DEFAULT NULL,
                                     `nome` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `valor_entrega` decimal(10,2) NOT NULL,
                                     `bairro_delivery_super` int DEFAULT NULL,
                                     `created_at` timestamp NULL DEFAULT NULL,
                                     `updated_at` timestamp NULL DEFAULT NULL,
                                     `status` tinyint(1) DEFAULT '1',
                                     PRIMARY KEY (`id`),
                                     KEY `bairro_deliveries_empresa_id_foreign` (`empresa_id`),
                                     CONSTRAINT `bairro_deliveries_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `contador_empresas` (
                                     `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                     `empresa_id` bigint unsigned DEFAULT NULL,
                                     `contador_id` bigint unsigned DEFAULT NULL,
                                     `created_at` timestamp NULL DEFAULT NULL,
                                     `updated_at` timestamp NULL DEFAULT NULL,
                                     PRIMARY KEY (`id`),
                                     KEY `contador_empresas_empresa_id_foreign` (`empresa_id`),
                                     KEY `contador_empresas_contador_id_foreign` (`contador_id`),
                                     CONSTRAINT `contador_empresas_contador_id_foreign` FOREIGN KEY (`contador_id`) REFERENCES `empresas` (`id`),
                                     CONSTRAINT `contador_empresas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `plano_pendentes` (
                                   `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                   `empresa_id` bigint unsigned NOT NULL,
                                   `contador_id` bigint unsigned NOT NULL,
                                   `valor` decimal(10,2) NOT NULL,
                                   `plano_id` bigint unsigned NOT NULL,
                                   `status` tinyint(1) NOT NULL DEFAULT '0',
                                   `created_at` timestamp NULL DEFAULT NULL,
                                   `updated_at` timestamp NULL DEFAULT NULL,
                                   PRIMARY KEY (`id`),
                                   KEY `plano_pendentes_empresa_id_foreign` (`empresa_id`),
                                   KEY `plano_pendentes_contador_id_foreign` (`contador_id`),
                                   KEY `plano_pendentes_plano_id_foreign` (`plano_id`),
                                   CONSTRAINT `plano_pendentes_contador_id_foreign` FOREIGN KEY (`contador_id`) REFERENCES `empresas` (`id`),
                                   CONSTRAINT `plano_pendentes_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
                                   CONSTRAINT `plano_pendentes_plano_id_foreign` FOREIGN KEY (`plano_id`) REFERENCES `planos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `difals` (
                          `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                          `empresa_id` bigint unsigned NOT NULL,
                          `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
                          `cfop` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
                          `pICMSUFDest` decimal(6,2) NOT NULL,
                          `pICMSInter` decimal(6,2) NOT NULL,
                          `pICMSInterPart` decimal(6,2) NOT NULL,
                          `pFCPUFDest` decimal(6,2) NOT NULL,
                          `created_at` timestamp NULL DEFAULT NULL,
                          `updated_at` timestamp NULL DEFAULT NULL,
                          PRIMARY KEY (`id`),
                          KEY `difals_empresa_id_foreign` (`empresa_id`),
                          CONSTRAINT `difals_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `financeiro_contadors` (
                                        `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                        `contador_id` bigint unsigned DEFAULT NULL,
                                        `percentual_comissao` decimal(5,2) NOT NULL,
                                        `valor_comissao` decimal(10,2) NOT NULL,
                                        `total_venda` decimal(10,2) NOT NULL,
                                        `mes` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `ano` int NOT NULL,
                                        `tipo_pagamento` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                        `observacao` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                        `status_pagamento` tinyint(1) NOT NULL DEFAULT '0',
                                        `created_at` timestamp NULL DEFAULT NULL,
                                        `updated_at` timestamp NULL DEFAULT NULL,
                                        PRIMARY KEY (`id`),
                                        KEY `financeiro_contadors_contador_id_foreign` (`contador_id`),
                                        CONSTRAINT `financeiro_contadors_contador_id_foreign` FOREIGN KEY (`contador_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `market_place_configs` (
                                        `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                        `empresa_id` bigint unsigned DEFAULT NULL,
                                        `cidade_id` bigint unsigned DEFAULT NULL,
                                        `link_facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                        `link_instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                        `link_whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                        `telefone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `rua` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `numero` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `bairro` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `cep` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `tempo_medio_entrega` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                        `valor_entrega` decimal(10,2) DEFAULT NULL,
                                        `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `descricao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                        `latitude` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                        `longitude` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                        `valor_entrega_gratis` int DEFAULT NULL,
                                        `usar_bairros` tinyint(1) NOT NULL,
                                        `status` tinyint(1) NOT NULL DEFAULT '0',
                                        `notificacao_novo_pedido` tinyint(1) NOT NULL DEFAULT '1',
                                        `mercadopago_public_key` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                        `mercadopago_access_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                        `tipo_divisao_pizza` enum('divide','valor_maior') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'divide',
                                        `logo` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `fav_icon` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `tipos_pagamento` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '[]',
                                        `segmento` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '[]',
                                        `pedido_minimo` decimal(10,2) DEFAULT NULL,
                                        `avaliacao_media` decimal(10,2) NOT NULL,
                                        `api_token` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                        `autenticacao_sms` tinyint(1) NOT NULL DEFAULT '0',
                                        `confirmacao_pedido_cliente` tinyint(1) NOT NULL DEFAULT '0',
                                        `created_at` timestamp NULL DEFAULT NULL,
                                        `updated_at` timestamp NULL DEFAULT NULL,
                                        `tipo_entrega` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '',
                                        PRIMARY KEY (`id`),
                                        KEY `market_place_configs_empresa_id_foreign` (`empresa_id`),
                                        KEY `market_place_configs_cidade_id_foreign` (`cidade_id`),
                                        CONSTRAINT `market_place_configs_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
                                        CONSTRAINT `market_place_configs_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `destaque_market_places` (
                                          `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                          `empresa_id` bigint unsigned NOT NULL,
                                          `produto_id` bigint unsigned DEFAULT NULL,
                                          `servico_id` bigint unsigned DEFAULT NULL,
                                          `descricao` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                          `valor` decimal(12,4) DEFAULT NULL,
                                          `status` tinyint(1) NOT NULL DEFAULT '1',
                                          `imagem` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                          `created_at` timestamp NULL DEFAULT NULL,
                                          `updated_at` timestamp NULL DEFAULT NULL,
                                          PRIMARY KEY (`id`),
                                          KEY `destaque_market_places_empresa_id_foreign` (`empresa_id`),
                                          KEY `destaque_market_places_produto_id_foreign` (`produto_id`),
                                          KEY `destaque_market_places_servico_id_foreign` (`servico_id`),
                                          CONSTRAINT `destaque_market_places_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
                                          CONSTRAINT `destaque_market_places_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
                                          CONSTRAINT `destaque_market_places_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `cupom_descontos` (
                                   `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                   `empresa_id` bigint unsigned NOT NULL,
                                   `cliente_id` bigint unsigned DEFAULT NULL,
                                   `tipo_desconto` enum('valor','percentual') COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `codigo` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `descricao` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `valor` decimal(10,4) NOT NULL,
                                   `valor_minimo_pedido` decimal(12,4) NOT NULL,
                                   `status` tinyint(1) NOT NULL DEFAULT '1',
                                   `expiracao` date DEFAULT NULL,
                                   `created_at` timestamp NULL DEFAULT NULL,
                                   `updated_at` timestamp NULL DEFAULT NULL,
                                   PRIMARY KEY (`id`),
                                   KEY `cupom_descontos_empresa_id_foreign` (`empresa_id`),
                                   KEY `cupom_descontos_cliente_id_foreign` (`cliente_id`),
                                   CONSTRAINT `cupom_descontos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
                                   CONSTRAINT `cupom_descontos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `funcionamento_deliveries` (
                                            `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                            `empresa_id` bigint unsigned NOT NULL,
                                            `inicio` time NOT NULL,
                                            `fim` time NOT NULL,
                                            `dia` enum('segunda','terca','quarta','quinta','sexta','sabado','domingo') COLLATE utf8mb4_unicode_ci NOT NULL,
                                            `created_at` timestamp NULL DEFAULT NULL,
                                            `updated_at` timestamp NULL DEFAULT NULL,
                                            PRIMARY KEY (`id`),
                                            KEY `funcionamento_deliveries_empresa_id_foreign` (`empresa_id`),
                                            CONSTRAINT `funcionamento_deliveries_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `motoboys` (
                            `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                            `empresa_id` bigint unsigned NOT NULL,
                            `nome` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
                            `telefone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                            `valor_comissao` decimal(10,2) NOT NULL,
                            `tipo_comissao` enum('valor_fixo','percentual') COLLATE utf8mb4_unicode_ci NOT NULL,
                            `status` tinyint(1) NOT NULL DEFAULT '1',
                            `created_at` timestamp NULL DEFAULT NULL,
                            `updated_at` timestamp NULL DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            KEY `motoboys_empresa_id_foreign` (`empresa_id`),
                            CONSTRAINT `motoboys_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `endereco_deliveries` (
                                       `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                       `cidade_id` bigint unsigned NOT NULL,
                                       `cliente_id` bigint unsigned NOT NULL,
                                       `bairro_id` bigint unsigned NOT NULL,
                                       `rua` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `referencia` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                       `latitude` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                       `longitude` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                       `cep` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `tipo` enum('casa','trabalho') COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `padrao` tinyint(1) NOT NULL,
                                       `created_at` timestamp NULL DEFAULT NULL,
                                       `updated_at` timestamp NULL DEFAULT NULL,
                                       PRIMARY KEY (`id`),
                                       KEY `endereco_deliveries_cidade_id_foreign` (`cidade_id`),
                                       KEY `endereco_deliveries_cliente_id_foreign` (`cliente_id`),
                                       KEY `endereco_deliveries_bairro_id_foreign` (`bairro_id`),
                                       CONSTRAINT `endereco_deliveries_bairro_id_foreign` FOREIGN KEY (`bairro_id`) REFERENCES `bairro_deliveries` (`id`),
                                       CONSTRAINT `endereco_deliveries_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
                                       CONSTRAINT `endereco_deliveries_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `pedido_deliveries` (
                                     `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                     `empresa_id` bigint unsigned NOT NULL,
                                     `cliente_id` bigint unsigned NOT NULL,
                                     `motoboy_id` bigint unsigned DEFAULT NULL,
                                     `comissao_motoboy` decimal(10,2) DEFAULT NULL,
                                     `valor_total` decimal(10,2) NOT NULL,
                                     `troco_para` decimal(10,2) DEFAULT NULL,
                                     `tipo_pagamento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `observacao` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `telefone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `estado` enum('novo','aprovado','cancelado','finalizado') COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `motivo_estado` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `endereco_id` bigint unsigned DEFAULT NULL,
                                     `cupom_id` bigint unsigned DEFAULT NULL,
                                     `desconto` decimal(10,2) DEFAULT NULL,
                                     `valor_entrega` decimal(10,2) NOT NULL,
                                     `app` tinyint(1) NOT NULL,
                                     `qr_code_base64` text COLLATE utf8mb4_unicode_ci,
                                     `qr_code` text COLLATE utf8mb4_unicode_ci,
                                     `transacao_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `status_pagamento` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `pedido_lido` tinyint(1) NOT NULL DEFAULT '0',
                                     `finalizado` tinyint(1) NOT NULL DEFAULT '0',
                                     `horario_cricao` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `horario_leitura` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `horario_entrega` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `nfce_id` int DEFAULT NULL,
                                     `created_at` timestamp NULL DEFAULT NULL,
                                     `updated_at` timestamp NULL DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `item_pedido_deliveries` (
                                          `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                          `produto_id` bigint unsigned NOT NULL,
                                          `pedido_id` bigint unsigned NOT NULL,
                                          `tamanho_id` bigint unsigned DEFAULT NULL,
                                          `status` tinyint(1) NOT NULL,
                                          `estado` enum('novo','pendente','preparando','finalizado') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'novo',
                                          `quantidade` decimal(8,2) NOT NULL,
                                          `valor_unitario` decimal(12,2) NOT NULL,
                                          `sub_total` decimal(12,2) NOT NULL,
                                          `observacao` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                          `created_at` timestamp NULL DEFAULT NULL,
                                          `updated_at` timestamp NULL DEFAULT NULL,
                                          PRIMARY KEY (`id`),
                                          KEY `item_pedido_deliveries_produto_id_foreign` (`produto_id`),
                                          KEY `item_pedido_deliveries_pedido_id_foreign` (`pedido_id`),
                                          KEY `item_pedido_deliveries_tamanho_id_foreign` (`tamanho_id`),
                                          CONSTRAINT `item_pedido_deliveries_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedido_deliveries` (`id`),
                                          CONSTRAINT `item_pedido_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
                                          CONSTRAINT `item_pedido_deliveries_tamanho_id_foreign` FOREIGN KEY (`tamanho_id`) REFERENCES `tamanho_pizzas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `item_adicional_deliveries` (
                                             `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                             `item_pedido_id` bigint unsigned NOT NULL,
                                             `adicional_id` bigint unsigned NOT NULL,
                                             `created_at` timestamp NULL DEFAULT NULL,
                                             `updated_at` timestamp NULL DEFAULT NULL,
                                             PRIMARY KEY (`id`),
                                             KEY `item_adicional_deliveries_item_pedido_id_foreign` (`item_pedido_id`),
                                             KEY `item_adicional_deliveries_adicional_id_foreign` (`adicional_id`),
                                             CONSTRAINT `item_adicional_deliveries_adicional_id_foreign` FOREIGN KEY (`adicional_id`) REFERENCES `adicionals` (`id`),
                                             CONSTRAINT `item_adicional_deliveries_item_pedido_id_foreign` FOREIGN KEY (`item_pedido_id`) REFERENCES `item_pedido_deliveries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `item_pizza_pedido_deliveries` (
                                                `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                                `item_pedido_id` bigint unsigned NOT NULL,
                                                `produto_id` bigint unsigned NOT NULL,
                                                `created_at` timestamp NULL DEFAULT NULL,
                                                `updated_at` timestamp NULL DEFAULT NULL,
                                                PRIMARY KEY (`id`),
                                                KEY `item_pizza_pedido_deliveries_item_pedido_id_foreign` (`item_pedido_id`),
                                                KEY `item_pizza_pedido_deliveries_produto_id_foreign` (`produto_id`),
                                                CONSTRAINT `item_pizza_pedido_deliveries_item_pedido_id_foreign` FOREIGN KEY (`item_pedido_id`) REFERENCES `item_pedido_deliveries` (`id`),
                                                CONSTRAINT `item_pizza_pedido_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `motoboy_comissaos` (
                                     `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                     `empresa_id` bigint unsigned NOT NULL,
                                     `pedido_id` bigint unsigned NOT NULL,
                                     `motoboy_id` bigint unsigned NOT NULL,
                                     `valor` decimal(10,2) NOT NULL,
                                     `valor_total_pedido` decimal(10,2) NOT NULL,
                                     `status` tinyint(1) NOT NULL DEFAULT '0',
                                     `created_at` timestamp NULL DEFAULT NULL,
                                     `updated_at` timestamp NULL DEFAULT NULL,
                                     PRIMARY KEY (`id`),
                                     KEY `motoboy_comissaos_empresa_id_foreign` (`empresa_id`),
                                     KEY `motoboy_comissaos_pedido_id_foreign` (`pedido_id`),
                                     KEY `motoboy_comissaos_motoboy_id_foreign` (`motoboy_id`),
                                     CONSTRAINT `motoboy_comissaos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
                                     CONSTRAINT `motoboy_comissaos_motoboy_id_foreign` FOREIGN KEY (`motoboy_id`) REFERENCES `motoboys` (`id`),
                                     CONSTRAINT `motoboy_comissaos_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedido_deliveries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `cupom_desconto_clientes` (
                                           `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                           `cliente_id` bigint unsigned NOT NULL,
                                           `empresa_id` bigint unsigned NOT NULL,
                                           `cupom_id` bigint unsigned NOT NULL,
                                           `pedido_id` bigint unsigned NOT NULL,
                                           `created_at` timestamp NULL DEFAULT NULL,
                                           `updated_at` timestamp NULL DEFAULT NULL,
                                           PRIMARY KEY (`id`),
                                           KEY `cupom_desconto_clientes_cliente_id_foreign` (`cliente_id`),
                                           KEY `cupom_desconto_clientes_empresa_id_foreign` (`empresa_id`),
                                           KEY `cupom_desconto_clientes_cupom_id_foreign` (`cupom_id`),
                                           KEY `cupom_desconto_clientes_pedido_id_foreign` (`pedido_id`),
                                           CONSTRAINT `cupom_desconto_clientes_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
                                           CONSTRAINT `cupom_desconto_clientes_cupom_id_foreign` FOREIGN KEY (`cupom_id`) REFERENCES `cupom_descontos` (`id`),
                                           CONSTRAINT `cupom_desconto_clientes_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
                                           CONSTRAINT `cupom_desconto_clientes_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedido_deliveries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `cash_back_configs` (
                                     `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                     `empresa_id` bigint unsigned NOT NULL,
                                     `valor_percentual` decimal(5,2) NOT NULL,
                                     `dias_expiracao` int NOT NULL,
                                     `valor_minimo_venda` decimal(10,2) NOT NULL,
                                     `percentual_maximo_venda` decimal(10,2) NOT NULL,
                                     `mensagem_padrao_whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `created_at` timestamp NULL DEFAULT NULL,
                                     `updated_at` timestamp NULL DEFAULT NULL,
                                     PRIMARY KEY (`id`),
                                     KEY `cash_back_configs_empresa_id_foreign` (`empresa_id`),
                                     CONSTRAINT `cash_back_configs_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `cash_back_clientes` (
                                      `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                      `empresa_id` bigint unsigned NOT NULL,
                                      `cliente_id` bigint unsigned NOT NULL,
                                      `tipo` enum('venda','pdv') COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `venda_id` int NOT NULL,
                                      `valor_venda` decimal(16,7) NOT NULL,
                                      `valor_credito` decimal(16,7) NOT NULL,
                                      `valor_percentual` decimal(5,2) NOT NULL,
                                      `data_expiracao` date NOT NULL,
                                      `status` tinyint(1) NOT NULL DEFAULT '1',
                                      `created_at` timestamp NULL DEFAULT NULL,
                                      `updated_at` timestamp NULL DEFAULT NULL,
                                      PRIMARY KEY (`id`),
                                      KEY `cash_back_clientes_empresa_id_foreign` (`empresa_id`),
                                      KEY `cash_back_clientes_cliente_id_foreign` (`cliente_id`),
                                      CONSTRAINT `cash_back_clientes_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
                                      CONSTRAINT `cash_back_clientes_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `variacao_modelos` (
                                    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                    `descricao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `status` tinyint(1) NOT NULL DEFAULT '1',
                                    `empresa_id` bigint unsigned NOT NULL,
                                    `created_at` timestamp NULL DEFAULT NULL,
                                    `updated_at` timestamp NULL DEFAULT NULL,
                                    PRIMARY KEY (`id`),
                                    KEY `variacao_modelos_empresa_id_foreign` (`empresa_id`),
                                    CONSTRAINT `variacao_modelos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `variacao_modelo_items` (
                                         `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                         `variacao_modelo_id` bigint unsigned NOT NULL,
                                         `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `created_at` timestamp NULL DEFAULT NULL,
                                         `updated_at` timestamp NULL DEFAULT NULL,
                                         PRIMARY KEY (`id`),
                                         KEY `variacao_modelo_items_variacao_modelo_id_foreign` (`variacao_modelo_id`),
                                         CONSTRAINT `variacao_modelo_items_variacao_modelo_id_foreign` FOREIGN KEY (`variacao_modelo_id`) REFERENCES `variacao_modelos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `produto_variacaos` (
                                     `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                     `produto_id` bigint unsigned DEFAULT NULL,
                                     `descricao` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `valor` decimal(12,4) NOT NULL,
                                     `codigo_barras` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `referencia` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `imagem` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `created_at` timestamp NULL DEFAULT NULL,
                                     `updated_at` timestamp NULL DEFAULT NULL,
                                     PRIMARY KEY (`id`),
                                     KEY `produto_variacaos_produto_id_foreign` (`produto_id`),
                                     CONSTRAINT `produto_variacaos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `ecommerce_configs` (
                                     `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                     `empresa_id` bigint unsigned DEFAULT NULL,
                                     `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `loja_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `logo` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `descricao_breve` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `rua` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `bairro` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `cep` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `cidade_id` bigint unsigned NOT NULL,
                                     `telefone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `link_facebook` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `link_whatsapp` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `link_instagram` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `frete_gratis_valor` decimal(10,2) DEFAULT NULL,
                                     `mercadopago_public_key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `mercadopago_access_token` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `habilitar_retirada` tinyint(1) NOT NULL DEFAULT '0',
                                     `notificacao_novo_pedido` tinyint(1) NOT NULL DEFAULT '1',
                                     `desconto_padrao_boleto` decimal(4,2) DEFAULT NULL,
                                     `desconto_padrao_pix` decimal(4,2) DEFAULT NULL,
                                     `desconto_padrao_cartao` decimal(4,2) DEFAULT NULL,
                                     `tipos_pagamento` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '[]',
                                     `status` tinyint(1) NOT NULL DEFAULT '1',
                                     `politica_privacidade` text COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `termos_condicoes` text COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `created_at` timestamp NULL DEFAULT NULL,
                                     `updated_at` timestamp NULL DEFAULT NULL,
                                     PRIMARY KEY (`id`),
                                     KEY `ecommerce_configs_empresa_id_foreign` (`empresa_id`),
                                     KEY `ecommerce_configs_cidade_id_foreign` (`cidade_id`),
                                     CONSTRAINT `ecommerce_configs_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
                                     CONSTRAINT `ecommerce_configs_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `galeria_produtos` (
                                    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                    `produto_id` bigint unsigned NOT NULL,
                                    `imagem` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                    `created_at` timestamp NULL DEFAULT NULL,
                                    `updated_at` timestamp NULL DEFAULT NULL,
                                    PRIMARY KEY (`id`),
                                    KEY `galeria_produtos_produto_id_foreign` (`produto_id`),
                                    CONSTRAINT `galeria_produtos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `endereco_ecommerces` (
                                       `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                       `cidade_id` bigint unsigned NOT NULL,
                                       `cliente_id` bigint unsigned NOT NULL,
                                       `rua` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `bairro` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `referencia` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                       `cep` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `padrao` tinyint(1) NOT NULL,
                                       `created_at` timestamp NULL DEFAULT NULL,
                                       `updated_at` timestamp NULL DEFAULT NULL,
                                       PRIMARY KEY (`id`),
                                       KEY `endereco_ecommerces_cidade_id_foreign` (`cidade_id`),
                                       KEY `endereco_ecommerces_cliente_id_foreign` (`cliente_id`),
                                       CONSTRAINT `endereco_ecommerces_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
                                       CONSTRAINT `endereco_ecommerces_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `carrinhos` (
                             `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                             `cliente_id` bigint unsigned DEFAULT NULL,
                             `empresa_id` bigint unsigned NOT NULL,
                             `endereco_id` bigint unsigned DEFAULT NULL,
                             `estado` enum('pendente','finalizado') COLLATE utf8mb4_unicode_ci NOT NULL,
                             `valor_total` decimal(10,2) NOT NULL,
                             `tipo_frete` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `valor_frete` decimal(10,2) NOT NULL,
                             `cep` decimal(9,2) NOT NULL,
                             `session_cart` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
                             `created_at` timestamp NULL DEFAULT NULL,
                             `updated_at` timestamp NULL DEFAULT NULL,
                             PRIMARY KEY (`id`),
                             KEY `carrinhos_cliente_id_foreign` (`cliente_id`),
                             KEY `carrinhos_empresa_id_foreign` (`empresa_id`),
                             KEY `carrinhos_endereco_id_foreign` (`endereco_id`),
                             CONSTRAINT `carrinhos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
                             CONSTRAINT `carrinhos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
                             CONSTRAINT `carrinhos_endereco_id_foreign` FOREIGN KEY (`endereco_id`) REFERENCES `endereco_ecommerces` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `item_carrinhos` (
                                  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                  `carrinho_id` bigint unsigned NOT NULL,
                                  `produto_id` bigint unsigned NOT NULL,
                                  `variacao_id` bigint unsigned DEFAULT NULL,
                                  `quantidade` decimal(8,3) NOT NULL,
                                  `valor_unitario` decimal(10,2) NOT NULL,
                                  `sub_total` decimal(10,3) NOT NULL,
                                  `created_at` timestamp NULL DEFAULT NULL,
                                  `updated_at` timestamp NULL DEFAULT NULL,
                                  PRIMARY KEY (`id`),
                                  KEY `item_carrinhos_carrinho_id_foreign` (`carrinho_id`),
                                  KEY `item_carrinhos_produto_id_foreign` (`produto_id`),
                                  KEY `item_carrinhos_variacao_id_foreign` (`variacao_id`),
                                  CONSTRAINT `item_carrinhos_carrinho_id_foreign` FOREIGN KEY (`carrinho_id`) REFERENCES `carrinhos` (`id`),
                                  CONSTRAINT `item_carrinhos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
                                  CONSTRAINT `item_carrinhos_variacao_id_foreign` FOREIGN KEY (`variacao_id`) REFERENCES `produto_variacaos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `pedido_ecommerces` (
                                     `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                     `cliente_id` bigint unsigned NOT NULL,
                                     `empresa_id` bigint unsigned NOT NULL,
                                     `endereco_id` bigint unsigned DEFAULT NULL,
                                     `estado` enum('novo','preparando','em_trasporte','finalizado','recusado') COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `tipo_pagamento` enum('cartao','pix','boleto') COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `valor_total` decimal(10,2) NOT NULL,
                                     `valor_frete` decimal(10,2) NOT NULL,
                                     `desconto` decimal(10,2) NOT NULL,
                                     `tipo_frete` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `rua_entrega` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `numero_entrega` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `referencia_entrega` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `bairro_entrega` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `cep_entrega` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `cidade_entrega` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `link_boleto` text COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `qr_code_base64` text COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `qr_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `observacao` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `hash_pedido` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `status_pagamento` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
                                     `transacao_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
                                     `nfe_id` int DEFAULT NULL,
                                     `cupom_desconto` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `data_entrega` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `codigo_rastreamento` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `pedido_lido` tinyint(1) NOT NULL DEFAULT '0',
                                     `nome` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `sobre_nome` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `tipo_documento` enum('cpf','cnpj') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `numero_documento` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `created_at` timestamp NULL DEFAULT NULL,
                                     `updated_at` timestamp NULL DEFAULT NULL,
                                     PRIMARY KEY (`id`),
                                     KEY `pedido_ecommerces_cliente_id_foreign` (`cliente_id`),
                                     KEY `pedido_ecommerces_empresa_id_foreign` (`empresa_id`),
                                     KEY `pedido_ecommerces_endereco_id_foreign` (`endereco_id`),
                                     CONSTRAINT `pedido_ecommerces_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
                                     CONSTRAINT `pedido_ecommerces_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
                                     CONSTRAINT `pedido_ecommerces_endereco_id_foreign` FOREIGN KEY (`endereco_id`) REFERENCES `endereco_ecommerces` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `item_pedido_ecommerces` (
                                          `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                          `pedido_id` bigint unsigned NOT NULL,
                                          `produto_id` bigint unsigned NOT NULL,
                                          `variacao_id` bigint unsigned DEFAULT NULL,
                                          `quantidade` decimal(8,3) NOT NULL,
                                          `valor_unitario` decimal(10,2) NOT NULL,
                                          `sub_total` decimal(10,2) NOT NULL,
                                          `created_at` timestamp NULL DEFAULT NULL,
                                          `updated_at` timestamp NULL DEFAULT NULL,
                                          PRIMARY KEY (`id`),
                                          KEY `item_pedido_ecommerces_pedido_id_foreign` (`pedido_id`),
                                          KEY `item_pedido_ecommerces_produto_id_foreign` (`produto_id`),
                                          KEY `item_pedido_ecommerces_variacao_id_foreign` (`variacao_id`),
                                          CONSTRAINT `item_pedido_ecommerces_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedido_ecommerces` (`id`),
                                          CONSTRAINT `item_pedido_ecommerces_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
                                          CONSTRAINT `item_pedido_ecommerces_variacao_id_foreign` FOREIGN KEY (`variacao_id`) REFERENCES `produto_variacaos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `cotacaos` (
                            `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                            `empresa_id` bigint unsigned NOT NULL,
                            `fornecedor_id` bigint unsigned NOT NULL,
                            `responsavel` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `hash_link` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
                            `referencia` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
                            `observacao_resposta` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `observacao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `status` tinyint(1) NOT NULL DEFAULT '1',
                            `valor_total` decimal(10,2) DEFAULT NULL,
                            `desconto` decimal(10,2) DEFAULT NULL,
                            `estado` enum('nova','respondida','aprovada','rejeitada') COLLATE utf8mb4_unicode_ci NOT NULL,
                            `escolhida` tinyint(1) NOT NULL DEFAULT '0',
                            `data_resposta` timestamp NULL DEFAULT NULL,
                            `nfe_id` int DEFAULT NULL,
                            `valor_frete` decimal(10,2) DEFAULT NULL,
                            `observacao_frete` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `previsao_entrega` date DEFAULT NULL,
                            `created_at` timestamp NULL DEFAULT NULL,
                            `updated_at` timestamp NULL DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            KEY `cotacaos_empresa_id_foreign` (`empresa_id`),
                            KEY `cotacaos_fornecedor_id_foreign` (`fornecedor_id`),
                            CONSTRAINT `cotacaos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
                            CONSTRAINT `cotacaos_fornecedor_id_foreign` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `item_cotacaos` (
                                 `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                 `cotacao_id` bigint unsigned DEFAULT NULL,
                                 `produto_id` bigint unsigned DEFAULT NULL,
                                 `valor_unitario` decimal(12,3) DEFAULT NULL,
                                 `quantidade` decimal(12,3) NOT NULL,
                                 `sub_total` decimal(12,3) DEFAULT NULL,
                                 `observacao` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL,
                                 PRIMARY KEY (`id`),
                                 KEY `item_cotacaos_cotacao_id_foreign` (`cotacao_id`),
                                 KEY `item_cotacaos_produto_id_foreign` (`produto_id`),
                                 CONSTRAINT `item_cotacaos_cotacao_id_foreign` FOREIGN KEY (`cotacao_id`) REFERENCES `cotacaos` (`id`),
                                 CONSTRAINT `item_cotacaos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `fatura_cotacaos` (
                                   `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                   `cotacao_id` bigint unsigned DEFAULT NULL,
                                   `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `data_vencimento` date NOT NULL,
                                   `valor` decimal(10,2) NOT NULL,
                                   `created_at` timestamp NULL DEFAULT NULL,
                                   `updated_at` timestamp NULL DEFAULT NULL,
                                   PRIMARY KEY (`id`),
                                   KEY `fatura_cotacaos_cotacao_id_foreign` (`cotacao_id`),
                                   CONSTRAINT `fatura_cotacaos_cotacao_id_foreign` FOREIGN KEY (`cotacao_id`) REFERENCES `cotacaos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `nota_servicos` (
                                 `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                 `empresa_id` bigint unsigned DEFAULT NULL,
                                 `cliente_id` bigint unsigned DEFAULT NULL,
                                 `cidade_id` bigint unsigned DEFAULT NULL,
                                 `valor_total` decimal(16,7) NOT NULL,
                                 `estado` enum('novo','rejeitado','aprovado','cancelado','processando') COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `serie` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `codigo_verificacao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `numero_nfse` int NOT NULL,
                                 `url_xml` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `url_pdf_nfse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `url_pdf_rps` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `documento` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `razao_social` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `im` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `ie` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `cep` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `rua` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `numero` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `bairro` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `complemento` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `email` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `telefone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `natureza_operacao` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `uuid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `chave` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL,
                                 `ambiente` int DEFAULT NULL,
                                 PRIMARY KEY (`id`),
                                 KEY `nota_servicos_empresa_id_foreign` (`empresa_id`),
                                 KEY `nota_servicos_cliente_id_foreign` (`cliente_id`),
                                 KEY `nota_servicos_cidade_id_foreign` (`cidade_id`),
                                 CONSTRAINT `nota_servicos_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
                                 CONSTRAINT `nota_servicos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
                                 CONSTRAINT `nota_servicos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `item_nota_servicos` (
                                      `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                      `nota_servico_id` bigint unsigned DEFAULT NULL,
                                      `servico_id` bigint unsigned DEFAULT NULL,
                                      `discriminacao` text COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `valor_servico` decimal(16,7) NOT NULL,
                                      `codigo_cnae` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `codigo_servico` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `codigo_tributacao_municipio` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `exigibilidade_iss` int NOT NULL,
                                      `iss_retido` int NOT NULL,
                                      `data_competencia` date DEFAULT NULL,
                                      `estado_local_prestacao_servico` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `cidade_local_prestacao_servico` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `valor_deducoes` decimal(16,7) DEFAULT NULL,
                                      `desconto_incondicional` decimal(16,7) DEFAULT NULL,
                                      `desconto_condicional` decimal(16,7) DEFAULT NULL,
                                      `outras_retencoes` decimal(16,7) DEFAULT NULL,
                                      `aliquota_iss` decimal(7,2) DEFAULT NULL,
                                      `aliquota_pis` decimal(7,2) DEFAULT NULL,
                                      `aliquota_cofins` decimal(7,2) DEFAULT NULL,
                                      `aliquota_inss` decimal(7,2) DEFAULT NULL,
                                      `aliquota_ir` decimal(7,2) DEFAULT NULL,
                                      `aliquota_csll` decimal(7,2) DEFAULT NULL,
                                      `intermediador` enum('n','f','j') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `documento_intermediador` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `nome_intermediador` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `im_intermediador` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `responsavel_retencao_iss` int NOT NULL DEFAULT '1',
                                      `created_at` timestamp NULL DEFAULT NULL,
                                      `updated_at` timestamp NULL DEFAULT NULL,
                                      PRIMARY KEY (`id`),
                                      KEY `item_nota_servicos_nota_servico_id_foreign` (`nota_servico_id`),
                                      KEY `item_nota_servicos_servico_id_foreign` (`servico_id`),
                                      CONSTRAINT `item_nota_servicos_nota_servico_id_foreign` FOREIGN KEY (`nota_servico_id`) REFERENCES `nota_servicos` (`id`),
                                      CONSTRAINT `item_nota_servicos_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `lista_precos` (
                                `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                `empresa_id` bigint unsigned NOT NULL,
                                `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                                `ajuste_sobre` enum('valor_compra','valor_venda') COLLATE utf8mb4_unicode_ci NOT NULL,
                                `tipo` enum('incremento','reducao') COLLATE utf8mb4_unicode_ci NOT NULL,
                                `percentual_alteracao` decimal(5,2) NOT NULL,
                                `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `funcionario_id` bigint unsigned DEFAULT NULL,
                                `created_at` timestamp NULL DEFAULT NULL,
                                `updated_at` timestamp NULL DEFAULT NULL,
                                PRIMARY KEY (`id`),
                                KEY `lista_precos_empresa_id_foreign` (`empresa_id`),
                                KEY `lista_precos_funcionario_id_foreign` (`funcionario_id`),
                                CONSTRAINT `lista_precos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
                                CONSTRAINT `lista_precos_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `item_lista_precos` (
                                     `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                     `lista_id` bigint unsigned DEFAULT NULL,
                                     `produto_id` bigint unsigned DEFAULT NULL,
                                     `valor` decimal(10,2) NOT NULL,
                                     `percentual_lucro` decimal(10,2) NOT NULL,
                                     `created_at` timestamp NULL DEFAULT NULL,
                                     `updated_at` timestamp NULL DEFAULT NULL,
                                     PRIMARY KEY (`id`),
                                     KEY `item_lista_precos_lista_id_foreign` (`lista_id`),
                                     KEY `item_lista_precos_produto_id_foreign` (`produto_id`),
                                     CONSTRAINT `item_lista_precos_lista_id_foreign` FOREIGN KEY (`lista_id`) REFERENCES `lista_precos` (`id`),
                                     CONSTRAINT `item_lista_precos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `ncms` (
                        `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                        `codigo` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
                        `descricao` text COLLATE utf8mb4_unicode_ci NOT NULL,
                        `created_at` timestamp NULL DEFAULT NULL,
                        `updated_at` timestamp NULL DEFAULT NULL,
                        PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tickets` (
                           `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                           `empresa_id` bigint unsigned DEFAULT NULL,
                           `assunto` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
                           `departamento` enum('financeiro','suporte') COLLATE utf8mb4_unicode_ci NOT NULL,
                           `status` enum('aberto','respondida','resolvido','aguardando') COLLATE utf8mb4_unicode_ci NOT NULL,
                           `created_at` timestamp NULL DEFAULT NULL,
                           `updated_at` timestamp NULL DEFAULT NULL,
                           PRIMARY KEY (`id`),
                           KEY `tickets_empresa_id_foreign` (`empresa_id`),
                           CONSTRAINT `tickets_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `ticket_mensagems` (
                                    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                    `ticket_id` bigint unsigned NOT NULL,
                                    `descricao` text COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `resposta` tinyint(1) NOT NULL,
                                    `created_at` timestamp NULL DEFAULT NULL,
                                    `updated_at` timestamp NULL DEFAULT NULL,
                                    PRIMARY KEY (`id`),
                                    KEY `ticket_mensagems_ticket_id_foreign` (`ticket_id`),
                                    CONSTRAINT `ticket_mensagems_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `ticket_mensagem_anexos` (
                                          `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                          `ticket_mensagem_id` bigint unsigned NOT NULL,
                                          `anexo` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                          `created_at` timestamp NULL DEFAULT NULL,
                                          `updated_at` timestamp NULL DEFAULT NULL,
                                          PRIMARY KEY (`id`),
                                          KEY `ticket_mensagem_anexos_ticket_mensagem_id_foreign` (`ticket_mensagem_id`),
                                          CONSTRAINT `ticket_mensagem_anexos_ticket_mensagem_id_foreign` FOREIGN KEY (`ticket_mensagem_id`) REFERENCES `ticket_mensagems` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `notificacaos` (
                                `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                `empresa_id` bigint unsigned DEFAULT NULL,
                                `tabela` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `descricao` text COLLATE utf8mb4_unicode_ci NOT NULL,
                                `descricao_curta` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
                                `titulo` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
                                `referencia` int DEFAULT NULL,
                                `status` tinyint(1) NOT NULL DEFAULT '1',
                                `visualizada` tinyint(1) NOT NULL DEFAULT '0',
                                `por_sistema` tinyint(1) NOT NULL DEFAULT '0',
                                `prioridade` enum('baixa','media','alta') COLLATE utf8mb4_unicode_ci NOT NULL,
                                `super` tinyint(1) NOT NULL DEFAULT '0',
                                `created_at` timestamp NULL DEFAULT NULL,
                                `updated_at` timestamp NULL DEFAULT NULL,
                                PRIMARY KEY (`id`),
                                KEY `notificacaos_empresa_id_foreign` (`empresa_id`),
                                CONSTRAINT `notificacaos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `carrinho_deliveries` (
                                       `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                       `cliente_id` bigint unsigned DEFAULT NULL,
                                       `empresa_id` bigint unsigned NOT NULL,
                                       `endereco_id` bigint unsigned DEFAULT NULL,
                                       `estado` enum('pendente','finalizado') COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `valor_total` decimal(10,2) NOT NULL,
                                       `valor_desconto` decimal(10,2) NOT NULL,
                                       `cupom` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `fone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `valor_frete` decimal(10,2) NOT NULL,
                                       `session_cart_delivery` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `created_at` timestamp NULL DEFAULT NULL,
                                       `updated_at` timestamp NULL DEFAULT NULL,
                                       PRIMARY KEY (`id`),
                                       KEY `carrinho_deliveries_cliente_id_foreign` (`cliente_id`),
                                       KEY `carrinho_deliveries_empresa_id_foreign` (`empresa_id`),
                                       KEY `carrinho_deliveries_endereco_id_foreign` (`endereco_id`),
                                       CONSTRAINT `carrinho_deliveries_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
                                       CONSTRAINT `carrinho_deliveries_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
                                       CONSTRAINT `carrinho_deliveries_endereco_id_foreign` FOREIGN KEY (`endereco_id`) REFERENCES `endereco_deliveries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `item_carrinho_deliveries` (
                                            `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                            `carrinho_id` bigint unsigned NOT NULL,
                                            `produto_id` bigint unsigned NOT NULL,
                                            `tamanho_id` bigint unsigned DEFAULT NULL,
                                            `quantidade` decimal(8,3) NOT NULL,
                                            `valor_unitario` decimal(10,2) NOT NULL,
                                            `sub_total` decimal(10,3) NOT NULL,
                                            `created_at` timestamp NULL DEFAULT NULL,
                                            `updated_at` timestamp NULL DEFAULT NULL,
                                            PRIMARY KEY (`id`),
                                            KEY `item_carrinho_deliveries_carrinho_id_foreign` (`carrinho_id`),
                                            KEY `item_carrinho_deliveries_produto_id_foreign` (`produto_id`),
                                            KEY `item_carrinho_deliveries_tamanho_id_foreign` (`tamanho_id`),
                                            CONSTRAINT `item_carrinho_deliveries_carrinho_id_foreign` FOREIGN KEY (`carrinho_id`) REFERENCES `carrinho_deliveries` (`id`),
                                            CONSTRAINT `item_carrinho_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
                                            CONSTRAINT `item_carrinho_deliveries_tamanho_id_foreign` FOREIGN KEY (`tamanho_id`) REFERENCES `tamanho_pizzas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `ibpts` (
                         `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                         `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `versao` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `created_at` timestamp NULL DEFAULT NULL,
                         `updated_at` timestamp NULL DEFAULT NULL,
                         PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `item_ibpts` (
                              `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                              `ibpt_id` bigint unsigned DEFAULT NULL,
                              `codigo` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `descricao` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `nacional_federal` decimal(5,2) NOT NULL,
                              `importado_federal` decimal(5,2) NOT NULL,
                              `estadual` decimal(5,2) NOT NULL,
                              `municipal` decimal(5,2) NOT NULL,
                              `created_at` timestamp NULL DEFAULT NULL,
                              `updated_at` timestamp NULL DEFAULT NULL,
                              PRIMARY KEY (`id`),
                              KEY `item_ibpts_ibpt_id_foreign` (`ibpt_id`),
                              CONSTRAINT `item_ibpts_ibpt_id_foreign` FOREIGN KEY (`ibpt_id`) REFERENCES `ibpts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60636 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `item_carrinho_adicional_deliveries` (
                                                      `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                                      `item_carrinho_id` bigint unsigned NOT NULL,
                                                      `adicional_id` bigint unsigned NOT NULL,
                                                      `created_at` timestamp NULL DEFAULT NULL,
                                                      `updated_at` timestamp NULL DEFAULT NULL,
                                                      PRIMARY KEY (`id`),
                                                      KEY `item_carrinho_adicional_deliveries_item_carrinho_id_foreign` (`item_carrinho_id`),
                                                      KEY `item_carrinho_adicional_deliveries_adicional_id_foreign` (`adicional_id`),
                                                      CONSTRAINT `item_carrinho_adicional_deliveries_adicional_id_foreign` FOREIGN KEY (`adicional_id`) REFERENCES `adicionals` (`id`),
                                                      CONSTRAINT `item_carrinho_adicional_deliveries_item_carrinho_id_foreign` FOREIGN KEY (`item_carrinho_id`) REFERENCES `item_carrinho_deliveries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `item_pizza_carrinhos` (
                                        `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                        `item_carrinho_id` bigint unsigned NOT NULL,
                                        `produto_id` bigint unsigned NOT NULL,
                                        `created_at` timestamp NULL DEFAULT NULL,
                                        `updated_at` timestamp NULL DEFAULT NULL,
                                        PRIMARY KEY (`id`),
                                        KEY `item_pizza_carrinhos_item_carrinho_id_foreign` (`item_carrinho_id`),
                                        KEY `item_pizza_carrinhos_produto_id_foreign` (`produto_id`),
                                        CONSTRAINT `item_pizza_carrinhos_item_carrinho_id_foreign` FOREIGN KEY (`item_carrinho_id`) REFERENCES `item_carrinho_deliveries` (`id`),
                                        CONSTRAINT `item_pizza_carrinhos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `nota_servico_configs` (
                                        `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                        `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `razao_social` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `documento` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `regime` enum('simples','normal') COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `ie` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                        `im` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                        `cnae` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                        `login_prefeitura` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                        `senha_prefeitura` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                        `telefone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `rua` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `bairro` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `complemento` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                        `cep` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                        `logo` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                        `empresa_id` bigint unsigned DEFAULT NULL,
                                        `cidade_id` bigint unsigned DEFAULT NULL,
                                        `created_at` timestamp NULL DEFAULT NULL,
                                        `updated_at` timestamp NULL DEFAULT NULL,
                                        PRIMARY KEY (`id`),
                                        KEY `nota_servico_configs_empresa_id_foreign` (`empresa_id`),
                                        KEY `nota_servico_configs_cidade_id_foreign` (`cidade_id`),
                                        CONSTRAINT `nota_servico_configs_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
                                        CONSTRAINT `nota_servico_configs_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `segmentos` (
                             `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                             `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                             `status` tinyint(1) NOT NULL,
                             `created_at` timestamp NULL DEFAULT NULL,
                             `updated_at` timestamp NULL DEFAULT NULL,
                             PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `segmento_empresas` (
                                     `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                     `empresa_id` bigint unsigned DEFAULT NULL,
                                     `segmento_id` bigint unsigned DEFAULT NULL,
                                     `created_at` timestamp NULL DEFAULT NULL,
                                     `updated_at` timestamp NULL DEFAULT NULL,
                                     PRIMARY KEY (`id`),
                                     KEY `segmento_empresas_empresa_id_foreign` (`empresa_id`),
                                     KEY `segmento_empresas_segmento_id_foreign` (`segmento_id`),
                                     CONSTRAINT `segmento_empresas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
                                     CONSTRAINT `segmento_empresas_segmento_id_foreign` FOREIGN KEY (`segmento_id`) REFERENCES `segmentos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `mercado_livre_configs` (
                                         `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                         `empresa_id` bigint unsigned NOT NULL,
                                         `client_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `client_secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `access_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `user_id` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `url` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `created_at` timestamp NULL DEFAULT NULL,
                                         `updated_at` timestamp NULL DEFAULT NULL,
                                         PRIMARY KEY (`id`),
                                         KEY `mercado_livre_configs_empresa_id_foreign` (`empresa_id`),
                                         CONSTRAINT `mercado_livre_configs_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `categoria_mercado_livres` (
                                            `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                            `_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                                            `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
                                            `created_at` timestamp NULL DEFAULT NULL,
                                            `updated_at` timestamp NULL DEFAULT NULL,
                                            PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `mercado_livre_perguntas` (
                                           `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                           `empresa_id` bigint unsigned NOT NULL,
                                           `_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `item_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `texto` text COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `data` timestamp NOT NULL,
                                           `created_at` timestamp NULL DEFAULT NULL,
                                           `updated_at` timestamp NULL DEFAULT NULL,
                                           PRIMARY KEY (`id`),
                                           KEY `mercado_livre_perguntas_empresa_id_foreign` (`empresa_id`),
                                           CONSTRAINT `mercado_livre_perguntas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `pedido_mercado_livres` (
                                         `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                         `empresa_id` bigint unsigned NOT NULL,
                                         `cliente_id` bigint unsigned DEFAULT NULL,
                                         `_id` bigint NOT NULL,
                                         `tipo_pagamento` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `total` decimal(10,2) NOT NULL,
                                         `valor_entrega` decimal(10,2) NOT NULL,
                                         `nickname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `seller_id` bigint NOT NULL,
                                         `entrega_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `data_pedido` timestamp NOT NULL,
                                         `comentario` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `nfe_id` int DEFAULT NULL,
                                         `rua_entrega` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `numero_entrega` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `cep_entrega` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `bairro_entrega` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `cidade_entrega` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `comentario_entrega` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `codigo_rastreamento` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `cliente_nome` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `cliente_documento` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `created_at` timestamp NULL DEFAULT NULL,
                                         `updated_at` timestamp NULL DEFAULT NULL,
                                         PRIMARY KEY (`id`),
                                         KEY `pedido_mercado_livres_empresa_id_foreign` (`empresa_id`),
                                         KEY `pedido_mercado_livres_cliente_id_foreign` (`cliente_id`),
                                         CONSTRAINT `pedido_mercado_livres_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
                                         CONSTRAINT `pedido_mercado_livres_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `item_pedido_mercado_livres` (
                                              `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                              `pedido_id` bigint unsigned NOT NULL,
                                              `produto_id` bigint unsigned DEFAULT NULL,
                                              `item_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                                              `item_nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
                                              `condicao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                                              `variacao_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                              `quantidade` decimal(8,2) NOT NULL,
                                              `valor_unitario` decimal(12,2) NOT NULL,
                                              `sub_total` decimal(12,2) NOT NULL,
                                              `taxa_venda` decimal(12,2) NOT NULL,
                                              `created_at` timestamp NULL DEFAULT NULL,
                                              `updated_at` timestamp NULL DEFAULT NULL,
                                              PRIMARY KEY (`id`),
                                              KEY `item_pedido_mercado_livres_pedido_id_foreign` (`pedido_id`),
                                              KEY `item_pedido_mercado_livres_produto_id_foreign` (`produto_id`),
                                              CONSTRAINT `item_pedido_mercado_livres_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedido_mercado_livres` (`id`),
                                              CONSTRAINT `item_pedido_mercado_livres_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `variacao_mercado_livres` (
                                           `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                           `produto_id` bigint unsigned DEFAULT NULL,
                                           `_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `quantidade` decimal(10,2) NOT NULL,
                                           `valor` decimal(12,2) NOT NULL,
                                           `created_at` timestamp NULL DEFAULT NULL,
                                           `updated_at` timestamp NULL DEFAULT NULL,
                                           PRIMARY KEY (`id`),
                                           KEY `variacao_mercado_livres_produto_id_foreign` (`produto_id`),
                                           CONSTRAINT `variacao_mercado_livres_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `plano_contas` (
                                `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                `empresa_id` bigint unsigned DEFAULT NULL,
                                `plano_conta_id` bigint unsigned DEFAULT NULL,
                                `descricao` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
                                `created_at` timestamp NULL DEFAULT NULL,
                                `updated_at` timestamp NULL DEFAULT NULL,
                                PRIMARY KEY (`id`),
                                KEY `plano_contas_empresa_id_foreign` (`empresa_id`),
                                KEY `plano_contas_plano_conta_id_foreign` (`plano_conta_id`),
                                CONSTRAINT `plano_contas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
                                CONSTRAINT `plano_contas_plano_conta_id_foreign` FOREIGN KEY (`plano_conta_id`) REFERENCES `plano_contas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `conta_empresas` (
                                  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                  `empresa_id` bigint unsigned DEFAULT NULL,
                                  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `banco` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                  `agencia` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                  `conta` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                  `plano_conta_id` int DEFAULT NULL,
                                  `saldo` decimal(16,2) DEFAULT NULL,
                                  `saldo_inicial` decimal(16,2) DEFAULT NULL,
                                  `status` tinyint(1) NOT NULL DEFAULT '0',
                                  `created_at` timestamp NULL DEFAULT NULL,
                                  `updated_at` timestamp NULL DEFAULT NULL,
                                  PRIMARY KEY (`id`),
                                  KEY `conta_empresas_empresa_id_foreign` (`empresa_id`),
                                  CONSTRAINT `conta_empresas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;

CREATE TABLE `item_conta_empresas` (
                                       `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                       `conta_id` bigint unsigned DEFAULT NULL,
                                       `descricao` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                       `caixa_id` int DEFAULT NULL,
                                       `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `valor` decimal(16,2) DEFAULT NULL,
                                       `saldo_atual` decimal(16,2) DEFAULT NULL,
                                       `tipo` enum('entrada','saida') COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `created_at` timestamp NULL DEFAULT NULL,
                                       `updated_at` timestamp NULL DEFAULT NULL,
                                       PRIMARY KEY (`id`),
                                       KEY `item_conta_empresas_conta_id_foreign` (`conta_id`),
                                       CONSTRAINT `item_conta_empresas_conta_id_foreign` FOREIGN KEY (`conta_id`) REFERENCES `conta_empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `produto_combos` (
                                  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                  `produto_id` bigint unsigned NOT NULL,
                                  `item_id` bigint unsigned NOT NULL,
                                  `quantidade` decimal(8,3) NOT NULL,
                                  `valor_compra` decimal(12,4) NOT NULL,
                                  `sub_total` decimal(12,4) NOT NULL,
                                  `created_at` timestamp NULL DEFAULT NULL,
                                  `updated_at` timestamp NULL DEFAULT NULL,
                                  PRIMARY KEY (`id`),
                                  KEY `produto_combos_produto_id_foreign` (`produto_id`),
                                  KEY `produto_combos_item_id_foreign` (`item_id`),
                                  CONSTRAINT `produto_combos_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `produtos` (`id`),
                                  CONSTRAINT `produto_combos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `item_servico_nfces` (
                                      `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                      `nfce_id` bigint unsigned NOT NULL,
                                      `servico_id` bigint unsigned NOT NULL,
                                      `quantidade` decimal(6,2) NOT NULL,
                                      `valor_unitario` decimal(10,2) NOT NULL,
                                      `sub_total` decimal(10,2) NOT NULL,
                                      `observacao` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `created_at` timestamp NULL DEFAULT NULL,
                                      `updated_at` timestamp NULL DEFAULT NULL,
                                      PRIMARY KEY (`id`),
                                      KEY `item_servico_nfces_nfce_id_foreign` (`nfce_id`),
                                      KEY `item_servico_nfces_servico_id_foreign` (`servico_id`),
                                      CONSTRAINT `item_servico_nfces_nfce_id_foreign` FOREIGN KEY (`nfce_id`) REFERENCES `nfces` (`id`),
                                      CONSTRAINT `item_servico_nfces_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `conta_boletos` (
                                 `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                 `empresa_id` bigint unsigned DEFAULT NULL,
                                 `banco` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `agencia` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `conta` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `titular` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `padrao` tinyint(1) NOT NULL DEFAULT '0',
                                 `usar_logo` tinyint(1) NOT NULL DEFAULT '0',
                                 `documento` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `rua` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `cep` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `bairro` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `cidade_id` bigint unsigned DEFAULT NULL,
                                 `carteira` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `convenio` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `juros` decimal(10,2) DEFAULT NULL,
                                 `multa` decimal(10,2) DEFAULT NULL,
                                 `juros_apos` int DEFAULT NULL,
                                 `tipo` enum('Cnab400','Cnab240') COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL,
                                 PRIMARY KEY (`id`),
                                 KEY `conta_boletos_empresa_id_foreign` (`empresa_id`),
                                 KEY `conta_boletos_cidade_id_foreign` (`cidade_id`),
                                 CONSTRAINT `conta_boletos_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
                                 CONSTRAINT `conta_boletos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `boletos` (
                           `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                           `empresa_id` bigint unsigned DEFAULT NULL,
                           `conta_boleto_id` bigint unsigned DEFAULT NULL,
                           `conta_receber_id` bigint unsigned DEFAULT NULL,
                           `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
                           `numero_documento` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
                           `carteira` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
                           `convenio` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                           `vencimento` date NOT NULL,
                           `valor` decimal(12,2) NOT NULL,
                           `instrucoes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                           `linha_digitavel` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                           `nome_arquivo` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                           `juros` decimal(10,2) DEFAULT NULL,
                           `multa` decimal(10,2) DEFAULT NULL,
                           `juros_apos` int DEFAULT NULL,
                           `tipo` enum('Cnab400','Cnab240') COLLATE utf8mb4_unicode_ci NOT NULL,
                           `usar_logo` tinyint(1) NOT NULL DEFAULT '0',
                           `posto` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                           `codigo_cliente` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                           `created_at` timestamp NULL DEFAULT NULL,
                           `updated_at` timestamp NULL DEFAULT NULL,
                           PRIMARY KEY (`id`),
                           KEY `boletos_empresa_id_foreign` (`empresa_id`),
                           KEY `boletos_conta_boleto_id_foreign` (`conta_boleto_id`),
                           KEY `boletos_conta_receber_id_foreign` (`conta_receber_id`),
                           CONSTRAINT `boletos_conta_boleto_id_foreign` FOREIGN KEY (`conta_boleto_id`) REFERENCES `conta_boletos` (`id`),
                           CONSTRAINT `boletos_conta_receber_id_foreign` FOREIGN KEY (`conta_receber_id`) REFERENCES `conta_recebers` (`id`),
                           CONSTRAINT `boletos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `remessa_boletos` (
                                   `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                   `nome_arquivo` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `conta_boleto_id` int NOT NULL,
                                   `empresa_id` bigint unsigned DEFAULT NULL,
                                   `created_at` timestamp NULL DEFAULT NULL,
                                   `updated_at` timestamp NULL DEFAULT NULL,
                                   PRIMARY KEY (`id`),
                                   KEY `remessa_boletos_empresa_id_foreign` (`empresa_id`),
                                   CONSTRAINT `remessa_boletos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `remessa_boleto_items` (
                                        `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                        `remessa_id` bigint unsigned DEFAULT NULL,
                                        `boleto_id` bigint unsigned DEFAULT NULL,
                                        `created_at` timestamp NULL DEFAULT NULL,
                                        `updated_at` timestamp NULL DEFAULT NULL,
                                        PRIMARY KEY (`id`),
                                        KEY `remessa_boleto_items_remessa_id_foreign` (`remessa_id`),
                                        KEY `remessa_boleto_items_boleto_id_foreign` (`boleto_id`),
                                        CONSTRAINT `remessa_boleto_items_boleto_id_foreign` FOREIGN KEY (`boleto_id`) REFERENCES `boletos` (`id`),
                                        CONSTRAINT `remessa_boleto_items_remessa_id_foreign` FOREIGN KEY (`remessa_id`) REFERENCES `remessa_boletos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `video_suportes` (
                                  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                  `pagina` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `url_video` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `url_servidor` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `created_at` timestamp NULL DEFAULT NULL,
                                  `updated_at` timestamp NULL DEFAULT NULL,
                                  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `nuvem_shop_configs` (
                                      `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                      `empresa_id` bigint unsigned NOT NULL,
                                      `client_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
                                      `client_secret` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
                                      `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
                                      `created_at` timestamp NULL DEFAULT NULL,
                                      `updated_at` timestamp NULL DEFAULT NULL,
                                      PRIMARY KEY (`id`),
                                      KEY `nuvem_shop_configs_empresa_id_foreign` (`empresa_id`),
                                      CONSTRAINT `nuvem_shop_configs_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `nuvem_shop_pedidos` (
                                      `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                      `empresa_id` bigint unsigned NOT NULL,
                                      `pedido_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `rua` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `numero` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `bairro` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `cidade` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `cep` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `subtotal` decimal(10,2) NOT NULL,
                                      `total` decimal(10,2) NOT NULL,
                                      `valor_frete` decimal(10,2) NOT NULL,
                                      `desconto` decimal(10,2) NOT NULL,
                                      `observacao` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `cliente_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `documento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `nfe_id` int DEFAULT NULL,
                                      `status_envio` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `gateway` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `status_pagamento` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `data` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `venda_id` int DEFAULT NULL,
                                      `created_at` timestamp NULL DEFAULT NULL,
                                      `updated_at` timestamp NULL DEFAULT NULL,
                                      PRIMARY KEY (`id`),
                                      KEY `nuvem_shop_pedidos_empresa_id_foreign` (`empresa_id`),
                                      CONSTRAINT `nuvem_shop_pedidos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `nuvem_shop_item_pedidos` (
                                           `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                           `produto_id` bigint unsigned DEFAULT NULL,
                                           `pedido_id` bigint unsigned DEFAULT NULL,
                                           `quantidade` decimal(8,2) NOT NULL,
                                           `valor_unitario` decimal(10,2) NOT NULL,
                                           `sub_total` decimal(10,2) NOT NULL,
                                           `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `created_at` timestamp NULL DEFAULT NULL,
                                           `updated_at` timestamp NULL DEFAULT NULL,
                                           PRIMARY KEY (`id`),
                                           KEY `nuvem_shop_item_pedidos_produto_id_foreign` (`produto_id`),
                                           KEY `nuvem_shop_item_pedidos_pedido_id_foreign` (`pedido_id`),
                                           CONSTRAINT `nuvem_shop_item_pedidos_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `nuvem_shop_pedidos` (`id`),
                                           CONSTRAINT `nuvem_shop_item_pedidos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `categoria_nuvem_shops` (
                                         `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                         `empresa_id` bigint unsigned NOT NULL,
                                         `nome` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `created_at` timestamp NULL DEFAULT NULL,
                                         `updated_at` timestamp NULL DEFAULT NULL,
                                         PRIMARY KEY (`id`),
                                         KEY `categoria_nuvem_shops_empresa_id_foreign` (`empresa_id`),
                                         CONSTRAINT `categoria_nuvem_shops_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `permissions` (
                               `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                               `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                               `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                               `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                               `created_at` timestamp NULL DEFAULT NULL,
                               `updated_at` timestamp NULL DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `roles` (
                         `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                         `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `empresa_id` bigint unsigned DEFAULT NULL,
                         `is_default` tinyint(1) NOT NULL DEFAULT '0',
                         `type_user` smallint NOT NULL,
                         `created_at` timestamp NULL DEFAULT NULL,
                         `updated_at` timestamp NULL DEFAULT NULL,
                         PRIMARY KEY (`id`),
                         UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`),
                         KEY `roles_empresa_id_foreign` (`empresa_id`),
                         CONSTRAINT `roles_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `model_has_permissions` (
                                         `permission_id` bigint unsigned NOT NULL,
                                         `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `model_id` bigint unsigned NOT NULL,
                                         PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
                                         KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
                                         CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `model_has_roles` (
                                   `role_id` bigint unsigned NOT NULL,
                                   `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `model_id` bigint unsigned NOT NULL,
                                   PRIMARY KEY (`role_id`,`model_id`,`model_type`),
                                   KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
                                   CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `role_has_permissions` (
                                        `permission_id` bigint unsigned NOT NULL,
                                        `role_id` bigint unsigned NOT NULL,
                                        PRIMARY KEY (`permission_id`,`role_id`),
                                        KEY `role_has_permissions_role_id_foreign` (`role_id`),
                                        CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
                                        CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `localizacaos` (
                                `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                `empresa_id` bigint unsigned DEFAULT NULL,
                                `descricao` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
                                `status` tinyint(1) NOT NULL DEFAULT '1',
                                `nome` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `nome_fantasia` mediumtext COLLATE utf8mb4_unicode_ci,
                                `cpf_cnpj` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
                                `aut_xml` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `ie` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `celular` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `arquivo` blob,
                                `senha` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `cep` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `rua` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `numero` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `bairro` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `complemento` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `cidade_id` bigint unsigned DEFAULT NULL,
                                `numero_ultima_nfe_producao` int DEFAULT NULL,
                                `numero_ultima_nfe_homologacao` int DEFAULT NULL,
                                `numero_serie_nfe` int DEFAULT NULL,
                                `numero_ultima_nfce_producao` int DEFAULT NULL,
                                `numero_ultima_nfce_homologacao` int DEFAULT NULL,
                                `numero_serie_nfce` int DEFAULT NULL,
                                `numero_ultima_cte_producao` int DEFAULT NULL,
                                `numero_ultima_cte_homologacao` int DEFAULT NULL,
                                `numero_serie_cte` int DEFAULT NULL,
                                `numero_ultima_mdfe_producao` int DEFAULT NULL,
                                `numero_ultima_mdfe_homologacao` int DEFAULT NULL,
                                `numero_serie_mdfe` int DEFAULT NULL,
                                `numero_ultima_nfse` int DEFAULT NULL,
                                `numero_serie_nfse` int DEFAULT NULL,
                                `csc` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `csc_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `ambiente` int NOT NULL,
                                `tributacao` enum('MEI','Simples Nacional','Regime Normal') COLLATE utf8mb4_unicode_ci NOT NULL,
                                `token_nfse` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `logo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
                                `created_at` timestamp NULL DEFAULT NULL,
                                `updated_at` timestamp NULL DEFAULT NULL,
                                PRIMARY KEY (`id`),
                                KEY `localizacaos_empresa_id_foreign` (`empresa_id`),
                                KEY `localizacaos_cidade_id_foreign` (`cidade_id`),
                                CONSTRAINT `localizacaos_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`),
                                CONSTRAINT `localizacaos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `produto_localizacaos` (
                                        `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                        `produto_id` bigint unsigned DEFAULT NULL,
                                        `localizacao_id` bigint unsigned DEFAULT NULL,
                                        `created_at` timestamp NULL DEFAULT NULL,
                                        `updated_at` timestamp NULL DEFAULT NULL,
                                        PRIMARY KEY (`id`),
                                        KEY `produto_localizacaos_produto_id_foreign` (`produto_id`),
                                        KEY `produto_localizacaos_localizacao_id_foreign` (`localizacao_id`),
                                        CONSTRAINT `produto_localizacaos_localizacao_id_foreign` FOREIGN KEY (`localizacao_id`) REFERENCES `localizacaos` (`id`),
                                        CONSTRAINT `produto_localizacaos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `usuario_localizacaos` (
                                        `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                        `usuario_id` bigint unsigned DEFAULT NULL,
                                        `localizacao_id` bigint unsigned DEFAULT NULL,
                                        `created_at` timestamp NULL DEFAULT NULL,
                                        `updated_at` timestamp NULL DEFAULT NULL,
                                        PRIMARY KEY (`id`),
                                        KEY `usuario_localizacaos_usuario_id_foreign` (`usuario_id`),
                                        KEY `usuario_localizacaos_localizacao_id_foreign` (`localizacao_id`),
                                        CONSTRAINT `usuario_localizacaos_localizacao_id_foreign` FOREIGN KEY (`localizacao_id`) REFERENCES `localizacaos` (`id`),
                                        CONSTRAINT `usuario_localizacaos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `financeiro_planos` (
                                     `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                     `empresa_id` bigint unsigned DEFAULT NULL,
                                     `plano_id` bigint unsigned DEFAULT NULL,
                                     `valor` decimal(10,2) NOT NULL,
                                     `tipo_pagamento` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `status_pagamento` enum('pendente','recebido','cancelado') COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `plano_empresa_id` int NOT NULL,
                                     `created_at` timestamp NULL DEFAULT NULL,
                                     `updated_at` timestamp NULL DEFAULT NULL,
                                     PRIMARY KEY (`id`),
                                     KEY `financeiro_planos_empresa_id_foreign` (`empresa_id`),
                                     KEY `financeiro_planos_plano_id_foreign` (`plano_id`),
                                     CONSTRAINT `financeiro_planos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
                                     CONSTRAINT `financeiro_planos_plano_id_foreign` FOREIGN KEY (`plano_id`) REFERENCES `planos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `modelo_etiquetas` (
                                    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                    `empresa_id` bigint unsigned DEFAULT NULL,
                                    `nome` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `observacao` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                    `altura` decimal(7,2) NOT NULL,
                                    `largura` decimal(7,2) NOT NULL,
                                    `etiquestas_por_linha` int NOT NULL,
                                    `distancia_etiquetas_lateral` decimal(7,2) NOT NULL,
                                    `distancia_etiquetas_topo` decimal(7,2) NOT NULL,
                                    `quantidade_etiquetas` int NOT NULL,
                                    `tamanho_fonte` decimal(7,2) NOT NULL,
                                    `tamanho_codigo_barras` decimal(7,2) NOT NULL,
                                    `nome_empresa` tinyint(1) NOT NULL,
                                    `nome_produto` tinyint(1) NOT NULL,
                                    `valor_produto` tinyint(1) NOT NULL,
                                    `codigo_produto` tinyint(1) NOT NULL,
                                    `codigo_barras_numerico` tinyint(1) NOT NULL,
                                    `tipo` enum('simples','gondola') COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `created_at` timestamp NULL DEFAULT NULL,
                                    `updated_at` timestamp NULL DEFAULT NULL,
                                    `importado_super` tinyint(1) DEFAULT '0',
                                    PRIMARY KEY (`id`),
                                    KEY `modelo_etiquetas_empresa_id_foreign` (`empresa_id`),
                                    CONSTRAINT `modelo_etiquetas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `categoria_acomodacaos` (
                                         `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                         `empresa_id` bigint unsigned NOT NULL,
                                         `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `created_at` timestamp NULL DEFAULT NULL,
                                         `updated_at` timestamp NULL DEFAULT NULL,
                                         PRIMARY KEY (`id`),
                                         KEY `categoria_acomodacaos_empresa_id_foreign` (`empresa_id`),
                                         CONSTRAINT `categoria_acomodacaos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `reservas` (
                            `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                            `empresa_id` bigint unsigned NOT NULL,
                            `cliente_id` bigint unsigned NOT NULL,
                            `acomodacao_id` bigint unsigned NOT NULL,
                            `data_checkin` date NOT NULL,
                            `data_checkout` date NOT NULL,
                            `valor_estadia` decimal(12,2) NOT NULL,
                            `valor_consumo_frigobar` decimal(12,2) DEFAULT NULL,
                            `valor_consumo_adicional` decimal(12,2) DEFAULT NULL,
                            `desconto` decimal(12,2) DEFAULT NULL,
                            `valor_outros` decimal(12,2) DEFAULT NULL,
                            `valor_total` decimal(12,2) DEFAULT NULL,
                            `estado` enum('pendente','iniciado','finalizado','cancelado') COLLATE utf8mb4_unicode_ci NOT NULL,
                            `observacao` text COLLATE utf8mb4_unicode_ci NOT NULL,
                            `conferencia_frigobar` tinyint(1) NOT NULL DEFAULT '0',
                            `total_hospedes` int DEFAULT NULL,
                            `created_at` timestamp NULL DEFAULT NULL,
                            `updated_at` timestamp NULL DEFAULT NULL,
                            `codigo_reseva` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `link_externo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `numero_sequencial` int DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            KEY `reservas_empresa_id_foreign` (`empresa_id`),
                            KEY `reservas_cliente_id_foreign` (`cliente_id`),
                            KEY `reservas_acomodacao_id_foreign` (`acomodacao_id`),
                            CONSTRAINT `reservas_acomodacao_id_foreign` FOREIGN KEY (`acomodacao_id`) REFERENCES `acomodacaos` (`id`),
                            CONSTRAINT `reservas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
                            CONSTRAINT `reservas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `consumo_reservas` (
                                    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                    `reserva_id` bigint unsigned NOT NULL,
                                    `produto_id` bigint unsigned DEFAULT NULL,
                                    `quantidade` decimal(8,2) NOT NULL,
                                    `valor_unitario` decimal(12,2) NOT NULL,
                                    `sub_total` decimal(12,2) NOT NULL,
                                    `observacao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                    `created_at` timestamp NULL DEFAULT NULL,
                                    `updated_at` timestamp NULL DEFAULT NULL,
                                    PRIMARY KEY (`id`),
                                    KEY `consumo_reservas_reserva_id_foreign` (`reserva_id`),
                                    KEY `consumo_reservas_produto_id_foreign` (`produto_id`),
                                    CONSTRAINT `consumo_reservas_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `reservas` (`id`),
                                    CONSTRAINT `consumo_reservas_reserva_id_foreign` FOREIGN KEY (`reserva_id`) REFERENCES `reservas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `notas_reservas` (
                                  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                  `reserva_id` bigint unsigned NOT NULL,
                                  `texto` text COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `leitura` tinyint(1) NOT NULL DEFAULT '0',
                                  `created_at` timestamp NULL DEFAULT NULL,
                                  `updated_at` timestamp NULL DEFAULT NULL,
                                  PRIMARY KEY (`id`),
                                  KEY `notas_reservas_reserva_id_foreign` (`reserva_id`),
                                  CONSTRAINT `notas_reservas_reserva_id_foreign` FOREIGN KEY (`reserva_id`) REFERENCES `reservas` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `produto_fornecedors` (
                                       `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                       `produto_id` bigint unsigned DEFAULT NULL,
                                       `fornecedor_id` bigint unsigned DEFAULT NULL,
                                       `created_at` timestamp NULL DEFAULT NULL,
                                       `updated_at` timestamp NULL DEFAULT NULL,
                                       PRIMARY KEY (`id`),
                                       KEY `produto_fornecedors_produto_id_foreign` (`produto_id`),
                                       KEY `produto_fornecedors_fornecedor_id_foreign` (`fornecedor_id`),
                                       CONSTRAINT `produto_fornecedors_fornecedor_id_foreign` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedors` (`id`),
                                       CONSTRAINT `produto_fornecedors_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `venda_suspensas` (
                                   `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                   `empresa_id` bigint unsigned NOT NULL,
                                   `cliente_id` bigint unsigned DEFAULT NULL,
                                   `total` decimal(12,2) NOT NULL,
                                   `desconto` decimal(12,2) DEFAULT NULL,
                                   `acrescimo` decimal(12,2) DEFAULT NULL,
                                   `observacao` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `local_id` int DEFAULT NULL,
                                   `user_id` int DEFAULT NULL,
                                   `funcionario_id` int DEFAULT NULL,
                                   `created_at` timestamp NULL DEFAULT NULL,
                                   `updated_at` timestamp NULL DEFAULT NULL,
                                   PRIMARY KEY (`id`),
                                   KEY `venda_suspensas_empresa_id_foreign` (`empresa_id`),
                                   KEY `venda_suspensas_cliente_id_foreign` (`cliente_id`),
                                   CONSTRAINT `venda_suspensas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
                                   CONSTRAINT `venda_suspensas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `item_venda_suspensas` (
                                        `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                        `venda_id` bigint unsigned DEFAULT NULL,
                                        `produto_id` bigint unsigned DEFAULT NULL,
                                        `variacao_id` bigint unsigned DEFAULT NULL,
                                        `quantidade` decimal(7,3) NOT NULL,
                                        `valor_unitario` decimal(10,2) NOT NULL,
                                        `sub_total` decimal(10,2) NOT NULL,
                                        `created_at` timestamp NULL DEFAULT NULL,
                                        `updated_at` timestamp NULL DEFAULT NULL,
                                        PRIMARY KEY (`id`),
                                        KEY `item_venda_suspensas_venda_id_foreign` (`venda_id`),
                                        KEY `item_venda_suspensas_produto_id_foreign` (`produto_id`),
                                        KEY `item_venda_suspensas_variacao_id_foreign` (`variacao_id`),
                                        CONSTRAINT `item_venda_suspensas_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
                                        CONSTRAINT `item_venda_suspensas_variacao_id_foreign` FOREIGN KEY (`variacao_id`) REFERENCES `produto_variacaos` (`id`),
                                        CONSTRAINT `item_venda_suspensas_venda_id_foreign` FOREIGN KEY (`venda_id`) REFERENCES `venda_suspensas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `trocas` (
                          `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                          `empresa_id` bigint unsigned NOT NULL,
                          `nfce_id` bigint unsigned NOT NULL,
                          `observacao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                          `valor_troca` decimal(12,2) NOT NULL,
                          `valor_original` decimal(12,2) NOT NULL,
                          `numero_sequencial` int DEFAULT NULL,
                          `codigo` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
                          `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
                          `created_at` timestamp NULL DEFAULT NULL,
                          `updated_at` timestamp NULL DEFAULT NULL,
                          PRIMARY KEY (`id`),
                          KEY `trocas_empresa_id_foreign` (`empresa_id`),
                          KEY `trocas_nfce_id_foreign` (`nfce_id`),
                          CONSTRAINT `trocas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
                          CONSTRAINT `trocas_nfce_id_foreign` FOREIGN KEY (`nfce_id`) REFERENCES `nfces` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `item_trocas` (
                               `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                               `troca_id` bigint unsigned NOT NULL,
                               `produto_id` bigint unsigned NOT NULL,
                               `quantidade` decimal(7,3) NOT NULL,
                               `created_at` timestamp NULL DEFAULT NULL,
                               `updated_at` timestamp NULL DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               KEY `item_trocas_troca_id_foreign` (`troca_id`),
                               KEY `item_trocas_produto_id_foreign` (`produto_id`),
                               CONSTRAINT `item_trocas_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
                               CONSTRAINT `item_trocas_troca_id_foreign` FOREIGN KEY (`troca_id`) REFERENCES `trocas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `credito_clientes` (
                                    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                    `cliente_id` bigint unsigned NOT NULL,
                                    `valor` decimal(12,2) NOT NULL,
                                    `created_at` timestamp NULL DEFAULT NULL,
                                    `updated_at` timestamp NULL DEFAULT NULL,
                                    PRIMARY KEY (`id`),
                                    KEY `credito_clientes_cliente_id_foreign` (`cliente_id`),
                                    CONSTRAINT `credito_clientes_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `contigencias` (
                                `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                `empresa_id` bigint unsigned DEFAULT NULL,
                                `status` tinyint(1) NOT NULL,
                                `tipo` enum('SVCAN','SVCRS','OFFLINE') COLLATE utf8mb4_unicode_ci NOT NULL,
                                `motivo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                `status_retorno` text COLLATE utf8mb4_unicode_ci NOT NULL,
                                `documento` enum('NFe','NFCe','CTe','MDFe') COLLATE utf8mb4_unicode_ci NOT NULL,
                                `created_at` timestamp NULL DEFAULT NULL,
                                `updated_at` timestamp NULL DEFAULT NULL,
                                PRIMARY KEY (`id`),
                                KEY `contigencias_empresa_id_foreign` (`empresa_id`),
                                CONSTRAINT `contigencias_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `woocommerce_configs` (
                                       `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                       `empresa_id` bigint unsigned NOT NULL,
                                       `consumer_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `consumer_secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `created_at` timestamp NULL DEFAULT NULL,
                                       `updated_at` timestamp NULL DEFAULT NULL,
                                       PRIMARY KEY (`id`),
                                       KEY `woocommerce_configs_empresa_id_foreign` (`empresa_id`),
                                       CONSTRAINT `woocommerce_configs_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `categoria_woocommerces` (
                                          `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                          `empresa_id` bigint unsigned NOT NULL,
                                          `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
                                          `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
                                          `descricao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                          `_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                                          `created_at` timestamp NULL DEFAULT NULL,
                                          `updated_at` timestamp NULL DEFAULT NULL,
                                          PRIMARY KEY (`id`),
                                          KEY `categoria_woocommerces_empresa_id_foreign` (`empresa_id`),
                                          CONSTRAINT `categoria_woocommerces_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `woocommerce_pedidos` (
                                       `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                       `empresa_id` bigint unsigned NOT NULL,
                                       `cliente_id` bigint unsigned DEFAULT NULL,
                                       `pedido_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `rua` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                       `numero` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                       `bairro` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                       `cidade` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                       `uf` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                       `cep` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                       `total` decimal(10,2) NOT NULL,
                                       `valor_frete` decimal(10,2) NOT NULL,
                                       `desconto` decimal(10,2) NOT NULL,
                                       `observacao` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                       `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `documento` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                       `nfe_id` int DEFAULT NULL,
                                       `tipo_pagamento` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                       `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `numero_pedido` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `data` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `venda_id` int DEFAULT NULL,
                                       `created_at` timestamp NULL DEFAULT NULL,
                                       `updated_at` timestamp NULL DEFAULT NULL,
                                       PRIMARY KEY (`id`),
                                       KEY `woocommerce_pedidos_empresa_id_foreign` (`empresa_id`),
                                       KEY `woocommerce_pedidos_cliente_id_foreign` (`cliente_id`),
                                       CONSTRAINT `woocommerce_pedidos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
                                       CONSTRAINT `woocommerce_pedidos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `woocommerce_item_pedidos` (
                                            `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                            `pedido_id` bigint unsigned NOT NULL,
                                            `produto_id` bigint unsigned DEFAULT NULL,
                                            `item_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                                            `item_nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
                                            `quantidade` decimal(8,2) NOT NULL,
                                            `valor_unitario` decimal(12,2) NOT NULL,
                                            `sub_total` decimal(12,2) NOT NULL,
                                            `created_at` timestamp NULL DEFAULT NULL,
                                            `updated_at` timestamp NULL DEFAULT NULL,
                                            PRIMARY KEY (`id`),
                                            KEY `woocommerce_item_pedidos_pedido_id_foreign` (`pedido_id`),
                                            KEY `woocommerce_item_pedidos_produto_id_foreign` (`produto_id`),
                                            CONSTRAINT `woocommerce_item_pedidos_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `woocommerce_pedidos` (`id`),
                                            CONSTRAINT `woocommerce_item_pedidos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `system_updates` (
                                  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                  `versao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `created_at` timestamp NULL DEFAULT NULL,
                                  `updated_at` timestamp NULL DEFAULT NULL,
                                  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tef_multi_plus_cards` (
                                        `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                        `empresa_id` bigint unsigned NOT NULL,
                                        `usuario_id` bigint unsigned NOT NULL,
                                        `cnpj` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `pdv` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `token` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `status` tinyint(1) NOT NULL,
                                        `created_at` timestamp NULL DEFAULT NULL,
                                        `updated_at` timestamp NULL DEFAULT NULL,
                                        PRIMARY KEY (`id`),
                                        KEY `tef_multi_plus_cards_empresa_id_foreign` (`empresa_id`),
                                        KEY `tef_multi_plus_cards_usuario_id_foreign` (`usuario_id`),
                                        CONSTRAINT `tef_multi_plus_cards_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
                                        CONSTRAINT `tef_multi_plus_cards_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `registro_tefs` (
                                 `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                 `empresa_id` bigint unsigned NOT NULL,
                                 `nfce_id` bigint unsigned DEFAULT NULL,
                                 `nome_rede` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `nsu` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `data_transacao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `hora_transacao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `valor_total` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `hash` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `estado` enum('aprovado','cancelado','pendente') COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL,
                                 PRIMARY KEY (`id`),
                                 KEY `registro_tefs_empresa_id_foreign` (`empresa_id`),
                                 KEY `registro_tefs_nfce_id_foreign` (`nfce_id`),
                                 CONSTRAINT `registro_tefs_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
                                 CONSTRAINT `registro_tefs_nfce_id_foreign` FOREIGN KEY (`nfce_id`) REFERENCES `nfces` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `acao_logs` (
                             `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                             `empresa_id` bigint unsigned NOT NULL,
                             `local` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
                             `descricao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                             `acao` enum('cadastrar','editar','excluir','transmitir','cancelar','corrigir','erro') COLLATE utf8mb4_unicode_ci NOT NULL,
                             `created_at` timestamp NULL DEFAULT NULL,
                             `updated_at` timestamp NULL DEFAULT NULL,
                             PRIMARY KEY (`id`),
                             KEY `acao_logs_empresa_id_foreign` (`empresa_id`),
                             CONSTRAINT `acao_logs_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `permissions` VALUES (1,'usuarios_view','Visualiza usuários','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(2,'usuarios_create','Cria usuário','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(3,'usuarios_edit','Edita usuário','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(4,'usuarios_delete','Deleta usuário','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(5,'produtos_view','Visualiza produtos','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(6,'produtos_create','Cria produto','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(7,'produtos_edit','Edita produtos','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(8,'produtos_delete','Deleta produtos','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(9,'estoque_view','Visualiza estoque','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(10,'estoque_create','Cria estoque','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(11,'estoque_edit','Edita estoque','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(12,'estoque_delete','Deleta estoque','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(13,'variacao_view','Visualiza variação','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(14,'variacao_create','Cria variação','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(15,'variacao_edit','Edita variação','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(16,'variacao_delete','Deleta variação','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(17,'categoria_produtos_view','Visualiza categoria de produtos','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(18,'categoria_produtos_create','Cria categoria de produtos','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(19,'categoria_produtos_edit','Edita categoria de produtos','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(20,'categoria_produtos_delete','Deleta categoria de produtos','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(21,'marcas_view','Visualiza marca','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(22,'marcas_create','Cria marca','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(23,'marcas_edit','Edita marca','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(24,'marcas_delete','Deleta marca','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(25,'lista_preco_view','Visualiza lista de preços','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(26,'lista_preco_create','Cria lista de preços','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(27,'lista_preco_edit','Edita lista de preços','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(28,'lista_preco_delete','Deleta lista de preços','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(29,'config_produto_fiscal_view','Visualiza configuração fiscal produto','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(30,'config_produto_fiscal_create','Cria configuração fiscal produto','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(31,'config_produto_fiscal_edit','Edita configuração fiscal produto','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(32,'config_produto_fiscal_delete','Deleta configuração fiscal produto','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(33,'atribuicoes_view','Visualiza atribuições','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(34,'atribuicoes_create','Cria atribuição','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(35,'atribuicoes_edit','Edita atribuições','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(36,'atribuicoes_delete','Deleta atribuições','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(37,'clientes_view','Visualiza clientes','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(38,'clientes_create','Cria cliente','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(39,'clientes_edit','Edita cliente','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(40,'clientes_delete','Deleta cliente','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(41,'fornecedores_view','Visualiza fornecedores','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(42,'fornecedores_create','Cria fornecedor','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(43,'fornecedores_edit','Edita fornecedor','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(44,'fornecedores_delete','Deleta fornecedor','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(45,'transportadoras_view','Visualiza transportadora','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(46,'transportadoras_create','Cria transportadora','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(47,'transportadoras_edit','Edita transportadora','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(48,'transportadoras_delete','Deleta transportadora','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(49,'nfe_view','Visualiza NFe','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(50,'nfe_create','Cria NFe','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(51,'nfe_edit','Edita NFe','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(52,'nfe_delete','Deleta NFe','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(53,'nfe_inutiliza','Inutiliza NFe','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(54,'nfe_transmitir','Transmitir NFe','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(55,'orcamento_view','Visualiza Orçamento','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(56,'orcamento_create','Cria Orçamento','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(57,'orcamento_edit','Edita Orçamento','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(58,'orcamento_delete','Deleta Orçamento','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(59,'nfce_view','Visualiza NFCe','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(60,'nfce_create','Cria NFCe','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(61,'nfce_edit','Edita NFCe','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(62,'nfce_delete','Deleta NFCe','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(63,'nfce_transmitir','Transmitir NFCe','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(64,'nfce_inutiliza','Inutiliza NFce','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(65,'cte_view','Visualiza CTe','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(66,'cte_create','Cria CTe','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(67,'cte_edit','Edita CTe','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(68,'cte_delete','Deleta CTe','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(69,'cte_os_view','Visualiza CTeOs','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(70,'cte_os_create','Cria CTeOs','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(71,'cte_os_edit','Edita CTeOs','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(72,'cte_os_delete','Deleta CTeOs','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(73,'mdfe_view','Visualiza MDFe','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(74,'mdfe_create','Cria MDFe','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(75,'mdfe_edit','Edita MDFe','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(76,'mdfe_delete','Deleta MDFe','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(77,'nfse_view','Visualiza NFSe','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(78,'nfse_create','Cria NFSe','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(79,'nfse_edit','Edita NFSe','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(80,'nfse_delete','Deleta NFSe','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(81,'pdv_view','Visualiza PDV','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(82,'pdv_create','Cria PDV','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(83,'pdv_edit','Edita PDV','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(84,'pdv_delete','Deleta PDV','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(85,'pre_venda_view','Visualiza pré venda','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(86,'pre_venda_create','Cria pré venda','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(87,'pre_venda_edit','Edita pré venda','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(88,'pre_venda_delete','Deleta pré venda','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(89,'agendamento_view','Visualiza agendamento','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(90,'agendamento_create','Cria agendamento','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(91,'agendamento_edit','Edita agendamento','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(92,'agendamento_delete','Deleta agendamento','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(93,'servico_view','Visualiza serviço','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(94,'servico_create','Cria serviço','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(95,'servico_edit','Edita serviço','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(96,'servico_delete','Deleta serviço','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(97,'categoria_servico_view','Visualiza categoria de serviço','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(98,'categoria_servico_create','Cria categoria de serviço','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(99,'categoria_servico_edit','Edita categoria de serviço','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(100,'categoria_servico_delete','Deleta categoria de serviço','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(101,'veiculos_view','Visualiza veículo','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(102,'veiculos_create','Cria veículo','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(103,'veiculos_edit','Edita veículo','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(104,'veiculos_delete','Deleta veículo','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(105,'atendimentos_view','Visualiza atendimento','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(106,'atendimentos_create','Cria atendimento','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(107,'atendimentos_edit','Edita atendimento','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(108,'atendimentos_delete','Deleta atendimento','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(109,'conta_pagar_view','Visualiza conta a pagar','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(110,'conta_pagar_create','Cria conta a pagar','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(111,'conta_pagar_edit','Edita conta a pagar','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(112,'conta_pagar_delete','Deleta conta a pagar','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(113,'conta_receber_view','Visualiza conta a receber','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(114,'conta_receber_create','Cria conta a receber','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(115,'conta_receber_edit','Edita conta a receber','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(116,'conta_receber_delete','Deleta conta a receber','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(117,'cardapio_view','Visualiza cárdapio','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(118,'controle_acesso_view','Visualiza controle de acesso','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(119,'controle_acesso_create','Cria controle de acesso','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(120,'controle_acesso_edit','Edita controle de acesso','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(121,'controle_acesso_delete','Deleta controle de acesso','web','2024-07-10 18:01:17','2024-07-10 18:01:17'),(122,'arquivos_xml_view','Visualiza arquivos xml','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(123,'natureza_operacao_view','Visualiza natureza de operação','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(124,'natureza_operacao_create','Cria natureza de operação','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(125,'natureza_operacao_edit','Edita natureza de operação','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(126,'natureza_operacao_delete','Deleta natureza de operação','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(127,'emitente_view','Visualiza emitente','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(128,'compras_view','Visualiza compras','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(129,'compras_create','Cria compras','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(130,'compras_edit','Edita compras','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(131,'compras_delete','Deleta compras','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(132,'manifesto_view','Visualiza manifesto compras','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(133,'cotacao_view','Visualiza cotação','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(134,'cotacao_create','Cria cotação','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(135,'cotacao_edit','Edita cotação','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(136,'cotacao_delete','Deleta cotação','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(137,'devolucao_view','Visualiza devolução','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(138,'devolucao_create','Cria devolução','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(139,'devolucao_edit','Edita devolução','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(140,'devolucao_delete','Deleta devolução','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(141,'funcionario_view','Visualiza funcionário','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(142,'funcionario_create','Cria funcionário','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(143,'funcionario_edit','Edita funcionário','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(144,'funcionario_delete','Deleta funcionário','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(145,'apuracao_mensal_view','Visualiza Apuração mensal','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(146,'apuracao_mensal_create','Cria Apuração mensal','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(147,'apuracao_mensal_edit','Edita Apuração mensal','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(148,'apuracao_mensal_delete','Deleta Apuração mensal','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(149,'ecommerce_view','Visualiza ecommerce','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(150,'delivery_view','Visualiza delivery','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(151,'mercado_livre_view','Visualiza mercado livre','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(152,'nuvem_shop_view','Visualiza nuvem shop','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(153,'relatorio_view','Visualiza relatório','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(154,'caixa_view','Visualiza caixa','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(155,'contas_empresa_view','Visualiza contas da empresa','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(156,'contas_empresa_create','Cria contas da empresa','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(157,'contas_empresa_edit','Edita contas da empresa','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(158,'contas_empresa_delete','Deleta contas da empresa','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(159,'contas_boleto_view','Visualiza contas de boleto','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(160,'contas_boleto_create','Cria contas de boleto','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(161,'contas_boleto_edit','Edita contas de boleto','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(162,'contas_boleto_delete','Deleta contas de boleto','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(163,'boleto_view','Visualiza boleto','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(164,'boleto_create','Cria boleto','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(165,'boleto_edit','Edita boleto','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(166,'boleto_delete','Deleta boleto','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(167,'taxa_pagamento_view','Visualiza taxa de pagamento','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(168,'taxa_pagamento_create','Cria taxa de pagamento','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(169,'taxa_pagamento_edit','Edita taxa de pagamento','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(170,'taxa_pagamento_delete','Deleta taxa de pagamento','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(171,'ordem_servico_view','Visualiza ordem de serviço','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(172,'ordem_servico_create','Cria ordem de serviço','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(173,'ordem_servico_edit','Edita ordem de serviço','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(174,'ordem_servico_delete','Deleta ordem de serviço','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(175,'difal_view','Visualiza difal','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(176,'difal_create','Cria difal','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(177,'difal_edit','Edita difal','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(178,'difal_delete','Deleta difal','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(179,'cashback_config_view','Visualiza cashback config','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(180,'localizacao_view','Visualiza localização','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(181,'localizacao_create','Cria localização','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(182,'localizacao_edit','Edita localização','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(183,'localizacao_delete','Deleta localização','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(184,'transferencia_estoque_view','Visualiza transferência de estoque','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(185,'transferencia_estoque_create','Cria transferência de estoque','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(186,'transferencia_estoque_delete','Deleta transferência de estoque','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(187,'config_reserva_view','Visualiza configuração de reserva','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(188,'categoria_acomodacao_view','Visualiza categoria de acomodação','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(189,'categoria_acomodacao_create','Cria categoria de acomodação','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(190,'categoria_acomodacao_edit','Edita categoria de acomodação','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(191,'categoria_acomodacao_delete','Deleta categoria de acomodação','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(192,'acomodacao_view','Visualiza acomodação','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(193,'acomodacao_create','Cria acomodação','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(194,'acomodacao_edit','Edita acomodação','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(195,'acomodacao_delete','Deleta acomodação','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(196,'frigobar_view','Visualiza frigobar','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(197,'frigobar_create','Cria frigobar','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(198,'frigobar_edit','Edita frigobar','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(199,'frigobar_delete','Deleta frigobar','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(200,'reserva_view','Visualiza reserva','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(201,'reserva_create','Cria reserva','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(202,'reserva_edit','Edita reserva','web','2024-07-10 18:01:18','2024-07-10 18:01:18'),(203,'reserva_delete','Deleta reserva','web','2024-07-10 18:01:18','2024-07-10 18:01:18');
