package com.afpa.cda.service;

import java.util.List;
import com.afpa.cda.dto.AnimateurDto;

public interface IAnimateurService {
	
	List<AnimateurDto> findAll();

	AnimateurDto add(AnimateurDto anim);

	boolean updateAnimateur(AnimateurDto anim, int id);

	boolean deleteAnimateur(int id);

	AnimateurDto findById(int id);

}
