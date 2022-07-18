package com.shop.fashion.api;

import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.shop.fashion.auth.PrincipalUserDetail;
import com.shop.fashion.dto.ResponseDto;
import com.shop.fashion.model.Board;
import com.shop.fashion.model.Reply;
import com.shop.fashion.model.User;

@RestController
public class CommunityApiContoller {
//
//	@PostMapping("/community/reply-insert")
//	public ResponseDto<Reply> replyInsert(@AuthenticationPrincipal PrincipalUserDetail principalUserDetail,@PathVariable int boardId, @RequestBody String content){
//		
//		return new ResponseDto<>(HttpStatus.OK.value(), );
//	}
}
