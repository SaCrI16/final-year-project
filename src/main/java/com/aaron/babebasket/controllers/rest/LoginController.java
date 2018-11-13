package com.aaron.babebasket.controllers.rest;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.aaron.babebasket.exception.UserNotFoundException;
import com.aaron.babebasket.models.Users;
import com.aaron.babebasket.services.UsersService;

import io.swagger.annotations.ApiOperation;

@Controller
@RequestMapping("user")
public class LoginController {
	
	@Autowired
	private UsersService userService;


	@GetMapping("login")
	@ApiOperation("get user by username")
	public String getUsernameAndPassword(@RequestParam String username, @RequestParam String password, HttpSession session) {
		try{
			Users user = userService.getUserInfo(username, password);
			session.setAttribute("user", user);
			
			System.out.println("//////////////////////////" + user);

			return "index";
		}catch(UserNotFoundException e){
			throw new UserNotFoundException();
		}
 	}
}
