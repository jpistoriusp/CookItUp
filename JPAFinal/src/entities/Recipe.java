package entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class Recipe {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "image_url")
	private String imgUrl;

	@Column(name = "source_url")
	private String sourceUrl;

	private String title;

	@ManyToMany
	@JoinTable(name = "rating", joinColumns = @JoinColumn(name = "recipe_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
	private List<User> user;

	@Column(name = "social_rank")
	private String socialRank;

	@ManyToMany
	@JoinTable(name = "recipe_tag", joinColumns = @JoinColumn(name = "recipe_id"), inverseJoinColumns = @JoinColumn(name = "tag_id"))
	private List<Tag> tags;

	@OneToMany(mappedBy = "recipe")
	private List<Rating> rating;

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSocialRank() {
		return socialRank;
	}

	public void setSocialRank(String socialRank) {
		this.socialRank = socialRank;
	}

	@Override
	public String toString() {
		return "Recipe [id=" + id + ", imgUrl=" + imgUrl + ", sourceUrl=" + sourceUrl + ", title=" + title + ", user="
				+ user + ", socialRank=" + socialRank + ", tags=" + tags + ", rating=" + rating + "]";
	}

}
