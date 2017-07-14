angular.module('staticModule')
	.component('home', {
		templateUrl : "app/staticModule/home/home.component.html",
		controller: function(staticService, $location){
			
			var vm = this;
			var vm = randomRecipe = {};
			
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