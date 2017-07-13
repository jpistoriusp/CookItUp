angular.module('fave')
.factory('faveService',
		function($http, $cookies, $location){
	var service = {};
	
	

	service.getFaveList = function(id) {
		return $http({
			method : 'GET',
			url : 'api/user/'+ id +'/recipe'
		}).then(function(u) {
			console.log(u)
			return u;
		})
	}

	
	return service;
})