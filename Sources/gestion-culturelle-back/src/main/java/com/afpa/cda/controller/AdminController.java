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

import com.afpa.cda.dto.AdminDto;
import com.afpa.cda.service.IAdminService;


@RestController
public class AdminController {

	@Autowired
	private IAdminService adminService;

	@GetMapping(path = "/admin")
	public List<AdminDto> getAll(){
		return this.adminService.findAll();
	}

	@GetMapping(path = "/admin/{id}")
	public AdminDto getOne(@PathVariable int id){
		return this.adminService.findById(id);
	}
	@PostMapping(path = "/admin")
	public AdminDto add(@RequestBody AdminDto admin) {
		return this.adminService.add(admin);
	}

	@PutMapping(path = "/admin/{id}")
	public void update(@RequestBody AdminDto admin, @PathVariable int id) {
		this.adminService.updateAdmin(admin,id);
	}

	@DeleteMapping(path = "/admin/{id}")
	public void delete(@PathVariable int id) {
		this.adminService.deleteAdmin(id);
	}

}



