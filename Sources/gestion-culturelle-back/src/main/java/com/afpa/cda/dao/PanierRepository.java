package com.afpa.cda.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.afpa.cda.entity.Panier;


@Repository
public interface PanierRepository extends CrudRepository<Panier, Integer> {

	List<Panier> findAll();
	
}
