angular.module('staticModule')
	.component('home', {
		templateUrl : "app/staticModule/home/home.component.html",
		controller: function(staticService, $location, authService){
			
			var vm = this;
			
			vm.loginChecker = function() {
				if (authService.getToken().id) {
					console.log('true');
					return true;
				}
				console.log('false');
				return false;
			}
			
			vm.displayProfile = function(){
				console.log("in display profile")
				staticService.index()
				.then(function(res){
					$location.path('/profile');
				})
			}
			
		},
		controllerAs : 'vm'

	})