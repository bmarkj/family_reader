package com.claimcap.reader.controller;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.claimcap.reader.model.Book;
import com.claimcap.reader.model.User;
import com.claimcap.reader.service.BookService;
import com.claimcap.reader.service.UserService;

@Controller
@SessionAttributes({ "loggedInuser", "role", "userId" })
public class ReadingListController {

	@Autowired
	UserService userService;

	@Autowired
	BookService bookService;

	@GetMapping("addtolist")
	String addBookToMyList(Model model, @SessionAttribute("userId") Long userId, @RequestParam Long bookId,
			RedirectAttributes redirect) {
		
		Optional<User> user = userService.findById(userId);
		
		List<Book> myBooks = user.get().getBooks();
		System.out.println(bookId);
		for(Book book : myBooks) {
			System.out.println(book.getId());
			if((long) book.getId() == (long) bookId) {
				System.out.println("true");
				redirect.addFlashAttribute("danger", bookService.findById(bookId).get().getTitle() + " is already in your reading list");
				return "redirect:mylist";
			} 
		}
		
		user.get().getBooks().add(bookService.findById(bookId).get());
		userService.save(user.get());

		return "redirect:mylist";
	}

	@SuppressWarnings("null")
	@GetMapping("mylist")
	String processMylist(Model model, @SessionAttribute("userId") Long userId) {

		model.addAttribute("title",  "My Reading List");
		List<Book> books = userService.findById(userId).get().getBooks();
		
		if (books.size() > 0) {
			Collections.sort(books, Book.compareByLevel);
			model.addAttribute("books", books);
		} else {
			model.addAttribute("msg", "There are no books in your reading list");
		}

		return "mylist";
	}
	
	@GetMapping("deletemybook")
	String processDelete(Model model, @SessionAttribute("userId") Long userId, Long bookId) {

		Optional<User> user = userService.findById(userId);
		user.get().getBooks().remove(bookService.findById(bookId).get());
		userService.save(user.get());
		
		return "redirect:mylist";
	}

}
