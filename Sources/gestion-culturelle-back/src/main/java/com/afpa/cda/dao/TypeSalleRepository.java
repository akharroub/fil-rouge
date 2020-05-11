package com.afpa.cda.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.afpa.cda.entity.TypeSalle;

@Repository
public interface TypeSalleRepository extends CrudRepository<TypeSalle, Integer> {
	List<TypeSalle> findAll();

	Optional<TypeSalle> findByLabel(String label);
}
