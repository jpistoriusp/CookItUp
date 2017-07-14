angular.module('recipe')
	.filter('recipeFilter', function(){
		return function(recipes, tags) {
			console.log("infilter")
			var filteredRecipes = [];
			recipes.forEach(function(recipe, idx, arr){
				console.log(recipe.tags)
				recipe.tags.forEach(function(tag, idx, arr){
					tags.forEach(function(t, idx, arr){
					
						if (t.selected && tag.id === t.id) {
							filteredRecipes.push(recipe);
						}
						
					})
				})
			});
			console.log(filteredRecipes);
			return filteredRecipes;
		}
	});