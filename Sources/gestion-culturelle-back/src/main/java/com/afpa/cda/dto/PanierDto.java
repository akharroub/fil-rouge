package com.afpa.cda.dto;

import java.util.Date;
import java.util.List;

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
public class PanierDto {
	private int id;
	private Date dateValidation;
	private List<CommandeDto> listCommandes;
	
	private double total;
}
