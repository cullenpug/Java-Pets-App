package com.codingdojo.projects.petsapp.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.projects.petsapp.models.LoginUser;
import com.codingdojo.projects.petsapp.models.User;
import com.codingdojo.projects.petsapp.repositories.UserRepo;

@Service
public class UserService {
	
	@Autowired
	UserRepo uRepo;
	
	public User register(User newUser, BindingResult result) {
		
//		see if the email already exists in the DB
		Optional<User> potentialUser = uRepo.findByEmail(newUser.getEmail());
			// if it does throw an error 
		if(potentialUser.isPresent()) {
			result.rejectValue("email", "matches", "An account already exists please sign in.");
		}
//		if the password matches the confirm password 
		// if it doesnt throw an error 
		if(!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "matches", "Confirm password and password must match");
		}
		
		if(result.hasErrors()) {
			return null;
		}
		
// 		if we get this far we need to hash and salt the password and save the user in the DB
		
		String hashedPass = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashedPass);
		return uRepo.save(newUser);
	}
	public User login(LoginUser newLoginUser, BindingResult result) {
//		check if the user exists by their email 
		Optional<User> potentialUser = uRepo.findByEmail(newLoginUser.getEmail());
		if(!potentialUser.isPresent()) {
			result.rejectValue("email", "matches", "Invalid Email/Password");
			return null;
		}
//		
		User user = potentialUser.get();
		if(!BCrypt.checkpw(newLoginUser.getPassword(),user.getPassword())) {
			result.rejectValue("password", "matches", "Invalid Email/Password");
			return null;
		}
		if (result.hasErrors()) {
			return null;
		}
		return user;
//		if they do check their password agains the password in the DB using bcrypt
//		if either of these 2 things fail reject (throw an error)
	}
	public User getUserById(Long id) {
		Optional<User> user = uRepo.findById(id);
        if(user.isPresent()) {
            return user.get();
        } else {
            return null;
        }
	}
}