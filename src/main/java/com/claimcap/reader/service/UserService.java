package com.claimcap.reader.service;

import java.util.List;
import java.util.Optional;

import com.claimcap.reader.model.User;

//A service sits between the controller and the repository

public interface UserService {

	Optional<User> findByEmail(String email);
	Optional<User> login(String email, String password);
	Optional<User> findById(Long id);
	List<User> searchUser(String keyword);
	List<User> findAll();
	void deleteUser(Long id);
	void save(User user);
	void addRole(Long id, String role);
	void updateUser(String fname, String lname, String email);
	
}
