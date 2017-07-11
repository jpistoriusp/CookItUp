package data;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import entities.Ingredient;
import entities.Recipe;

@Transactional
public class RecipeDAOImpl implements RecipeDAO{
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Set<Recipe> index(String json) throws IOException {
		
		ObjectMapper mapper = new ObjectMapper();

			ArrayList<Ingredient> ingredients = 
					mapper.readValue(json, new TypeReference<List<Ingredient>>(){});
			
			String ingredientQuery = "SELECT i FROM Ingredient i WHERE i.name = :name";
			String recipeQuery = "SELECT r FROM Recipe r WHERE ";
			
			for (Ingredient ingd : ingredients) {
				Ingredient managed = em.createQuery(ingredientQuery, Ingredient.class)
						.setParameter("name", ingd.getName()).getSingleResult();
				if (managed == null) continue;
				if (ingredients.indexOf(ingd) == ingredients.size()-1) {
					recipeQuery += managed + " MEMBER OF r.recipeIngredients";
					break;
				}
				recipeQuery += managed+" OR";
			}
			return new HashSet<Recipe>(em.createQuery(recipeQuery, Recipe.class).getResultList());
////		}
//   	catch (Exception e){
//   		e.printStackTrace();
//   	}
//		return null;
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
