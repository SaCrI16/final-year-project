package com.aaron.babebasket.models;

import org.bson.types.ObjectId;

import io.swagger.annotations.ApiModelProperty;

public class UsersRoles {
	@ApiModelProperty(hidden = true)
	private String id = new ObjectId().toHexString();
	private String role;
	
	 public UsersRoles() {
	    }
	 
	
	 public UsersRoles(String id, String role) {
		this.id = id;
		this.role = role;
	}


	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "UsersRoles [id=" + id + ", role=" + role + "]";
	}
	

}
