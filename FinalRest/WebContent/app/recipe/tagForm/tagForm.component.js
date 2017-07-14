angular.module('recipe')
	.component('tagForm', {
		templateUrl : 'app/recipe/tagForm/tagForm.component.html',
		controller : function(recipeService, $filter){
			
			var vm = this;
						
			vm.tags = [];
			vm.recipes = [];
			vm.filteredRecipes = [];
			
			vm.showTags = function() {
				recipeService.showTags()
					.then(function(response){
						vm.tags = response.data;
					})
				vm.tags.forEach(function(tag, idx, arr){
						tag.selected = false;
				})
			}
			
			
			vm.showTags();
		},
		controllerAs : 'vm'
	})