package com.aaron.babebasket.services;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.data.mongodb.core.aggregation.GroupOperation;
import org.springframework.data.mongodb.core.aggregation.GroupOperation.GroupOperationBuilder;
import org.springframework.data.mongodb.core.aggregation.TypedAggregation;
import org.springframework.stereotype.Service;

import com.aaron.babebasket.models.Category;
import com.aaron.babebasket.repositories.CategoryRepository;
import com.mongodb.MapReduceCommand.OutputType;

import dto.CategoryDTO;

@Service
public class CategoriesService {

	@Autowired
	private CategoryRepository categoryRepository;

	@Autowired
	private MongoTemplate mongoTemplate;

	/**
	 * Add new Category
	 * 
	 * @param category
	 *            category to add
	 * @return
	 */
	public Category createCategory(Category category) {
		return categoryRepository.save(category);
	}

	/**
	 * get all categories in collection
	 * 
	 * @return
	 */
	public List<CategoryDTO> getAllCategories() {

		GroupOperation agg = Aggregation.group("categoryName").count().as("count");

		List<Document> aggRes = mongoTemplate
				.aggregate(Aggregation.newAggregation(agg), "advertisements", Document.class).getMappedResults();

		List<Category> categories = categoryRepository.findAll();

		List<CategoryDTO> result = categories.stream().map(m -> {

			List<Document> found = aggRes.stream().filter(p -> m.getCategoryName().equalsIgnoreCase(p.getString("_id")))
					.collect(Collectors.toList());

			int count = !found.isEmpty() ? found.get(0).getInteger("count") : 0;

			return new CategoryDTO(m.getId(), m.getCategoryName(), m.getSubcategories(), count);
		}).collect(Collectors.toList());

		return result;
	}

	// CategoryDTO(m.getId(), m.getCategoryName(), m.getSubcategories(),
	// found.isEmpty(), count);

	/**
	 * get category by id
	 * 
	 * @param id
	 *            id of the category
	 * @return
	 */
	public Category getCategoryById(String id) {
		Optional<Category> category = categoryRepository.findById(id);
		return category.orElseGet(null);
	}
}
