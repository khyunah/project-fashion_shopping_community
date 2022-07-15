package com.shop.fashion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommunityController {
// 테스트
	
	@GetMapping("/")
	public String index() {
		return "index"; 
	}
	
	@GetMapping("/board/write")
	public String write() {
		return "community/write_form";
	}
}
