package com.codingdojo.projects.petsapp.models;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "pets")
public class Pet {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	//Add Attributes here
	@NotEmpty(message="Name is required!")
	@Size(min=3, max=256, message="Name must be between 3 and 256 characters")
	private String petName;
	
	@NotEmpty(message="Type is required!")
	@Size(min=3, max=30, message="Type must be between 3 and 30 characters")
	private String type;
	
	@NotNull
	@Min(value = 0, message = "Cant be that bad, has to start at 0 ")
	private int level;
	
	@NotNull
	@Min(value = 65, message = "Unlike us humans, animals are more spiritually present than us ... happiness starts at 65  ")
	private int happiness;
	
	@NotNull
	@Min(value = 85, message = "All starter friends must have 85 health ")
	private int health;
	
	
	 // This will not allow the createdAt column to be updated after creation
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    //Relationship
    
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User user;
	
    
    
 
  //Empty Constructor
    public Pet() {
    	
    }
    
    
    public Pet(
		@NotEmpty(message = "Name is required!") @Size(min = 3, max = 256, message = "Name must be between 3 and 256 characters") String petName,
		@NotEmpty(message = "Type is required!") @Size(min = 3, max = 30, message = "Type must be between 3 and 30 characters") String type,
		@NotNull @Min(value = 0, message = "Cant be that bad, has to start at 0 ") int level,
		@NotNull @Min(value = 65, message = "All animals are more cognitively present than us , happiness starts at 65% ... ") int happiness,
		@NotNull @Min(value = 85, message = "All starter friends have 85% health ") int health, User user) {
	super();
	this.petName = petName;
	this.type = type;
	this.level = level;
	this.happiness = happiness;
	this.health = health;
	this.user = user;
}





	//Getters and Setters 
	public Long getId() {
		return id;
	}




	public void setId(Long id) {
		this.id = id;
	}




	public String getPetName() {
		return petName;
	}




	public void setPetName(String petName) {
		this.petName = petName;
	}




	public String getType() {
		return type;
	}




	public void setType(String type) {
		this.type = type;
	}




	public int getLevel() {
		return level;
	}




	public void setLevel(int level) {
		this.level = level;
	}




	public int getHappiness() {
		return happiness;
	}




	public void setHappiness(int happiness) {
		this.happiness = happiness;
	}




	public int getHealth() {
		return health;
	}




	public void setHealth(int health) {
		this.health = health;
	}




	public Date getCreatedAt() {
		return createdAt;
	}




	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}




	public Date getUpdatedAt() {
		return updatedAt;
	}




	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}




	public User getUser() {
		return user;
	}




	public void setUser(User user) {
		this.user = user;
	}
    
    
    
}
    