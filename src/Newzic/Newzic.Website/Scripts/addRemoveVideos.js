var videos = [];
var contador = 0;
var listaRemoveVideos = [];

function handler_insereVideo() {
    var link = $('#textBoxVideos')[0].value;
    $('#textBoxVideos')[0].value = "";
    adicionaVideo(link);
    $('#link0')[0].value++;
}

function adicionaVideo(linkHTML) {
    //por alguma razao o numId soma como string... fica 1+1 fika 11 em vez de 2
    var numId = 0;
    numId = contador + 1;
    numId++;
    var id = '"link' + numId + '"';
    var novoLink = '<input id=' + id + ' name=' + id + ' value="' + linkHTML + '"' + ' style="display: none" />';
    $('#linksVideos').append(novoLink);
    $('#link' + numId)[0].value = linkHTML;
    var videoHTML = '<div id = "video' + numId + '">' +
                    '<object width="280" height="225">' +
                                '<param name="movie" value="' + linkHTML + '"></param>' +
                                '<param name="allowFullScreen" value="true"></param>' +
                                '<param name="allowscriptaccess" value="always"></param>' +
                                '<embed src="' + linkHTML + '"' +
                                'type="application/x-shockwave-flash"' +
                                'allowscriptaccess="always"' +
                                'allowfullscreen="true"' +
                                'width="280" height="225"></embed>' +
                                '</object>' + '<br />' +
                                '<input id="removeVideo' + numId + '" type="button" value="Remover" />' +
                                '</div>';
    $('#videos').append(videoHTML);
    contador++;
    $('#removeVideo' + numId).click(function () {

        $('#video' + numId).fadeOut();
        $('#link' + numId)[0].value = "";
    });

}

function carregaVideo(linkHTML, numId) {
    var videoHTML = '<div id = "video' + numId + '">' +
                    '<object width="280" height="225">' +
                                '<param name="movie" value="' + linkHTML + '"></param>' +
                                '<param name="allowFullScreen" value="true"></param>' +
                                '<param name="allowscriptaccess" value="always"></param>' +
                                '<embed src="' + linkHTML + '"' +
                                'type="application/x-shockwave-flash"' +
                                'allowscriptaccess="always"' +
                                'allowfullscreen="true"' +
                                'width="280" height="225"></embed>' +
                                '</object>' + '<br />' +
                                '<input id="removeVideo' + numId + '" type="button" value="Remover" />' +
                                '</div>';
    $('#videos').append(videoHTML);
    $('#removeVideo' + numId).click(function () {
        $('#video' + numId).fadeOut();
        $('#removeListaVideos')[0].value += $('#link' + numId)[0].value + ';';
        $('#link' + numId)[0].value = "";
    });
}

function carregaVideos() {
    contador = $('#link0')[0].value;
    for (var i = 1; i <= contador; i++) {
        var id = '#link' + i;
        var videoHTML = $(id)[0].value;
        carregaVideo(videoHTML, i);
    }
}

function initVideos() {
    carregaVideos();
    $('#inserirVideo').click(handler_insereVideo);

}

function initVideos2() {
    $('#inserirVideo').click(handler_insereVideo);
}
