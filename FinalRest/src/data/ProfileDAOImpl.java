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
	public Profile update(int uid, int pid, String profileJson) {
		ObjectMapper mapper = new ObjectMapper();
		Profile managedProfile = em.find(Profile.class, pid);
		try {
			Profile mappedProfile = mapper.readValue(profileJson, Profile.class);
			managedProfile.setFirstName(mappedProfile.getFirstName());
			managedProfile.setLastName(mappedProfile.getLastName());
			managedProfile.setAge(mappedProfile.getAge());
			managedProfile.setLocation(mappedProfile.getLocation());
			managedProfile.setWeight(mappedProfile.getWeight());
			managedProfile.setProfilePic(mappedProfile.getProfilePic());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return managedProfile;
	}

}
