angular.module('recipe').component(
		"recipeForm",
		{
			templateUrl : 'app/recipe/recipeForm/recipeForm.component.html',
			controller : function(recipeService, $filter, $scope) {
				var vm = this;

				vm.recipe = {
						
						tags : [],
						ingredients : [],
						instructions : []
				};

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

				vm.tags = [];
				
				vm.createRecipe = function(recipe) {
					
					vm.tags.forEach(function(tag,index,array){
						if(tag.selected === true){
							console.log(tag);
							console.log(vm.recipe.tags);
							vm.recipe.tags.push(tag);
						}
					})
					recipeService.createRecipe(recipe).then(
							function(response) {
							});
				}
				
				vm.selectedTags = [];
				
				
				vm.showTags = function() {
					recipeService.showTags()
						.then(function(response){
							vm.tags = response.data;
								vm.tags.forEach(function(tag, idx, arr){
									tag.selected = false;
									vm.selectedTags = tag;
								})
								console.log(vm.tags);
						})
				}
				
				vm.showTags();

			},

			controllerAs : 'vm'

		});
