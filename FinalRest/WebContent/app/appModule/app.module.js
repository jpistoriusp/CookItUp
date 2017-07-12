angular.module('appModule',['staticModule','fave', 'ngRoute', 'recipe','authModule','nav'])
	.config(function($routeProvider){
		$routeProvider
			.when('/', {
			template : '<home></home>'
			})
			.when('/profile', {
				template : '<profile></profile>'
			}).when('/login', {
			
				template : "<login></login>"
				
			}).when('/register', {
			
				template : "<register></register>"
				
			}).when('/favorite', {
			
				template : "<fave></fave>"
				
			})
			.otherwise({
				template : '<not-found></not-found>'
			})
			
	})

