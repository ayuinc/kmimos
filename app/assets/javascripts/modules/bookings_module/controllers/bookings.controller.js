
/*global bookings_module */
/*global angular */
/*global console */

bookings_module.controller('BookingsController', ['$scope', '$filter', '$http', function ($scope, $filter, $http) {

  "use strict";
    
  $scope.bookService;
  $scope.pets_booked = [];
  $scope.services_booked = [];
  $scope.minDate;
  $scope.maxDate;
  $scope.diff = 0;
  $scope.services_booked_total = 0;
  $scope.pets_booked_total = 0;

  $scope.get_diff_dates = function () {

    var min, max, diff;
    
    min = $scope.minDate;
    max = $scope.maxDate;
    
    min = new Date(min);
    max = new Date(max);
    
    diff = (max - min) / 1000 / 60 / 60 / 24;
 
    $scope.diff = diff;

    $scope.set_total_pets();

  };

  $scope.deleteServ = function (serv) {
    $scope.services_booked.splice($scope.services_booked.indexOf(serv), 1);
    $scope.set_total_services();
  };

  $scope.deletePet = function (pet) {
    $scope.pets_booked.splice($scope.pets_booked.indexOf(pet), 1);
    $scope.set_total_pets();
  };

  $scope.add_pet = function () {
    var rand = Math.floor(Math.random() * 6000) + 1;
    $scope.pets_booked.push({uniq: rand, pet_id: '', price: 0});
    $scope.set_total_pets();
  };

  $scope.add_service = function () {
    var rand, field_name;
    
    field_name = "booking[booked_services_attributes][" + rand + "][service_id]";
    rand = Math.floor(Math.random() * 6000) + 1;
    
    $scope.services_booked.push({uniq: rand, pet_id: '', service_id: '', price: 0});
    $scope.set_total_services();
  };

  $scope.set_total_services = function () {
    var total = 0;
    angular.forEach($scope.services_booked, function (service, key) {
      total += parseInt(service.price, 10);
    });
    $scope.services_booked_total = total;
  };

  $scope.set_total_pets = function () {
    var total = 0;
    angular.forEach($scope.pets_booked, function (pet, key) {
      total = total + parseInt(pet.price * $scope.diff, 10);
    });
    $scope.pets_booked_total = total;
  };

  $scope.update_pets = function (provider_id) {

    var host_name, port, url_service, n;
    
    host_name = document.location.hostname;
    port = document.location.port;
    url_service = "http://" + host_name + ":" + port + "/api/bookings/get_pet_rate.json"; //local url
    n = 0;
    
    angular.forEach($scope.pets_booked, function (pet, key) {

      $http({
        method: 'POST',
        url: url_service,
        data: { pet: pet.pet_id, provider: provider_id}
      }).then(function (response) {
        pet.price = response.data.price;
        pet.pet_name = response.data.pet_name;
        $scope.set_total_pets();
      }, function (error) {
        //console.log(error);
      });
    });
  };

  $scope.update_services = function (provider_id) {
    
    var host_name, port, url_service;
    host_name = document.location.hostname;
    port = document.location.port;
    url_service = "http://" + host_name + ":" + port + "/api/bookings/get_rate.json"; //local url
    
    angular.forEach($scope.services_booked, function (service, key) {

      if (service.pet_id !== "" && service.service_id !== "" && provider_id !== "") {
        $http({
          method: 'POST',
          url: url_service,
          data: { pet: service.pet_id, service: service.service_id, provider: provider_id}
        }).then(function (response) {
          service.price = response.data.price;
          service.pet_name = response.data.pet_name;
          service.service_name = response.data.service_name;
          $scope.set_total_services();
        }, function (error) {
          console.log(error);
        });
      }

    });
  };
  
  $scope.add_pet();
  $scope.add_service();

}]);
