package com.codingdojo.projects.petsapp.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.projects.petsapp.models.Pet;
import com.codingdojo.projects.petsapp.models.User;
import com.codingdojo.projects.petsapp.services.PetService;
import com.codingdojo.projects.petsapp.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class PetController {

	@Autowired
    private UserService userServ;
	@Autowired
	private PetService petService;
	
	//
	
	// Displays create page
		@GetMapping("/pets/new")
		public String showNewPet(@ModelAttribute("pet") Pet pet, HttpSession session) {
			Long userId = (Long) session.getAttribute("userId");
			if(userId == null) {
				return "redirect:/";
			}
			return "newPet.jsp";
		}

		// Processes create page
		@PostMapping("/pets/new")
		public String createPet(@Valid @ModelAttribute("pet") Pet pet, BindingResult result, HttpSession session) {
			Long userId = (Long) session.getAttribute("userId");
			if(userId == null) {
				return "redirect:/";
			}
			if (result.hasErrors()) {
				return "newPet.jsp";
			}
			else {
			// Make a new pet and save to db
			
			User user = userServ.getUserById(userId);
			pet.setUser(user);
			petService.createPet(pet);
			}
			return "redirect:/homepage";
		}
		
		//Display Details Page
		@GetMapping("/pets/{id}")
		public String petDetails(@PathVariable("id")Long id,Model model,HttpSession session) {
			Long userId = (Long) session.getAttribute("userId");
			if(userId == null) {
				return "redirect:/";
			}
			model.addAttribute("pets", petService.findPet(id));
			return "show.jsp";
			
		}
		
		//Delete a pet(by id)
		@DeleteMapping("/pets/{id}/delete")
		public String deletePet(@PathVariable("id")Long id) {
			petService.deletePet(id);
			return"redirect:/homepage";
		}
		
		//Display Edit page with pre-populated form
		@GetMapping("/pets/{id}/edit")
		public String showEditPet(@PathVariable("id")Long id, Model model,HttpSession session) {
			Long userId = (Long) session.getAttribute("userId");
			if(userId == null) {
				return "redirect:/";
			}
			model.addAttribute("pet", petService.findPet(id));
			return"edit.jsp";
		}
		
		//Process the edit page
		@PutMapping("/pets/{id}/edit")
		public String updatePet(@Valid @ModelAttribute("pet") Pet pet, BindingResult result, HttpSession session, Model model,@PathVariable("id")Long id) {
			Long userId = (Long) session.getAttribute("userId");
			if(userId == null) {
				return "redirect:/";
			}
			//If submitted edit form has errors reset the pre-populated form
			if(result.hasErrors()) {
				//pet.setId(id);
				//model.addAttribute("pet", pet);
				model.addAttribute("pet", petService.findPet(id));
				return "edit.jsp";
			}
			else {
				User user = userServ.getUserById(userId);
				pet.setUser(user);
				petService.updatePet(pet);
				return"redirect:/homepage";
			}
		}
	
}
