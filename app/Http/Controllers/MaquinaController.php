<?php

namespace App\Http\Controllers;

use App\Models\Maquina;
use App\Models\Setor;
use Illuminate\Http\Request;

class MaquinaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $item = Maquina::where('empresa_id', $request->empresa_id)->get();
        $data = $item;
        return view('maquinas.index', compact('item', 'data'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $setores = Setor::where('empresa_id', request()->empresa_id)->get();
        return view('maquinas.create', compact('setores'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try {
            Maquina::create($request->all());
            session()->flash('flash_success', 'Cadastrado com sucesso');
        } catch (\Exception $e) {
            session()->flash('flash_error', 'Algo deu errado' . $e->getMessage());
        }
        return redirect()->route('maquinas.index');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $item = Maquina::findOrFail($id);
        $setores = Setor::where('empresa_id', request()->empresa_id)->get();
        __validaObjetoEmpresa($item);
        return view('maquinas.edit', compact('item', 'setores'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $item = Maquina::findOrFail($id);
        __validaObjetoEmpresa($item);
        try {
            $item->fill($request->all())->save();
            session()->flash('flash_success', 'Alterado com sucesso');
        } catch (\Exception $e) {
            session()->flash('flash_error', 'Algo deu errado: ' . $e->getMessage());
        }
        return redirect()->route('maquinas.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $item = Maquina::findOrFail($id);
        __validaObjetoEmpresa($item);
        try {
            $item->delete();
            session()->flash('flash_success', 'Removido com sucesso');
        } catch (\Exception $e) {
            session()->flash('flash_warning', 'Este maquina esta sendo usada em alguma OS');
        }
        return redirect()->route('maquinas.index');
    }

    public function destroySelecet(Request $request)
    {
        $removidos = 0;
        for ($i = 0; $i < sizeof($request->item_delete); $i++) {
            $item = Maquina::findOrFail($request->item_delete[$i]);
            try {
                $item->delete();
                $removidos++;
            } catch (\Exception $e) {
                session()->flash("flash_error", 'Algo deu errado: ' . $e->getMessage());
                return redirect()->route('maquinas.index');
            }
        }

        session()->flash("flash_success", "Total de itens removidos: $removidos!");
        return redirect()->route('maquinas.index');
    }
}
