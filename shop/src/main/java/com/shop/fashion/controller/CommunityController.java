package com.shop.fashion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class CommunityController {

	// 커뮤니티 상세보기 
	@GetMapping("/community/{boardId}")
	public String communityDetail(@PathVariable int boardId) {
		return "community/community_detail";
	}
}
