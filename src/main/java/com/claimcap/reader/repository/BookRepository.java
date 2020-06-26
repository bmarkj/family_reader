package com.claimcap.reader.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.claimcap.reader.model.Book;

public interface BookRepository extends JpaRepository<Book, Long> {

	@Query("FROM Book b WHERE b.author=?1 OR b.title=?1")
	List<Book> searchBook(String keyword);
	
	@Query("FROM Book ORDER BY title ASC")
    List<Book> findAllOrderByTitleAsc();
		
	@Query("From Book b WHERE b.level.id=?1 AND b.category.id=?2")
	List<Book> findAllByLevelAndCat(Long levelId, Long catId);
	
	@Query("From Book WHERE author LIKE %?1% OR title LIKE %?1%")
	List<Book> findByKeyword(String keyword);
}
