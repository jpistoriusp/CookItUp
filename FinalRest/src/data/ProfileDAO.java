package data;

import entities.Profile;

public interface ProfileDAO {
	public Profile show(int uid, int pid);
	
	public Profile create(int uid, String profileJson);
	
	public Profile update(int uid, int pid, String profileJson);
}
