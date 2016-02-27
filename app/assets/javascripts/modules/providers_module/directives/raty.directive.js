providers_module.directive("raty", function() {
  return {
    restrict: 'AE',
    link: function (scope, elem, attrs) {
      $(elem).raty({score: function(){
            return attrs.score;
          },
          starOff : '/assets/icono-hueso-gris.svg',
          starOn  : '/assets/icono-hueso-verde.svg',
          readOnly: true
        });
    }
  };
});