package test;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Instruction;
import entities.Recipe;
import entities.User;

public class DbTest {

	private EntityManager em;
	
	@Test
	public void test() {
		boolean pass = true;
		assertEquals(pass,true);
	}
	
	@Before
	public void setUp() throws Exception{
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("CookItUp");
		em = emf.createEntityManager();
	}
	
	@After
	public void tearDown() throws Exception{
		if(em!=null){
			em.close();
		}
	}
	
	@Test
	public void test_get_user() {
		User user = em.find(User.class, 1);
		assertEquals(user.getEmail(),"nancy@test.com");
	}
	
	@Test
	public void test_get_recipe() {
		Recipe recipe = em.find(Recipe.class, 1);
		assertEquals(recipe.getTitle(),"Fried Rice");
	}
	
	@Test
	public void test_get_recipe_ingredients() {
		Recipe recipe = em.find(Recipe.class, 1);
		assertEquals(recipe.getRecipeIngredients().size(),6);
	}
	
	@Test
	public void test_get_user_profile() {
		User user = em.find(User.class, 1);
		assertEquals(user.getProfile().getAge(),25);
	}
	
	@Test
	public void test_get_recipe_instructions() {
		Recipe r = em.find(Recipe.class, 1);
		assertEquals(r.getInstructions().size(),6);
	}
	
	@Test
	public void test_get_instruction(){
		Instruction i = em.find(Instruction.class, 1);
		assertEquals(i.getText(),"Heat 1 tbsp oil in wok; add chopped onions and stir-fry until onions turn a nice brown color, about 8-10 minutes; remove from wok.");
	}
	
	@Test
	public void test_get_user_favorites(){
		User u = em.find(User.class, 1);
		assertEquals(u.getFavorites().size(),2);
	}
}
