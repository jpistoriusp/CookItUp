angular.module('appModule',['staticModule', 'ngRoute'])
	.config(function($routeProvider){
		$routeProvider
			.when('/profile', {
				template : '<profile></profile>'
			})
			.otherwise({
				template : '<not-found></not-found>'
			})
			
	})