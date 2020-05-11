package com.afpa.cda.security.service.impl;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.afpa.cda.dao.UserRepository;
import com.afpa.cda.entity.User;
import com.afpa.cda.security.model.UserSecDto;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	private UserRepository userRepository;
	
	@Override
	public UserSecDto loadUserByUsername(String username){

		Objects.requireNonNull(username);
		User userE = userRepository.findByNom(username)
				.orElseThrow(()-> new UsernameNotFoundException("User not found"));
		
        Collection<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority(userE.getRole().getLabel()));
        
		return new UserSecDto(
				userE.getId(), 
				userE.getNom(), 
				userE.getPassword(), 
				authorities,
				true, 
				LocalDate.now(), 
				userE.getTokenSecret());
	}

}
	
	
	
	
//	@Override
//	public UserDto loadUserByUsername(String username) 
//			throws UsernameNotFoundException {
//
//		
//        Collection<GrantedAuthority> authorities = new ArrayList<>();
//        authorities.add(new SimpleGrantedAuthority("ADMIN"));
//
//		return new UserDto(1L, "user", "password", "mail@mail.com",
//				authorities, true, LocalDate.now(), "doubleVerification");
//	}


