package com.afpa.cda.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

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
		name="t_panier"
)
public class Panier {
	@Id
	@GeneratedValue(generator = "PANIER_SEQ", strategy = GenerationType.SEQUENCE)
	private int id;
	
	@Temporal(TemporalType.DATE)
	private Date dateValidation;
		
	@OneToMany
	List<Commande> listCommandes;
	
	
	private double total;

}
