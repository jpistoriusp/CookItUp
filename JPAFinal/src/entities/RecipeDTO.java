package entities;

import java.util.List;

public class RecipeDTO {

	private String title;
	private String imgUrl;
	private String quantity;
	private String ing;
	
	
	
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	
	public String getIng() {
		return ing;
	}
	public void setIng(String ing) {
		this.ing = ing;
	}
	@Override
	public String toString() {
		return "RecipeDTO [title=" + title + ", imgUrl=" + imgUrl + ", quantity=" + quantity + ", ing=" + ing + "]";
	}
	
	
}
