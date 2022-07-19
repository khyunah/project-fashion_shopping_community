package com.shop.fashion.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.shop.fashion.auth.PrincipalUserDetail;
import com.shop.fashion.model.CommunityBoard;
import com.shop.fashion.model.CommunityLike;
import com.shop.fashion.service.CommunityService;

@Controller
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;

	// 커뮤니티 상세보기 
	@GetMapping("/community/{boardId}")
	public String communityDetail(@PathVariable int boardId, Model model, @AuthenticationPrincipal PrincipalUserDetail userDetail) {
		CommunityBoard board = communityService.detailCommunityBoard(boardId);
		model.addAttribute("communityBoard", board);
		
		CommunityLike checkLike = communityService.isLike(boardId, userDetail.getUser().getId());
		model.addAttribute("like", checkLike);
		return "community/community_detail";
	}
}
