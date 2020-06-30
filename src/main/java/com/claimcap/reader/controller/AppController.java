package com.claimcap.reader.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.claimcap.reader.model.User;
import com.claimcap.reader.repository.PaymentMethodRepository;
import com.claimcap.reader.service.UserService;
import com.claimcap.reader.utils.DataValidation;
import com.claimcap.reader.utils.WebUtils;

@Controller
@SessionAttributes({"loggedInuser","role", "userId"})
public class AppController {
	
	@Autowired
	private UserService userService;

	@Autowired
	private DataValidation dataValidation;

	@Autowired
	PaymentMethodRepository paymentMethodRepository;
	
	@Autowired
	WebUtils webUtils;
	

	
	@GetMapping({"/", "index"}) //handles mapping to: app directory root and mapping name 
	public String processIndexPage(Model model) {

		model.addAttribute("title", "Family Reader - Home");
		
		return "index"; //returns user to this jsp page
	}
	
	@GetMapping("about")
	String about(Model model) {

		model.addAttribute("title", "Family Reader - About");
		model.addAttribute("msg", "");

		return "about";
	}
	
	@GetMapping("staffbios")
	String getStaffBiosPage (Model model) {
		
		model.addAttribute("title", "About - Staff Profiles");
		return "staffbios";
	}

	@GetMapping("contact")
	String processContactPage(Model model) {

		model.addAttribute("title", "Family Reader - Contact");
		model.addAttribute("msg", "");

		return "contact";
	}
	
	@GetMapping("register")
	String register(Model model) {

		model.addAttribute("msg", "");
		model.addAttribute("user", new User());

		return "register";		
	}

	@PostMapping("register")
	String register(Model model, @ModelAttribute User user, BindingResult result) {

		dataValidation.validate(user, result);
		if (result.hasErrors()) {
			return "register";
		}
		
		user.setRole("USER"); // this is the default for everyone 
		userService.save(user); //persist this user role in db
		model.addAttribute("msg", "Registration success, thank you " + user.getFname());

		return "login";
	}//end "register" mapping

	
	@GetMapping("login")
	String login(Model model) {

		model.addAttribute("title", "Family Reader - Login");
		model.addAttribute("msg", "Please login");
		return "login";
	}
		
	@PostMapping("login")
	String login(@RequestParam String email, @RequestParam String password, RedirectAttributes redirect, Model model) {

		Optional<User> findUser = userService.login(email, password);
		
		if(findUser.isPresent()) {
			model.addAttribute("loggedInuser", email);
			model.addAttribute("userId", findUser.get().getId());
			model.addAttribute("role", findUser.get().getRole()); //get() is a method required when using the Optional class
			redirect.addFlashAttribute("msg", "Welcome");

		} else {
			redirect.addFlashAttribute("error", "Invalid credentials");
			return "redirect:/login";
		}

		return "redirect:/profile";
	}
	
	@GetMapping("logout")
	String logout(Model model, SessionStatus status) {
		status.setComplete(); //terminates session
		model.addAttribute("loggedInuser", ""); //removes from session
		model.addAttribute("role", "");			//removes from session
		model.addAttribute("msg", "You have been logged out");
		return "login";
	}


	@PostMapping("sendemail")
	String sendemail(Model model, @RequestParam String email, @RequestParam String name, @RequestParam String message, @RequestParam String subject) {
		try {
			webUtils.sendMail(email, message + " From " + name, subject);
			model.addAttribute("msg", "Thank you " + name + ", your email was sent :)");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "contact";	 
 	}


	

}
