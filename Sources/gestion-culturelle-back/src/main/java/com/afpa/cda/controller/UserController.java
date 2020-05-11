package com.afpa.cda.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.afpa.cda.constant.AdminUserDefaultConf;
import com.afpa.cda.dao.RoleRepository;
import com.afpa.cda.dto.UserDto;
import com.afpa.cda.service.IUserService;

@RestController
public class UserController {

	@Autowired
	private IUserService userService;

	@Autowired
	private RoleRepository roleRepository;

	@Autowired
	private AdminUserDefaultConf adminUserDefaultConf;

	@Autowired
	private ModelMapper modelMapper;

	@GetMapping(path = "/users")
	public List<UserDto> getAll(){
		return this.userService.findAll();
	}

	@GetMapping(path = "/users/{id}")
	public UserDto getOne(@PathVariable int id){
		return this.userService.findOne(id);
	}

	@PostMapping(path = "/users")
	public UserDto add(@RequestBody UserDto user, HttpServletResponse resp) throws IOException {
		if(user.getRole() == null) {
			resp.sendError(HttpStatus.BAD_REQUEST.value(),"le role est obligatoire à la création de la personne");
			return null;
		} else if(user.getNom().equalsIgnoreCase(adminUserDefaultConf.getNom()) 
				|| user.getPrenom().equalsIgnoreCase(adminUserDefaultConf.getPrenom())) {
			resp.sendError(HttpStatus.NOT_ACCEPTABLE.value(),"prenom/nom 'admin' sont déjà pris");
			return null;
		} else {
			return this.userService.add(user);
		}
	}

	@PostMapping(path = "/newusers")
	public UserDto addClient(@RequestBody UserDto user, HttpServletResponse resp) throws IOException {
		if(user.getNom().equalsIgnoreCase(adminUserDefaultConf.getNom()) 
				|| user.getPrenom().equalsIgnoreCase(adminUserDefaultConf.getPrenom())) {
			resp.sendError(HttpStatus.NOT_ACCEPTABLE.value(),"prenom/nom 'admin' sont déjà pris");
			return null;
		} else {

			return this.userService.addClient(user);
		}
	}



	@GetMapping("/users/current")
	public UserDto getCurrentUser(Principal currentUser) {
		Integer userId = Integer.valueOf((String)((UsernamePasswordAuthenticationToken)currentUser).getPrincipal());
		return this.userService.findById(userId).get();

	}


	@PutMapping(path = "/users/{id}")
	public void update(@RequestBody UserDto user,@PathVariable int id ) {
		this.userService.update(user, id);
	}

	@DeleteMapping(path = "/users/{id}")
	public void delete(@PathVariable int id) {
		this.userService.delete(id);
	}
	
//	@GetMapping(path = "/user/role/{id}")
//	public void findByRole(Integer role){
//		
//		this.userService.findByRole(role);
//		
//	}

}
