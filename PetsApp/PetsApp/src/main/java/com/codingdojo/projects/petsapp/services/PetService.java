package com.codingdojo.projects.petsapp.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.projects.petsapp.models.Pet;
import com.codingdojo.projects.petsapp.repositories.PetRepo;

@Service
public class PetService {
	@Autowired
	PetRepo petRepo;
	
	
	public List<Pet> allPets(){
		return petRepo.findAll();
	}
	
	public Pet createPet(Pet pet){
		return petRepo.save(pet);
	}
	
	public Pet findPet(Long id) {
		Optional<Pet> optionalPet = petRepo.findById(id);
		if(optionalPet.isPresent()) {
			return optionalPet.get();	
		} else {
			return null;
		}
	}
	
	public void deletePet(Long id) {
		petRepo.deleteById(id);
	}

	public Pet updatePet(Pet pet) {
		return petRepo.save(pet);
	}

}