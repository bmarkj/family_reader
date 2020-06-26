package com.claimcap.reader.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.claimcap.reader.model.Level;

public interface LevelRepository extends JpaRepository<Level, Long> {
	
	@Query("FROM Level ORDER BY id ASC")
    List<Level> findAllLevelsOrderByIdAsc();
	
	@Query("FROM Level WHERE name=?1")
	Level findLevelByName(String name);
}
