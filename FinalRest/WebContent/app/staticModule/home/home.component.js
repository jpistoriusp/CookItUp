angular.module('staticModule')
	.component('home', {
		templateUrl : "app/staticModule/home/home.component.html",
		controller: function(staticService, $location, authService){
			
			var vm = this;
			
			vm.randomRecipe = {};
			vm.rndomIngred=[];
			
			vm.loginChecker = function() {
				if (authService.getToken().id) {
					console.log('true');
					return true;
				}
				console.log('false');
				return false;
			}
			
			vm.displayProfile = function(){
				staticService.index()
				.then(function(res){
					$location.path('/profile');
				})
			}
			
	
			
			vm.getRecipeOfTheDay = function() {
				staticService.getRandomRecipe()
				.then(function(res){
					vm.randomRecipe = res.data;
					staticService.getIngred(res.data.id)
					.then(function(res){
						vm.randomRecipe.recipeIngredients = res.data;
						staticService.getInstructions(vm.randomRecipe.id)
							.then(function(res){
								vm.randomRecipe.instructions = res.data
							})
					})
				})
			}
			
			vm.getRecipeOfTheDay()
			
		},
		controllerAs : 'vm'

	})