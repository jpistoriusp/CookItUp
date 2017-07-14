angular.module('recipe')
	.component('tagForm', {
		templateUrl : 'app/recipe/tagForm/tagForm.component.html',
		controller : function(recipeService, $filter){
			
			var vm = this;
			var checked = null;
			
			var recipeFilter = $filter('recipeFilter')
			
			vm.tags = [];
			vm.filteredTags = [];
			vm.filteredRecipes = [];
			
			vm.filterRecipes = function() {
				vm.filteredRecipes = vm.recipeFilter(tags);
			}
			
			vm.showTags = function() {
				recipeService.showTags()
					.then(function(response){
						vm.tags = response.data;
					})
			}
			vm.showTags();
		},
		controllerAs : 'vm'
	})