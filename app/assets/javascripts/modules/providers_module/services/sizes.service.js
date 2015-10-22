providers_module.factory('SizeService', ['$resource', function($resource){
  var host_name = document.location.hostname;
  var port = document.location.port;
  var url_service="http://" + host_name +":" + port + "/api/general/get_sizes.json"; //local url
  return $resource(url_service, {}, {get: {method: 'GET', isArray: true}});
}]);