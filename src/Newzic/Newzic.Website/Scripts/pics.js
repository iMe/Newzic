var currentPic = 0

function updatePic() {
    $('#current-pic').attr('src', '/News/getImage/' + window.picIds[currentPic])
    if (currentPic == 0) {
        $('#prev-pic').addClass('invisible')
    } else {
        $('#prev-pic').removeClass('invisible')
    }
    if (currentPic == picIds.length - 1) {
        $('#next-pic').addClass('invisible')
    } else {
        $('#next-pic').removeClass('invisible')
    }
}

$(function () {
    $('#prev-pic').click(function () {
        currentPic--
        updatePic()
    })
    $('#next-pic').click(function () {
        currentPic++
        updatePic()
    })
    updatePic()
})
