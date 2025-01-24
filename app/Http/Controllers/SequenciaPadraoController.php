<?php

namespace App\Http\Controllers;

use App\Models\SequenciaPadrao;
use App\Models\Setor;
use App\Models\SetoresSequenciaPadrao;
use Illuminate\Http\Request;

class SequenciaPadraoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $item = SequenciaPadrao::where('empresa_id', request()->empresa_id)->get();
        $data = $item;
        $setor = Setor::where('empresa_id', $request->empresa_id)->get();
        return view('sequencia_padrao.index', compact('item', 'data', 'setor'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $setores = Setor::where('empresa_id', request()->empresa_id)->get();
        return view('sequencia_padrao.create', compact('setores', ));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try {
            $setores = $request->setores;
            $data = [
                'empresa_id' => $request->empresa_id,
                'nome' => $request->nome,
                'status' => $request->status
            ];
            $sequencia = SequenciaPadrao::create($data);
            foreach ($setores as $setor) {
                $data = [
                    'setor_id' => $setor,
                    'sequencia_id' => $sequencia->id,
                    'empresa_id' => $request->empresa_id
                ];
                SetoresSequenciaPadrao::create($data);
            }
            session()->flash('flash_success', 'Cadastrado com sucesso');
        } catch (\Exception $e) {
            session()->flash('flash_error', 'Algo deu errado' . $e->getMessage());
        }
        return redirect()->route('seqpadrao.index');
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
        $item = SequenciaPadrao::findOrFail($id);
        $setoresSequencia = SetoresSequenciaPadrao::where('sequencia_id', $id)->get();
        $setores = Setor::all();
        return view('sequencia_padrao.edit', compact('item', 'setores', 'setoresSequencia'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $item = SequenciaPadrao::findOrFail($id);
        $setores = SetoresSequenciaPadrao::where('sequencia_id', $item->id)->get();
        __validaObjetoEmpresa($item);

        try {
            // Fiz desta forma para excluir todos os registros da Sequencia Padrão
            foreach ($setores as $setor){
                $setor->delete();
            }

            // Adiciona os novos Setores na Sequencia Padrão
            $novosSetores = $request->setores;
            foreach ($novosSetores as $setor) {

                $data = [
                    'setor_id' => $setor,
                    'sequencia_id' => $item->id,
                    'empresa_id' => $request->empresa_id
                ];

                SetoresSequenciaPadrao::create($data);
                $item->fill($request->all())->save();
            }

            session()->flash('flash_success', 'Alterado com sucesso');
        } catch (\Exception $e) {
            session()->flash('flash_error', 'Algo deu errado: ' . $e->getMessage());
        }
        return redirect()->route('seqpadrao.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $item = SequenciaPadrao::findOrFail($id);
        $setores = SetoresSequenciaPadrao::where('sequencia_id', $item->id)->get();
        __validaObjetoEmpresa($item);
        try {
            foreach ($setores as $setor) {
                $setor->delete();
            }
            $item->delete();
            session()->flash('flash_success', 'Removido com sucesso');
        } catch (\Exception $e) {
            session()->flash('flash_warning', 'Este maquina esta sendo usada em alguma OS');
        }
        return redirect()->route('seqpadrao.index');
    }

    public function destroySelecet(Request $request)
    {
        $removidos = 0;
        for ($i = 0; $i < sizeof($request->item_delete); $i++) {
            $item = SequenciaPadrao::findOrFail($request->item_delete[$i]);
            $setores = SetoresSequenciaPadrao::where('sequencia_id', $item->id)->get();
            try {
                foreach ($setores as $setor) {
                    $setor->delete();
                }
                $item->delete();
                $removidos++;
            } catch (\Exception $e) {
                session()->flash("flash_error", 'Algo deu errado: ' . $e->getMessage());
                return redirect()->route('seqpadrao.index');
            }
        }

        session()->flash("flash_success", "Total de itens removidos: $removidos!");
        return redirect()->route('seqpadrao.index');
    }
}
