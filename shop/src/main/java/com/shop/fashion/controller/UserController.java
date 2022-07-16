package com.shop.fashion.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.client.RestTemplate;

import com.shop.fashion.dto.KakaoTokenDto;
import com.shop.fashion.dto.KakaoUserInfoDto;
import com.shop.fashion.model.OAuthType;
import com.shop.fashion.model.User;
import com.shop.fashion.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private AuthenticationManager authenticationManager;

	// 회원가입 화면
	@GetMapping("/security/join_form")
	public String joinForm() {
		return "user/join_form";
	}
	
	// 회원가입
	@PostMapping("/security/join-user")
	public String joinUser(User user) {
		userService.joinUser(user);
		return "user/login_form";
	}
	
	// 로그인 화면 
	@GetMapping("/security/login_form")
	public String loginForm() {
		return "user/login_form";
	}
	
	// 회원 정보 수정 화면
	@GetMapping("/user/update_form")
	public String updateUser() {
		return "user/update_form";
	}
	


	// 카카오 로그인 
	@GetMapping("/security/kakao/callback")
	public String kakaoLogin(String code) {
		
		// 토큰 정보 받기
		HttpHeaders tokenHeaders = new HttpHeaders();
		tokenHeaders.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		MultiValueMap<String, String> tokenParams = new LinkedMultiValueMap<String, String>();
		tokenParams.add("grant_type", "authorization_code");
		tokenParams.add("client_id", "0d6bcf296d67c35ad944b2a3d38df9be");
		tokenParams.add("redirect_uri", "http://localhost:9090/security/kakao/callback");
		tokenParams.add("code", code);
		
		// Http 메세지를 만든다. 
		HttpEntity<MultiValueMap<String, String>> tokenRequest = new HttpEntity<MultiValueMap<String,String>>(tokenParams,tokenHeaders);
		
		RestTemplate tokenRest = new RestTemplate();
		ResponseEntity<KakaoTokenDto> tokenResponse = tokenRest.exchange(
				"https://kauth.kakao.com/oauth/token",
				HttpMethod.POST,
				tokenRequest,
				KakaoTokenDto.class);

		// 사용자 정보 받기 
		HttpHeaders kakaoUserInfoHeader = new HttpHeaders();
		kakaoUserInfoHeader.add("Authorization", "Bearer " + tokenResponse.getBody().getAccessToken());
		kakaoUserInfoHeader.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		HttpEntity<MultiValueMap<String, String>> kakaoUserInfoRequest = new HttpEntity<>(kakaoUserInfoHeader);
		RestTemplate kakaoUserInfoRest = new RestTemplate();
		ResponseEntity<KakaoUserInfoDto> kakaoUserInfoResponse = kakaoUserInfoRest.exchange(
				"https://kapi.kakao.com/v2/user/me",
				HttpMethod.POST,
				kakaoUserInfoRequest,
				KakaoUserInfoDto.class);
		
		KakaoUserInfoDto kakaoUserInfo = kakaoUserInfoResponse.getBody();
		
		// 사용자 가입시켜주기 
		
		// 사용자가 이미 가입되어 있는지 확인 
		String name = kakaoUserInfo.getProperties().getNickname(); 
		String email = kakaoUserInfo.getKakaoAccount().getEmail();
		boolean hasEmail = kakaoUserInfo.getKakaoAccount().getHasEmail();
		
		User kakaoLoginUser = User.builder()
				.username(email + "_" + kakaoUserInfo.getId())
				.password(String.valueOf(kakaoUserInfo.getId()))
				.email(email)
				.oauth(OAuthType.KAKAO)
				.name(name)
				.build();
		
		if(hasEmail) {
			User originUser = userService.checkUsername(kakaoLoginUser.getUsername());
			
			if(originUser.getUsername() == null) {
				userService.joinUser(kakaoLoginUser);
				System.out.println("가입됨");
			}
		}
		
		Authentication authentication = authenticationManager.authenticate(
				new UsernamePasswordAuthenticationToken(kakaoLoginUser.getUsername(), String.valueOf(kakaoUserInfo.getId())));
		SecurityContextHolder.getContext().setAuthentication(authentication);

		return "redirect:/";
	}

}
