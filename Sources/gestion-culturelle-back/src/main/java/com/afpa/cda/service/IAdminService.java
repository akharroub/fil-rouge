package com.afpa.cda.service;

import java.util.List;

import com.afpa.cda.dto.AdminDto;


public interface IAdminService {
	
	List<AdminDto> findAll();

	AdminDto add(AdminDto admin);

	boolean updateAdmin(AdminDto admin, int id);

	boolean deleteAdmin(int id);

	AdminDto findById(int id);

}
