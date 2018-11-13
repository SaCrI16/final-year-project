package com.aaron.babebasket;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.aaron.babebasket.repositories.UsersRepository;

@Controller
@RequestMapping("/")
public class HomeController {

	@Autowired
	private UsersRepository userRepository;

	@GetMapping("")
	public String index() {
		return "index";
	}

	@GetMapping("/list")
	public String listAds(@RequestParam(required = false) String id, @RequestParam(required = false) String category, HttpSession session, Model model) {
		if(id != null && !id.isEmpty()) {
			System.out.println("awdsf asdf" + id);
			session.setAttribute("user", userRepository.findById(id).get());
		}
		model.addAttribute("subcategories", model);
			
		return "listOfAds";
	}
	
	@GetMapping("/detail")
	public String details() {
		return "product-detail";
	}

	@GetMapping("/post-ads")
	public String postAds() {
		return "post-ads";
	}
	
	@GetMapping("/upload")
	public String uploadImage() {
		return "upload-image";
	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@GetMapping("/register")
	public String register() {
		return "register";
	}

	@GetMapping("profile")
	public String userProfil() {
		return "user-profile";
	}

	@GetMapping("userList")
	public String userlist() {
		return "userList";
	}

	@GetMapping("home")
	public String home() {

		return "index";
	}
}
