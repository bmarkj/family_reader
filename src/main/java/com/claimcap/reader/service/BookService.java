package com.claimcap.reader.service;

import java.util.List;
import java.util.Optional;

import com.claimcap.reader.model.Book;

public interface BookService {
	
	Optional<Book> findById(Long id);
	List<Book> searchBook(String keyword);
	List<Book> findAll();
	List<Book> findAllOrderByTitleAsc();
	List<Book> findAllByLevelAndCat(Long levelId, Long catId);
	List<Book> findByKeyword(String keyword);
	void deleteBook(Long id);
	void save(Book book);
}
