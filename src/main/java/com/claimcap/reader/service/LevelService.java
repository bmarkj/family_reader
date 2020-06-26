package com.claimcap.reader.service;

import java.util.List;
import java.util.Optional;

import com.claimcap.reader.model.Level;

public interface LevelService {
	
	void save (Level level);
	Optional<Level> findById(Long id);
	List<Level> findAllLevelsOrderByIdAsc();
	List<Level> findAll();
	Level findLevelByName(String name);

}
