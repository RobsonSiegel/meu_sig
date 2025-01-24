<?php


namespace App\Utils;


use Illuminate\Support\Facades\Http;

class ImpressaoAutoUtil{

    public function imprimeNFCe($pdf, $identificador){

        if (!$identificador){
            $identificador = 'SIG001';
        }

        //Converte o aruqivo para Array
        $data = [
            'type' => 'pdf',
            'data' => base64_encode($pdf)
        ];

        //Converte em Json para enviar a API da Dualden
        $data = json_encode($data);

        //Envia para a API
        $response = Http::post('https://www.dualden.com/api/auto-print-sig', [
            'identifier' => $identificador,
            'message' => $data,
        ]);

        if ($response->successful()) {
            return 'OK';
        }else{
            return 'error: ' . $response->json()['message'];
        }

    }
}
