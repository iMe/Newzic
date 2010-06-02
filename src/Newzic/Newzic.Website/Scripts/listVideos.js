var contador = 0;
var arrayListaVideos = [];
var stringComTodosOsVideos = "";

function geraStringListaVideos() {
    var i = 0;
    for (i = 0; i < arrayListaVideos.length; i++)
        stringComTodosOsVideos += arrayListaVideos[i] + ";";
    
}

function guardaStringListaVideos() {
    geraStringListaVideos();
    $('#stringListaVideos')[0].value = stringComTodosOsVideos;
    stringComTodosOsVideos = "";
}

function addListaVideos() {
    
    var text = document.getElementById("textBoxVideos").value;
    if (text == "")
        alert("Insira o link do video!");
    else {
        document.getElementById("selectListVideos").size += 1;
        var novaOpcao = $("<option id=" + "slv" + contador + ">" + text + "</option>");
        $('#selectListVideos').append(novaOpcao);
        arrayListaVideos.push(text);
        guardaStringListaVideos();
        contador++;
        if (contador <= 1)
            $('#selectListVideos').slideDown();
    }
}

function comecaAccaoVideo() {
    $('#inserirVideo').click(addListaVideos);
}

$(document).ready(comecaAccaoVideo);
