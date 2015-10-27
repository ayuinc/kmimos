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
      }
  });
});

