<?php

namespace NFePHP\DA\NFe\Traits2;

/**
 * Bloco totais da NFCe
 */
trait TraitBlocoIV
{
    protected function blocoIV($y, $venda)
    {
        //$this->bloco4H = 13;

        //$aFont = ['font'=> $this->fontePadrao, 'size' => 7, 'style' => ''];
        //$this->pdf->textBox($this->margem, $y, $this->wPrint, $this->bloco4H, '', $aFont, 'T', 'C', true, '', false);

        $qtd = sizeof($this->venda->itens);
        $valor = $this->venda->total;
        if($this->isPreVenda){
            $valor = $this->venda->valor_total;
        }
        $valorTroca = 0;
        $valorCredito = 0;
        if($this->troca){
            $valorTroca = $this->troca->valor_troca - $this->troca->valor_original;
            $valorCredito = $this->troca->valor_original - $this->troca->valor_troca;
        }

        $desconto = $this->venda->desconto;
        $frete = 0;
        $bruto = $valor + $desconto - $frete;
        $aFont = ['font' => 'arial', 'size' => 10, 'style' => 'B'];
        $texto = "Qtde total de itens";
        $this->pdf->textBox(
            $this->margem,
            $y,
            $this->wPrint / 2,
            3,
            $texto,
            $aFont,
            'T',
            'L',
            false,
            '',
            false
        );
        $y1 = $this->pdf->textBox(
            $this->margem + $this->wPrint / 2,
            $y,
            $this->wPrint / 2,
            3,
            $qtd,
            $aFont,
            'T',
            'R',
            false,
            '',
            false
        );

        $texto = "Valor Total R$";
        $this->pdf->textBox(
            $this->margem,
            $y + $y1,
            $this->wPrint / 2,
            3,
            $texto,
            $aFont,
            'T',
            'L',
            false,
            '',
            false
        );
        $texto = number_format((float) $bruto, 2, ',', '.');
        $y2 = $this->pdf->textBox(
            $this->margem + $this->wPrint / 2,
            $y + $y1,
            $this->wPrint / 2,
            3,
            $texto,
            $aFont,
            'T',
            'R',
            false,
            '',
            false
        );

        $texto = "Desconto R$";
        $this->pdf->textBox(
            $this->margem,
            $y + $y1 + $y2,
            $this->wPrint / 2,
            3,
            $texto,
            $aFont,
            'T',
            'L',
            false,
            '',
            false
        );
        $texto = number_format((float) $desconto, 2, ',', '.');
        $y3 = $this->pdf->textBox(
            $this->margem + $this->wPrint / 2,
            $y + $y1 + $y2,
            $this->wPrint / 2,
            3,
            $texto,
            $aFont,
            'T',
            'R',
            false,
            '',
            false
        );

        if(!$this->isPreVenda){
            $texto = "Frete R$";
            $this->pdf->textBox(
                $this->margem,
                $y + $y1 + $y2 + $y3,
                $this->wPrint / 2,
                3,
                $texto,
                $aFont,
                'T',
                'L',
                false,
                '',
                false
            );
            $texto = number_format((float) $frete, 2, ',', '.');
            $y4 = $this->pdf->textBox(
                $this->margem + $this->wPrint / 2,
                $y + $y1 + $y2 + $y3,
                $this->wPrint / 2,
                3,
                $texto,
                $aFont,
                'T',
                'R',
                false,
                '',
                false
            );
        }else{
            $y4 = 0;
        }

        $fsize = 10;
        if ($this->paperwidth < 70) {
            $fsize = 8;
        }
        $aFont = ['font' => 'arial', 'size' => 10, 'style' => 'B'];

        if($valorCredito <= 0){
            $texto = "Valor a Pagar R$";
            $this->pdf->textBox(
                $this->margem,
                $y + $y1 + $y2 + $y3 + $y4,
                $this->wPrint / 2,
                3,
                $texto,
                $aFont,
                'T',
                'L',
                false,
                '',
                false
            );
            $texto = number_format((float) $valor, 2, ',', '.');
            if($valorTroca > 0){
                $texto = number_format((float) $valorTroca, 2, ',', '.');
            }
            $y4 = $this->pdf->textBox(
                $this->margem + $this->wPrint / 2,
                $y + $y1 + $y2 + $y3 + $y4,
                $this->wPrint / 2,
                3,
                $texto,
                $aFont,
                'T',
                'R',
                false,
                '',
                false
            );
        }else{
            $texto = "Valor de Crédito R$";
            $this->pdf->textBox(
                $this->margem,
                $y + $y1 + $y2 + $y3 + $y4,
                $this->wPrint / 2,
                3,
                $texto,
                $aFont,
                'T',
                'L',
                false,
                '',
                false
            );
            $texto = number_format((float) $valorCredito, 2, ',', '.');
            $y4 = $this->pdf->textBox(
                $this->margem + $this->wPrint / 2,
                $y + $y1 + $y2 + $y3 + $y4,
                $this->wPrint / 2,
                3,
                $texto,
                $aFont,
                'T',
                'R',
                false,
                '',
                false
            );
        }

        $this->pdf->dashedHLine($this->margem, $this->bloco4H + $y, $this->wPrint, 0.1, 30);
        return $this->bloco4H + $y;
    }
}
