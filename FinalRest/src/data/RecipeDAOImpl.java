package data;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import entities.Ingredient;
import entities.Recipe;

public class RecipeDAOImpl implements RecipeDAO{

	@Override
	public Set<Recipe> index(String json) {
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			ArrayList<Ingredient> ingredients = null;
			ingredients = mapper.readValue(json, new TypeReference<List<Ingredient>>(){});
			String query = "SELECT r FROM Recipe r WHERE r.recipeIngredients = :uid";
			
		}
		catch (Exception e){
			e.printStackTrace();
		}
		
		
//		return new HashSet<Recipe>(em.createQuery(query, Recipe.class).setParameter("uid",uid).getResultList());
		return null;
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
