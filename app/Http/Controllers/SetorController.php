<?php

namespace App\Http\Controllers;

use App\Models\Setor;
use Illuminate\Http\Request;

class SetorController extends Controller
{

    public function __construct()
    {
        $this->middleware('permission:setor_create', ['only' => ['create', 'store']]);
        $this->middleware('permission:setor_edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:setor_view', ['only' => ['show', 'index']]);
        $this->middleware('permission:setor_delete', ['only' => ['destroy']]);
    }
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $item = Setor::where('empresa_id', $request->empresa_id)
            ->get();
        $data = $item;
        return view('setores.index', compact('data', 'item'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('setores.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try {
            Setor::create($request->all());
            session()->flash('flash_success', 'Cadastrado com sucesso');
        } catch (\Exception $e) {
            session()->flash('flash_error', 'Algo deu errado' . $e->getMessage());
        }
        return redirect()->route('setor.index');
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
        $item = Setor::findOrFail($id);
        __validaObjetoEmpresa($item);
        return view('setores.edit', compact('item'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $item = Setor::findOrFail($id);
        __validaObjetoEmpresa($item);
        try {
            $item->fill($request->all())->save();
            session()->flash('flash_success', 'Alterado com sucesso');
        } catch (\Exception $e) {
            session()->flash('flash_error', 'Algo deu errado: ' . $e->getMessage());
        }
        return redirect()->route('setor.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $item = Setor::findOrFail($id);
        __validaObjetoEmpresa($item);
        try {
            $item->delete();
            session()->flash('flash_success', 'Removido com sucesso');
        } catch (\Exception $e) {
            session()->flash('flash_warning', 'Este setor esta sendo usada em alguma máquina');
        }
        return redirect()->route('setor.index');
    }

    public function destroySelecet(Request $request)
    {
        $removidos = 0;
        for($i=0; $i<sizeof($request->item_delete); $i++){
            $item = Setor::findOrFail($request->item_delete[$i]);
            try {
                $item->delete();
                $removidos++;
            } catch (\Exception $e) {
                session()->flash("flash_error", 'Algo deu errado: '. $e->getMessage());
                return redirect()->route('setor.index');
            }
        }

        session()->flash("flash_success", "Total de itens removidos: $removidos!");
        return redirect()->route('setor.index');
    }
}
