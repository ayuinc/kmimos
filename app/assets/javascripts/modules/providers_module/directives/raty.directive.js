providers_module.directive("raty", function() {
  return {
    restrict: 'AE',
    link: function (scope, elem, attrs) {
      $(elem).raty({score: function(){
            if (parseInt(attrs.score) == 0){
              return 4;
            } else {
              return attrs.score;
            }
          },
          starOff : '/assets/icono-hueso-gris.svg',
          starOn  : '/assets/icono-hueso-verde.svg',
          readOnly: true
        });
    }
  };
});