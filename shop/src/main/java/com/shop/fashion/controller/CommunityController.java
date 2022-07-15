package com.shop.fashion.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.shop.fashion.auth.PrincipalUserDetail;
import com.shop.fashion.dto.RequestFileDto;
import com.shop.fashion.service.CommunityService;

@Controller
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;
	
	@GetMapping("/")
	public String index() {
		return "index"; 
	}
	
	@GetMapping("/board/write")
	public String write() {
		return "community/write_form";
	}
	
	@PostMapping("/board/upload")
	public String storyUpload(RequestFileDto fileDto, @AuthenticationPrincipal PrincipalUserDetail detail) {
//		communityService.upload(fileDto, detail.getUser());
		return "redirect:/";
	}
	
}
