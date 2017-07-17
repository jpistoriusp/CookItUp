angular.module('nav').component('navigation', {
	templateUrl : 'app/nav/navigation/nav.component.html',
	controller : function(authService, $location) {
		var vm = this;
		
		vm.login = function(user){
			authService.login(user)
				.then(function(resp){
					$location.path('/');
				})
		}
		
		vm.loginChecker = function() {
			if (authService.getToken().id) {
				
				return true;
			}

			return false;
		}
		
		vm.moderator = function() {
			if (authService.getToken().id == 6) {
				return true;
			}
			
			return false;
		}
	},
	controllerAs : 'vm'
});