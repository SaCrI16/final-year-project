package com.aaron.babebasket.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.aaron.babebasket.models.Users;

@Repository
public interface UsersRepository extends MongoRepository<Users, String> {

	Optional<Users> findByUsernameAndPassword(String username, String password);
 
	Optional<Users> findByEmail(String email);
	
	Optional<Users> findByUsername(String username);
	
	List<Users>deleteUsersById(String id);

}
