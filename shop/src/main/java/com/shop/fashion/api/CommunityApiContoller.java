package com.shop.fashion.api;

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
import com.shop.fashion.model.Board;
import com.shop.fashion.model.CommunityLike;
import com.shop.fashion.model.Reply;
import com.shop.fashion.model.User;
import com.shop.fashion.service.CommunityService;

@RestController
public class CommunityApiContoller {
	
	@Autowired
	private CommunityService communityService;

	// 댓글 쓰기
	@PostMapping("/community/reply-insert/{boardId}")
	public ResponseDto<Reply> replyInsert(@PathVariable int boardId, @RequestBody Reply reply, @AuthenticationPrincipal PrincipalUserDetail userDetail){
		System.out.println("서버에 도착");
		System.out.println(boardId);
		System.out.println(reply);
		System.out.println(userDetail);
		Reply replyEntity = communityService.insertReply(boardId, reply, userDetail.getUser());
		return new ResponseDto<>(HttpStatus.OK.value(), replyEntity);
	}
	
	// 좋아요
	@GetMapping("/community/check-like/{communityBoardId}")
	public ResponseDto<CommunityLike> checkLike(@PathVariable int communityBoardId, @AuthenticationPrincipal PrincipalUserDetail principalUserDetail){
		CommunityLike like = communityService.checkLike(communityBoardId, principalUserDetail.getUser().getId());
		return new ResponseDto<CommunityLike>(HttpStatus.OK.value(), like);
	}
	
}
