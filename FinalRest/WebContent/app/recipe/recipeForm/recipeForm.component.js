angular.module('recipe').component("recipeForm", {
	templateUrl : 'app/recipe/recipeForm/recipeForm.component.html',
	controller : function(recipeService,$filter,$scope) {
		var vm = this;

		vm.createRecipe = function(recipe) {
			recipeService.create(angular.copy(recipe)).then(function(response) {
				console.log("recipe created: " + recipe);
			});
		}

		vm.numberOfTodos = function() {
			return vm.todoList.length;
		}

		vm.selected = null;

		vm.displayItem = function(item) {
			vm.selected = item;
			vm.showTable = false;
		}

		vm.showTable = true;

		vm.displayTable = function() {
			vm.selected = null;
			vm.showTable = true;
		}

		vm.updateItem = function(todo, id) {
			todoService.update(todo, id)
			.then(function(response) {
				vm.reload();
			});
		}

		vm.destroyItem = function(item) {
			todoService.destroy(item.id).then(function(response) {
				vm.reload();
			});
		};
		
		
		$scope.$on('createdTodo', function(e,obj){
			console.log(e,obj);
			console.log(obj.newTodo.task)
		});
	},

	controllerAs : 'vm'

});
