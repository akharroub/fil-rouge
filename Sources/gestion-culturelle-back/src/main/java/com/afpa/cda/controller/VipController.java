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

import com.afpa.cda.dto.VipDto;
import com.afpa.cda.service.IVipService;

@RestController
public class VipController {
	
	@Autowired
	private IVipService vipService;
	
	@GetMapping(path="/vip")
	public List<VipDto> getAll(){
		return this.vipService.findAll();
	}
	
	@GetMapping(path="/vip/{id}")
	public VipDto getOne(@PathVariable int id) {
		return this.vipService.findById(id);
	}
	
	@PostMapping(path="/vip")
	public VipDto add(@RequestBody VipDto vip) {
		return this.vipService.add(vip);
	}
	
	@PutMapping(path="/vip/{id}")
	public void update(@RequestBody VipDto vip ,@PathVariable int id) {
		this.vipService.updateVip(vip, id);
	}
	
	@DeleteMapping(path="/vip/{id}")
	public void delete(@PathVariable int id) {
		this.vipService.deleteVip(id);
	}
	

}