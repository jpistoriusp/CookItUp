angular.module('staticModule')
	.component('home', {
		templateUrl : "app/staticModule/home/home.component.html",
		controller: function(staticService, $location){
			
			var vm = this;
			
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