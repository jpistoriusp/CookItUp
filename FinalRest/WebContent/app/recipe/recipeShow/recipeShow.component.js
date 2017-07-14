angular.module('recipe')
	.component('recipeShow', {
		
		templateUrl : 'app/recipe/recipeShow/recipeShow.component.html',
		
		controller : function(recipeService,authService,$scope){
			
			var vm = this;
			
			vm.favorite = false;
			
			$scope.$on('recipeSelected', function(e,object){			
				if (!object.value) {
					recipeService.showUserFavorites()
						.then(function(response){
							var favorites = response.data;
							console.log(favorites);
							favorites.forEach(function(fav,idx,arr){
								if (fav.recipe.id === vm.recipe.id) {
									vm.favorite = true;
								}
							})
					})
				}
			})
			
			var checkLogin = function(){
				if(authService.getToken()) return;
				$location.path('/login')
			}
			
			vm.backButton = function(){
				vm.goBack();
			}
			
			vm.updateFavorites = function(recipe){
				if (vm.favorite) {
					recipeService.addToFavorites(recipe)
						.then(function(response){
							console.log(response.data);
						})
				}
				if (!vm.favorite){
					recipeService.deleteFromFavorites(recipe)
					.then(function(response){
						console.log(response.data);
					})
				}
			}
			$scope.displayNum = 1;
			$scope.increaseBy = function(num) {
			  $scope.displayNum +=num;
			}
			
			vm.recipeRating = {};
			vm.recipe = {};
			vm.createRating = function(){
				vm.recipeRating.recipe = vm.recipe;
				console.log(vm.recipeRating);
				recipeService.createRating = function(vm.recipeRating);
			}
		},
		
		controllerAs : 'vm',
		
		bindings : {
			recipe : '<',
			goBack : '&',
			showList : '='
		}
	})