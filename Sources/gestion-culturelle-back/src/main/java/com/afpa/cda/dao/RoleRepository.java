package com.afpa.cda.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.afpa.cda.entity.Role;


@Repository
public interface RoleRepository extends CrudRepository<Role, Integer> {

	List<Role> findAll();
	
	Optional<Role> findByLabel(String label);
}
