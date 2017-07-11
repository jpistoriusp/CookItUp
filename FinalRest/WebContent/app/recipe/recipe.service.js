angular.module('recipe')
	.factory('recipeService', function($http,authService,$location,$rootScope){
		var service = {};
		
		var userId = 0;
		
		var userId = authService.getToken().id;
		
		var checkLogin = function(){
			if(authService.getToken()) return;
			$location.path('/login')
		}
		
		service.index = function(ingredients){
			checkLogin();
			var userId = authService.getToken().id;
			return $http({
				method : 'POST',
				url : 'api/user/'+userId+'/recipe',
				data : ingredients,
				headers : { 'Content-type' : "application/json"}
			})
		}
		
		return service;
	})