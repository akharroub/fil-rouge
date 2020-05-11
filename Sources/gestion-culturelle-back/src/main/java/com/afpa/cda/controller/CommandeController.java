package com.afpa.cda.controller;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.afpa.cda.dto.CommandeDto;
import com.afpa.cda.dto.PanierDto;
import com.afpa.cda.service.ICommandeService;

@RestController
public class CommandeController {

	@Autowired
	private ICommandeService commandeService;
	

	@GetMapping(path = "/commande")
	public List<CommandeDto> getAll(){
		return this.commandeService.findAll();
	}

	@GetMapping(path = "/commande/{id}")
	public CommandeDto getOne(@PathVariable int id){
		return this.commandeService.findById(id);
	}
	
	@GetMapping(path = "/commande/panier/{id}")
	public List<CommandeDto> getCommandes(@PathVariable int id){
		return this.commandeService.findByPanierId(id);
	}
	
	
	@GetMapping(path = "/commande/user/{id}")
	public PanierDto getUser(@PathVariable int id){
		return this.commandeService.findByUser(id);
	}
	
	//@PreAuthorize("hasAnyAuthority('RESP','ADMIN')")
	@PostMapping(path = "/commande")
	public void add(@RequestBody CommandeDto commande) {
				this.commandeService.add(commande);
		
	}

	@PutMapping(path = "/commande/{id}")
	public void update(@RequestBody CommandeDto commande, @PathVariable int id) {
		this.commandeService.update(commande,id);
	}

	@DeleteMapping(path = "/commande/{id}")
	public void delete(@PathVariable int id) {
		this.commandeService.delete(id);
	}

}