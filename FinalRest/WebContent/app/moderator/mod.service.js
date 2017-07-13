angular.module('mod')
	.factory('modService', function($http,$location,$rootScope){
		var service = {};
		
		
		service.review = function(){
			return $http({
				method : 'GET',
				url : 'api/search/rating',
			})
		}
		


		
		return service;
	})