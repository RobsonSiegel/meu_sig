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
        Schema::create('setores_sequencia_padraos', function (Blueprint $table) {
            $table->id();

            $table->foreignId('empresa_id')->nullable()->constrained('empresas');
            $table->foreignId('setor_id')->nullable()->constrained('setors');
            $table->foreignId('sequencia_id')->nullable()->constrained('sequencia_padraos');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('setores_sequencia_padraos');
    }
};
