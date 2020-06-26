package com.claimcap.reader.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.claimcap.reader.model.User;
import com.claimcap.reader.repository.UserRepository;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserRepository userRepository;

	
	@Override
	public Optional<User> findByEmail(String email) {
		
		return userRepository.findByEmail(email);
	}

	@Override
	public Optional<User> login(String email, String password) {
		
		return userRepository.login(email, password);
	}

	@Override
	public List<User> searchUser(String keyword) {
		
		return userRepository.searchUser(keyword);
	}

	@Override
	public Optional<User> findById(Long id) {
		
		return userRepository.findById(id);
	}

	@Override
	public void deleteUser(Long id) {
		
		userRepository.deleteById(id);
	}

	@Override
	public void save(User user) {
		
		userRepository.save(user);
	}

	@Override
	public void addRole(Long id, String role) {
		
		findById(id).ifPresent(user -> { //findById already exists on line 38 so just call that method, then use a lambda
			user.setRole(role);
		});
	}

	@Override
	public void updateUser(String fname, String lname, String email) {
		findByEmail(email).ifPresent( user -> {
			user.setFname(fname);
			user.setLname(lname);
		});
	}

	@Override
	public List<User> findAll() {
		
		return userRepository.findAll();
	}

}//end interface
