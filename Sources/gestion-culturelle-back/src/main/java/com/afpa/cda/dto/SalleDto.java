package com.afpa.cda.dto;
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
public class SalleDto {

	private int id;
	private String label;
	private int capacite;
	private int placesVip;
	private int fraisJournalier;
	private TypeSalleDto typeSalle;
	private List<ManifestationDto> manifestations;

}
