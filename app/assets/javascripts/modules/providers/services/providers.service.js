providers.factory('ProviderService', ['$resource', function($resource){
  var host_name = document.location.hostname;
  var port = document.location.port;
  var url_service="http://" + host_name +":" + port + "/api/providers/get_providers.json"; //local url
  return $resource(url_service, {}, {get: {method: 'GET', isArray: true}});
}]);