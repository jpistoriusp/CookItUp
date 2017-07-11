angular.module('recipe')
	.component('recipeList', {
		templateUrl : 'app/recipe/recipeList/recipeList.component.html',
		
		controller : function() {
			var vm = this;
			
			vm.ingredients = [];
			
			vm.addIngredient = function(ingredient){
				vm.ingredients.push(ingredient);
			}
		},
		controllerAs : 'vm'
	})