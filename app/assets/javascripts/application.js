//= require jquery


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

//= require jquery-timepicker-jt/jquery.timepicker

//= require jquery.steps.js
//= require jquery.raty.js
//= require jquery_nested_form
//= require select2.js
//= require utils
//= require providers

//= require jquery.purr
//= require best_in_place

//= require slick-carousel/slick/slick.min

//= require lodash/lodash

//= require jquery_ujs


//= require angular/angular
//= require angular-simple-logger/dist/angular-simple-logger
//= require angular-google-maps/dist/angular-google-maps

//= require angularjs-slider/dist/rzslider

//= require ngmap/build/scripts/ng-map

//= require angular-rangeslider/angular.rangeSlider
 
//= require angular-resource/angular-resource
//= require app
//= require modules/providers_module/services/providers.service.js
//= require modules/providers_module/services/services.service.js
//= require modules/providers_module/directives/raty.directive.js
//= require modules/providers_module/filters/search.filter.js
//= require modules/providers_module/filters/capitalize.filter.js
//= require modules/providers_module/controllers/providers.controller.js
//= require modules/bookings_module/controllers/bookings.controller.js

//= require_self
//= require moment
//= require bootstrap-datetimepicker
//= require pickers


$(document).ready(function() {
  var docHeight = $(window).height();
  var footerHeight = $('#footer').height();

  var footerTop = $('#footer').position().top + footerHeight;

  if (footerTop < docHeight) {
    $('#footer').css('margin-top', 10+ (docHeight - footerTop) + 'px');
  }

  // modal for referral codes
  //$(document).bind('ajaxError', 'form#new_referral', function(event, jqxhr, settings, exception){
    // note: jqxhr.responseJSON undefined, parsing responseText instead
  //  $(event.data).render_form_errors( $.parseJSON(jqxhr.responseText) );
  //});

  //timepicker
  //if ($('#booking_pickup_time').length > 0) {
  //  $('#booking_pickup_time').timepicker({
  //    'minTime': '9:00am',
  //    'maxTime': '6:00pm',
  //  });
  //};
  //if ($('#booking_dropoff_time').length > 0) {
  //  $('#booking_dropoff_time').timepicker({
  //    'minTime': '9:00am',
  //    'maxTime': '6:00pm',
  //  });
  //};



  //var picCache = $("#provider_avatar_cache");

  //ocultar campos innecesarios en providers#edit
  //$('img').filter(function(){
  //        return !$(this).attr('src');
  //}).hide();
  //$("a[href='/provider_attachments']").hide();

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





  $('#booking_reservation').click(function(e) {
    if (!$('#terms_and_services').is(':checked')) {
      e.preventDefault();
      alert('Debe aceptar los términos y condiciones');
    };
  });


  $(window).load(function() {
    $('.flexslider').flexslider({
      controlNav: true,
    });
  });
});



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

function previewImage(input, container, isClass, isUserPet) {
  if (typeof(isClass)==='undefined') isClass = false;
  if (typeof(isUserPet)==='undefined') isUserPet = false;
  // Check for the various File API support.
  if (window.File && window.FileReader && window.FileList && window.Blob) {
    var files = input.files; // FileList object

    // files is a FileList of File objects. List some properties.
    if (files.length > 0) {
      var reader = new FileReader();
      var preview = null;

      if (isUserPet) {
        preview = input.parentElement.parentElement.children[0];
      }
      else if (isClass) {
        var containers = document.getElementsByClassName(container);
        for (var i = containers.length - 1; i >= 0; i--) {
          if (containers[i].src.length <= 0 || containers[i].src.indexOf("missing.png") > 0) {
            preview = containers[i];
            break;
          }
        }
      }
      else {
        preview = document.getElementById(container);
      } 

      reader.onload = function(e) {
        preview.src = e.target.result;
      };

      reader.readAsDataURL(files[0]);
    }
  } else {
    alert('The File APIs are not fully supported in this browser.');
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

$(function() {
  $(document).on('change', '#states_id', function(evt) {
    $.ajax('/providers/update_state', {
      type: 'GET',
      data: {
        country_id: $("#states_id option:selected").val()
      },
      error: function(jqXHR, textStatus, errorThrown) {
        return console.log("AJAX Error: " + textStatus);
      },
      success: function(data, textStatus, jqXHR) {
        $("#locations_id").html(data);
        return console.log("Dynamic country select OK! ");
      }
    });
  });
});