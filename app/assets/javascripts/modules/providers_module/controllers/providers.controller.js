providers_module.controller('ProvidersController', ['$scope', '$filter', 'ProviderService', 'ServiceService', function($scope, $filter, ProviderService, ServiceService) {
   
  $scope.search; 
  $scope.sizes = []; 
  $scope.number_of; 
  $scope.price; 
  $scope.sel_service = [];
  
  //navigator.geolocation.getCurrentPosition(success, console.log("error")); 
  
  
  
  //function success(position){
  $scope.map = { zoom: 16, control: {}, markers: []}; 
   
   
  
  $scope.map_options = { icon:'assets/huella-mensaje-17-mini.png',
                         draggable: false, 
                         crossOnDrag: false,
  animation: 1
                       };
  
    //}
  
  $scope.services = ServiceService.get();
  
  update_filter();
  
  $scope.$watchCollection('number_of', function() { 
    update_filter(); 
  });
  
  $scope.$watchCollection('sel_service', function() { 
    update_filter();
  });
  
  $scope.$watchCollection('sizes', function() { 
    update_filter();
  });
  
  $scope.$watchCollection('price', function() { 
    //$scope.providers;
  });
  
  
  
  function update_filter(){
    
    $scope.map.markers = [];
    
    ProviderService.get({sizes: $scope.sizes.join(' '), number_of: $scope.number_of, sel_service: $scope.sel_service.join(' ')}).$promise.then(function(providers) {
      
      var temp_markers = [];
      var log = [];
      
      angular.forEach(providers, function(provider, key) {
        temp_markers.push({latitude: provider.latitude, longitude: provider.longitude, id: provider.id, icon:'assets/huella-mensaje-17-mini.png' });
      }, log);
      
      $scope.providers = providers;
      
      $scope.map.markers = temp_markers;
      
    });; 
    
     
    
  }
   
}]);