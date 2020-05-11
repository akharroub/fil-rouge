package com.afpa.cda.dto;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty.Access;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(value = Include.NON_NULL)
public class UserDto {
	private int id;
	private String nom;
	private String prenom;
	
	@JsonProperty(access = Access.WRITE_ONLY)
	private String password;
	
	@JsonProperty(access = Access.WRITE_ONLY)
	private String tokenSecret;
	
	private String email;
	private String adresse;

	private String numClient;
	
	private PanierDto panier;
	
	private RoleDto role;
	
	private String entreprise;
	
	private List <AnimationDto> listAnimations;
	
	private boolean inactif;
	
	private List <ManifestationDto> listManifestations;

	

}
