
angular.module('appModule',['staticModule', 'ngRoute', 'recipe','authModule'])
	.config(function($routeProvider){
		$routeProvider
			.when('/profile', {
				template : '<profile></profile>'
			})
			.otherwise({
				template : '<not-found></not-found>'
			})
			
	})

