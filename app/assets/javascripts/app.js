
providers_module = angular.module('providers_module', ['ngResource', 'rzModule', 'uiGmapgoogle-maps']);

providers_module.constant("AGENT", {
    "HOST_NAME": document.location.hostname,
    "PORT": document.location.port 
});


bookings_module = angular.module('bookings_module', ['ngResource']);
 