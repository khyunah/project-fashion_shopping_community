package com.shop.fashion.test;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.shop.fashion.model.User;
import com.shop.fashion.repository.UserRepository;

@Controller
//@RestController
public class TestApiController {
	
	@Autowired
	UserRepository userRepository;
	
	@GetMapping("/test")
	public String searchUserName() {
			
		User user = userRepository.mSearchUserName("teco");
		System.out.println("user : " + user.toString());
		
		
		return user.toString();
	}
	
	@GetMapping("/test/commu")
	public String communityHome() {
		return "community/community_home";
	}
	
	// 테스트 홈 
	@GetMapping("/test/home")
	public String home() {
		return "user/home";
	}
}
