angular.module('recipe')
	.component('recipeList', {
		templateUrl : 'app/recipe/recipeList/recipeList.component.html',
		
		controller : function(recipeService) {
			var vm = this;
			
			vm.ingredients = [];
			
			vm.addIngredient = function(i){
				vm.ingredients.push(i);
			}
			
			vm.deleteIngredient = function(i){
				vm.ingredients.forEach(function(val,idx,arr){
					if (i === val){
						arr.splice(idx,1);
					}
				})
			}
			
			vm.recipes = [];
			
			vm.findRecipes = function(ingredients){
				recipeService.index(ingredients)
					.then(function(response){
						if (!response.data) {
							
						}
						vm.recipes = response.data;
						console.log(response.data);
					})
			}
		},
		controllerAs : 'vm'
	})