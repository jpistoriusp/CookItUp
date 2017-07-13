package data;

import java.util.Set;

import entities.Rating;

public interface ModDAO {
	public Set<Rating> reviewIndex();
	public boolean delReview(int id);
}
