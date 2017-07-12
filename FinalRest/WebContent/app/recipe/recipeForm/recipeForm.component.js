angular.module('recipe').component("recipeForm", {
	templateUrl : 'app/recipe/recipeForm/recipeForm.component.html',
	controller : function(todoService,$filter,$scope) {
		var vm = this;

		vm.todoList = [];
		

		vm.reload = function() {
			todoService.index().then(function(response) {
				console.log(response);
				vm.todoList = response.data;
			});
		}
		vm.reload();

		vm.addToList = function(newTodo) {
			console.log("Clicked create method. add to List")
			todoService.create(angular.copy(newTodo)).then(function(response) {
				vm.reload();
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
