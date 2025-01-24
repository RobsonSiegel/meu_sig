<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CategoriaProduto extends Model
{
    use HasFactory;

    protected $fillable = [
        'empresa_id',
        'nome',
        'cardapio',
        'nome_en',
        'nome_es',
        'tipo_pizza',
        'delivery',
        'ecommerce',
        'chapas',
        'sequencia_id',
        'hash_ecommerce',
        'hash_delivery'
    ];

    public function produtos(){
        return $this->hasMany(Produto::class, 'categoria_id')->with(['pizzaValores', 'categoria'])->where('status', 1);
    }

    public function produtosDelivery(){
        return $this->hasMany(Produto::class, 'categoria_id')->with(['pizzaValores', 'categoria'])->where('status', 1)
        ->where('delivery', 1);
    }

    public function sequencia(){
        return $this->belongsTo(SequenciaPadrao::class, 'sequencia_id', 'id');
    }
}
