<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\UsuarioEmpresa;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function setSidebar(Request $request){
        $user = User::findOrFail($request->usuario_id);
        $user->sidebar_active = !$user->sidebar_active;
        $user->save();
        return response()->json("", 200);
    }
}
