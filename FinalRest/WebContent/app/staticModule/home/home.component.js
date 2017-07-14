angular.module('staticModule')
	.component('home', {
		templateUrl : "app/staticModule/home/home.component.html",
		controller: function(staticService, $location, authService){
			
			var vm = this;
			
			vm.randomRecipe = {};
			
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
					console.log(res.data);
					vm.randomRecipe = res.data;
				})
			}
			
			vm.getRecipeOfTheDay()
			
		},
		controllerAs : 'vm'

	})