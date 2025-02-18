@extends('food.default', ['title' => 'SERVIÇOS'])

@section('content')

<div class="middle">
	<div class="container">
		<div class="row rowtitle hidden-xs hidden-sm">
			<div class="col-md-12">
				<div class="title-icon">
					<span>SERVIÇOS DA CATEGORIA</span>
				</div>
				
			</div>
			<div class="col-md-12 hidden-xs hidden-sm">
				<div class="clearline"></div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="search-bar-mobile visible-xs visible-sm">
					<form class="align-middle" method="GET" action="">
						<input type="text" name="busca" placeholder="Digite sua busca..." value="">
						<button>
							<i class="lni lni-search-alt"></i>
						</button>
						<div class="clear"></div>
					</form>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="tv-infinite tv-infinite-menu">
					<a class="" href="{{ route('food.index', ['link='.$config->loja_id]) }}">Início</a>
					@foreach($categorias as $c)
					@if($c->servicos && sizeof($c->servicos) > 0)
					<a class="" href="{{ route('food.servicos-categoria', [$c->hash_delivery, 'link='.$config->loja_id]) }}">{{ $c->nome }}</a>
					@endif
					@endforeach
				</div>
			</div>
		</div>
		<div class="categorias no-bottom-mobile">
			<div class="categoria no-bottom-mobile">
				<div class="row">
					<div class="col-md-6 col-sm-6 col-xs-6">
						<strong class="counter">{{ sizeof($servicos) }}</strong>
						<span class="title">Itens:</span>
					</div>
					
				</div>
				<div class="produtos">
					<div class="row tv-grid">
						@foreach($servicos as $s)
						<div class="col-md-3 col-sm-6 col-xs-6">
							<div class="produto">
								<a href="#!" onclick="carregaPagina('{{ route('servico-delivery.modal', [$s->hash_delivery]) }}')" title="lasanha media">
									<div class="capa" style="background: url('{{ $s->img  }}') no-repeat center center;">
										<span class="nome">{{ $s->nome }}</span>
									</div>
									
									
									<span class="valor" style="color:black">R$: {{ __moeda($s->valor) }}</span>
									<div class="detalhes"><i class="icone icone-sacola"></i> <span>Adicionar</span></div>
								</a>
							</div>
						</div>
						@endforeach
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


@endsection