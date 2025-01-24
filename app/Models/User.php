<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, HasRoles;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'telefone',
        'imagem',
        'admin',
        'notificacao_cardapio',
        'tipo_contador',
        'notificacao_marketplace',
        'notificacao_ecommerce',

        /* configuração de email */
        'nome_email',
        'host_email',
        'envio_email',
        'senha_email',
        'porta_email',
        'criptograma_email',
        'autenticacao_email',
        'smtp_debug',

        /* Configuração para impressão de cupom automatica */
        'nome_impressora',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];

    public function empresa()
    {
        return $this->hasOne(UsuarioEmpresa::class, 'usuario_id');
    }

    public function empresaSuper()
    {
        return $this->hasMany(Empresa::class, 'nome');
    }

    public function acessos()
    {
        return $this->hasMany(AcessoLog::class, 'usuario_id')->orderBy('id', 'desc');
    }

    public function locais()
    {
        return $this->hasMany(UsuarioLocalizacao::class, 'usuario_id');
    }

    public function getImgAttribute()
    {
        if ($this->imagem == "") {
            return "/imgs/no-image.png";
        }
        return "/uploads/usuarios/$this->imagem";
    }

    public function getAuthPassword()
    {
        return $this->password;
    }
}
