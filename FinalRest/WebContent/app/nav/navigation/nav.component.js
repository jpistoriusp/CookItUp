angular.module('nav').component('navigation', {
	templateUrl : 'app/nav/navigation/nav.component.html',
	controller : function(authService) {
		var vm = this;
		vm.loginChecker = function() {
			if (authService.getToken().id) {
				
				return true;
			}

			return false;
		}
		
		vm.moderator = function() {
			console.log(authService.getToken().id);
			if (authService.getToken().id == 3) {
				
				return true;
			}
			
			return false;
		}

		vm.moderator
	},
	controllerAs : 'vm'
});