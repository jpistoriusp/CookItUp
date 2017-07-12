package data;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import entities.Ingredient;
import entities.Instruction;
import entities.Recipe;
import entities.RecipeIngredient;

@Transactional
public class RecipeDAOImpl implements RecipeDAO{
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Set<Recipe> index(String json) throws IOException {
		
		ObjectMapper mapper = new ObjectMapper();

		List<Ingredient> ingredients = 
				mapper.readValue(json, new TypeReference<List<Ingredient>>(){});
		
		String ingredientQuery = "SELECT i FROM Ingredient i WHERE i.name = :name";
		String recipeQuery = "SELECT r FROM Recipe r WHERE";

		List<Ingredient> managedIngs = new ArrayList<Ingredient>();
		for (Ingredient ingd : ingredients) {
			Ingredient managed;
			try {
				managed = em.createQuery(ingredientQuery, Ingredient.class)
						.setParameter("name", ingd.getName()).getSingleResult();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				continue;
			}
			managedIngs.add(managed);
		}
		for(int i = 0; i < managedIngs.size(); i++){
			if (i == managedIngs.size()-1) {
				recipeQuery += " :ing"+i+" MEMBER OF r.recipeIngredients";
				break;
			}
			recipeQuery += " :ing"+i+" MEMBER OF r.recipeIngredients OR";
		}
		if (managedIngs.size() == 0) return null;
		TypedQuery<Recipe> recipes = em.createQuery(recipeQuery, Recipe.class);
		for(int i = 0; i < managedIngs.size(); i++){
			recipes.setParameter("ing" + i, managedIngs.get(i));
		}
		return new HashSet<Recipe>(recipes.getResultList());
	}

	@Override
	public Recipe show(int uid, int rid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Recipe create(int uid, String recipeJson) {
		ObjectMapper mapper = new ObjectMapper();
	    try {
			Recipe recipe = mapper.readValue(recipeJson, Recipe.class);
			//maybe create set User method when personalizing accounts
//			recipe.setUser(em.find(User.class, uid));
			em.persist(recipe);
			em.flush();
			return recipe;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
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

	@Override
	public Set<RecipeIngredient> showIngredients(int rid) {
		String query = "SELECT ring FROM RecipeIngredient ring WHERE ring.recipe.id = :rid";
		return new HashSet<RecipeIngredient>(em.createQuery(query,RecipeIngredient.class).setParameter("rid", rid).getResultList());
	}

	@Override
	public Set<Instruction> showInstructions(int rid) {
		String query = "SELECT i FROM Instruction i WHERE i.recipe.id = :rid";
		return new HashSet<Instruction>(em.createQuery(query,Instruction.class).setParameter("rid", rid).getResultList());
	}

}
