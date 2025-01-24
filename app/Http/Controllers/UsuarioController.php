<?php

namespace App\Http\Controllers;

use App\Models\Empresa;
use App\Models\User;
use App\Models\Role;
use App\Models\UsuarioEmpresa;
use App\Models\UsuarioLocalizacao;
use App\Utils\MailUtil;
use App\Utils\UploadUtil;
use GuzzleHttp\Promise\Create;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use PHPMailer\PHPMailer\Exception;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;

class UsuarioController extends Controller
{
    protected $util;
    protected $mailUtil;


    public function __construct(UploadUtil $util, MailUtil $mailUtil)
    {
        $this->util = $util;
        $this->mailUtil = $mailUtil;
        $this->middleware('permission:usuarios_create', ['only' => ['create', 'store']]);
        $this->middleware('permission:usuarios_edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:usuarios_view', ['only' => ['show', 'index']]);
        $this->middleware('permission:usuarios_delete', ['only' => ['destroy']]);
    }

    public function index(Request $request)
    {
        $data = User::where('usuario_empresas.empresa_id', request()->empresa_id)
            ->join('usuario_empresas', 'users.id', '=', 'usuario_empresas.usuario_id')
            ->select('users.*')
            ->when(!empty($request->name), function ($q) use ($request) {
                return $q->where(function ($quer) use ($request) {
                    return $quer->where('name', 'LIKE', "%$request->name%");
                });
            })
            ->paginate(env("PAGINACAO"));

        return view('usuarios.index', compact('data'));
    }

    public function create(Request $request)
    {
        $roles = Role::orderBy('name', 'desc')
            ->where('empresa_id', $request->empresa_id)
            ->get();
        return view('usuarios.create', compact('roles'));
    }

    public function edit(Request $request, $id)
    {
        $item = User::findOrFail($id);
        __validaObjetoEmpresa($item);

        $roles = Role::orderBy('name', 'desc')
            ->where('empresa_id', $request->empresa_id)
            ->get();
        return view('usuarios.edit', compact('item', 'roles'));
    }

    public function store(Request $request)
    {
        try {
            $file_name = '';
            if ($request->hasFile('image')) {
                $file_name = $this->util->uploadImage($request, '/usuarios');
            }
            $request->merge([
                'password' => Hash::make($request['password']),
                'telefone' => $request['telefone'] ? $request['telefone'] : '',
                'imagem' => $file_name,
                'nome_email' => $request['nome_email'] ? $request['nome_email'] : '',
                'host_email' => $request['host_email'] ? $request['host_email'] : '',
                'envio_email' => $request['envio_email'] ? $request['envio_email'] : '',
                'senha_email' => $request['senha_email'] ? $request['senha_email'] : '',
                'porta_email' => $request['porta_email'] ? $request['porta_email'] : '',
                'criptograma_email' => $request['criptograma_email'] ? $request['criptograma_email'] : 'ssl',
                'autenticacao_email' => $request['autenticacao_email'] ? $request['autenticacao_email'] : 0,
                'smtp_debug' => $request['smtp_debug'] ? $request['smtp_debug'] : 0,
                'nome_impressora' => $request['nome_impressora'] ? $request['nome_impressora'] : '',

            ]);

            $usuario = User::create($request->all());

            UsuarioEmpresa::create([
                'empresa_id' => $request->empresa_id,
                'usuario_id' => $usuario->id
            ]);

            $role = Role::findOrFail($request->role_id);
            $usuario->assignRole($role->name);

            if (isset($request->locais)) {
                for ($i = 0; $i < sizeof($request->locais); $i++) {
                    UsuarioLocalizacao::updateOrCreate([
                        'usuario_id' => $usuario->id,
                        'localizacao_id' => $request->locais[$i]
                    ]);
                }
            }

            session()->flash("flash_success", "Usuário cadastrado!");
        } catch (\Exception $e) {
            session()->flash("flash_error", "Algo deu errado: " . $e->getMessage());
        }
        return redirect()->route('usuarios.index');
    }

