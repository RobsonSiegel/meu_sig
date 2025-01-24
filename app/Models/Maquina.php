<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Maquina extends Model
{
    use HasFactory;

    protected $fillable = [
        'empresa_id', 'nome', 'status', 'valor_hora', 'tipo_processo', 'setor_id', 'movimenta_estoque'
    ];

    public function setor(){
        return $this->belongsTo(Setor::class, 'setor_id');
    }
    public static function getTipoProcesso(){

        return [
            '01' => 'Processo Interno',
            '02' => 'Processo Externo',
        ];
    }
}
