package com.afpa.cda.dto;

import com.afpa.cda.entity.Manifestation;
import com.afpa.cda.entity.Panier;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CommandeDto {

	private int id;
	
	private ManifestationDto manifestation;
//	
	private PanierDto panier;
	
	int quantite;
}
