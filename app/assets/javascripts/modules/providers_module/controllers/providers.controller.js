providers_module.controller('ProvidersController', ['$scope', '$filter', 'ProviderService', 'ServiceService', function($scope, $filter, ProviderService, ServiceService) {


  $scope.search = {};

  $scope.search.locations = "";
  $scope.search.states = "";
  $scope.search.sizes = [];
  $scope.search.number_of;
  
  $scope.search.sel_service = [];

  $scope.providers=ProviderService.get();

  $scope.map = { zoom: 16, control: {}, markers: []};

  $scope.map.markers = [];

  $scope.search.price = {
      min: 0,
      max: 1000,
      ceil: 1000,
      floor: 0
  };

  $scope.onSliderChange = function(){
    console.log("changed!");
    $scope.search.price.min=$scope.priceSlider.min;
    $scope.search.price.max=$scope.priceSlider.max;
  }

  $scope.services = ServiceService.get();



}]);
