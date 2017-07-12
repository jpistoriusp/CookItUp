angular.module('recipe')
	.component('recipeShow', {
		
		templateUrl : 'app/recipe/recipeShow/recipeShow.component.html',
		
		controller : function(recipeService,authService){
			
			var vm = this;
			
			var checkLogin = function(){
				if(authService.getToken()) return;
				$location.path('/login')
			}
			
			vm.backButton = function(){
				vm.goBack();
			}
			
			vm.updateFavorites = function(recipe){
				if (vm.favorite) {
					recipeService.addToFavorites(recipe)
						.then(function(response){
							console.log(response.data);
						})
				}
				if (!vm.favorite){
					recipeService.deleteFromFavorites(recipe)
					.then(function(response){
						console.log(response.data);
					})
				}
			}
		},
		
		controllerAs : 'vm',
		
		bindings : {
			recipe : '<',
			goBack : '&'
		}
	})