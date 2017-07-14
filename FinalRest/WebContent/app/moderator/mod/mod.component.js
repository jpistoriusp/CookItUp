angular.module('mod').component('mod', {
	templateUrl : 'app/moderator/mod/mod.component.html',
	controller : function(modService) {
		var vm = this;
		vm.reviewList=[];
		vm.listReview = function(){
			modService.review()
			.then(function(result){
				vm.reviewList = result.data;
			});
		}
		
	vm.deleteReview = function(id){
		modService.del(id)
		.then(function(result){
			vm.listReview();
		});
		}
		
		vm.listReview();
	},
	controllerAs : 'vm'
});