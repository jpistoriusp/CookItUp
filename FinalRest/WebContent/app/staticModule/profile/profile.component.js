angular.module('staticModule')
	.component('profile', {
	templateUrl : "app/staticModule/profile/profile.component.html",
		controller: function(){
			var vm = this;
			
			vm.createProfile = function(user){
				
			}
		},
		controllerAs : 'vm'
})