package com.afpa.cda.service.impl;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.afpa.cda.dao.RoleRepository;
import com.afpa.cda.dto.RoleDto;
import com.afpa.cda.entity.Role;
import com.afpa.cda.service.IRoleService;


@Service
public class RoleServiceImpl implements IRoleService {

	@Autowired
	private RoleRepository roleRepository;

	@Autowired
	private ModelMapper modelMapper;

	@Override
	public List<RoleDto> findAll() {
		return this.roleRepository.findAll()
				.stream().map(r-> {
					RoleDto roleDto = RoleDto.builder()
							.id(r.getId())
							.label(r.getLabel())
							.build();

					return roleDto;	
				})
				.collect(Collectors.toList());	
	}

	@Override
	public RoleDto findById(int id) {
		Optional <Role> roleOp = this.roleRepository.findById(id);
		RoleDto rol =null; 
		if(roleOp.isPresent()) {
			Role role= roleOp.get();

			rol=this.modelMapper.map(role,RoleDto.class);
		}
		return rol;
	}



	@Override
	public RoleDto add(RoleDto rol) {
		Role role = this.roleRepository.save(this.modelMapper.map(rol,Role.class));
		rol.setLabel(role.getLabel());
		System.err.println("role ajouté");
		return rol;
	}

	@Override
	public boolean updateRole(RoleDto rol, int id) {
		Optional <Role> roleOp = this.roleRepository.findById(id);
		if(roleOp.isPresent()) {
			Role role = roleOp.get();
			role.setLabel(rol.getLabel());
			this.roleRepository.save(role);
			System.err.println("role mise à jour");
			return true;
		}

		return false;
	}

	@Override
	public boolean deleteRole(int id) {

		if(this.roleRepository.existsById(id)) {
			this.roleRepository.deleteById(id);
			System.err.println("role supprimé");
			return true;
		}

		return false;
	}
}