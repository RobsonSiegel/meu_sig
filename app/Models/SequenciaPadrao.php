<?php

namespace App\Models;

use App\Http\Controllers\SetoresSequenciaPadraoController;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SequenciaPadrao extends Model
{
    use HasFactory;

    protected $fillable = [
        'empresa_id','status', 'nome',
    ];


    public function setores()
    {
        return $this->hasMany(SetoresSequenciaPadrao::class, 'sequencia_id');
    }

}
