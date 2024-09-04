package com.packages.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.packages.dao.UserDao;
import com.packages.entity.User;

@Controller
public class HomeController {
	
	@Autowired
	private UserDao userdao;
	@RequestMapping("/home")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/login")
	public String loginPage() {
		return "login";
	}
	
	@RequestMapping("/register")
	public String registerPage() {
		return "register";
	}
	
	
	
	@RequestMapping(path = "/registerUser", method = RequestMethod.POST )
	public String registerUser(@ModelAttribute User user, HttpSession session) {
		userdao.saveUser(user);
		session.setAttribute("mssg", " ✅ register successfully");
		//System.out.println(user);
		return "redirect:/register";
	}
	
	@RequestMapping(path="/loginUser" , method = RequestMethod.POST)
	public String loginUser(@RequestParam ("email") String email, @RequestParam ("password") String password, HttpSession session) {
		
		User user = userdao.loginUser(email, password);
		if(user!=null) {
			session.setAttribute("userObj", user);
			return "userprofile";
			
		}else {
			session.setAttribute("msg", "❌ Invalid email or password");
			return "redirect:/login";
		}
		
	}
}
