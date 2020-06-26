package com.claimcap.reader.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.claimcap.reader.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
	
	Optional<User> findByEmail(String email);
	
	@Query("FROM User WHERE email=?1 AND password=?2")
	Optional<User> login(String email, String password);
	
	@Query("FROM User u WHERE u.lname=?1 OR u.fname=?1")
	List<User> searchUser(String keyword);

}