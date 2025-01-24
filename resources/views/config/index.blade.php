@extends('layouts.app', ['title' => 'Configuração da Empresa'])
<!-- Meta Pixel Code -->
<script>
    !function(f,b,e,v,n,t,s)
    {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
        n.callMethod.apply(n,arguments):n.queue.push(arguments)};
        if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
        n.queue=[];t=b.createElement(e);t.async=!0;
        t.src=v;s=b.getElementsByTagName(e)[0];
        s.parentNode.insertBefore(t,s)}(window, document,'script',
        'https://connect.facebook.net/en_US/fbevents.js');
    fbq('init', '1855409168195558');
    fbq('track', 'PageView');
</script>
<noscript><img height="1" width="1" style="display:none"
               src="https://www.facebook.com/tr?id=1855409168195558&ev=PageView&noscript=1"
    /></noscript>
<!-- End Meta Pixel Code -->
@section('content')

<div class="card mt-1">
    <div class="card-header">
        <h4>Configuração da Empresa</h4>
        <div style="text-align: right; margin-top: -35px;">
            <a href="{{ route('empresas.index') }}" class="btn btn-danger btn-sm px-3">
                <i class="ri-arrow-left-double-fill"></i>Voltar
            </a>
        </div>
    </div>
    <div class="card-body">
        {!!Form::open()->fill($empresa)
        ->post()
        ->route('config.store')
        ->multipart()
        !!}
        <div class="pl-lg-4">

            @isset($empresa->id)
            @include('config.edit')
            @else
            @include('empresas._forms')
            @endisset
        </div>
        {!!Form::close()!!}
    </div>
</div>
@endsection
