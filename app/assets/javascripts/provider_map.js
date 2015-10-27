var map_item;

if ($("#map").length > 0) {
  map_item = new GMaps({
    div: '#map',
    lat: -12.043333,
    lng: -77.028333,
    zoom: 15
  });   
  GMaps.geolocate({
    success: function(position) {
      map_item.setCenter(position.coords.latitude, position.coords.longitude);
      map_item.addMarker({
        lat: position.coords.latitude,
        lng: position.coords.longitude
      });
      $("#provider_latitude").val(position.coords.latitude);
      $("#provider_longitude").val(position.coords.longitude);
    }
  });
}

if ($("#provider_location").length > 0) {
  function setProviderLocation(latitude, longitude) {
    map_item = new GMaps({
      div: '#provider_location',
      lat: latitude,
      lng: longitude,
      zoom: 15
    });

    map_item.addMarker({
      lat: latitude,
      lng: longitude
    });
  }
}  

$("#provider_address").keydown(function(e) {
  if (e.keyCode == 13) {
    e.preventDefault();
    $("#search_address").trigger("click");
  };
});

$("#search_address").click(function(e) {
  e.preventDefault();
  GMaps.geocode({
    address: $('#provider_address').val(),
    callback: function(results, status) {
      if (status == 'OK') {
        var latlng = results[0].geometry.location;
        map_item.setCenter(latlng.lat(), latlng.lng());
        map_item.removeMarkers();
        map_item.addMarker({
          lat: latlng.lat(),
          lng: latlng.lng()
        });
        $("#provider_latitude").val(latlng.lat());
        $("#provider_longitude").val(latlng.lng());
      }
    }
  });
});

if (map_item != undefined) {
  GMaps.on('click', map_item.map, function(event) {
    var markers = map_item.markers.length;
    var lat = event.latLng.lat();
    var lng = event.latLng.lng();
    console.log(markers);
    if (markers != null) {
      map_item.removeMarkers();
    }
    map_item.addMarker({
      lat: lat,
      lng: lng
    });
    $("#provider_latitude").val(lat);
    $("#provider_longitude").val(lng);
  });
}