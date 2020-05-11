package com.afpa.cda.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.afpa.cda.entity.Manifestation;


@Repository
public interface ManifestationRepository extends CrudRepository<Manifestation, Integer> {

	List<Manifestation> findAll();
	
}
