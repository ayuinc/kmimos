//= require jquery
//= require jquery_ujs
//= require jquery.flexslider-min.js
//= require bootstrap/transition
//= require bootstrap/collapse
//= require bootstrap/dropdown
//= require bootstrap/collapse
//= require bootstrap/tooltip
//= require bootstrap/z_popover
//= require bootstrap/modal
//= require bootstrap/tab
//= require jquery-ui
//= require datepicker-es.js
//= require jquery.timepicker.min.js
//= require easing
//= require gmaps.min 
//= require jquery.steps.js
//= require jquery.raty.js
//= require jquery_nested_form 
//= require_self
//= require_tree 


$(document).ready(function() {
  var docHeight = $(window).height();
  var footerHeight = $('#footer').height();
  var footerTop = $('#footer').position().top + footerHeight;
  var map;

  if ($("#provider_location").length > 0) {
    function setProviderLocation(latitude, longitude) {
      map = new GMaps({
        div: '#provider_location',
        lat: latitude,
        lng: longitude,
        zoom: 15
      });

      map.addMarker({
        lat: latitude,
        lng: longitude
      });
    }
  }

  if (footerTop < docHeight) {
    $('#footer').css('margin-top', 10+ (docHeight - footerTop) + 'px');
  }

  // modal for referral codes
  $(document).bind('ajaxError', 'form#new_referral', function(event, jqxhr, settings, exception){
    // note: jqxhr.responseJSON undefined, parsing responseText instead
    $(event.data).render_form_errors( $.parseJSON(jqxhr.responseText) );
  });

  //timepicker
  if ($('#booking_pickup_time').length > 0) {
    $('#booking_pickup_time').timepicker({
      'minTime': '9:00am',
      'maxTime': '6:00pm',
    });
  };
  if ($('#booking_dropoff_time').length > 0) {
    $('#booking_dropoff_time').timepicker({
      'minTime': '9:00am',
      'maxTime': '6:00pm',
    });
  };

  // pretty-fy the upload field
  // var realInputField = $('#provider_pictures_attributes_0_image');
  var realInputField = $('#provider_avatar');
  var picCache = $("#provider_avatar_cache")

  //ocultar campos innecesarios en providers#edit
  $('img').filter(function(){
          return !$(this).attr('src');
  }).hide();
  $("a[href='/provider_attachments']").hide();
  
  //ocultar secciones de disqus
  $('[data-tracking-area="footer"]').hide();
  //validate datepickers
  $("input.form-search").click(function(event){
    if($("#start_date").val() == "" | $("#end_date").val() == "") {
      event.preventDefault(); // cancel default behavior
      // alert("llenalo");
      $("#fechas-warning").show();
    }
    //... rest of add logic
  });

  if ($.datepicker != undefined) {
    // initialize jquery-ui datepicker
    $.datepicker.setDefaults(
      $.extend(
        $.datepicker.regional['es']
      )
    );  
  }
  
  if ($('#start_date').length > 0) {
    $('#start_date').datepicker({
      minDate: new Date(),
      dateFormat: 'dd/mm/yy',
      defaultDate: "+1w",
      changeMonth: true,
      numberOfMonths: 1,
      onClose: function( selectedDate ) {
        $( "#end_date" ).datepicker( "option", "minDate", selectedDate );
      }
    });
  
    $('#end_date').datepicker({
      minDate: new Date(),
      dateFormat: 'dd/mm/yy',
      defaultDate: "+1w",
      changeMonth: true,
      numberOfMonths: 1,
      onClose: function( selectedDate ) {
        $( "#end_date" ).datepicker( "option", "minDate", selectedDate );
      }
    });
  }

  // drop just the filename in the display field
  realInputField.change(function() {
    // $('#file-display').val $(@).val().replace(/^.*[\\\/]/, '');
    $('#file-display').val("Archivo elegido: " + realInputField.val().replace(/^.*[\\\/]/, ''));
    $('#archivo-elegido').hide();
  });

  // trigger the real input field click to bring up the file selection dialog
  $('#upload-btn').click(function() {
    realInputField.click();
  });

  $('#booking_reservation').click(function(e) {
    if (!$('#terms_and_services').is(':checked')) {
      e.preventDefault();
      alert('Debe aceptar los términos y condiciones');
    };
  });

 
  $("#search_address").click(function(e) {
    e.preventDefault();
    GMaps.geocode({
      address: $('#address').val(),
      callback: function(results, status) {
        if (status == 'OK') {
          var latlng = results[0].geometry.location;
          map.setCenter(latlng.lat(), latlng.lng());
          map.removeMarkers();
          map.addMarker({
            lat: latlng.lat(),
            lng: latlng.lng()
          });
          $("#provider_latitude").val(latlng.lat());
          $("#provider_longitude").val(latlng.lng());
        }
      }
    });
  });
  
  if ($("#map").length > 0) {
    map = new GMaps({
      div: '#map',
      lat: -12.043333,
      lng: -77.028333,
      zoom: 15
    });   
    GMaps.geolocate({
      success: function(position) {
        map.setCenter(position.coords.latitude, position.coords.longitude);
        map.addMarker({
          lat: position.coords.latitude,
          lng: position.coords.longitude
        });
        $("#provider_latitude").val(position.coords.latitude);
        $("#provider_longitude").val(position.coords.longitude);
      }
    });
  }

  GMaps.on('click', map.map, function(event) {
    var markers = map.markers.length;
    var lat = event.latLng.lat();
    var lng = event.latLng.lng();
    console.log(markers);
    if (markers != null) {
      map.removeMarkers();
    }
    map.addMarker({
      lat: lat,
      lng: lng
    });
    $("#provider_latitude").val(lat);
    $("#provider_longitude").val(lng);
  });
 
  $(window).load(function() {
    $('.flexslider').flexslider({
      controlNav: true,
    });
  });
});

