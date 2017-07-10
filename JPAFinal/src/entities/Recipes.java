package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class Recipes {
	
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int id;

@Column(name="image_url")
private String imgUrl;

@Column(name="source_url")
private String sourceUrl;

@Column(name="f2f_url")
private String f2fUrl;

@Column(name="recipe_id")
private int recipeId;

private String title;

private String publisher;

@Column(name="publisher_url")
private String publisherUrl;


@Column(name="social_rank")
private String socialRank;

private String ingredients;





public String getImgUrl() {
	return imgUrl;
}


public void setImgUrl(String imgUrl) {
	this.imgUrl = imgUrl;
}


public int getRecipeId() {
	return recipeId;
}


public void setRecipeId(int recipeId) {
	this.recipeId = recipeId;
}


public int getId() {
	return id;
}


public String getSourceUrl() {
	return sourceUrl;
}


public void setSourceUrl(String sourceUrl) {
	this.sourceUrl = sourceUrl;
}


public String getF2fUrl() {
	return f2fUrl;
}


public void setF2fUrl(String f2fUrl) {
	this.f2fUrl = f2fUrl;
}


public String getTitle() {
	return title;
}


public void setTitle(String title) {
	this.title = title;
}


public String getPublisher() {
	return publisher;
}


public void setPublisher(String publisher) {
	this.publisher = publisher;
}


public String getPublisherUrl() {
	return publisherUrl;
}


public void setPublisherUrl(String publisherUrl) {
	this.publisherUrl = publisherUrl;
}


public String getSocialRank() {
	return socialRank;
}


public void setSocialRank(String socialRank) {
	this.socialRank = socialRank;
}


public String getIngredients() {
	return ingredients;
}


public void setIngredients(String ingredients) {
	this.ingredients = ingredients;
}


@Override
public String toString() {
	return "Recipes [id=" + id + ", imgUrl=" + imgUrl + ", sourceUrl=" + sourceUrl + ", f2fUrl=" + f2fUrl
			+ ", recipeId=" + recipeId + ", title=" + title + ", publisher=" + publisher + ", publisherUrl="
			+ publisherUrl + ", socialRank=" + socialRank + ", ingredients=" + ingredients + "]";
}





}
