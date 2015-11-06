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
