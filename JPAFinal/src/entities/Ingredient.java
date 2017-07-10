package entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class Ingredient {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@ManyToMany
	@JoinTable(name="tag_ingredient",
	joinColumns=@JoinColumn(name="ingredient_id"),
	inverseJoinColumns=@JoinColumn(name="tag_id"))
	private List<Tag> tags;

	
	
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



	@Override
	public String toString() {
		return "Ingredient [name=" + name + ", tags=" + tags + "]";
	}
	
}
