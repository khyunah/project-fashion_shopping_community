package com.shop.fashion.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.shop.fashion.dto.ResponseDto;
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
	
	@PutMapping("/api/board/{id}")
	public ResponseDto<Integer> update(@PathVariable int id, @RequestBody CommunityBoard board) {
		communityService.modifyBoard(id, board);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	
	@DeleteMapping("/api/board/{id}")
	public ResponseDto<Integer> deleteById(@PathVariable int id) {
		communityService.deleteById(id);
		return new ResponseDto<>(HttpStatus.OK.value(), 1);
	}
	
}
