package entities;

public class RatingDTO {
	
	private int value;
	
	private String review;
	
	private int userId;
	
	private Recipe recipe;

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Recipe getRecipe() {
		return recipe;
	}

	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}

	@Override
	public String toString() {
		return "RatingDTO [value=" + value + ", review=" + review + ", userId=" + userId + ", recipe=" + recipe + "]";
	}
	
	
}
