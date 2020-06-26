package com.claimcap.reader.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.claimcap.reader.model.Book;
import com.claimcap.reader.model.Post;

@Repository
public interface BlogRepository extends JpaRepository<Post, Long> {
	
	
	@Query("FROM Post WHERE staffPick=?1")
	List<Post> findAllByIsStaffPick(boolean value);


}
