angular.module('fave').component('fave', {
	templateUrl : 'app/favorite/fave/favorite.component.html',
	controller : function(faveService,authService) {
		var vm = this;
		vm.errors = [];
		vm.listFave = [];
		vm.listFave = function(){
			faveService.getFaveList(authService.getToken().id)
			.then(function(result){
				vm.listFave = result.data;
			});
		}
	},
	controllerAs : 'vm'
});