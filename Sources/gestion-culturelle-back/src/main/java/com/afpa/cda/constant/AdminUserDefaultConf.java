package com.afpa.cda.constant;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Component
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AdminUserDefaultConf {
	@Value("${cda.admin.nom}")
	private String nom;
	
	@Value("${cda.admin.prenom}")
	private String prenom;
	
	@Value("${cda.admin.password}")
	private String password;
	
	@Value("${cda.admin.login}")
	private String login;
}
