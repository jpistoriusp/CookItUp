package data;

import java.util.Set;

import entities.Recipe;

public class RecipeDAOImpl implements RecipeDAO{

	@Override
	public Set<Recipe> index(int uid) {
		String query = "SELECT r FROM Recipe r WHERE r.ingredients = :uid";
		return new HashSet<Recipe>(em.createQuery(query, Recipe.class).setParameter("uid",uid).getResultList());
	}

	@Override
	public Recipe show(int uid, int rid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Recipe create(int uid, String recipeJson) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Recipe update(int uid, int rid, String recipeJson) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean destroy(int uid, int rid) {
		// TODO Auto-generated method stub
		return null;
	}

}
