providers_module.controller('ProvidersController', ['$scope', '$filter', 'ProviderService', 'ServiceService', function($scope, $filter, ProviderService, ServiceService) {
  
  $scope.search; 
  $scope.sizes = []; 
  $scope.number_of; 
  $scope.sel_service = [];
  
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
  
  function update_filter(){
    $scope.providers = ProviderService.get({sizes: $scope.sizes.join(' '), number_of: $scope.number_of, sel_service: $scope.sel_service.join(' ')}); 
  }
   
}]);