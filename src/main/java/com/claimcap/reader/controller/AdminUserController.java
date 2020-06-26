package com.claimcap.reader.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.claimcap.reader.service.UserService;

@Controller
public class AdminUserController {
	
	@Autowired
	private UserService userService;


	
	@GetMapping("admin-users")
	String adminusers(Model model) {
		model.addAttribute("title", "Admin - Users");
		model.addAttribute("users", userService.findAll());
		model.addAttribute("msg", "Users");
		
		return "admin-users"; //this returns admin-users.jsp
	}

	@PostMapping("searchusers")
	String edit(@RequestParam String keyword, Model model) {

		model.addAttribute("users", userService.searchUser(keyword));
		model.addAttribute("msg", "user(s) Found");

		return "admin-users";
	}

	@PostMapping("updateUser")
	String update(RedirectAttributes redirect, @RequestParam String fname, @RequestParam String lname, @RequestParam String email) {

			userService.updateUser(fname, lname, email);
			redirect.addFlashAttribute("success", "Updated user: " + fname);

		return "redirect:/admin-users";
	}

	@PostMapping("editrole")
	String edit(@RequestParam String role, Long id, RedirectAttributes redirect) {

		userService.addRole(id, role);
		redirect.addFlashAttribute("success", "Role changed successfully");

		return "redirect:/admin-users";
	}

	@GetMapping("deleteuser")
	String deleteuser(@RequestParam Long id, RedirectAttributes redirect) {

		userService.deleteUser(id);
		redirect.addFlashAttribute("success","Delete Success");

		return "redirect:/admin-users"; //!!!!!!!!!!   NOTE: REDIRECT (not 'return') sends to a controller mapping address, NOT a .jsp page   !!!!!!!!!!
	}

	

}
