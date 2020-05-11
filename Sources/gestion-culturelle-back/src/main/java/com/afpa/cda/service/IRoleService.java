package com.afpa.cda.service;

import java.util.List;
import com.afpa.cda.dto.RoleDto;


public interface IRoleService {
	
	List<RoleDto> findAll();

	RoleDto add(RoleDto rol);

	boolean updateRole(RoleDto rol, int id);

	boolean deleteRole(int id);

	RoleDto findById(int id);

}
