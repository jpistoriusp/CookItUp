package test;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

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
		
	}
}
