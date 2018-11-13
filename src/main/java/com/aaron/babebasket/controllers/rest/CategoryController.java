package com.aaron.babebasket.controllers.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aaron.babebasket.models.Category;
import com.aaron.babebasket.services.CategoriesService;

import dto.CategoryDTO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@Api
@RestController
@RequestMapping("category")
public class CategoryController {

	
	@Autowired
	private CategoriesService categoryService;
	
	@PostMapping
	@ApiOperation("add new category to collection")
	public Category createCategory(Category category) {
		return categoryService.createCategory(category);
	}
	
	
	@GetMapping
	@ApiOperation("retrieve all categories")
	public List<CategoryDTO> getAllCategories() {
		return categoryService.getAllCategories();
	}

	
	@GetMapping("{id}")
	@ApiOperation("get category by id")
	public Category getCategoryById(String id) {
		return categoryService.getCategoryById(id);
	}
	
	
	
}
