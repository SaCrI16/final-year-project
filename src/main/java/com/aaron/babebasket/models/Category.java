package com.aaron.babebasket.models;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import io.swagger.annotations.ApiParam;

@Document(collection = "categories")
public class Category {

	@Id
	@ApiParam(hidden = true)
	private String id;
	
	@ApiParam(required = true, value = "Name of Category")
	private String categoryName;
	
	@ApiParam(required = true, value = "Subcategioes for the category")
	private List<String> subcategories = new ArrayList<>();

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public List<String> getSubcategories() {
		return subcategories;
	}

	public void setSubcategories(List<String> subcategories) {
		this.subcategories = subcategories;
	}

}
