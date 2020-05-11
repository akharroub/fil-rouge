package com.afpa.cda.dto;

import java.util.ArrayList;
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
public class ManifestationDto {
	private int id;
	private String label;
	private Date dateValidation;
	private AdminDto validateur;
	private AnimationDto animation;
	private Date dateDebut;
	private Date dateFin;
	private double cout;
	private SalleDto salle;
	private double prixBillet;
	private int reservations;
	private int reservationsVip;
	private int rentabilite;
	private AdminDto annulateur;
	private Date dateAnnulation;

	private List <CommandeDto> listCommandes;

	private List <UserDto> listVips;
}
