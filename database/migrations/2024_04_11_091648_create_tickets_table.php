<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('tickets', function (Blueprint $table) {
            $table->id();

            $table->foreignId('empresa_id')->nullable()->constrained('empresas');
            $table->string('assunto', 200);
            $table->enum('departa1mento', ['financeiro', 'suporte', 'treinamento']);
            $table->enum('status', ['aberto', 'respondida', 'resolvido', 'aguardando']);

            $table->timestamps();

//          alter table tickets
//          modify departamento enum ('financeiro', 'suporte', 'treinamento') not null;
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tickets');
    }
};
