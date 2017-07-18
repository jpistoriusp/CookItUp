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

				vm.tags = [];
				vm.tagName = "";
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
				
				vm.createTag = function(tagName) {
					console.log("create Tag");
					if(tagName){
						console.log(vm.tags.length);
						var newTag = {};
						newTag.id = vm.tags.length + 1;
						newTag.name = tagName;
						console.log(newTag);
						vm.recipe.tags.push(newTag);
					}
				}
				
				vm.createRecipe = function(recipe) {
					console.log("create recipe");
					console.log(recipe);
					vm.tags.forEach(function(tag,index,array){
						if(tag.selected === true){
							console.log(tag);
							console.log(vm.recipe.tags);
							vm.recipe.tags.push(tag);
						}
					})
					vm.addStepNumber();
					recipeService.createRecipe(recipe).then(
							function(response) {
							 stepCounter = 0;
							});
				}

			},

			controllerAs : 'vm'

		});
