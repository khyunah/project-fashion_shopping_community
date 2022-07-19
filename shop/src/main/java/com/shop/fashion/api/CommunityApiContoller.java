package com.shop.fashion.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shop.fashion.model.CommunityBoard;
import com.shop.fashion.service.CommunityService;

@RestController
public class CommunityApiContoller {
	
	@Autowired
	CommunityService communityService;
	
	@GetMapping("/api/boardList")
	public List<CommunityBoard> boardList() {
		List<CommunityBoard> bordList = communityService.getCommunityBoardList();
		return bordList;
		
	}
	
}
