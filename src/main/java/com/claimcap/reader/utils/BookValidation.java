package com.claimcap.reader.utils;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.claimcap.reader.model.Book;

@Component
public class BookValidation implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		
		return Book.class.equals(clazz);
	}

	@Override
	public void validate(Object o, Errors errors) {
		
		Book book = (Book) o;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "size.book.title");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "author", "size.book.author");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "level", "size.book.level");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "category", "size.book.category");
		
	}

}
