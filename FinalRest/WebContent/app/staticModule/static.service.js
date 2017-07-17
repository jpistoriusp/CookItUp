angular.module('staticModule').factory('staticService', function($http, authService, $location){
	
	var service = {}
	
	var showUser = function(uid){
		return $http({
			method : 'GET',
			url : 'api/search/user/'+uid
		})
	}
	
	service.checkLogin = function() {
		var user = authService.getToken()
		if(!user.id) {
			$location.path('/login')
		}
	}
	
	service.index = function() {
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
    };
    
    service.update = function(profile) {
    	console.log(profile)
    	  console.log("profile first Name: "+profile)
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
    
    service.getRandomRecipe = function(){
		return $http({
			method : 'GET',
			url : 'api/recipe/random',
			})
	}
    
    service.getIngred = function(rid){
    		return $http({
			method : 'GET',
			url : 'api/search/recipe/'+rid+'/recipeIngredient'
    		})
    }
    
    service.getInstructions = function(rid){
    		return $http({
			method : 'GET',
			url : 'api/search/recipe/'+rid+'/instruction'
		})
    }
    
    return service;
})