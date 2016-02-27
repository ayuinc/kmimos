providers_module.factory('ProviderService', function($resource, AGENT){
   
  var url_service="http://" + AGENT.HOST_NAME + ":" + AGENT.PORT + "/api/providers/get_providers"; 
  
  return $resource(url_service, {}, {get: {method: 'GET', isArray: true}});
  
});

providers_module.factory('ProviderFilterService', ['$http', '$q', '$location', function($http, $q, $location) {
  
  var url_service = $location.protocol() + "://" + $location.host() + ":" + $location.port() + "/api/providers/get_providers"; 
  
  function all (location_id) {
    var deferred = $q.defer();
    
    $http({
      method: 'GET',
      url: url_service,
      params: { location_id : location_id }
    }).success(function (data) {
      deferred.resolve(data);
    });
    
    return deferred.promise;
  }
  
  function byNumberOf(number_of_pets) {
    var deferred = $q.defer();
    
    var providers = JSON.parse(localStorage.getItem("filteredProviders"));
    
    var results = providers.filter(function (provider) {
      var isValid = true;
      for (var i = 0; i < number_of_pets.length; i++) {
        if (number_of_pets[i] == 4)
          isValid = isValid && (provider.pet_qty >= 4);
        else
          isValid = isValid && (provider.pet_qty >= number_of_pets[i]);
      }
      return isValid;
    })
      
    if (results.length > 0)
      deferred.resolve(results);
    else 
      deferred.reject();
    
    return deferred.promise;
  }
  
  function bySize(sizes) {
    var deferred = $q.defer();
    
    var providers = JSON.parse(localStorage.getItem("filteredProviders"));
    var size_list = ['Pequeños', 'Medianos', 'Grandes'];
    
    var results = providers.filter(function (provider) {
      var isValid = true;
      for (var i = 0; i < sizes.length; i++) {
        isValid = isValid && (provider.sizes.indexOf(size_list[sizes[i] - 1]) >= 0);
      }
      return isValid;
    })
      
    if (results.length > 0)
      deferred.resolve(results);
    else 
      deferred.reject();
    
    return deferred.promise;
  }
  
  function byService(services) {
    var deferred = $q.defer();
    
    var providers = JSON.parse(localStorage.getItem("filteredProviders"));
    
    var results = providers.filter(function (provider) {
      var isValid = true;
      for (var i = 0; i < services.length; i++) {
        isValid = isValid && (provider.services.indexOf(services[i].service_name) >= 0);
      }
      return isValid;
    })
      
    if (results.length > 0)
      deferred.resolve(results);
    else 
      deferred.reject();
    
    return deferred.promise;
  }
  
  function byPriceRange(minPrice, maxPrice) {
    var deferred = $q.defer();
    
    var providers = JSON.parse(localStorage.getItem("providers"));
    
    var results = providers.filter(function (provider) {
      return provider.price >= minPrice && provider.price <= maxPrice;
    })
      
    if (results.length > 0)
      deferred.resolve(results);
    else 
      deferred.reject();
    
    return deferred.promise;
  }

  function byLocation(locations) {
    var deferred = $q.defer();

    var providers = JSON.parse(localStorage.getItem("allProviders"));

    var results = providers.filter(function (provider) {
      var isValid = false;
      for (var i = 0; i < locations.length; i++) {
        isValid = (provider.locations.indexOf(locations[i]) >= 0);
        if (isValid) break;
      }
      return isValid;
    })

    if (results.length > 0)
      deferred.resolve(results)
    else
      deferred.reject()

    return deferred.promise;
  }
  
  return {
    all: all,
    byNumberOf: byNumberOf,
    bySize: bySize,
    byService: byService,
    byPriceRange: byPriceRange,
    byLocation: byLocation
  };
  
}]);