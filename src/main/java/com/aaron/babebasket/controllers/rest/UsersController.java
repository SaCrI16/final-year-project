package com.aaron.babebasket.controllers.rest;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aaron.babebasket.models.Advertisement;
import com.aaron.babebasket.models.Users;
import com.aaron.babebasket.services.UsersService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@Api
@RestController
@RequestMapping("user")
public class UsersController {
	
	@Autowired
	private UsersService userService;
	
	@GetMapping
	@ApiOperation("retrieve all users")
	public List<Users> getAllUser() {
 		return userService.getAllUsers();
		
	}
	
	@PostMapping("/delete")
	public List<Users> deleteUser(String id) {
		return userService.deleteUsers(id);
	}
	@PostMapping("update")
	@ApiOperation("add new users to collection or update")
	public Users createUsers(@RequestBody Users user) {
 		return userService.createUsers(user);
		
	}

	@GetMapping("username")
	public Optional<Users> getUsername(String username) {
		return userService.getAUsersByUsername(username);
	}

	
//	@GetMapping("login")
//	@ApiOperation("get user by username")
//	public Users getUsernameAndPassword(String username, String password, HttpSession session) {
//		Users user = userService.getUserInfo(username, password);
//		session.setAttribute("user", user);
//		return user;
//	}
	
	
//	@GetMapping("login/second")
//	@ApiOperation("get user by username")
//	public String getUsernameAndPassword(@RequestParam String username, @RequestParam String password, HttpSession session) {
//		try{
//			Users user = userService.getUserInfo(username, password);
//			session.setAttribute("user", user);
//			return "user-profile";
//		}catch(UserNotFoundException e){
//			throw new UserNotFoundException();
//		}

//	}
}