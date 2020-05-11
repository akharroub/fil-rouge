package com.afpa.cda.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.afpa.cda.dto.RoleDto;
import com.afpa.cda.service.IRoleService;

@RestController
public class RoleController {

	@Autowired
	private IRoleService roleService;

	@GetMapping(path = "/role")
	public List<RoleDto> getAll(){
		return this.roleService.findAll();
	}

	@GetMapping(path = "/role/{id}")
	public RoleDto getOne(@PathVariable int id){
		return this.roleService.findById(id);
	}
	@PostMapping(path = "/role")
	public RoleDto add(@RequestBody RoleDto rol) {
		return this.roleService.add(rol);
	}

	@PutMapping(path = "/role/{id}")
	public void update(@RequestBody RoleDto rol, @PathVariable int id) {
		this.roleService.updateRole(rol,id);
	}

	@DeleteMapping(path = "/role/{id}")
	public void delete(@PathVariable int id) {
		this.roleService.deleteRole(id);
	}

}



