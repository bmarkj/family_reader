package com.claimcap.reader.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.claimcap.reader.model.Post;
import com.claimcap.reader.service.BlogService;
import com.claimcap.reader.service.UserService;

@Controller
@SessionAttributes({ "loggedInuser", "role", "userId" })
public class BlogController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	BlogService blogService;
	
	
	
	
	@GetMapping("blog-pickspage")
	String getBlogPage(Model model) {
		
		List<Post> posts = blogService.findAllByIsStaffPick(true);
		model.addAttribute("title", "Blog - Staff Picks");
		model.addAttribute("posts", posts);
		 		
		return "blog-pickspage";
	}
	
	@GetMapping("blog-reviewspage")
	String getSingleBlog(Model model) {
		
		List<Post> posts = blogService.findAllByIsStaffPick(false);
		model.addAttribute("title", "Blog - Staff Picks");
		model.addAttribute("posts", posts);
		 		
		return "blog-reviewspage";
	}

	@GetMapping("newpost")
	String getNewpostPage (Model model) {
		
		model.addAttribute("title", "Blog - New Post");
		return "blog-newpost";
	}
	
	
	@PostMapping("addpost")
	String processAddStaffPick(Model model, @SessionAttribute("userId") Long userId, @RequestParam String type,
			@RequestParam String title, @RequestParam String quote, @RequestParam String content, RedirectAttributes redirect) {
		
		String author = userService.findById(userId).get().getFname() + " " + userService.findById(userId).get().getLname();
		Date date = new Date();
		
		Post post = new Post();
		post.setPostTitle(title);
		post.setPostAuthor(author);
		if("pick".equalsIgnoreCase(type)) {
			post.setStaffPick(true);
		} else {
			post.setStaffPick(false);
		}
		post.setPostDate(date);
		post.setQuote(quote);
		post.setPostContent(content);
		
		blogService.save(post);
		
		redirect.addFlashAttribute("success", "Post added:  " + post.getPostTitle());
		
		if("pick".equalsIgnoreCase(type)) {
			return "redirect:/blog-pickspage";
		}
		
		return "redirect:blog-reviewspage";

	}
	

}
