package com.shop.fashion.controller;


import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.shop.fashion.auth.PrincipalUserDetail;
import com.shop.fashion.dto.CommunityDto;
import com.shop.fashion.model.CommunityBoard;

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
	
	@GetMapping("/")
	public String index(Model model) {
		List<CommunityBoard> boardList = communityService.getCommunityBoardList();
		Collections.reverse(boardList);
		model.addAttribute("boardList", boardList);
		return "index";
	}
	
	@GetMapping("/board/write")
	public String write() {
		return "community/write_form";
	}
	
	@PostMapping("/board/upload")
	public String storyUpload(CommunityDto fileDto, @AuthenticationPrincipal PrincipalUserDetail detail) {
		communityService.upload(fileDto, detail.getUser());
		return "redirect:/";
	}
	
	@GetMapping("/board/{id}/update_form")
	public String updateForm(@PathVariable int id, Model model) {
		model.addAttribute("communityBoard", communityService.boardDetail(id));
		return "/community/update_form";
	}
	
	
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
