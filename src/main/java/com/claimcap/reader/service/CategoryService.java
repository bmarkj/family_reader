package com.claimcap.reader.service;

import java.util.List;
import java.util.Optional;

import com.claimcap.reader.model.Category;

public interface CategoryService {
	
	Optional<Category> findById(Long id);
	List<Category> findAll();
	List<Category> findAllCatOrderByIdAsc();
	void save(Category category);
	Category findCategoryByName(String name);

}