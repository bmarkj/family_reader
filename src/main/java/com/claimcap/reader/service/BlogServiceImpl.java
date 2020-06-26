package com.claimcap.reader.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.claimcap.reader.model.Post;
import com.claimcap.reader.repository.BlogRepository;

@Service
@Transactional
public class BlogServiceImpl implements BlogService{
	
	@Autowired
	BlogRepository blogRepository;

	@Override
	public Optional<Post> findById(Long id) {
		
		return blogRepository.findById(id);
	}

	@Override
	public List<Post> findAll() {
		
		return blogRepository.findAll();
	}

	@Override
	public void save(Post post) {
		
		blogRepository.save(post);
	}

	@Override
	public List<Post> findAllByIsStaffPick(boolean value) {
		
		return blogRepository.findAllByIsStaffPick(value);
	}

	@Override
	public Post findPostByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

}
