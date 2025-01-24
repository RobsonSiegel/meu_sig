<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('config_gerals', function (Blueprint $table) {
            $table->id();

            $table->foreignId('empresa_id')->constrained('empresas');
            $table->enum('balanca_valor_peso', ['peso', 'valor']);
            $table->integer('balanca_digito_verificador')->nullable();
            $table->boolean('confirmar_itens_prevenda')->default(0);
            $table->boolean('gerenciar_estoque')->default(0);
            $table->boolean('movimenta_estoque_entrega')->default(0);
            $table->text('notificacoes');
            $table->decimal('margem_combo', 5,2)->default(50);
            $table->decimal('percentual_lucro_produto', 10,2)->default(50);
            $table->text('tipos_pagamento_pdv');
            $table->string('senha_manipula_valor', 20)->nullable();
            $table->boolean('abrir_modal_cartao')->default(1);

            /*Alteração para inclusão de novos tipos de valores - Ticket: 5125 - */
            //Inicio Bruno
            $table->boolean('mostra_campos_extra_fechamento_caixa')->default(0);

            // alter table config_gerals add column mostra_campos_extra_fechamento_caixa boolean default 0 after balanca_valor_peso;
            //Fim Bruno

            /* Alteração para usar ou não o Caixa Cego - Ticket: 5127*/
            //Inicio Bruno
            $table->boolean('usa_caixa_cego')->default(0);

            // alter table config_gerals add column usa_caixa_cego boolean default 0 after mostra_campos_extra_fechamento_caixa;
            //Fim Bruno

            /* Alteração para escolher o tipo de impressão do fechamento de caixa - Ticket: 5130 */
            //Inicio Bruno
            $table->string('tipo_imp_fechamento_caixa', 2)->default('01');
            // alter table config_gerals add column tipo_imp_fechamento_caixa varchar(20) default '01' after usa_caixa_cego;
            //Fim Bruno

            /* Alteração para setar o percentual maximo de desconto permitido na venda - Ticket: 5129 */
            //Inicio Bruno
            $table->string('percentual_maximo_desconto', 2)->default('01');
            // alter table config_gerals add column percentual_maximo_desconto decimal(10,2) default 0 after tipo_imp_fechamento_caixa;
            //Fim Bruno


            // alter table config_gerals add column confirmar_itens_prevenda boolean default 0;
            // alter table config_gerals add column movimenta_estoque_entrega boolean default 0 after gerenciar_estoque;
            // alter table config_gerals modify column balanca_digito_verificador integer default null;
            // alter table config_gerals add column notificacoes text;
            // alter table config_gerals add column margem_combo decimal(5,2) default 50;
            // alter table config_gerals add column gerenciar_estoque boolean default 0;
            // alter table config_gerals add column percentual_lucro_produto decimal(10,2) default 0;
            // alter table config_gerals add column tipos_pagamento_pdv text;
            // alter table config_gerals add column senha_manipula_valor varchar(20) default null;
            // alter table config_gerals add column abrir_modal_cartao boolean default 1;


            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('config_gerals');
    }
};
