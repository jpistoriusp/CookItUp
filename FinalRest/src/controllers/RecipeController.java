package controllers;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import data.RecipeDAO;
import entities.Instruction;
import entities.Recipe;
import entities.RecipeIngredient;

@RestController
public class RecipeController {
	
	@Autowired
	private RecipeDAO recipedao;
	
	@RequestMapping(path = "search/recipe", method = RequestMethod.POST)
	public Collection<Recipe> index(HttpServletRequest req, HttpServletResponse res, @RequestBody String json) {
		
		try {
			return recipedao.index(json);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
  
	@RequestMapping(path = "user/{uid}/recipe/{rid}", method = RequestMethod.GET)
	public Recipe show(HttpServletRequest req, HttpServletResponse res, @PathVariable int uid, @PathVariable int rid){
		return recipedao.show(uid, rid);
	}
  
	@RequestMapping(path = "user/{uid}/recipe", method = RequestMethod.POST)
	public Recipe create(HttpServletRequest req, HttpServletResponse res, @PathVariable int uid, @RequestBody String recipeJson){
		return recipedao.create(uid, recipeJson);
	}
  
	@RequestMapping(path = "user/{uid}/recipe/{rid}", method = RequestMethod.PUT)
	public Recipe update(HttpServletRequest req, HttpServletResponse res, @PathVariable int uid, @PathVariable int rid, @RequestBody String recipeJson){
		return recipedao.update(uid, rid, recipeJson);
	}
	
	@RequestMapping(path = "search/recipe/{rid}/recipeIngredient", method = RequestMethod.GET)
	public Collection<RecipeIngredient> showIngredients(HttpServletRequest req, HttpServletResponse res, @PathVariable int rid){
		return recipedao.showIngredients(rid);
	}
	
	@RequestMapping(path = "search/recipe/{rid}/instruction", method = RequestMethod.GET)
	public Collection<Instruction> showInstructions(HttpServletRequest req, HttpServletResponse res, @PathVariable int rid){
		return recipedao.showInstructions(rid);
	}
  
	@RequestMapping(path = "user/{uid}/recipe/{rid}", method = RequestMethod.DELETE)
	public Boolean destroy(HttpServletRequest req, HttpServletResponse res, @PathVariable int uid, @PathVariable int rid) {
		return recipedao.destroy(uid, rid);
	}
}
