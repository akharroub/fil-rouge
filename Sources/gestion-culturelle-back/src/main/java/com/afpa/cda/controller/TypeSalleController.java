package com.afpa.cda.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.afpa.cda.dto.TypeSalleDto;
import com.afpa.cda.service.ITypeSalleService;

@RestController
public class TypeSalleController {

	@Autowired
	private ITypeSalleService typeSalleService;
	
	@GetMapping(path = "/typesalle")
	public List<TypeSalleDto> getAll(){
		return this.typeSalleService.findAll();
	}
	
	@GetMapping(path = "/typesalle/{id}")
	public TypeSalleDto getOne(@PathVariable int id){
		return this.typeSalleService.findById(id);
	}
	
	//@PreAuthorize("hasAnyAuthority('RESP','ADMIN')")
	@PostMapping(path = "/typesalle")
	public boolean add(@RequestBody TypeSalleDto typeSalleDto) {
		return this.typeSalleService.add(typeSalleDto);
	}
	
	@PutMapping(path = "/typesalle/{id}")
	public void update(@RequestBody TypeSalleDto typ,@PathVariable int id) {
		this.typeSalleService.updateTypeSalle(typ, id);
		
	}
	
	@DeleteMapping(path = "/typesalle/{id}")
	public boolean delete(@PathVariable int id) {
		return this.typeSalleService.deleteTypeSalle(id);
	}
	
	
}
