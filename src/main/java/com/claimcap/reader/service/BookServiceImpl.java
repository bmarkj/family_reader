package com.claimcap.reader.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.claimcap.reader.model.Book;
import com.claimcap.reader.repository.BookRepository;
import com.claimcap.reader.repository.CategoryRepository;
import com.claimcap.reader.repository.LevelRepository;

@Service
@Transactional
public class BookServiceImpl implements BookService{

	@Autowired
	private BookRepository bookRepository;	
	
	
	
	@Override
	public Optional<Book> findById(Long id) {
		
		return bookRepository.findById(id);
	}

	@Override
	public List<Book> searchBook(String keyword) {
		
		return bookRepository.searchBook(keyword);
	}

	@Override
	public List<Book> findAll() {
		
		return bookRepository.findAll();
	}

	@Override
	public void deleteBook(Long id) {

		bookRepository.deleteById(id);
	}

	@Override
	public List<Book> findAllOrderByTitleAsc() {
		
		return bookRepository.findAllOrderByTitleAsc();
	}

//	@Override
//	public List<Book> OrderByLevelIdAsc() {
//		
//		return bookRepository.OrderByLevelIdAsc();
//	}

	
	@Override
	public void save(Book book) {
		bookRepository.save(book);
		
	}

	@Override
	public List<Book> findAllByLevelAndCat(Long levelId, Long catId) {
		
		return bookRepository.findAllByLevelAndCat(levelId, catId);
	}

	@Override
	public List<Book> findByKeyword(String keyword) {
		
		return bookRepository.findByKeyword(keyword);
	}




}
