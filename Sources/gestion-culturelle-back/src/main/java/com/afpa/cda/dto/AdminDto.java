package com.afpa.cda.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
@ToString
public class AdminDto {
	private int id;
	private String nom;
	private String prenom;
	private String email;
	private String password;
	private String tokenSecret;
	private String adresse;
	private RoleDto role;
	private String photo;
}
