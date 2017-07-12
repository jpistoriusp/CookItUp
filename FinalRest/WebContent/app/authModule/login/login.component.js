angular.module('authModule').component('login',{
	templateUrl :'app/authModule/login/login.component.html',
	controller : function(authService,$location){
		var vm = this;
		vm.notvalid= true;
		vm.login = function (user){
			authService.login(user)
			.then(function(res){
				// must create path
				vm.notvalid= true;
				$location.path('/');
			})
			.catch(function(e){
				vm.notvalid= false;
				console.log('ahsdfhashdfhas');
				$location.path('/login');
			});
			
		}
	},
	controllerAs : 'vm'
});