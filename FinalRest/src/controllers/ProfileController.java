package controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import data.ProfileDAO;
import entities.Profile;

@RestController
public class ProfileController {
	
	@Autowired
	private ProfileDAO profileDAO;
	
	@RequestMapping(path = "/user/{uid}/profile", method = RequestMethod.GET)
	public Profile index(HttpServletRequest req, HttpServletResponse res, @PathVariable int uid) {
		return profileDAO.index(uid);
	}
	
	@RequestMapping(path = "/user/{uid}/profile/{pid}", method = RequestMethod.GET)
    public Profile show(HttpServletRequest req, HttpServletResponse res, @PathVariable int uid, @PathVariable int pid) {
        return profileDAO.show(uid, pid);
    }
    
    @RequestMapping(path= "/user/{uid}/profile", method = RequestMethod.POST)
    public Profile create(HttpServletRequest req, HttpServletResponse res, @PathVariable int uid, @RequestBody String profileJson) {
        return profileDAO.create(uid, profileJson);
    }
    
    @RequestMapping(path = "/user/{uid}/profile", method = RequestMethod.PUT)
    public Profile update(HttpServletRequest req, HttpServletResponse res, @PathVariable int uid, @RequestBody String profileJson) {
        return profileDAO.update(uid, profileJson);
    }
}
