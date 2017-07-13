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
		vm.favorite();
	},
	controllerAs : 'vm'
});