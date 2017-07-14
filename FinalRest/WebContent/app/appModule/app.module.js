angular.module('appModule',['staticModule','fave','mod', 'ngRoute', 'recipe','authModule','nav'])
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
				
			}).when('/moderator', {
			
				template : "<mod></mod>"
				
			}).when('/about', {
			
				template : "<about></about>"
				
			})
			.otherwise({
				template : '<not-found></not-found>'
			})
			
	})

