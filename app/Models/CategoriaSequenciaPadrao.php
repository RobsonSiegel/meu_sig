<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CategoriaSequenciaPadrao extends Model
{
    use HasFactory;

    protected $fillable = [
        'empresa_id', 'categoria_id', 'status', 'sequencia_id'
    ];


    public function categoria(){
        return $this->belongsTo(CategoriaProduto::class, 'categoria_id', 'id');
    }

    public function sequencia(){
        return $this->belongsTo(SequenciaPadrao::class, 'sequencia_id', 'id');
    }

}
