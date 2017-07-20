angular.module('authModule')
.factory('authService',
		function($http, $cookies, $location){
	var service = {};
	
	var saveToken = function(user) {
		$cookies.put('id', user.id);
		$cookies.put('email', user.email);
	}
	
	service.getToken = function() {
		var user = {};
		user.id = $cookies.get('id');
		user.email = $cookies.get('email');
		return user;
	}

	var removeToken = function() {
		$cookies.remove('id');
		$cookies.remove('email');
	}

	service.login = function(user) {
		return $http({
			method : 'POST',
			url : 'api/auth/login/',
			headers : {
				'Content-Type' : 'application/json'
			},
			data : user

		}).then(function(u) {
			saveToken(u.data);
			return u;
		})			
		.catch(function(error){
			console.log("dfdf");
		throw error;
		})
	}

	service.register = function(user) {
		return $http({
			method : 'POST',
			url : 'api/auth/register/',
			headers : {
				'Content-Type' : 'application/json'
			},
			data : user

		}).then(function(u) {
			saveToken(u.data);
			return u;
		})
	}

	service.logout = function() {
		return $http({
			method : 'POST',
			url : 'api/auth/logout/'
			

		}).then(function(u) {
			removeToken();
			return u;
		})
	}

	
	return service;
})