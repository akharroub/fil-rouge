package com.afpa.cda.service;

import java.util.List;

import com.afpa.cda.dto.ManifestationDto;
import com.afpa.cda.dto.SalleDto;

public interface ISalleService {
	
	List<SalleDto> findAll();
	
	SalleDto add(SalleDto sal);
	
	boolean updateSalle(SalleDto sal, int id);
	
	boolean deleteSalle (int id);

	SalleDto findById(int id);

	ManifestationDto calcul(ManifestationDto manifDto);

	

}
