package com.aaron.babebasket.models;

import java.util.ArrayList;
import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import com.google.gson.Gson;

import io.swagger.annotations.ApiModelProperty;

@Document(collection = "users")
public class Users {

	@Id
	@ApiModelProperty(hidden = true)
	private String id  = new ObjectId().toHexString();
	private String username;
	private String password;
	private String firstname;
	private String surname;
	private String email;
	private int points;
	private List<UsersRoles> roles = new ArrayList<>();
	
	 public Users() {
	    }

	public Users(Users users) {
		this.id = users.getId();
		this.username =users.getUsername();
		this.password =users.getPassword();
		this.firstname = users.getFirstname();
		this.surname = users.getSurname();
		this.email = users.getEmail();
		this.points = users.getPoints();
		this.roles = users.getRoles();
		
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPoints() {
		return points;
	}
	public void setPoints(int points) {
		this.points = points;
	}
	
	public List<UsersRoles> getRoles() {
		return roles;
	}
	public void setRoles(List<UsersRoles> roles) {
		this.roles = roles;
	}

	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Users other = (Users) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "{id:" + id + ", username:" + username + ", password:" + password + ", firstname:" + firstname
				+ ", surname:" + surname + ", email:" + email + ", points:" + points + ", roles:" + roles + "}";
		//return new Gson().toJson(this);
	}

	
}
