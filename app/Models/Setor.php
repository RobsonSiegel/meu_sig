<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Setor extends Model
{
    use HasFactory;

    protected $fillable = [
        'nome', 'empresa_id', 'status'
    ];


    public function setoresSequenciaPadrao(){
        return $this->belongsTo(SetoresSequenciaPadrao::class, 'setor_id');
    }
}
