package data;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import entities.Rating;

@Transactional
public class ModDAOImpl implements ModDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	
	public Set<Rating> reviewIndex(){
		String query = "SELECT r FROM Rating r";
		Set<Rating>r = new HashSet<Rating>(em.createQuery(query, Rating.class).getResultList());
		return r;
	
	}

}
