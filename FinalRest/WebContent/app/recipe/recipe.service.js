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
		
		service.createRecipe = function(recipeDTO){
			checkLogin();
			return $http({
				method : 'POST',
				url : 'api/user/' + userId + '/recipe',
				headers : {
					'Content-Type' : 'application/json'
				},
				data : recipeDTO
			})
				.then(function(response){
					console.log(response.data);
				})
		}
//		
//		service.createRecipeIngredient = function(recipeId,recipeIngredient,
//						ingredient){
//			console.log("in service create recIng");
//			console.log(recipeIngredient);
//			console.log(ingredient);
//			return $http({
//				method : 'POST',
//				url : 'api/recipe/' + recipeId + '/ingredient',
//				headers : {
//					'Content-Type' : 'application/json'
//				},
//				data : recipeIngredient
//			})
//			.then(function(response){
//				console.log(response.data);
//			})
//		}
		
		service.showIngredients = function(recipe) {
			return $http({
				method : 'GET',
				url : 'api/search/recipe/'+recipe.id+'/recipeIngredient'
			})
		}
		service.showInstructions = function(recipe) {
			return $http({
				method : 'GET',
				url : 'api/search/recipe/'+recipe.id+'/instruction'
			})
		}
		
		service.showUserFavorites = function(uid){
			checkLogin();
			var uid = authService.getToken().id;
			return $http({
				method : 'GET',
				url : 'api/user/'+uid+'/recipe'
			})
		}
		
		service.addToFavorites = function(recipe){
			checkLogin();
			var uid = authService.getToken().id;
			return $http({
				method : 'POST',
				url : 'api/user/'+uid+'/recipe/'+recipe.id
			})
		}
		service.deleteFromFavorites = function(recipe){
			checkLogin();
			var uid = authService.getToken().id;
			return $http({
				method : 'DELETE',
				url : 'api/user/'+uid+'/recipe/'+recipe.id+'/unfave'
			})
		}
		
		return service;
	})