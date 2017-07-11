angular.module('staticModule')
	.component('profile', {
	templateUrl : "app/staticModule/profile/profile.component.html",
		controller: function(staticService){
			var vm = this;
			
			vm.createProfile = function(profile){
				staticService.create(profile).then(function(res){
					
				})
			}
		},
		controllerAs : 'vm'
})