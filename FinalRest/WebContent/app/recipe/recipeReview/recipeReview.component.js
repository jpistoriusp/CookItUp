angular.module('recipe')
	.component('recipeReview',
	{
		templateUrl : 'app/recipe/recipeReview/recipeReview.component.html',
		controller : function(recipeService, $filter, $scope){
			
			var vm = this;
			
			vm.recipeRating = {};
			
			vm.createRating = function(){
				console.log(vm.recipeRating);
			}
			
		},
		
		controllerAs : 'vm'
	
	})
	