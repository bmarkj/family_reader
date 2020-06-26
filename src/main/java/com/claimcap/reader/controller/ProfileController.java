package com.claimcap.reader.controller;

import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.claimcap.reader.model.ContactInfo;
import com.claimcap.reader.model.PaymentMethod;
import com.claimcap.reader.model.User;
import com.claimcap.reader.repository.ContactInfoRepository;
import com.claimcap.reader.repository.PaymentMethodRepository;
import com.claimcap.reader.service.UserService;
import com.claimcap.reader.utils.States;
import com.claimcap.reader.utils.WebUtils;


@Controller
public class ProfileController {
	
	@Autowired
	private UserService userService;

	@Autowired
	private ContactInfoRepository contactInfoRepository;

	@Autowired
	PaymentMethodRepository paymentMethodRepository;
	
	@Autowired
	private WebUtils webUtils;


	
	@GetMapping("profile")
	String profile(@SessionAttribute("loggedInuser") String email, Model model) {
		
		model.addAttribute("title", "Family Reader - Profile");
		model.addAttribute("user_account", userService.findByEmail(email).get());

		if(userService.findByEmail(email).get().getContactInfo() != null) {
			model.addAttribute("contact_info", userService.findByEmail(email).get().getContactInfo());
		}
		else {
			
			model.addAttribute("contact_info", new ContactInfo());
		}
		
		return "profile";
	}
	
	@PostMapping("savecontact")
	String savecontact(@ModelAttribute ContactInfo info, RedirectAttributes redirect) {

		contactInfoRepository.save(info);
		redirect.addFlashAttribute("msg", "Contact saved");

		return "redirect:/profile";
	}

	@PostMapping("updatecontact")
	String updatecontact(@ModelAttribute ContactInfo contact_info, RedirectAttributes redirect) { //data comes from front end (user)

		try {
			User user=userService.findById(contact_info.getId()).get();
			contact_info.setUser(user);
			contactInfoRepository.save(contact_info);
			redirect.addFlashAttribute("success", "Address Updated");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:profile";

	}
	
	@PostMapping("addcard")
	String addcard(@RequestParam String cardType, @RequestParam String cardNo, @RequestParam String secCode, @RequestParam String expiry, @RequestParam Long id, RedirectAttributes redirect) {
		
		User user = userService.findById(id).get();
		PaymentMethod pay = new PaymentMethod();
		pay.setCardType(cardType);
		pay.setCardNo(cardNo);
		pay.setExpiry(expiry);
		pay.setSecCode(secCode);
		pay.setUser(user);
		paymentMethodRepository.save(pay);
		
		redirect.addFlashAttribute("success", "Card added");
		
		return "redirect:profile";
	}
	
	@GetMapping("deletecard")
	String removecard(@RequestParam Long id, RedirectAttributes redirect) {
		
		paymentMethodRepository.deleteById(id);
		redirect.addFlashAttribute("success", "Card deleted");
		
		return "redirect:profile";
	}
	
	@PostMapping("editcard")
	String processEditCard(@RequestParam Long id, @RequestParam String cardType, @RequestParam String cardNo, @RequestParam String secCode, @RequestParam String expiry, RedirectAttributes redirect) {
		
		try {
			paymentMethodRepository.findById(id).ifPresent( a -> {
				a.setCardType(cardType);
				a.setCardNo(cardNo);
				a.setSecCode(secCode);
				a.setExpiry(expiry);
				paymentMethodRepository.save(a);
			});
			
			redirect.addFlashAttribute("success", "Card updated");

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:profile";
	}

	@PostMapping("/addimages")
	public String addprofileImg(@RequestParam MultipartFile file, 
			@RequestParam Long id, RedirectAttributes model) {

		Pattern ext = Pattern.compile("([^\\s]+(\\.(?i)(png|jpg|pdf|gif|jpeg))$)");
		try {

			if(file != null && file.isEmpty()){
				model.addFlashAttribute("error", "Error: no file Selected "); 
				return "redirect:profile"; 
			} 
			if(file.getSize()>1073741824){
				model.addFlashAttribute("error","File size "+file.getSize()+"KB exceeds max allowed size, try another photo ");
				return "redirect:profile"; 
			} 
			
			Matcher mtch = ext.matcher(file.getOriginalFilename());

			if (!mtch.matches()) {
				model.addFlashAttribute("error", "Invalid Image type "); 
				return "redirect:profile";			  
			}			 		
			//save image
			webUtils.addProfilePhoto(file, id, "users");
			model.addFlashAttribute("success", "Upload success "+ file.getSize()+" KB");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:profile";
	}

	@ModelAttribute("states")
	public List<States> populateStates(){    	
		return Arrays.asList(States.values());
	}

	@ModelAttribute("contact_info") 
	ContactInfo info2(){
		return new ContactInfo();
	}

}
