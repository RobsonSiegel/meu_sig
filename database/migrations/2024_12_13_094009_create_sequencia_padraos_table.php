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
        Schema::create('sequencia_padraos', function (Blueprint $table) {
            $table->id();

            $table->foreignId('empresa_id')->nullable()->constrained('empresas');

            $table->string('nome', 100);
            $table->boolean('status')->default(1);
            $table->text('setores_id');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sequencia_padraos');
    }
};
