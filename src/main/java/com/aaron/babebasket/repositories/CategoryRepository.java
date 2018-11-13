package com.aaron.babebasket.repositories;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.aaron.babebasket.models.Category;

@Repository
public interface CategoryRepository extends MongoRepository<Category, String>{

}
