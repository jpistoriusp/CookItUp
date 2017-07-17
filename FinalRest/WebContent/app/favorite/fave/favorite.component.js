angular.module('fave').component('fave', {
	templateUrl : 'app/favorite/fave/favorite.component.html',
	controller : function(faveService,authService,recipeService,$rootScope) {
		var vm = this;
		vm.errors = [];
		vm.listFave = [];
		vm.selected = {};
		vm.showList = true;
		
		vm.favorite = function(){
			faveService.getFaveList(authService.getToken().id)
			.then(function(result){
				vm.listFave = result.data;
				vm.listFave.forEach(function(f,idx,arr){
					var total = 0;
					f.recipe.rating.forEach(function(r,idx,arr){
						total += r.value;
					})
					f.recipe.avgRating = total/f.recipe.rating.length;
				})
			});
		}
		
		vm.toggle = function(fave){
			vm.selected = fave.recipe;
			vm.showList = false;
			vm.loadDetails(vm.selected);
			
			$rootScope.$broadcast('recipeSelected', {
				value : vm.showList
			})
		}
		
		vm.loadDetails = function (recipe) {
			console.log(recipe)
			recipeService.showIngredients(recipe)
				.then(function(response){
					vm.selected.recipeIngredients = response.data;
					recipeService.showInstructions(recipe)
						.then(function(response){
							vm.selected.instructions = response.data;
						})
				})
		}
		
		vm.changeListVisibility = function() {
			vm.showList = vm.showList ? false : true;
		}
		
		vm.favorite();
	},
	controllerAs : 'vm'
});