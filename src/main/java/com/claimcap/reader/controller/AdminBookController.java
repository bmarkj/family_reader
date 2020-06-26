package com.claimcap.reader.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.claimcap.reader.model.Book;
import com.claimcap.reader.service.BookService;
import com.claimcap.reader.service.CategoryService;
import com.claimcap.reader.service.LevelService;
import com.claimcap.reader.utils.BookValidation;

@Controller
public class AdminBookController {

	@Autowired
	private LevelService levelService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private BookService bookService;
	
	@Autowired
	BookValidation bookValidation;

	
	
	@GetMapping("admin-books")
	String adminbooks(Model model) {
		model.addAttribute("title", "Admin - Books");
		
		
		return "admin-books";
	}

	@GetMapping("addbook")
	String getAddbookPage(Model model) {
		
		model.addAttribute("title",  "Admin - Add Book");
		model.addAttribute("book", new Book());
		model.addAttribute("levels", levelService.findAllLevelsOrderByIdAsc());
		model.addAttribute("categories", categoryService.findAllCatOrderByIdAsc());
		
		return "addbook";
	}
		
	@PostMapping("addbook")
	String processAddBookForm(Model model, @ModelAttribute Book book, BindingResult result, RedirectAttributes redirect) {
		
			List<Book> books = bookService.findAll();
			
			bookValidation.validate(book, result);
			if (result.hasErrors()) {
				
				model.addAttribute("levels", levelService.findAllLevelsOrderByIdAsc());
				model.addAttribute("categories", categoryService.findAllCatOrderByIdAsc());

				return "addbook";
			}

			if(books != null) {
				 for (Book thisbook : books) {
					if(thisbook.getTitle().toLowerCase().equalsIgnoreCase(book.getTitle()) &&
							thisbook.getAuthor().toLowerCase().equalsIgnoreCase(book.getAuthor())) {
						
						redirect.addFlashAttribute("danger", thisbook.getTitle() + " is already in the database");
						redirect.addFlashAttribute("levels", levelService.findAllLevelsOrderByIdAsc());
						redirect.addFlashAttribute("categories", categoryService.findAllCatOrderByIdAsc());
						
						return "redirect:addbook";
						}//end inner if 
					}//end for 
				}//end outer if
				 			
			bookService.save(book);
			
			redirect.addFlashAttribute("success", "Book added:  " + book.getTitle());
			return "redirect:/addbook";
	}
	
	@GetMapping("getallbooks")
	String processGetAllBooks(Model model, RedirectAttributes redirect) {
		
		List<Book> books = bookService.findAllOrderByTitleAsc();
		redirect.addFlashAttribute("books", books);
		redirect.addFlashAttribute("levels", levelService.findAll());
		redirect.addFlashAttribute("categories", categoryService.findAll());
		
		return "redirect:/admin-books";
	}
	
	@PostMapping("editbook")
	String processEditBook (@RequestParam Long id, @RequestParam String title, @RequestParam String author, 
			@RequestParam Long level, @RequestParam Long category, @RequestParam String isbn, Model model,
			RedirectAttributes redirect) {
		
		model.addAttribute("title",  "Admin - Edit Book");
		
		try {
			bookService.findById(id).ifPresent(book -> {
				book.setTitle(title);
				book.setAuthor(author);
				book.setLevel(levelService.findById(level).get());
				book.setCategory(categoryService.findById(category).get());
				book.setIsbn(isbn);
				
				bookService.save(book);
				
			});
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		redirect.addFlashAttribute("success", "You edited " + title);
		
		return "redirect:/admin-books";
	}
	
	@GetMapping("deletebook")
	String processDeleteBook(@RequestParam Long id, RedirectAttributes redirect) {
		
		bookService.deleteBook(id);
		redirect.addFlashAttribute("books", bookService.findAll());
		redirect.addFlashAttribute("success", "Book deleted");
		
		return "redirect:admin-books";	
	}

}
