package com.afpa.cda.service;

import java.util.List;
import java.util.Optional;

import com.afpa.cda.dto.ClientDto;
import com.afpa.cda.dto.UserDto;

public interface IClientService {
	
	List<ClientDto> findAll();

	ClientDto add(ClientDto client);

	Optional<ClientDto> findById(Integer clientId);

	ClientDto findOne(Integer clientId);

	boolean delete(int id);

	boolean updateClient(ClientDto client, int id);

}
