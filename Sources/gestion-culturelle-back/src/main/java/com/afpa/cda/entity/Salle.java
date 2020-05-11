package com.afpa.cda.entity;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
@Table(
		name="t_salle"
)
public class Salle {
	
	@Id
	@GeneratedValue(generator = "SALLE_SEQ", strategy = GenerationType.SEQUENCE)
	private int id;
	private String label;
	private int capacite;
	private int placesVip;
	private int fraisjournalier;

	@ManyToOne
	private TypeSalle typesalle;
	
	
	@OneToMany (mappedBy = "salle")
	private List <Manifestation> manifestations;


}
