angular.module('authModule').component('register', {
	templateUrl : 'app/authModule/register/register.component.html',
	controller : function(authService, $location) {
		var vm = this;
		vm.errors = [];
		vm.register = function(user) {
			console.log(user);
			vm.errors = [];

			if ((!user.password || !user.password2) || user.password != user.password2){
				
				vm.errors.push('The password does not match. Please make sure you typed in the same password.');
			}
			if (!user.email || !user.email.match(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/)){
				
				vm.errors.push('Please Type a valid email');
			}
			if (user.password == user.password2 && vm.errors.length==0) {
				authService.register(user).then(function(res) {
					// must add path
//					$location.path('');
				}).catch(function(error){
					console.log("in catch error");
					vm.errors.push('This email is already in use. Please enter a different email or login.');
				});
			}
		}
	},
	controllerAs : 'vm'
});