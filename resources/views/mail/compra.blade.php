<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<h2>Envio de Ordem de Compra</h2>

	<p>Olá <strong>{{ $compra->fornecedor->razao_social }},</strong></p>
    <p>Segue em anexo ordem de compra nº {{$compra->id}}. Favor confirmar o recebimento e aceite.

	<p>Att, {{ $compra->empresa->nome }}</p>
</body>
</html>
