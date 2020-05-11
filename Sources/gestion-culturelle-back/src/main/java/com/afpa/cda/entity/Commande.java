package com.afpa.cda.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.afpa.cda.entity.Manifestation.ManifestationBuilder;

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
		name="t_commande"
)
public class Commande {

	@Id
	@GeneratedValue(generator = "COMMANDE", strategy = GenerationType.SEQUENCE)
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "manifestation", nullable = false)
	Manifestation manifestation;
	
	@ManyToOne
	@JoinColumn(name = "panier", nullable = false)
	Panier panier;
	
	
	int quantite;
	
}
