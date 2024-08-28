package com.codingdojo.projects.petsapp.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.projects.petsapp.models.Pet;

@Repository
public interface PetRepo extends CrudRepository<Pet, Long> {
	List<Pet> findAll();
	
	

}