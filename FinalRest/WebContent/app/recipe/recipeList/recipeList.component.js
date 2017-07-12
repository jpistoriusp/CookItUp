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
						vm.recipes = response.data;
						if (!response.data) {
							
						}
						console.log(response.data);
					})
			}
			
			vm.selected = null;
			
			vm.showList = true;
			
			vm.changeListVisibility = function() {
				vm.showList = vm.showList ? false : true;
			}
			
			vm.loadDetails = function (recipe) {
				recipeService.showIngredients(recipe)
					.then(function(response){
						vm.selected.recipeIngredients = response.data;
						recipeService.showInstructions(recipe)
							.then(function(response){
								vm.selected.instructions = response.data;
							})
					})
			}
		},
		controllerAs : 'vm'
	})