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

import com.afpa.cda.dto.AnimationDto;
import com.afpa.cda.service.IAnimationService;

@RestController
public class AnimationController {

	@Autowired
	private IAnimationService animationService;
	
	@GetMapping(path = "/public/animation")
	public List<AnimationDto> getAll(){
		return this.animationService.findAll();
	}
	
	//@PreAuthorize("hasAnyAuthority('ANIM')")
	@PostMapping(path = "animation")
	public AnimationDto add(@RequestBody AnimationDto anim) {
		return this.animationService.add(anim);
	}
	
	@GetMapping(path = "/animation/{id}")
	public AnimationDto getOne(@PathVariable int id) {
		return this.animationService.findById(id);
	}
	
	@PutMapping(path="/animation/{id}")
	public void update(@RequestBody AnimationDto anim, @PathVariable int id) {
		this.animationService.update(anim,id);
	}
	
	@DeleteMapping(path="/animation/{id}")
	public void delete(@PathVariable int id) {
		this.animationService.delete(id);
	}
	
}
