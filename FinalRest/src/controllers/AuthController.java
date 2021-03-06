package controllers;

import java.nio.file.Path;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import data.AuthDAO;
import entities.User;

@RestController
@RequestMapping("/auth")
public class AuthController {

	@Autowired
	private AuthDAO authDAO;

	@RequestMapping(path = "/register/", method = RequestMethod.POST)
	public User register(HttpSession session, @RequestBody User user, HttpServletResponse response) {
		User u = authDAO.register(user);
		System.out.println(u+"asdfasdf");
		if(u!=null){
			
			session.setAttribute("user", u);
		}
		else {
			response.setStatus(409);
			return null;
		}
		return u;
	}

	@RequestMapping(path = "/login/", method = RequestMethod.POST)
	public User login(HttpSession session, @RequestBody User user, HttpServletResponse response) {
		User u = authDAO.login(user);
		session.setAttribute("user", u);
		if(u != null){
		return u;
		}
		else{
			response.setStatus(400);
			return null;
		}
	}

	@RequestMapping(path = "/logout/", method = RequestMethod.POST)
	public Boolean logout(HttpSession session, HttpServletResponse response) {
		session.removeAttribute("user");
		return true;
	}

	@RequestMapping(path = "/unauthorized")
	public String unauth(HttpServletResponse response) {
		response.setStatus(401);
		return "unauthorized";
	}
}
