package controllers;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import data.ModDAO;
import entities.Rating;

@RestController
public class ModController {

	@Autowired
	private ModDAO mod;

	@RequestMapping(path = "api/search/rating", method = RequestMethod.GET)
	public Set<Rating> indexReview(HttpServletRequest req, HttpServletResponse res) {

		return mod.reviewIndex();
	}
}
