package com.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller("UserRole")
public class UserController {

	@GetMapping("home")
	public String home() {
		
		return "Home";
	}
	
}
