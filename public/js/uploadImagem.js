function showPreview(event){
    if(event.target.files.length > 0){
        var src = URL.createObjectURL(event.target.files[0]);
        var preview = document.getElementById("file-ip-1-preview");
        preview.src = src;
        preview.style.display = "block";
    }
}

$('#btn-remove-imagem').click(() => {
    $('#file-ip-1').val('')
    $('#file-ip-1-preview').attr('src', '/imgs/no-image.png')
})

function showPreview2(event){
    if(event.target.files.length > 0){
        var src = URL.createObjectURL(event.target.files[1]);
        var preview = document.getElementById("file-ip-2-preview");
        preview.src = src;
        preview.style.display = "block";
    }
}

$('#btn-remove-imagem2').click(() => {
    $('#file-ip-2').val('')
    $('#file-ip-2-preview').attr('src', '/imgs/no-image.png')
})

// Função para mostrar a pré-visualização de imagens
function showPreviewLinha(event, index) {
    const input = event.target;
    const file = input.files[0];

    if (file && file.type.startsWith('image/')) {
        const reader = new FileReader();

        reader.onload = function (e) {
            // Atualiza o src do preview da linha correspondente
            $(`#file-ip-${index}-preview`).attr('src', e.target.result).show();
        };

        reader.readAsDataURL(file);
    } else {
        alert('Por favor, selecione uma imagem válida.');
    }

    if(event.target.files.length > 0){
        var src = URL.createObjectURL(event.target.files[0]);
        var preview = document.getElementById("file-ip-1-preview");
        preview.src = src;
        preview.style.display = "block";
    }
}
