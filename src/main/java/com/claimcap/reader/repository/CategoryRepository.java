package com.claimcap.reader.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.claimcap.reader.model.Category;

public interface CategoryRepository extends JpaRepository<Category, Long> {
	
	@Query("FROM Category ORDER BY id ASC")
    List<Category> findAllCatOrderByIdAsc();

	@Query("FROM Category WHERE name=?1")
	Category findCategoryByName(String name);
	
}
