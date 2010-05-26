var markers

function markerHtml(n, text) {
    var p = $('<p>' + text + '</p>')
    return p[0]
}

function createMarker(point, text) {
    var marker = new GMarker(point, { draggable: true, bouncy: true });
    var m = { marker: marker, text: text }
    markers.push(m)
    GEvent.addListener(marker, 'click', function () {
        marker.openInfoWindow(markerHtml(markers.length, m.text))
    });
    GEvent.addListener(marker, 'drag', updateLine);
    return m;
}

var line

function updateLine() {
    if (markers.length > 2) {
        map.removeOverlay(line)
    }
    if (markers.length > 1) {
        var points = markers.map(function (m) { return m.marker.getLatLng() })
        line = new GPolyline(points, '#0000ff', 3)
        map.addOverlay(line)
    }
}

var lastPos
function addPoint(unused, latlng) {
    if (latlng) {
        var marker = createMarker(latlng, null)
        map.addOverlay(marker.marker)
        updateLine(latlng)
    }
}

var map
// This runs on page load
$(function () {
    markers = new Array()
    markers = window.MapPoints.map(function (m) { return createMarker(m.point, m.text) })
    $('#map').width(600).height(500)
    map = new GMap2($('#map')[0])
    map.setCenter(new GLatLng(41.55, -8.3333), 8)
    map.addControl(new GLargeMapControl())
    map.addControl(new GMapTypeControl())
    map.enableGoogleBar()
    markers.map(function (x) { map.addOverlay(x.marker) }) 
    updateLine()
})
