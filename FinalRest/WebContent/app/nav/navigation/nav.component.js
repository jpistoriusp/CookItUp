angular.module('nav').component('navigation',{
	templateUrl:'app/nav/navigation/nav.component.html',
		controller: function (authService){
			var vm = this;
			vm.loginChecker = function(){
				if(authService.getToken().id){
					console.log('in true')
					return true;
				}
				console.log('in false')

				return false;
			}
		},
	controllerAs : 'vm'
});