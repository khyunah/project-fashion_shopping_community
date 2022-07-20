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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.shop.fashion.auth.PrincipalUserDetail;
import com.shop.fashion.dto.ResponseDto;
import com.shop.fashion.model.CommunityBoard;
import com.shop.fashion.model.CommunityLike;
import com.shop.fashion.model.Reply;
import com.shop.fashion.model.User;

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
	
	// 댓글 쓰기
	@PostMapping("/community/reply-insert/{boardId}")
	public ResponseDto<Reply> insertReply(@PathVariable int boardId, @RequestBody Reply reply, @AuthenticationPrincipal PrincipalUserDetail userDetail){
		System.out.println("서버에 도착");
		System.out.println(boardId);
		System.out.println(reply);
		System.out.println(userDetail);
		Reply replyEntity = communityService.insertReply(boardId, reply, userDetail.getUser());
		return new ResponseDto<>(HttpStatus.OK.value(), replyEntity);
	}
	
	// 댓글 삭제
	@GetMapping("/community/reply-delete/{id}")
	public ResponseDto<Integer> deleteReply(@PathVariable int id){
		communityService.deleteReply(id);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	// 댓글 수정
	@PostMapping("/community/reply-update")
	public ResponseDto<Reply> updateReply(@RequestBody Reply reply){
		Reply replyEntity = communityService.updateReply(reply);
		return new ResponseDto<Reply>(HttpStatus.OK.value(), replyEntity);
	}
	
	// 좋아요
	@GetMapping("/community/check-like/{communityBoardId}")
	public ResponseDto<CommunityLike> checkLike(@PathVariable int communityBoardId, @AuthenticationPrincipal PrincipalUserDetail principalUserDetail){
		CommunityLike like = communityService.checkLike(communityBoardId, principalUserDetail.getUser());
		return new ResponseDto<CommunityLike>(HttpStatus.OK.value(), like);
	}
	
}
