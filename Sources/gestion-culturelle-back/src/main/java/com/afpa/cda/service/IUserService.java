package com.afpa.cda.service;

import java.util.List;
import java.util.Optional;

import com.afpa.cda.dto.UserDto;

public interface IUserService {

	List<UserDto> findAll();

	UserDto add(UserDto user);

	Optional<UserDto> findById(Integer userId);

	UserDto findOne(Integer userId);

	boolean update(UserDto user, int id);

	boolean delete(int id);

	UserDto addClient(UserDto userDto);
	
//	List<UserDto> findByRole(Integer roleId);

}
