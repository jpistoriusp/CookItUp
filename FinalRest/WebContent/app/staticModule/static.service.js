angular.module('staticModule').factory('staticService', function($http, authService, $location){
	
	var service = {}
	
	service.checkLogin = function() {
		var user = authService.getToken()
		if(!user.id) {
			$location.path('/login')
		}
	}
	
	service.index = function() {
		console.log(authService.getToken().id)
		service.checkLogin();
		return $http({
			method : 'GET',
			url : "api/user/"+authService.getToken().id+"/profile"
		})
	}

	service.show = function(id) {
		service.checkLogin();
        return $http({
            method : 'GET',
            url : "api/user/"+ authService.getToken().id + "/profile/" + id
        })
    }
    
    service.create = function(profile) {
        service.checkLogin();
        return $http({
              method : 'POST',
              url : "api/user/"+authService.getToken().id+"/profile",
              headers : {
                'Content-Type' : 'application/json'
              },
              data : profile
            })
//            .then(function(resp) {
//                $rootScope.$broadcast('newMessage', {
//                    message : resp.data
//                });
//            });
    };
    
    service.update = function(profile) {  
        service.checkLogin();
        return $http({
              method : 'PUT',
              url : "api/user/"+ authService.getToken().id + "/profile",
              headers : {
                  'Content-Type' : 'application/json'
              },
              data : profile
        })
    }
    return service;
})