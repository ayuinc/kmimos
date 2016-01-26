providers_module.factory('ProviderService', function($resource, AGENT){
   
  var url_service="http://" + AGENT.HOST_NAME + ":" + AGENT.PORT + "/api/providers/get_providers.json"; 
  
  return $resource(url_service, {}, {get: {method: 'GET', isArray: true}});
  
});