package entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Ingredient {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	@ManyToMany
	@JoinTable(name = "tag_ingredient", joinColumns = @JoinColumn(name = "ingredient_id"), inverseJoinColumns = @JoinColumn(name = "tag_id"))
	@JsonIgnore
	private List<Tag> tags;

	@ManyToMany
	@JoinTable(name = "recipe_ingredient", 
	joinColumns = @JoinColumn(name = "ingredient_id"), 
	inverseJoinColumns = @JoinColumn(name = "recipe_id"))
	@JsonIgnore
	private List<Recipe> recipe;
	
	@OneToMany(mappedBy="ingredient")
	@JsonIgnore
	private List<RecipeIngredient> recipeIngredient;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public List<Recipe> getRecipe() {
		return recipe;
	}

	public void setRecipe(List<Recipe> recipe) {
		this.recipe = recipe;
	}

	public List<RecipeIngredient> getRecipeIngredient() {
		return recipeIngredient;
	}

	public void setRecipeIngredient(List<RecipeIngredient> recipeIngredient) {
		this.recipeIngredient = recipeIngredient;
	}

	@Override
	public String toString() {
		return "Ingredient [id=" + id + ", name=" + name + "]";
	}
	
	





}
