angular.module('staticModule')
	.component('profile', {
	templateUrl : "app/staticModule/profile/profile.component.html",
		controller: function(staticService){
			var vm = this;
			
			vm.createProfile = function(profile){
				
			}
		},
		controllerAs : 'vm'
})