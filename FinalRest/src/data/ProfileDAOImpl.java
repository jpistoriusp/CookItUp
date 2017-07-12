package data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.ObjectMapper;

import entities.Profile;
import entities.User;

@Transactional
public class ProfileDAOImpl implements ProfileDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Profile index(int uid) {
		String query = "Select p FROM Profile p WHERE p.user.id = :id";
		return em.createQuery(query, Profile.class).setParameter("id", uid).getSingleResult();
	}
	
	@Override
	public Profile show(int uid, int pid) {
		return em.find(Profile.class, pid);
	}

	@Override
	public Profile create(int uid, String profileJson) {
		ObjectMapper mapper = new ObjectMapper();
		Profile mappedProfile = null;
		User u = em.find(User.class, uid);
		try {
			mappedProfile = mapper.readValue(profileJson, Profile.class);
			mappedProfile.setUser(u);
			em.persist(mappedProfile);
			em.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mappedProfile;
	}

	@Override
	public Profile update(int uid, String profileJson) {
		ObjectMapper mapper = new ObjectMapper();
		User managedUser = em.find(User.class, uid);
		try {
			Profile mappedProfile = mapper.readValue(profileJson, Profile.class);
			managedUser.getProfile().setFirstName(mappedProfile.getFirstName());
			managedUser.getProfile().setLastName(mappedProfile.getLastName());
			managedUser.getProfile().setAge(mappedProfile.getAge());
			managedUser.getProfile().setLocation(mappedProfile.getLocation());
			managedUser.getProfile().setWeight(mappedProfile.getWeight());
			managedUser.getProfile().setProfilePic(mappedProfile.getProfilePic());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return managedUser.getProfile();
	}

}
