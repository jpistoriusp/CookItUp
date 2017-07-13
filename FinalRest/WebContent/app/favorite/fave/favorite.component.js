angular.module('fave').component('fave', {
	templateUrl : 'app/favorite/fave/favorite.component.html',
	controller : function(faveService,authService) {
		var vm = this;
		vm.errors = [];
		vm.listFave = [];
		
		vm.favorite = function(){
			faveService.getFaveList(authService.getToken().id)
			.then(function(result){
				vm.listFave = result.data;
				console.log(vm.listFave);
			});
		}
		vm.favorite();
	},
	controllerAs : 'vm'
});