function checkAll(){
  // Pass in a named "Check All" checkbox that appears on the same form where all 
  // checkboxes should be checked.
  main_checkbox = document.getElementById("check_all");

  // Loop through an array containing ALL inputs on same form as check_all
  location_checkboxes = document.getElementsByClassName("location_cbx");
  for (var i = 0; i < location_checkboxes.length; i++) {  
    // Only work on checkboxes, and NOT on the "Check All" checkbox
    if(main_checkbox.checked == true){
      location_checkboxes[i].checked = true ;
    }else{
      location_checkboxes[i].checked = false;
    }
  };
}

function uncheckMain(location_checkbox) {
  var tracker = 0;
  main_checkbox = document.getElementById("check_all");
    if(location_checkbox.checked == false) {
      main_checkbox.checked = false;
    };
  location_checkboxes = document.getElementsByClassName("location_cbx");  
    for (var i = 0; i < location_checkboxes.length; i++) {  
      // Only work on checkboxes, and NOT on the "Check All" checkbox
      if (location_checkboxes[i].type == "checkbox") { 
        if(location_checkboxes[i].checked == true){
          tracker ++;
        }
      }  
    };
    if (tracker == location_checkboxes.length) {
      main_checkbox.checked = true;
    }
}

function allLabel() {
  main_checkbox = document.getElementById("check_all");
  if (main_checkbox.checked == true) {
    main_checkbox.checked = false;
    checkAll();
  }else{
    main_checkbox.checked = true;
    checkAll();
  }
}

// referrals
(function($) {

  $.fn.modal_success = function(){
    // close modal
    // this.modal('hide');
    // this.removeClass('hidden');
    this.find('.modal-title').html("Este es tu código de descuento. Cuando realices tu próxima reserva, utiliza este código y obtén 10% de descuento.");
    this.find('.modal-body').hide();

    // clear form input elements
    // todo/note: handle textarea, select, etc
    this.find('form input[type="text"]').val('');

    // clear error state
    this.clear_previous_errors();
  };

  $.fn.render_form_errors = function(errors){

    $form = this;
    this.clear_previous_errors();
    model = this.data('model');

    // show error messages in input form-group help-block
    $.each(errors, function(field, messages){
      $input = $('input[name="' + model + '[' + field + ']"]');
      $input.closest('.form-group').addClass('has-error').find('.help-block').html( messages.join(' & ') );
    });

  };

  $.fn.clear_previous_errors = function(){
    $('.form-group.has-error', this).each(function(){
      $('.help-block', $(this)).html('');
      $(this).removeClass('has-error');
    });
  }
}(jQuery));


function disqus_config() {
  this.callbacks.afterRender = [function() {
    console.log("disqus");
  }];
}

var p = document.createElementNS('http://www.w3.org/2000/svg','path');
p.setAttribute('d','M8.80241867,0.982896523 C8.80241867,0.982896523 313.418257,16.2744735 387.45244,33.6457043 C461.486623,51.0169351 648.456713,114.132929 694.698444,232.283285 C740.940175,350.433641 700.065811,200.201561 843.424319,216.242421 C890.837141,221.547599 923.749201,232.866679 946.56605,245.641427 C992.738754,271.492702 997.571057,303.305013 997.571057,303.305013 C997.571057,303.305013 619.18862,245.854551 611.145269,475.694603 C606.321971,613.521122 775.279374,596.383738 952.413126,613.557329 C1070.66832,625.022486 1192.56768,651.779876 1268.83598,750.147821 C1459.34612,995.860521 1220.6981,1070.09348 1220.6981,1070.09348 C1220.6981,1070.09348 841.803438,980.775368 717.154125,909.493695 C592.504811,838.212022 220.69015,924.831185 89.4196108,1032.01745 C-41.8509283,1139.20372 -22.9352424,1342.78814 116.248682,1294.79555 C255.432607,1246.80296 296.803983,1230.71623 470.026954,1283.46449 C643.249925,1336.21275 610.587127,1482.18618 610.587127,1482.18618 C610.587127,1482.18618 319.550199,1422.15913 243.688682,1661.4111 C167.827165,1900.66307 208.082263,1571.03789 573.191576,1651.2422 C938.300889,1731.44652 715.663196,2186.36328 715.663196,2186.36328 C715.663196,2186.36328 768.289128,2067.71603 939.378962,2122.95676 C1110.4688,2178.1975 1271.15265,2215.38679 1313.73205,2337.95633');

$(window).scroll(function () { 
  
  var len = p.getTotalLength();
  
  var top_scroll = $(window).scrollTop() + 70;
  
  var width = $(window).width() / 2; 
  
  var x_position =  p.getPointAtLength(top_scroll * 3);
  
  var width_size = 20 + ((($(window).scrollTop() / $(window).height()) * 9 )); 
  
  $(".fixed-ball").css({left: x_position.x * 1.5});
  
  $(".fixed-ball").css({width: width_size});
  
  
   
});

 
