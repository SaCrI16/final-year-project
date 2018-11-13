package com.aaron.babebasket.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;

import com.aaron.babebasket.exception.UserNotFoundException;
import com.aaron.babebasket.models.Users;
import com.aaron.babebasket.repositories.UsersRepository;

@Service
public class UsersService {

	@Autowired
	private UsersRepository usersRepository;

	@Autowired private MongoTemplate mongoTemplate;

	public Users getUserInfo(String username, String password) {
		Optional<Users> user = usersRepository.findByUsernameAndPassword(username, password);

		return user.orElseThrow(UserNotFoundException::new);
	}
	
	public Users createUsers(Users user) {
		return usersRepository.save(user);
	}

	public List<Users> getAllUsers() {
		return mongoTemplate.findAll(Users.class, "users");
		//return usersRepository.findAll();
	}
	
	public Optional<Users> getAUsersByUsername(String username) {
		System.out.println(username+" "+"////////////\\\\\\\\\\\\\\\\\\\\");
		return usersRepository.findByUsername(username);
	}

	public List<Users> deleteUsers(String id) {
		return usersRepository.deleteUsersById(id);
	}


	public Users getUserById(String id) {
		Optional<Users> user = usersRepository.findById(id);

		return user.orElseThrow(UserNotFoundException::new);
	}


	public Users getUserByEmail(String email) {
		Optional<Users> user = usersRepository.findByEmail(email);

		return user.orElseThrow(UserNotFoundException::new);
	}


}
