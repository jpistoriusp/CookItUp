angular.module('appModule',['staticModule', 'ngRoute', 'recipe','authModule','nav'])
	.config(function($routeProvider){
		$routeProvider
			.when('/profile', {
				template : '<profile></profile>'
			}).when('/login', {
			
				template : "<login></login>"
				
			}).when('/register', {
			
				template : "<register></register>"
				
			})
			.otherwise({
				template : '<not-found></not-found>'
			})
			
	})

