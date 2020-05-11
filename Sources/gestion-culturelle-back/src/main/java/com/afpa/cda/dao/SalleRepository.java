package com.afpa.cda.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.afpa.cda.entity.Salle;

@Repository
public interface SalleRepository extends CrudRepository<Salle, Integer> {
	List<Salle> findAll();

	Optional<Salle> findByLabel(String label);	

}
