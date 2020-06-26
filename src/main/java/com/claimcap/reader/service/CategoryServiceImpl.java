package com.claimcap.reader.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.claimcap.reader.model.Category;
import com.claimcap.reader.repository.CategoryRepository;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryRepository categoryRepository;
	
	
	
	@Override
	public Optional<Category> findById(Long id) {
		return categoryRepository.findById(id);
	}

	@Override
	public List<Category> findAll() {
		return categoryRepository.findAll();
	}

	@Override
	public List<Category> findAllCatOrderByIdAsc() {

		return categoryRepository.findAllCatOrderByIdAsc();
	}

	@Override
	public void save(Category category) {
		
		categoryRepository.save(category);
	}

	@Override
	public Category findCategoryByName(String name) {
		
		return categoryRepository.findCategoryByName(name);
	}



}
