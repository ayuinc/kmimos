providers_module.factory('ServiceService', ['$resource', function($resource){
  var host_name = document.location.hostname;
  var port = document.location.port;

  var url_service;

  if (String(port) == ""){
    url_service="http://" + host_name + "/api/services/get_services.json"; //local url
  } else {
    url_service="http://" + host_name +":" + port + "/api/services/get_services.json"; //local url
  }

  return $resource(url_service, {}, {get: {method: 'GET', isArray: true}});

}]);

providers_module.factory('ServiceFilterService', ['$http', '$q', '$location', function($http, $q, $location) {
  
  var url_service = $location.protocol() + "://" + $location.host() + ":" + $location.port() + "/api/services/get_services.json"; 
  
  function all () {
    var deferred = $q.defer();
    
    $http.get(url_service)
      .success(function (data) {
        deferred.resolve(data);
      });
    
    return deferred.promise;
  }
  
  return {
    all: all
  };
  
}]);