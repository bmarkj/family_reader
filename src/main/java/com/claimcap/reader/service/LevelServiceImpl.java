package com.claimcap.reader.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.claimcap.reader.model.Level;
import com.claimcap.reader.repository.LevelRepository;

@Service
@Transactional
public class LevelServiceImpl implements LevelService{
	
	@Autowired
	private LevelRepository levelRepository;

	
	
	@Override
	public Optional<Level> findById(Long id) {
		return levelRepository.findById(id);
	}

	@Override
	public List<Level> findAll() {
		return levelRepository.findAll();
	}

	@Override
	public List<Level> findAllLevelsOrderByIdAsc() {
		
		return levelRepository.findAllLevelsOrderByIdAsc();
	}

	@Override
	public void save(Level level) {
		
		levelRepository.save(level);
		
	}

	@Override
	public Level findLevelByName(String name) {
		
		return levelRepository.findLevelByName(name);
	}

	
}
