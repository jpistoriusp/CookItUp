package data;

import java.util.Set;

import entities.Instruction;
import entities.Recipe;
import entities.RecipeIngredient;

public interface RecipeDAO {
	public Set<Recipe> index(String json) throws Exception;
	public Recipe show(int uid, int rid);
	public Recipe create(int uid, String recipeJson);
	public Recipe update(int uid, int rid, String recipeJson);
	public Set<RecipeIngredient> showIngredients(int rid);
	public Set<Instruction> showInstructions(int rid);
	public Boolean destroy(int uid, int rid);
	
}
