angular.module('mod')
	.factory('modService', function($http,$location,$rootScope){
		var service = {};
		
		
		service.review = function(){
			return $http({
				method : 'GET',
				url : 'api/search/rating',
			})
		}
		
		service.del = function(id){
			return $http({
				method : 'DELETE',
				url : 'api/search/rating/'+id,
			})
		}
		


		
		return service;
	})