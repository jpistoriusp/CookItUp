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
			return $http({
				method : 'POST',
				url : 'api/search/recipe',
				headers : { 'Content-type' : "application/json"},
				data : ingredients
			})
		}
		
		return service;
	})