    public function update(Request $request, $id)
    {
        $usuario = User::findOrFail($id);
        try {
            $file_name = $usuario->imagem;

            if ($request->hasFile('image')) {
                $this->util->unlinkImage($usuario, '/usuarios');
                $file_name = $this->util->uploadImage($request, '/usuarios');
            }
            if ($request->password) {
                $request->merge([
                    'password' => Hash::make($request->password),
                    'telefone' => $request['telefone'] ? $request['telefone'] : '',
                    'imagem' => $file_name,
                    'nome_email' => $request['nome_email'] ? $request['nome_email'] : '',
                    'host_email' => $request['host_email'] ? $request['host_email'] : '',
                    'envio_email' => $request['envio_email'] ? $request['envio_email'] : '',
                    'senha_email' => $request['senha_email'] ? $request['senha_email'] : '',
                    'porta_email' => $request['porta_email'] ? $request['porta_email'] : '',
                    'criptograma_email' => $request['criptograma_email'] ? $request['criptograma_email'] : 'ssl',
                    'autenticacao_email' => $request['autenticacao_email'] ? $request['autenticacao_email'] : 0,
                    'smtp_debug' => $request['smtp_debug'] ? $request['smtp_debug'] : 0,
                    'nome_impressora' => $request['nome_impressora'] ? $request['nome_impressora'] : '',
                ]);
            } else {
                $request->merge([
                    'password' => $usuario->password,
                    'imagem' => $file_name,
                    'nome_email' => $request['nome_email'] ? $request['nome_email'] : '',
                    'host_email' => $request['host_email'] ? $request['host_email'] : '',
                    'envio_email' => $request['envio_email'] ? $request['envio_email'] : '',
                    'senha_email' => $request['senha_email'] ? $request['senha_email'] : '',
                    'porta_email' => $request['porta_email'] ? $request['porta_email'] : '',
                    'criptograma_email' => $request['criptograma_email'] ? $request['criptograma_email'] : 'ssl',
                    'autenticacao_email' => $request['autenticacao_email'] ? $request['autenticacao_email'] : 0,
                    'smtp_debug' => $request['smtp_debug'] ? $request['smtp_debug'] : 0,
                    'nome_impressora' => $request['nome_impressora'] ? $request['nome_impressora'] : '',


                ]);
            }
            $usuario->fill($request->all())->save();

            $role = Role::findOrFail($request->role_id);
            $user_role = $usuario->roles->first();
            foreach ($usuario->roles as $r) {
                $usuario->removeRole($r->name);
            }
            $usuario->assignRole($role->name);

            if (isset($request->locais)) {
                $usuario->locais()->delete();
                for ($i = 0; $i < sizeof($request->locais); $i++) {
                    UsuarioLocalizacao::updateOrCreate([
                        'usuario_id' => $usuario->id,
                        'localizacao_id' => $request->locais[$i]
                    ]);
                }
            }
            session()->flash("flash_success", "Usuário alterado!");
        } catch (\Exception $e) {
            session()->flash("flash_error", "Algo deu errado: " . $e->getMessage());
        }
        return redirect()->route('usuarios.index');
    }

    public function destroy($id)
    {
        $item = User::findOrFail($id);
        __validaObjetoEmpresa($item);

        try {
            $item->empresa->delete();
            $item->delete();
            session()->flash("flash_success", "Apagado com sucesso!");
        } catch (\Exception $e) {
            session()->flash("flash_error", "Algo deu errado: " . $e->getMessage());
        }
        return redirect()->route('usuarios.index');
    }

    public function profile($id)
    {
        $item = User::findOrFail($id);
        return view('usuarios.profile', compact('item'));
    }

    public function show($id)
    {
        if (!__isAdmin()) {
            session()->flash("flash_error", "Acesso permitido somente para administradores");
            return redirect()->back();
        }
        $item = User::findOrFail($id);
        return view('usuarios.show', compact('item'));
    }

    public function teste($id)
    {
        $mail = $this->mailUtil->enviarEmailTeste($id);
        if ($mail){
            session()->flash("flash_success", "Enviado com sucesso!");
            return redirect()->back();
        }else{
            session()->flash("flash_error", "Algo deu errado:  {$mail->ErrorInfo}!");
            return redirect()->back();
        }

    }
}
