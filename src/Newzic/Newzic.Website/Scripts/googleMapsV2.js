﻿var listenerMap;
var htmlText;
var mapa;
var arrayPontos = [];
var stringHTML;
var stringComTodosOsPontos;
var flagRemove;

function criaNovoMarco(latitude, longitude, titulo, corpo) {

    var novoPonto = new GLatLng(latitude, longitude);
    var novoMarcador;
    if (flagRemove == 1)
        novoMarcador = new GMarker(novoPonto, { draggable: true, bouncy: true });
    else
        novoMarcador = new GMarker(novoPonto, { draggable: false, bouncy: true });
    mapa.addOverlay(novoMarcador);
    var aux;
    if (flagRemove == 1)
       aux = $("<div><h3><U>" + titulo + "</U></h3>" + "<p>" + corpo + "</p><a href=''>Remover</a></div>");
    else
       aux = $("<div><h3><U>" + titulo + "</U></h3>" + "<p>" + corpo + "</p></div>");
    stringHTML = (titulo + "§" + corpo);
    novoMarcador.bindInfoWindow(aux[0]);
    novoMarcador.textoHTML = stringHTML;
    arrayPontos.push(novoMarcador);
    aux.find('a').click(function (evento) {
        mapa.removeOverlay(novoMarcador);
        evento.preventDefault();
        var i = 0;
        for (i = 0; i < arrayPontos.length; i++)
            if (arrayPontos[i] === novoMarcador) {
                arrayPontos.splice(i, 1);
                var str = ("Foi removido o balao " + (i + 1));

            }
    });
}

function preencheInputComAString() {
    transformaArrayPontoEmString();
    $('#stringComMarcos')[0].value = stringComTodosOsPontos;
}

function transformaArrayPontoEmString() {
    var i = 0;
    stringComTodosOsPontos = "";
    for (i = 0; i < arrayPontos.length; i++) {
        var gMarker = arrayPontos[i];
        var latlong = gMarker.getLatLng();

        var latitude = latlong.lat();
        var longitude = latlong.lng();
        var texto = arrayPontos[i].textoHTML;
        stringComTodosOsPontos += (latitude + "§" + longitude + "§" + texto + "§");
    }
}

function limpaFormulario() {
    $('#textTituloBalao')[0].value = "";
    $('#textCorpoBalao')[0].value = "";
}

function handlerMouseDownMarcador(marcador) {
    marcador.closeInfoWindow();
}

function handlerMap(unused, ponto, unused2) {
    GEvent.removeListener(listenerMap);
    var novoMarcador = new GMarker(ponto, { draggable: true, bouncy: true });

    mapa.addOverlay(novoMarcador);
    novoMarcador.bindInfoWindow(htmlText[0]);
    novoMarcador.textoHTML = stringHTML;
    arrayPontos.push(novoMarcador);
    htmlText.find('a').click(function (evento) {
        mapa.removeOverlay(novoMarcador);
        evento.preventDefault();
        var i = 0;
        for (i = 0; i < arrayPontos.length; i++)
            if (arrayPontos[i] === novoMarcador) {
                arrayPontos.splice(i, 1);
                var str = ("Foi removido o balao " + (i + 1));

            }
    });
    GEvent.addListener(novoMarcador, 'mousedown', function () { handlerMouseDownMarcador(novoMarcador) });
    handler_dadosMarco_fadeOut();
    limpaFormulario();
}

function handlerInsereDados() {
    var titulo = $('#textTituloBalao')[0].value;
    var corpo = $('#textCorpoBalao')[0].value;
    if (titulo == "" || corpo == "") {
        alert("Preencha ambos os campos");
    }
    else {
        htmlText = $("<div><h3><U>" + titulo + "</U></h3>" + "<p>" + corpo + "</p><a href=''>Remover</a></div>");
        //stringHTML = ("<div><h3><U>" + titulo + "</U></h3>" + "<p>" + corpo + "</p><a href=''>Remover</a></div>");
        stringHTML = (titulo + "§" + corpo);
        alert("Pode inserir o marcador no sitio desejado");
        listenerMap = GEvent.addListener(mapa, 'click', handlerMap);
    }
    //Clicke no mapa onde pretende inserir o ponto.
}

function handler_dadosMarco_fadeIn() {
    $('#dadosBalao').slideDown();
}

function handler_dadosMarco_fadeOut() {
    $('#dadosBalao').slideUp();
}

function carregaPontosCaixas() {
    var objecto = $('#countMarcos')[0];
    if (objecto != null) {
        var countMarcos = objecto.value;

        for (var i = 0; i < countMarcos; i++) {

            var latitude = parseFloat($('#latitude' + i)[0].value);
            var longitude = parseFloat($('#longitude' + i)[0].value);
            var titulo = $('#titulo' + i)[0].value;
            var corpo = $('#corpo' + i)[0].value;
            criaNovoMarco(latitude, longitude, titulo, corpo);
        }
    }
}

function main() {
    flagRemove = 1;
    var latitude = 41.55;
    var longitude = -8.3333;
    var zoom = 8;
    $('#mapaGoogle').width(600).height(500);
    mapa = new GMap2($('#mapaGoogle')[0]);
    var pontoInicial = new GLatLng(latitude, longitude);
    mapa.setCenter(pontoInicial, zoom);
    mapa.addControl(new GLargeMapControl());
    mapa.addControl(new GMapTypeControl());
    mapa.enableGoogleBar();
    carregaPontosCaixas();
    $('#dadosMarcoFadeOut').click(handler_dadosMarco_fadeOut);
    $('#dadosMarcoFadeIn').click(handler_dadosMarco_fadeIn);
    $('#botaoSubmeter').click(handlerInsereDados);
    $('#botaoAdicionaStringComMarcos').click(preencheInputComAString);
}

function mainShow() {
    flagRemove = 0;
    var latitude = 41.55;
    var longitude = -8.3333;
    var zoom = 8;
    $('#mapaGoogle').width(600).height(500);
    mapa = new GMap2($('#mapaGoogle')[0]);
    var pontoInicial = new GLatLng(latitude, longitude);
    mapa.setCenter(pontoInicial, zoom);
    mapa.addControl(new GLargeMapControl());
    mapa.addControl(new GMapTypeControl());
    mapa.enableGoogleBar();
    carregaPontosCaixas();
}

