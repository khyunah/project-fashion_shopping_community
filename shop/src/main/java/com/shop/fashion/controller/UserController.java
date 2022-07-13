package com.shop.fashion.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.shop.fashion.model.User;
import com.shop.fashion.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;

	// 회원가입 화면
	@GetMapping("/security/join_form")
	public String joinForm() {
		return "user/join_form";
	}
	
	// 회원가입
	@PostMapping("/security/join-user")
	public String joinUser(User user) {
		userService.joinUser(user);
		return "user/login_form";
	}
	
	// 로그인 화면 
	@GetMapping("/security/login_form")
	public String loginForm() {
		return "user/login_form";
	}
	
	// 회원 정보 수정 화면
	@GetMapping("/user/update_form")
	public String updateUser() {
		return "user/update_form";
	}
	
	// 테스트 홈 
	@GetMapping("/")
	public String home() {
		return "user/home";
	}

}
