<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProdutoFornecedor extends Model
{
    use HasFactory;

    protected $fillable = [
        'empresa_id',
        'produto_id',
        'fornecedor_id',
        'nr_referencia',
        'nr_nota_fiscal',
        'un_estoque',
        'qt_estoque',
        'un_original',
        'qt_original',
    ];

    public function empresa()
    {
        return $this->hasMany(Empresa::class, 'empresa_id');
    }

    public function produto()
    {
        return $this->hasMany(Produto::class, 'produto_id');
    }

    public function fornecedor()
    {
        return $this->belongsTo(Fornecedor::class, 'fornecedor_id');
    }

    public static function verificaCadastrado($fornecedor_id, $produto_id, $empresa_id)
    {
        $prod = null;

        $prod = ProdutoFornecedor::where('fornecedor_id', $fornecedor_id)
            ->where('nr_referencia', $produto_id)
            ->where('empresa_id', $empresa_id)->first();
        if ($prod){
            return $prod;
        }else{
            return null;
        }
    }

    public static function cadastrarProdutoFornecedor(
        $fornecedor_id, $produto_id, $empresa_id, $un_produto, $un_original, $nr_nota_fiscal, $nr_referencia){

        ProdutoFornecedor::create([
            'empresa_id' => $empresa_id,
            'fornecedor_id' => $fornecedor_id,
            'produto_id' => $produto_id,
            'un_estoque' => $un_produto,
            'un_original' => $un_original,
            'nr_nota_fiscal' => $nr_nota_fiscal,
            'nr_referencia' => $nr_referencia,
            'qt_estoque' => 0,
            'qr_original' => 0,
        ]);
    }
}
