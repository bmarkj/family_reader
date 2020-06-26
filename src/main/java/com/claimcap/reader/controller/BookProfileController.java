package com.claimcap.reader.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.claimcap.reader.model.Book;
import com.claimcap.reader.model.GBWrapper;
import com.claimcap.reader.service.BookService;


@Controller
public class BookProfileController {

	@Autowired
	BookService bookService;
	
	@RequestMapping("bookprofile")
	String getBookProfilePage (Model model, @RequestParam Long bookId ) {
		
		System.out.println(bookId);
		Book book = bookService.findById(bookId).get();
		String description = getApiData(book);
		
		model.addAttribute("title", "Book Profile");
		model.addAttribute("book", book);
		model.addAttribute("description", description);	
		
		return "bookprofile";
		
	}
	
	public String getApiData(Book book) {
		
		String title = book.getTitle();
		String titleSplit[] = title.split(" ");
		
		String queryString = "";
		
        for(int i = 0; i < titleSplit.length; i++) {
            if(i < titleSplit.length-1) {
                queryString += titleSplit[i] + "+";
            }else {
                queryString += titleSplit[i];
            }
        }

        String key = "AIzaSyADwOutmIYeRijGzcKqIg-b9F1Kl2ChBv4";
		
        //this creates an HTTP request & sends it to the Google Books (GB) API
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<GBWrapper> entity = restTemplate.getForEntity("https://www.googleapis.com/books/v1/volumes?q=title:" +
                queryString + "&key=" + key, GBWrapper.class);

        GBWrapper gbEntity = (GBWrapper) entity.getBody();
        String description = gbEntity.getItems()[0].getVolumeInfo().getDescription();//add to model as an attribute to send to template

        if (!(description == null)) {
            return description;
        }else {
            return "No description available for this book.";
        }
               
	}//end getApiData
	
}//end class
