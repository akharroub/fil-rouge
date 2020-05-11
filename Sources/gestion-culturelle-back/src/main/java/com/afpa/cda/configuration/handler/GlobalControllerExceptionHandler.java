package com.afpa.cda.configuration.handler;

import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

import lombok.extern.slf4j.Slf4j;


@ControllerAdvice
@Slf4j
public class GlobalControllerExceptionHandler {

	 @ResponseStatus(value =  HttpStatus.UNAUTHORIZED, reason = "Bad credentials")
	    @ExceptionHandler(BadCredentialsException.class)
	    public void badCredentials(Exception ex) {
	    	log.error(ex.getMessage(),ex);
	    }
	
	
	
//    @ResponseStatus(value =  HttpStatus.UNAUTHORIZED)
//    @ExceptionHandler(BadCredentialsException.class)
//    public void badCredentials() {
//    }

}
