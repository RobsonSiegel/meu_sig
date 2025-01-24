$(function(){
	// alert('oi')
	intervalVar = setInterval(() => {
		notificacoesEcommerce()
	}, 5000)
})

function notificacoesEcommerce(){

	$('.control-loading').remove("div");
	if($('#modals-notificacao-ecommerce').is(':visible')){
	}else{

		$.get(path_url + "api/notificacoes-ecommerce", {empresa_id: $('#empresa_id').val()})
		.done((success) => {
			if(success.length > 1){
				var audio = new Audio('/audio/song3.wav');
				audio.addEventListener('canplaythrough', function() {
					audio.play();
				});
				$('#modals-notificacao-ecommerce').modal('show')
				$('#modals-notificacao-ecommerce .modals-body').html(success)
			}
		})
		.fail((err) => {
			if(err.status != 401){
				// swal("erro", "erro ao buscar notificações", "error")
			}
		})
	}
	setTimeout(() => {
		$('.control-loading').add('<div class="modals-loading loading-class"></div>')
	}, 100)
}

$('body').on('click', '.btn-set-status', function () {
	let id = $(this).prev().val()

	$.post(path_url + "api/notificacoes-set-status", {id: id})
	.done((success) => {
		$('#modals-notificacao').modal('hide')
		if(success.tipo == 'fechar_mesa'){
			if(success.pedido){
				location.href = '/pedidos-cardapio/'+success.pedido.id
			}
		}

	})
	.fail((err) => {
		console.log(err)
	})
});
