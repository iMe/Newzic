function markerHtml(n, text) {
    var control = $(text ? ('<p>' + text + '</p>') : ('<textarea name="marker' + n + '" /><br/>'))
    var editSave = $('<a class="edit-marker" id="edit-marker' + n + '">' + (text ? 'Edit' : 'Save') + '</a>')
    var div = $('<div>' +
                control.html() +
                editSave.html() + ' ' +
                '<a class="delete-marker" id="delete-marker' + n + '">Delete</a>' +
                '</div>')
    function save() {
        var m = $('#edit-marker' + n)
        m.html('Edit')
        // TODO: Change to <textarea>
    }
    function edit() {
        var m = $('#edit-marker' + n)
        m.html('Save')
        // TODO: Really save and change to <p>
    }
    div.find('.edit-marker').click(toggle(edit, save))
    div.find('.delete-marker').one('click', function () {
    })
    return div[0]
}

function createMarker(point, text) {
    var marker = new GMarker(point, { draggable: true, bouncy: true });
    var m = { marker: marker, text: text }
    markers.push(m)
    GEvent.addListener(marker, 'click', function () {
        marker.openInfoWindow(markerHtml(markers.length, m.text))
    });
    GEvent.addListener(marker, 'drag', updateLine);
    return marker;
}

var line
// TODO: this assignment should be part of the view
// as a means to "pass" the marker data into this script.
var markers = []
function updateLine() {
    if (markers.length > 2) {
        map.removeOverlay(line)
    }
    if (markers.length > 1) {
        var points = jLinq.from(markers).select(function (m) { return m.marker.getLatLng() })
        line = new GPolyline(points, '#0000ff', 3)
        map.addOverlay(line)
    }
}

var lastPos
function addPoint(unused, latlng) {
    if (latlng) {
        var marker = createMarker(latlng, null)
        map.addOverlay(marker)
        updateLine(latlng)
    }
}

var map
// This runs on page load
$(function () {
    $('#map').width(600).height(500)
    map = new GMap2($('#map')[0])
    map.setCenter(new GLatLng(41.55, -8.3333), 8)
    map.addControl(new GLargeMapControl())
    map.addControl(new GMapTypeControl())
    map.enableGoogleBar()
    GEvent.addListener(map, 'click', addPoint)
    updateLine()
})
