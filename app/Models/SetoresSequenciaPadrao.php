<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SetoresSequenciaPadrao extends Model
{
    use HasFactory;

    protected $fillable = [
        'empresa_id','setor_id', 'sequencia_id'
    ];


    public function setor()
    {
        return $this->belongsTo(Setor::class, 'setor_id', 'id');
    }



}
