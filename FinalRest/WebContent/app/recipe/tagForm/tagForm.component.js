angular.module('recipe')
	.component('tagForm', {
		templateUrl : 'app/recipe/tagForm/tagForm.component.html',
		controller : function(recipeService){
			
			var vm = this;
			
			vm.tags = [];
			
			vm.showTags = function() {
				recipeService.showTags()
					.then(function(response){
						console.log("***&&&*&" + response.data)
						vm.tags = response.data;
					})
			}
			vm.showTags();
		},
		controllerAs : 'vm'
	})