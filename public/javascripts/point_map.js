var loc_history;

function update_points() {
  $.ajax({
    url: "locations",
    dataType: "json",
    success: function(data) {
      loc_history = data;
      draw_points();
      map_points();
    }
  });
}

function draw_points() {
  var parsed_history = $.map(loc_history, function(loc, i) {
    var l = loc.location;
    return [[l.time, l.lat, l.lng, l.rssi]];
  });

  $('#location_history').dataTable( {
    "bDestroy": true,
    "aaData": parsed_history,
    "aaSorting": [[0,'desc']],
    "aoColumns": [
      { "sTitle": "Time" },
      { "sTitle": "Latitude" },
      { "sTitle": "Longitude" },
      { "sTitle": "RSSI" }
    ]
  });
}

function map_points() {
  var map_canvas = $('#map_canvas');
  var tbl_settings = $('#location_history').dataTable().fnSettings();

  map_canvas.gmap('clear', 'markers');
  for (var i = tbl_settings._iDisplayEnd; i >= tbl_settings._iDisplayStart; i--) {
    var l = loc_history[i].location;
    map_canvas.gmap('addMarker', {'position': l.lat+','+l.lng}).click(function() {
      map_canvas.gmap('openInfoWindow', {'content': 'Found here at ' + l.time + ' with signal strength ' + l.rssi + ' dB.'}, this);
    });
  }
}

function init_elements() {
  $('#map_canvas').gmap({'zoom': 14});
  update_points();
}
