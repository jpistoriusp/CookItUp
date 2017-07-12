angular.module('recipe')
	.component('recipeShow', {
		
		templateUrl : 'app/recipe/recipeShow/recipeShow.component.html',
		
		controller : function(){
			
			var vm = this;			
			
			vm.backButton = function(){
				vm.goBack();
			}
		},
		
		controllerAs : 'vm',
		
		bindings : {
			recipe : '<',
			goBack : '&'
		}
	})