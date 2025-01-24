<!-- Modal para exibir produtos, sequências e setores -->
<div class="modal fade" id="modalSequencia" tabindex="-1" aria-labelledby="modalSequenciaLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalSequenciaLabel">Setores da Sequência de Produção</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>Descrição do Produto</th>
                        <th>Sequência de Produção</th>
                        <th>Setores</th>
                    </tr>
                    </thead>
                    <tbody>
                    @if(session('itens_com_sequencia'))
                    @foreach(session('itens_com_sequencia') as $item)
                    @foreach($item['sequencias'] as $sequencia)
                    <tr>
                        <td>{{ $item['produto'] }}</td>
                        <td>{{ $sequencia['sequencia'] }}</td>
                        <td>
                            <ul>
                                @foreach($sequencia['setores'] as $setor)
                                <li>{{ $setor }}</li>
                                @endforeach
                            </ul>
                        </td>
                    </tr>
                    @endforeach
                    @endforeach
                    @endif
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
            </div>
        </div>
    </div>
</div>
