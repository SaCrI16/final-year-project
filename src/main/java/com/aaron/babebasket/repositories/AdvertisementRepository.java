package com.aaron.babebasket.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.aaron.babebasket.models.AdvertStatus;
import com.aaron.babebasket.models.Advertisement;

@Repository
public interface AdvertisementRepository extends MongoRepository<Advertisement, String> {
	
	List<Advertisement> findByStatus(AdvertStatus status);


	List<Advertisement> findByEmail(String email);

	
	List<Advertisement> findByCategoryNameAndStatus(String categoryName, AdvertStatus status);
	
	List<Advertisement> findByConditionAndStatus(String condition, AdvertStatus status);
	
	List<Advertisement> findBytitleAndStatus(String title, AdvertStatus status);
	
	long countByCategoryName(String sucategories);
	
	List<Advertisement> findBySubcategoriesAndStatus(String subcategories, AdvertStatus status);
	
	List<Advertisement> findByCreationDateGreaterThanAndStatus(Date creationDate, AdvertStatus status);
	
	List<Advertisement> findByMessageSendTo(String userId);
	
}

