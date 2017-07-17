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

				
				var stepCounter = 0;
				vm.addStepNumber = function(){
				vm.recipe.instructions[stepCounter].stepNumber=stepCounter+1;
				stepCounter++;
				}
				
				
				var insCounter = 0;
				vm.instructionInput = function() {
					insCounter++;
					vm.instructionArray.push({
						num : insCounter
					});
				};

				vm.createRecipe = function(recipe) {
					vm.addStepNumber();
					recipeService.createRecipe(recipe).then(
							function(response) {
							 stepCounter = 0;
							});
				}

			},

			controllerAs : 'vm'

		});
