var files = 1

function addFile() {
    files++
    var html = $('<br/><input type="file" name="file' + files + '" id="file' + files + '" />')
    html.one('change', addFile)
    $('#uploads').append(html)
}

$(function () {
    $('#file1').one('change', addFile)
})