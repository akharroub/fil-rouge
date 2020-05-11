package com.afpa.cda.service.impl;
import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.afpa.cda.dao.UserRepository;
import com.afpa.cda.dto.ClientDto;
import com.afpa.cda.entity.Role;
import com.afpa.cda.entity.User;
import com.afpa.cda.service.IClientService;
@Service
public class ClientServiceImpl implements IClientService {

	@Autowired
	private UserRepository clientRepository;

	@Autowired
	private ModelMapper modelMapper;

	/*@Override
	public List<ClientDto> findAll() {
		return this.clientRepository.findAll()

				.stream()
				.map(c-> {		
					ClientDto clientDto = new ClientDto();
					clientDto.setId(c.getId());
					clientDto.setNom(c.getNom());
					clientDto.setPrenom(c.getPrenom());			

					RoleDto roleDto = new RoleDto();
					roleDto.setLabel(c.getRole().getLabel());
					clientDto.setRole(roleDto);

					PanierDto panierDto = new PanierDto();
					panierDto.setId(c.getPanier().getId());
					clientDto.setPanier(panierDto);

					return clientDto;
				})

				.collect(Collectors.toList());
	}*/
	
	@Override
	public ClientDto add(ClientDto clientDto) {
		User perE = this.modelMapper.map(clientDto, User.class);
		Role client = new Role();
		client.setId(4);
				
		perE.setRole(client);
		
		this.clientRepository.save(perE);
		
		clientDto.setId(perE.getId());
		
		
		System.err.println("client ajouté");
		return clientDto;		

	}
	@Override
	public boolean updateClient(ClientDto client, int id) {

		Optional<User> perOp = this.clientRepository.findById(id);
		if (perOp.isPresent()) {
			User perE = perOp.get();
			perE.setNom(client.getNom());
			perE.setPrenom(client.getPrenom());
			perE.setAdresse(client.getAdresse());
			perE.setEmail(client.getEmail());
			perE.setPassword(client.getPassword());
			
			
			this.clientRepository.save(this.modelMapper.map(client,User.class));
			System.err.println("client mis à jour");
			return true;
		}
		return false;
	}
	@Override
	public List<ClientDto> findAll() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Optional<ClientDto> findById(Integer clientId) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public ClientDto findOne(Integer clientId) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return false;
	}
	
}


