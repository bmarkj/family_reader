package com.claimcap.reader.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.claimcap.reader.model.Book;
import com.claimcap.reader.model.Category;
import com.claimcap.reader.model.Level;
import com.claimcap.reader.service.CategoryService;
import com.claimcap.reader.service.LevelService;

@Controller
public class AdminLevelCatController {
	
	@Autowired
	private LevelService levelService;
	
	@Autowired
	private CategoryService categoryService;
	

	@GetMapping("managelc")
	String getManageLevelsPage(Model model) {
		
		model.addAttribute("title",  "Admin - Levels & Categories");
		
		return "managelc";
		
	}
	
	@GetMapping("addlevel")
	String getAddLevelPage(Model model) {
		
		model.addAttribute("title",  "Admin - Add Level");
		
		return "addlevel";
	}
	
	@PostMapping("addlevel")
	String processAddLevelForm(Model model, @RequestParam String name, RedirectAttributes redirect) {
		
		Level level = new Level(name);
		levelService.save(level);
		redirect.addFlashAttribute("success", "Level added:  " + level);
		
		return "redirect:/addlevel";
	}
	
	
	@GetMapping("addcategory")
	String getAddCategoryPage(Model model) {
		
		model.addAttribute("title", "Admin - Add Category");
		return "addcategory";
	}
	
	@PostMapping("addcategory")
	String processAddCategoryForm(Model model, @RequestParam String name, RedirectAttributes redirect) {
		
		Category category = new Category(name);
		categoryService.save(category);
		redirect.addFlashAttribute("success", "Category added:  " + category);
		
		return "redirect:/addcategory";
	}
	
	@GetMapping("getalllevels")
	String processGetAllLevels(Model model, RedirectAttributes redirect) {
		
		List<Level> levels = levelService.findAllLevelsOrderByIdAsc();
		redirect.addFlashAttribute("levels", levels);
		
		return "redirect:/managelc";
	}

	
	@GetMapping("getallcategories")
	String processGetAllCategories(Model model, RedirectAttributes redirect) {
		
		List<Category> categories = categoryService.findAllCatOrderByIdAsc();
		redirect.addFlashAttribute("categories", categories);
		
		return "redirect:/managelc";
	}


	@PostMapping("editlevel")
	String processEditLevelForm(Model model, @RequestParam Long id, @RequestParam String name, RedirectAttributes redirect ) {
		
		System.out.println(id);
		
		try {
			levelService.findById(id).ifPresent(level -> {
				level.setName(name);
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:managelc";
	}
	
}
