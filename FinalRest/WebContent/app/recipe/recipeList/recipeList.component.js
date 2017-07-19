angular.module('recipe').component('recipeList', {
	templateUrl : 'app/recipe/recipeList/recipeList.component.html',

	controller : function(recipeService, $rootScope, $filter, staticService) {
		var vm = this;

		vm.ingredients = [];
		
		vm.ingred = [];
		
		var loadIngred = function(){
			recipeService.indexIngred()
			.then(function(res){
				vm.ingred = res.data;
			})
		}
		
		loadIngred();

		vm.showFilter = false;

		vm.toggleDaily = function() {
			vm.showDaily = false;
			$rootScope.$broadcast('recipeDaily', {
				value : vm.showDaily
			})
		}

		vm.toggle = function(recipe) {
			vm.selected = recipe;
			vm.showList = false;
			vm.loadDetails(recipe);

			$rootScope.$broadcast('recipeSelected', {
				value : vm.showList
			})
		}

		vm.addIngredient = function(i) {
			vm.ingredients.push(i);
		}

		vm.deleteIngredient = function(i) {
			vm.ingredients.forEach(function(val, idx, arr) {
				if (i === val) {
					arr.splice(idx, 1);
				}
			})
		}

		vm.recipes = [];

		vm.findRecipes = function(ingredients) {
			recipeService.index(ingredients).then(function(response) {
				vm.recipes = response.data;
				console.log("find recipes");
				console.log(vm.recipes);
				vm.recipes.forEach(function(r, idx, arr) {
					var total = 0;
					r.rating.forEach(function(rat, idx, arr) {
						total += rat.value
					})
					r.avgRating = total / r.rating.length;
				})
			})
		}

		vm.selected = null;

		vm.showList = true;

		vm.changeListVisibility = function() {
			vm.showList = vm.showList ? false : true;
		}

		vm.loadDetails = function(recipe) {
			recipeService.showIngredients(recipe).then(function(response) {
				vm.selected.recipeIngredients = response.data;
				recipeService.showInstructions(recipe).then(function(response) {
					vm.selected.instructions = response.data;
				})
			})
		}

		vm.tags = [];
		vm.recipes = [];
		vm.filteredRecipes = [];

		vm.showTags = function() {
			recipeService.showTags().then(function(response) {
				vm.tags = response.data;
				vm.tags.forEach(function(tag, idx, arr) {
					tag.selected = false;
				})
			})
		}

		vm.showTags();
	},
	controllerAs : 'vm'
})