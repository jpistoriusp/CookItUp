package data;

import entities.Profile;
import entities.User;

public interface ProfileDAO {
	
	public Profile index(int uid);

	public Profile show(int uid, int pid);
	
	public Profile create(int uid, String profileJson);
	
	public Profile update(int uid, String profileJson);
	
	public User showUser(int uid);
}
