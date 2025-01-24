<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AcaoLog extends Model
{
    use HasFactory;

    protected $fillable = [
        'empresa_id', 'local', 'acao', 'descricao'
    ];

    public function empresa(){
        return $this->belongsTo(Empresa::class, 'empresa_id');
    }

    public static function acoes(){
        return [
            '' => 'Selecione',
            'cadastrar' => 'cadastrar',
            'editar' => 'editar',
            'excluir' => 'excluir',
            'transmitir' => 'transmitir',
            'cancelar' => 'cancelar',
            'corrigir' => 'corrigir',
            'erro' => 'erro'
        ];
    }

    public static function locais(){
        return [
            '' => 'Selecione',
            'Produto' => 'Produto',
            'Categoria de Produto' => 'Categoria de Produto',
            'Estoque' => 'Estoque',
            'Variação de Produto' => 'Variação de Produto',
            'Lista de Preços' => 'Lista de Preços',
            'Padrão de Tributação' => 'Padrão de Tributação',
            'Marca' => 'Marca',
            'Modelo Etiqueta' => 'Modelo Etiqueta',
            'Transferência de Estoque' => 'Transferência de Estoque',
            'Categoria de Serviço' => 'Categoria de Serviço',
            'Serviço' => 'Serviço',
            'Ordem de Serviço' => 'Ordem de Serviço',
            'Ordem de Serviço - Serviço' => 'Ordem de Serviço - Serviço',
            'Ordem de Serviço - Produto' => 'Ordem de Serviço - Produto',
            'Agendamento' => 'Agendamento',
        ];
    }

}
