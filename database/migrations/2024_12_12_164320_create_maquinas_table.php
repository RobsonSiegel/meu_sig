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
        Schema::create('maquinas', function (Blueprint $table) {
            $table->id();

            $table->foreignId('empresa_id')->nullable()->constrained('empresas');
            $table->foreignId('setor_id')->nullable()->constrained('setors');

            $table->string('nome', 100);
            $table->boolean('status')->default(1);
            $table->boolean('movimenta_estoque')->default(0);
            $table->string('tipo_processo', 2)->default(01);
            $table->decimal('valor_hora', 10, 4)->default(0);

            $table->timestamps();

            // alter table maquinas add column movimenta_estoque boolean default 0 after valor_hora;
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('maquinas');
    }
};
