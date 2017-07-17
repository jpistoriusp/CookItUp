package data;

import java.util.Collection;
import java.util.Set;

import entities.Favorite;
import entities.Ingredient;
import entities.Instruction;
import entities.Rating;
import entities.Recipe;
import entities.RecipeIngredient;
import entities.Tag;

public interface RecipeDAO {
	public Set<Recipe> index(String json) throws Exception;
	public Recipe show(int uid, int rid);
	public Recipe createRecipe(int uid, String recipeJson);
//	public Ingredient createIngredient(String ingredientJson);
//	public RecipeIngredient createRecipeIngredient(int rid, String recipeIngJson);
	public Rating createRating(int uid, String ratingJson);
	public Recipe update(int uid, int rid, String recipeJson);
	public Set<RecipeIngredient> showIngredients(int rid);
	public Set<Instruction> showInstructions(int rid);
	public Boolean destroy(int uid, int rid);
	public Recipe addToFavorite(int uid, int rid);
	public Set<Favorite> showFavorite(int uid);
	public Rating addRating(int uid, int rid,String jsonRating);
	public Boolean destroyFave(int uid, int rid);
	public Set<Tag> showTags();
	Set<Recipe> showFilteredRecipes(int tid);
	public Recipe showRandomRecipe();
	public Set<Ingredient> showIngred(int id);
	
}
