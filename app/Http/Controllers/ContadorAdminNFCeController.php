<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Nfce;
use App\Models\Empresa;
use NFePHP\DA\NFe\Danfce;

class ContadorAdminNFCeController extends Controller
{
    public function __construct(){
        if (!is_dir(public_path('zips'))) {
            mkdir(public_path('zips'), 0777, true);
        }
    }

    public function nfe(Request $request){
        $contador = Empresa::findOrFail(request()->empresa_id);
        $empresaSelecionada = $contador->empresa_selecionada;
        $start_date = $request->get('start_date');
        $end_date = $request->get('end_date');
        $estado = $request->get('estado');

        $data = Nfce::where('empresa_id', $empresaSelecionada)
        ->when(!empty($start_date), function ($query) use ($start_date) {
            return $query->whereDate('created_at', '>=', $start_date);
        })
        ->when(!empty($end_date), function ($query) use ($end_date,) {
            return $query->whereDate('created_at', '<=', $end_date);
        })
        ->when($estado != "", function ($query) use ($estado) {
            return $query->where('estado', $estado);
        })
        ->orderBy('created_at', 'desc')
        ->paginate(env("PAGINACAO"));

        $contXml = $this->preparaXmls($start_date, $end_date, $empresaSelecionada);
        return view('contador.nfce', compact('data', 'contXml'));
    }

    private function preparaXmls($start_date, $end_date, $empresaSelecionada){
        $data = Nfce::where('empresa_id', $empresaSelecionada)
        ->when(!empty($start_date), function ($query) use ($start_date) {
            return $query->whereDate('created_at', '>=', $start_date);
        })
        ->when(!empty($end_date), function ($query) use ($end_date,) {
            return $query->whereDate('created_at', '<=', $end_date);
        })
        ->where('estado', 'aprovado')
        ->get();

        $cont = 0;
        foreach($data as $item){
            if (file_exists(public_path('xml_nfce/') . $item->chave . '.xml')) {
                $cont++;
            }
        }
        return $cont;

    }

    public function downloadNFCe($id){
        $item = Nfce::findOrFail($id);

        if (file_exists(public_path('xml_nfce/') . $item->chave . '.xml')) {
            return response()->download(public_path('xml_nfce/') . $item->chave . '.xml');
        } else {
            session()->flash("flash_error", "Arquivo não encontrado");
            return redirect()->back();
        }
    }

    public function danfce($id){
        $item = Nfce::findOrFail($id);

        if (file_exists(public_path('xml_nfce/') . $item->chave . '.xml')) {
            $xml = file_get_contents(public_path('xml_nfce/') . $item->chave . '.xml');

            $danfe = new Danfce($xml, $item);
            $pdf = $danfe->render();
            return response($pdf)
            ->header('Content-Type', 'application/pdf');
        } else {
            session()->flash("flash_error", "Arquivo não encontrado");
            return redirect()->back();
        }
    }

    public function downloadZip(Request $request){
        $start_date = $request->get('start_date');
        $end_date = $request->get('end_date');

        $contador = Empresa::findOrFail(request()->empresa_id);
        $doc = preg_replace('/[^0-9]/', '', $contador->cpf_cnpj);
        $empresaSelecionada = $contador->empresa_selecionada;
        $data = Nfce::where('empresa_id', $empresaSelecionada)
        ->when(!empty($start_date), function ($query) use ($start_date) {
            return $query->whereDate('created_at', '>=', $start_date);
        })
        ->when(!empty($end_date), function ($query) use ($end_date,) {
            return $query->whereDate('created_at', '<=', $end_date);
        })
        ->where('estado', 'aprovado')
        ->get();
        $zip = new \ZipArchive();
        $zip_file = public_path('zips') . '/xml-'.$doc.'.zip';
        $zip->open($zip_file, \ZipArchive::CREATE | \ZipArchive::OVERWRITE);
        foreach($data as $item){
            if (file_exists(public_path('xml_nfce/') . $item->chave . '.xml')) {
                $filename = public_path('xml_nfce/') . $item->chave . '.xml';

                $zip->addFile($filename, $item->chave . '.xml');
            }
        }
        $zip->close();
        if (file_exists($zip_file)){
            return response()->download($zip_file, 'nfce_'.$doc.'.zip');
        }else{
            session()->flash("flash_error", "Arquivo não encontrado");
            return redirect()->back();
        }
    }
}
