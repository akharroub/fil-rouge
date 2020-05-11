package com.afpa.cda.service.impl;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.afpa.cda.dao.UserRepository;
import com.afpa.cda.dto.AdminDto;
import com.afpa.cda.entity.User;
import com.afpa.cda.service.IAdminService;

@Service
public class AdminServiceImpl implements IAdminService {

	@Autowired
	private UserRepository adminRepository;
	
	@Autowired
	private ModelMapper modelMapper;
	
	@Override
	public List<AdminDto> findAll() {
		
		return this.adminRepository.findAll()
		.stream()
		.map(ts-> this.modelMapper.map(ts,AdminDto.class ))
		.collect(Collectors.toList());
		
		
	}

	
	
	
	
	@Override
	public AdminDto add(AdminDto admin) {		
	
	
			User adminE = this.modelMapper.map(admin,User.class);
			User admniEntity = this.adminRepository.save(adminE);
			admin.setId(admniEntity .getId());			
			
		System.err.println("administrateur ajouté");
		
		return admin;
	}

@Override
	public boolean updateAdmin(AdminDto admin, int id) {
	
		Optional<User> adminOp = this.adminRepository.findById(id);
		if(adminOp.isPresent()) {
			this.adminRepository.save(this.modelMapper.map(admin,User.class));			
			System.err.println("administrateur mise à jour");
			return true;
		}
		
		return false;
	}

	@Override
	public boolean deleteAdmin(int id) {
	
		if(this.adminRepository.existsById(id)) {
			this.adminRepository.deleteById(id);
			System.err.println("administrateur supprimé");
			return true;
		}
		return false;
	
	}

	@Override
	public AdminDto findById(int id) {
		Optional <User> manifOp = this.adminRepository.findById(id);
		AdminDto admin =null; 
		if(manifOp.isPresent()) {
			User personne= manifOp.get();

			admin=this.modelMapper.map(personne,AdminDto.class);
		}
		return admin;
	}

	

}
