package com.afpa.cda.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
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
		name="t_manifestation"
		)
public class Manifestation {

	@Id
	@GeneratedValue(generator = "MANIFESTATION_SEQ", strategy = GenerationType.SEQUENCE)
	private int id;

	private String label;
	@Temporal(TemporalType.DATE)
	private Date dateValidation;
	@OneToOne
	private User validateur;

	@OneToOne
	private Animation animation;	

	@Temporal(TemporalType.DATE)
	private Date dateDebut;
	@Temporal(TemporalType.DATE)
	private Date dateFin;

	@Column(precision=6,scale=2)
	private double cout;

	@ManyToOne
	@JoinColumn(name = "salle", nullable = false)
	private Salle salle;

	@Column(precision=6,scale=2)
	private double prixBillet;	
	private int reservations;
	private int reservationsVip;
	private int rentabilite;

	@OneToOne
	private User annulateur;

	@Temporal(TemporalType.DATE)
	private Date dateAnnulation;

	@OneToMany (mappedBy = "manifestation")
	List<Commande> listCommandes;

	@ManyToMany
	@JoinTable(name = "t_manifestation_vip",
	joinColumns = { @JoinColumn(name = "id_manifestation") },
	inverseJoinColumns = { @JoinColumn(name = "id_vip") })
	List<User> listVips;





}
