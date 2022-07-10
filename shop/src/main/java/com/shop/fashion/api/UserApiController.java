package com.shop.fashion.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.shop.fashion.dto.ResponseDto;
import com.shop.fashion.service.UserService;

@RestController
public class UserApiController {

	@Autowired
	private UserService userService;

	// 회원가입시 아이디 중복 체크
	/**
	 * 회원가입시 아이디 중복 체크를 하는 기능 <br>
	 * 입력한 userId가 가입되어 있지 않으면 new User()로 넘어옴 <br>
	 * 입력한 userId로 이미 가입이 되어있으면 UserEntity로 넘어옴
	 */
	@PostMapping("/security/join-usernameCheck")
	public ResponseDto<Boolean> checkUsername(@RequestBody String username) {
		boolean checkUser = userService.checkUsername(username);
		return new ResponseDto<>(HttpStatus.OK.value(), checkUser);
	}
}
