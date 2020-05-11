package com.afpa.cda.security.service;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;

import org.springframework.security.core.Authentication;

import com.afpa.cda.security.model.AuthenticationRequest;

public interface AuthenticationService {

	Authentication getAuthentication(Jws<Claims> request);
	Authentication authenticate(AuthenticationRequest authenticationRequest);

}
