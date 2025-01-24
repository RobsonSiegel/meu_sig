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
        Schema::create('produto_fornecedors', function (Blueprint $table) {
            $table->id();
            $table->foreignId('empresa_id')->nullable()->constrained('empresas');
            $table->foreignId('produto_id')->nullable()->constrained('produtos');
            $table->foreignId('fornecedor_id')->nullable()->constrained('fornecedors');

            $table->string('nr_referencia', 100);
            $table->string('nr_nota_fiscal', 100);

            $table->string('un_estoque', 20);
            $table->string('un_original', 20);

            $table->decimal('qt_estoque', 5,2)->default(0);
            $table->decimal('qt_original', 5,2)->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('produto_fornecedors');
    }
};
