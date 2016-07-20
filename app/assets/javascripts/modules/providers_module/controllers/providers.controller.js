/*global providers_module */
/*global angular */
/*global console */


providers_module.controller('ProvidersController', ['$scope', '$filter', 'ProviderService', 'ServiceService', '$http', '$location', 'ProviderFilterService', 'ServiceFilterService', function ($scope, $filter, ProviderService, ServiceService, $http, $location, ProviderFilterService, ServiceFilterService) {
  "use strict";
  
  $scope.providers;
  $scope.filteredProviders;
  $scope.providersMsg = '';
  
  $scope.search = {};
  $scope.search.number_of = [0, 0, 0, 0];
  $scope.search.locations = "";
  $scope.search.states = "";
  $scope.search.sizes = [0, 0, 0];
  $scope.search.sel_service = [0,0,0,0,0,0,0,0,0];
  $scope.params = [];
  $scope.map = { zoom: 10, control: {}, markers: []};
  $scope.map.markers = [];
  $scope.mapOptions = { zoomControl: true, panControl: true, scaleControl: true }; 
  $scope.predicate = 'on_top';
  $scope.reverse = true;

  // $scope.order = function(predicate) {
  //   $scope.reverse = ($scope.predicate === predicate) ? !$scope.reverse : false;
  //   $scope.predicate = predicate;
  // }
 
  var url_params  = $location.protocol() + "://" + $location.host() + ":" + $location.port() + "/api/providers/get_session_params";
  
  $http({
    method: 'GET',
    url: url_params
  }).then(function successCallback(response) {
    $scope.params.location = response.data.location == null ? 'all' : response.data.location;
    $scope.params.location_id = response.data.location_id.length == 0 ? 0 : response.data.location_id;
    
    ProviderFilterService.all($scope.params.location_id).then(function (providers) {
      if (providers.length == 0) {
        $scope.providersMsg = 'Probablemente no hay cuidadores en el área seleccionada :(';
      } else {
        localStorage.setItem("providers", JSON.stringify(providers));
        localStorage.setItem("filteredProviders", JSON.stringify(providers));
      }
      $scope.providers = providers;
    });    
  });
  
  if ($scope.params.location_id != 0) {
    ProviderFilterService.all(0).then(function (providers) {
      localStorage.setItem("allProviders", JSON.stringify(providers));
    });
  }  
  
  $scope.$watch('providers', function () {  
    var temp_markers, log;  
    
    log           = [];
    temp_markers  = []; 
    
    angular.forEach($scope.providers, function (provider, key) {
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

  ServiceFilterService.all().then(function (services) {
    $scope.services = services;
  });
  
  $scope.filterSize = function() {
    var sizes = $scope.search.sizes.filter(function (size) { return size > 0 });
    if (sizes.length == 0) {
      var providers = localStorage.getItem("providers");
      var filteredProviders = localStorage.getItem("filteredProviders");
      if (filteredProviders == null) localStorage.setItem("filteredProviders", providers);
      $scope.providers = JSON.parse(providers);
    }
    else {
      ProviderFilterService.bySize(sizes).then(function (providers) {
        localStorage.setItem("filteredProviders", JSON.stringify(providers));
        $scope.providers = providers;
      }); 
    }
  }
  
  $scope.filterNumberOfPets = function() {
    var number_of_pets = $scope.search.number_of.filter(function (number_of_pets) { return number_of_pets > 0 });
    if (number_of_pets.length == 0) {
      var providers = localStorage.getItem("providers");
      var filteredProviders = localStorage.getItem("filteredProviders");
      if (filteredProviders == null) localStorage.setItem("filteredProviders", providers);
      $scope.providers = JSON.parse(providers);
    }
    else {
      ProviderFilterService.byNumberOf(number_of_pets).then(function(providers) {
        localStorage.setItem("filteredProviders", JSON.stringify(providers));
        $scope.providers = providers;
      })
    }
  }
  
  $scope.filterService = function() {
    var services = $scope.search.sel_service.filter(function (service) { return service > 0 });
    if (services.length == 0) {
      var providers = localStorage.getItem("providers");
      var filteredProviders = localStorage.getItem("filteredProviders");
      if (filteredProviders == null) localStorage.setItem("filteredProviders", providers);
      $scope.providers = JSON.parse(providers);
    } else {
      var filtered_services = $scope.services.filter(function (service) { return services.indexOf(service.id) >= 0 });
      ProviderFilterService.byService(filtered_services) .then(function (providers) {
        localStorage.setItem("filteredProviders", JSON.stringify(providers));
        $scope.providers = providers;
      });
    }
  }
  
  $scope.$on("slideEnded", function() {
    var minPrice = $scope.search.price.min;
    var maxPrice = $scope.search.price.max;
    if (minPrice == 0 && maxPrice == 1000) {
      $scope.providers = JSON.parse(localStorage.getItem("providers"));
    } else {
      ProviderFilterService.byPriceRange($scope.search.price.min, $scope.search.price.max).then(function (providers) {
        $scope.providers = providers;
      });
    }
  });
   
  $scope.changeLocation = function() {
    $scope.providersMsg = '';
    var locations = $scope.search.locations;
    if (locations.length == 0) {
      $scope.providers = JSON.parse(localStorage.getItem("providers"));
    } else if (locations[0].length > 0) {
      ProviderFilterService.byLocation(locations).then(function (providers_by_location) {
        $scope.providers = providers_by_location;
      }, function(reason) {
        $scope.providers = [];
        $scope.providersMsg = 'Probablemente no hay cuidadores en el área seleccionada :(';
      });
    }
  };   

}]);
