
$(".registration_wizard").ready(function(){
    $(".registration_wizard").steps({
        headerTag: "h3",
        bodyTag: "section",
        transitionEffect: "slideLeft",
        autoFocus: true,
        labels: {  
                finish: "Registrarme",
                next: "Continuar",
                previous: "Anterior" 
            },
        onFinished: function () { 
          $('#myModal').modal(); 
          _gaq.push(['_trackEvent', 'Homepage', 'Recomendar-modal-trigger']);
        },
        onStepChanged: function (e, cI, pI) {
          if (cI == 1){
            paint_map();
          }
        }
    });
  });

var paint_map = function(){

    console.log('do function');

    $("#mapNew").each(function(){
      itemLatLng = new google.maps.LatLng($(this).attr('latitude'), $(this).attr('longitude'), 16) 
    });

    newProviderMap = new google.maps.Map(document.getElementById('mapNew'), {
      center: itemLatLng,
      zoom: 8
    });

    marker = new google.maps.Marker({
        draggable: true,
        position: itemLatLng,
        map: newProviderMap
    });

    google.maps.event.addListener(marker,'drag',function(event) {
        $("#provider_latitude").val(event.latLng.lat());
        $("#provider_longitude").val(event.latLng.lng());
    });



    function codeAddress() {
        var address = document.getElementById("provider_address").value;
        geocoder.geocode( { 'address': address}, function(results, status) {
          if (status == google.maps.GeocoderStatus.OK) {
            newProviderMap.setCenter(results[0].geometry.location);
            marker.setPosition( results[0].geometry.location );
            console.log(results[0].geometry.location);
            $("#provider_latitude").val(results[0].geometry.location.lat());
            $("#provider_longitude").val(results[0].geometry.location.lng());
          } else {
            alert("Geocode was not successful for the following reason: " + status);
          }
        });
      }


  };
