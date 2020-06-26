package com.claimcap.reader.service;

import java.util.List;
import java.util.Optional;

import com.claimcap.reader.model.Post;

public interface BlogService {
	
	Optional<Post> findById(Long id);
	List<Post> findAll();
	List<Post> findAllByIsStaffPick(boolean value);
	void save(Post post);
	Post findPostByKeyword(String keyword);


}
