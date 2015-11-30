/*global providers_module */
/*global angular */
/*global console */


providers_module.controller('ProvidersController', ['$scope', '$filter', 'ProviderService', 'ServiceService', '$http', 'AGENT', function ($scope, $filter, ProviderService, ServiceService, $http, AGENT) {
  "use strict";
  
  $scope.providers;
  $scope.filteredProviders;
  
  $scope.search = {};
  $scope.search.number_of;
  $scope.search.locations = "";
  $scope.search.states = "";
  $scope.search.sizes = [];
  $scope.search.sel_service = [];
  $scope.params = [];
  $scope.map = { zoom: 10, control: {}, markers: []};
  $scope.map.markers = [];
  $scope.mapOptions = { zoomControl: true, panControl: true, scaleControl: true }; 
  
  var url_params  = "http://" + AGENT.HOST_NAME + ":" + AGENT.PORT + "/api/providers/get_session_params.json";
  
  
  
  $scope.$watch('filteredProviders', function () {  
    var temp_markers, log;  
    
    log           = [];
    temp_markers  = []; 
    
    angular.forEach($scope.filteredProviders, function (provider, key) {
      console.log(provider);
      temp_markers.push({
        latitude: provider.latitude,
        longitude: provider.longitude,
        id: provider.id,
        icon: 'assets/huella-mensaje-17-mini.png',
        provider: {id: provider.id, name: provider.name, avatar: provider.avatar}
      });
    }, log); 
    
    $scope.map.markers = temp_markers;
  });  
  
  ProviderService.get().$promise.then(function (providers) {
    $scope.providers = providers;
    
  });
  
  
  $http({
    method: 'GET',
    url: url_params
  }).then(function successCallback(response) {
    $scope.params.location = response.location;
  });

  $scope.search.price = {
    min: 0,
    max: 1000,
    ceil: 1000,
    floor: 0
  };
  
  $scope.onClick = function (marker, eventName, model) {
    model.show = !model.show;
  };
  
  

  $scope.onSliderChange = function () {
    $scope.search.price.min = $scope.priceSlider.min;
    $scope.search.price.max = $scope.priceSlider.max;
  };

  $scope.services = ServiceService.get();
   

}]);
