package com.afpa.cda.service;

import java.util.List;
import com.afpa.cda.dto.TypeSalleDto;


public interface ITypeSalleService {

	List<TypeSalleDto> findAll();

	boolean add(TypeSalleDto typ);

	boolean updateTypeSalle(TypeSalleDto typ, int id);

	boolean deleteTypeSalle(int id);

	TypeSalleDto findById(int id);
	
}
