package data;

import java.util.Set;

import entities.Recipe;

public interface RecipeDAO {
	public Set<Recipe> index(int uid);
	public Recipe show(int uid, int rid);
	public Recipe create(int uid, String recipeJson);
	public Recipe update(int uid, int rid, String recipeJson);
	public Boolean destroy(int uid, int rid);
}
