package entities;

import java.util.List;

public class RecipeDTO {

	private String title;
	private String imgUrl;
	private List<IngredientDTO> ingredients;
	private List<InstructionDTO> instructions;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public List<IngredientDTO> getIngredients() {
		return ingredients;
	}
	public void setIngredients(List<IngredientDTO> ingredients) {
		this.ingredients = ingredients;
	}
	public List<InstructionDTO> getInstructions() {
		return instructions;
	}
	public void setInstructions(List<InstructionDTO> instructions) {
		this.instructions = instructions;
	}
	@Override
	public String toString() {
		return "RecipeDTO [title=" + title + ", imgUrl=" + imgUrl + ", ingredients="
				+ ingredients + ", instructions=" + instructions + "]";
	}
	
	
}
