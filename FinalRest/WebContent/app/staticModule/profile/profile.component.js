angular.module('staticModule')
	.component('profile', {
	templateUrl : "app/staticModule/profile/profile.component.html",
		controller: function(staticService, $location){
			var vm = this;
			vm.showCreateButton = true;
						
			vm.loadProfile = function(){
				staticService.index()
				.then(function(res){
					vm.profile = res.data;
				})
			}
			
			vm.loadProfile();
					
			vm.createProfile = function(profile){
				staticService.create(profile)
				.then(function(res){
					$location.path('/profile');
				})
			}
			
			vm.showCreate = function(){
				vm.showCreateButton = false;
			}
			
			vm.updateProfile = function(profile){
				staticService.update(profile)
				.then(function(res){
					$location.path('/profile');
				})
			}
			
			vm.reload = function() {
				  staticService.index().then(function(res){
						vm.profile = res.data;
				  });
			  }
		},
		controllerAs : 'vm',
		
})