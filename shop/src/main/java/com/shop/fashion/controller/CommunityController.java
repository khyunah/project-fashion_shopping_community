package com.shop.fashion.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
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
	
	@GetMapping("/community/social-main")
	public String communityHome(@PageableDefault(size = 2) Pageable pageable, Model model, @AuthenticationPrincipal PrincipalUserDetail userDetail) {
		Page<CommunityBoard> communityBoardList = communityService.getCommunityBoardList(pageable);
		model.addAttribute("communityBoardList", communityBoardList);
		
		List<CommunityLike> likeList = communityService.myLike(userDetail.getUser().getId());
		model.addAttribute("likeList", likeList);
		return "community/community_social";
	}

}
