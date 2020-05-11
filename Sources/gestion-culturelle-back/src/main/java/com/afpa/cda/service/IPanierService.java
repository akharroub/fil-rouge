package com.afpa.cda.service;

import java.util.List;

import com.afpa.cda.dto.CommandeDto;
import com.afpa.cda.dto.PanierDto;



public interface IPanierService {
	
	List<PanierDto> findAll();

	PanierDto add(PanierDto panier);

	boolean updatePanier(PanierDto panier, int id);

	PanierDto findById(int id);

	PanierDto findByUser(int id);

	void addCommandePanier(CommandeDto commandeDto);


	void deletePanier(int id);

	void deleteCommandes(int id);


}
