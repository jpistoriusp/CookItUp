angular.module('staticModule')
	.component('profile', {
	templateUrl : "app/staticModule/profile/profile.component.html",
		controller: function(staticService, $location){
			var vm = this;
			vm.showCreateButton = true;
			vm.showCreateForm = false;
			vm.showEditForm = false;
			
			vm.showTable = function(){
				if(!(vm.showCreateForm && vm.showEditForm)) {
					return true;
				}
				return false;
			}
						
			vm.loadProfile = function(){
				staticService.index()
				.then(function(res){
					vm.profile = res.data;
				})
			}
			
			vm.loadProfile();
					
			vm.createProfile = function(profile){
				vm.showCreateButton = false;
				staticService.create(profile)
				.then(function(res){
					vm.loadProfile();
					$location.path('/profile');
				})
			}
			
			vm.updateProfile = function(profile){
				staticService.update(profile)
				.then(function(res){
					vm.loadProfile();
					$location.path('/profile');
				})
			}
		},
		controllerAs : 'vm',
		
})