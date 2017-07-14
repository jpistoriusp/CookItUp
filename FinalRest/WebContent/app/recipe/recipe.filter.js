angular.module('recipe')
	.filter('recipeFilter', function(){
		return function(tags) {
			console.log("infilter")
			var results = [];
			tags.forEach(function(tag){
				if (tag.id === 2) {
					results.push(tag);
				}
			});
			console.log(results);
			return results;
		}
	});