package com.claimcap.reader.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.claimcap.reader.model.Book;
import com.claimcap.reader.service.BookService;
import com.claimcap.reader.service.CategoryService;
import com.claimcap.reader.service.LevelService;

@Controller
@SessionAttributes({"loggedInuser","role"})
public class SearchController {
	
	@Autowired
	BookService bookService;
	
	@Autowired
	LevelService levelService;
	
	@Autowired
	CategoryService categoryService;
	
	
	
	
	
	@GetMapping("searchbooks-lc")
	String getSearchPageLC(Model model) {
		
		model.addAttribute("title", "Search - Level / Category");
		return "searchbooks-lc";
	}
	
	@GetMapping("searchlc") 
	String getBooksLC (Model model, @RequestParam Long levelId, @RequestParam Long catId, RedirectAttributes redirect) {
				
		List<Book> books = bookService.findAllByLevelAndCat(levelId, catId);
		String level = levelService.findById(levelId).get().getName();
		String category = categoryService.findById(catId).get().getName();
		redirect.addFlashAttribute("level", level);
		redirect.addFlashAttribute("category", category);
		redirect.addFlashAttribute("books", books);
		
		return "redirect:searchbooks-lc";
	}
	
	@GetMapping("searchbooks-ta")
	String getSearchPageTA(Model model) {
		

		model.addAttribute("title", "Search - Title / Author");
		return "searchbooks-ta";
	}
	
	@GetMapping("search-ta")
	String getBooksTA (Model model, @RequestParam String keyword, RedirectAttributes redirect) {
		
		List<Book> books = bookService.findByKeyword(keyword);
		redirect.addFlashAttribute("books", books);
		
		return "redirect:searchbooks-ta";
		
	}
	

}
