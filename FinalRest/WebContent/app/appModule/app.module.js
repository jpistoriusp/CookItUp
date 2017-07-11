angular.module('appModule',['staticModule', 'ngRoute', 'recipe','authModule'])
	.config(function($routeProvider){
		$routeProvider
			.when('/profile', {
				template : '<profile></profile>'
			}).when('/login', {
			
				template : "<login></login>"
				
			}).when('/create', {
			
				template : "<create></create>"
				
			})
			.otherwise({
				template : '<not-found></not-found>'
			})
			
	})

