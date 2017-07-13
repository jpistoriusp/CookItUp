angular.module('recipe').component(
		"recipeForm",
		{
			templateUrl : 'app/recipe/recipeForm/recipeForm.component.html',
			controller : function(recipeService, $filter, $scope) {
				var vm = this;

				vm.recipe = {};

				vm.recipe.ingredients = [];

				vm.recipe.instructions = [];
				
				vm.ingredientArray = [];
				vm.instructionArray = [];
				
				var ingCounter = 0;
				vm.ingredientInput = function() {
					ingCounter++;
					vm.ingredientArray.push({
						num : ingCounter
					});

				};

				var insCounter = 0;
				vm.instructionInput = function() {
					insCounter++;
					vm.instructionArray.push({
						num : insCounter
					});
				};

				vm.createRecipe = function() {
					console.log(vm.recipe);
					recipeService.createRecipe(angular.copy(vm.recipe)).then(
							function(response) {
							});
				}

			},

			controllerAs : 'vm'

		});
