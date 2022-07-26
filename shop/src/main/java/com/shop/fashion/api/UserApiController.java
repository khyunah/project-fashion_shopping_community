package com.shop.fashion.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.shop.fashion.auth.PrincipalUserDetail;
import com.shop.fashion.dto.ReqUserSearchDto;
import com.shop.fashion.dto.ResponseDto;
import com.shop.fashion.model.OAuthType;
import com.shop.fashion.model.User;
import com.shop.fashion.service.UserService;

@RestController
public class UserApiController {

	@Autowired
	private UserService userService;
	@Autowired
	private AuthenticationManager authenticationManager;
	@Value("${kakao.key}")
	private String kakaoKey;

	// 회원가입시 아이디 중복 체크
	@PostMapping("/security/join-usernameCheck")
	public ResponseDto<User> checkUsername(@RequestBody ReqUserSearchDto dto) {
		User checkUser = userService.checkUsername(dto.getUsername());
		return new ResponseDto<>(HttpStatus.OK.value(), checkUser);
	}

	// 회원정보 수정
	@PutMapping("/user/update")
	public ResponseDto<User> updateUser(@RequestBody User user,
			@AuthenticationPrincipal PrincipalUserDetail userDetail) {

		User updateUserEntity = userService.updateUser(user);

		if(userDetail.getUser().getOauth() == OAuthType.ORIGIN) {
			Authentication authentication = authenticationManager
					.authenticate(new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword()));
			SecurityContextHolder.getContext().setAuthentication(authentication);
		} else {
			Authentication authentication = authenticationManager
					.authenticate(new UsernamePasswordAuthenticationToken(user.getUsername(), kakaoKey));
			SecurityContextHolder.getContext().setAuthentication(authentication);
		}

		return new ResponseDto<User>(HttpStatus.OK.value(), updateUserEntity);
	}

}
