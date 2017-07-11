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
			
			vm.findRecipes = function(ingredients){
				console.log(ingredients);
				recipeService.index(ingredients)
			}
		},
		controllerAs : 'vm'
	})