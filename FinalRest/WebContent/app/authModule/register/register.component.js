angular.module('authModule').component('register', {
	templateUrl : 'app/authModule/register/register.component.html',
	controller : function(authService, $location) {
		var vm = this;
		vm.errors = [];
		vm.register = function(user) {
			if (user.password == user.password2) {
				authService.register(user).then(function(res) {
					//must add path
					$location.path('')
				});
			} else {
				errors.push('The password does not match. Please make sure you typed in the same password.');
			}
		}
	},
	controllerAs : 'vm'
});