package data;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.User;

@Transactional
@Repository
public class AuthDAOImpl implements AuthDAO {

	@PersistenceContext
	private EntityManager em;

	@Autowired
	private PasswordEncoder encoder;

	@Override
	public User register(User u) {
		String passwordSha = encoder.encode(u.getPassword());
	    u.setPassword(passwordSha);
	    em.persist(u);
	    em.flush();
	    return u;
	}

	@Override
	public User login(User u) throws NoResultException {
		  // find the User by username/email (a unique field)
		  String query = "SELECT u FROM User u WHERE u.email = :email";
		  User managedUser = em.createQuery(query, User.class)
		                        .setParameter("email", u.getEmail())
		                        .getSingleResult();
		  if (encoder.matches(u.getPassword(), managedUser.getPassword())) {
			  System.out.println("login!!");
		    return managedUser;
		    
		  }
		  return null;
		}
}