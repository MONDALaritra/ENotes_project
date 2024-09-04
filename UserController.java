package com.packages.controller;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.packages.dao.UserDao;
import com.packages.entity.Notes;
import com.packages.entity.User;

@Controller
@RequestMapping("/user/")
public class UserController {
	
	@Autowired 
	private UserDao userdao;
	@RequestMapping("/addnotes")
	public String addNotes() {
		return "AddNotes";
	}
	
	@RequestMapping("/viewnotes")
	public String viewNotes(HttpSession session, Model m) {
		User user = (User) session.getAttribute("userObj");
		List<Notes> notes = userdao.getNotesByUser(user);
		m.addAttribute("list", notes);
		return "viewNotes";
	}
	
	@RequestMapping("/editNotes")
	public String editNotes(@RequestParam("id") int id, Model m) {
		Notes n = userdao.getNotesById(id);
		m.addAttribute("notes", n);
		return "editNotes";
	}
	
	@RequestMapping(path="/updateNotes", method= RequestMethod.POST)
	public String updateNotes(@ModelAttribute Notes n, HttpSession session) {
		User us = (User) session.getAttribute("userObj");
		n.setUser(us);
		n.setDate(LocalDateTime.now().toString());
		session.setAttribute("msg", "✅ Note is successfully updated");
		userdao.updateNotes(n);
		return "redirect:/user/viewnotes";
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userObj");
		session.setAttribute("msg", "✅ successfully logged out");
		return "redirect:/login";
		
	}
	
	@RequestMapping(path = "/savenotes" , method = RequestMethod.POST)
	public String saveNotes(@ModelAttribute Notes notes, HttpSession session) {
		User us = (User) session.getAttribute("userObj");
		notes.setDate(LocalDateTime.now().toString());
		notes.setUser(us);
		userdao.saveNotes(notes);
		session.setAttribute("msg", "Note added successfully");
		return "redirect:/user/addnotes";
	}
	
	@RequestMapping("/deleteNotes")
	public String deleteNotes(@RequestParam("id") int id, HttpSession session) {
		
		userdao.deleteNode(id);
		session.setAttribute("msg", " ✅ Note deleted successfully");
		return "redirect:/user/viewnotes";
	}
	
	
}
