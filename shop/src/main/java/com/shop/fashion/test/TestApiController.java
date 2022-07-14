package com.shop.fashion.test;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shop.fashion.model.User;
import com.shop.fashion.repository.UserRepository;

@RestController
public class TestApiController {
	
	@Autowired
	UserRepository userRepository;
	
	@GetMapping("/test")
	public String searchUserName() {
			
		User user = userRepository.mSearchUserName("teco");
		System.out.println("user : " + user.toString());
		
		
		return user.toString();
	}

}
