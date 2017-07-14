angular.module('staticModule')
	.component('about', {
		templateUrl : "app/staticModule/about/about.component.html",
		controller: function(staticService){
			
			var vm = this;
			
			
		},
		controllerAs : 'vm'

	})