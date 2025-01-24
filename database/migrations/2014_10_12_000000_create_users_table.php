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
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->string('telefone');

            $table->string('imagem', 25)->nullable();
            $table->boolean('admin')->default(1);
            $table->boolean('sidebar_active')->default(1);
            $table->boolean('notificacao_cardapio')->default(0);
            $table->boolean('notificacao_marketplace')->default(0);
            $table->boolean('notificacao_ecommerce')->default(0);
            $table->boolean('tipo_contador')->default(0);

            /* Criação dos campos para envio de email dentro do usuário */
            $table->string('nome_email',50)->default('');
            $table->string('host_email',50)->default('');
            $table->string('envio_email',50)->default('');
            $table->string('senha_email',50)->default('');
            $table->string('porta_email',50)->default('');
            $table->enum('criptograma_email', ['ssl', 'tls']);
            $table->boolean('autenticacao_email')->default(0);
            $table->boolean('smtp_debug')->default(0);

            /* Criado configuração para setar o nome da impressora que será impresso.*/
            $table->string('nome_impressora',100)->default('');
            // alter table users add column nome_impressora varchar(50) default '' after smtp_debug;
            /*
             * // alter table users add column telefone varchar(50) default '' after password;
             * */
            // alter table users add column nome_email varchar(50) default '' after tipo_contador;
            // alter table users add column host_email varchar(50) default '' after host_email;
            // alter table users add column envio_email varchar(50) default '' after host_email;
            // alter table users add column senha_email varchar(50) default '' after envio_email;
            // alter table users add column porta_email varchar(50) default '' after senha_email;
            // alter table users add column criptograma_email enun(['ssl', 'tls']) after porta_email;
            // alter table users add column autenticacao_email boolean default 0 after criptograma_email;
            // alter table users add column smtp_debug boolean default 0 after autenticacao_email;




            $table->rememberToken();
            $table->timestamps();

            // alter table users add column imagem varchar(25) default '';
            // alter table users add column admin boolean default 1;
            // alter table users add column sidebar_active boolean default 1;
            // alter table users add column notificacao_cardapio boolean default 0;
            // alter table users add column notificacao_marketplace boolean default 0;
            // alter table users add column notificacao_ecommerce boolean default 0;
            // alter table users add column tipo_contador boolean default 0;



        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
