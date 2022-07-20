package com.shop.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.fashion.model.OAuthType;
import com.shop.fashion.model.RollType;
import com.shop.fashion.model.User;
import com.shop.fashion.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	// 회원가입
	@Transactional
	public User joinUser(User user) {
		if(user.getOauth() == null) {
			user.setOauth(OAuthType.ORIGIN);
		}
		user.setRole(RollType.USER);
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		System.out.println(user.getPassword());
		return userRepository.save(user);
	}
	
	// 아이디 중복 체크
	@Transactional()
	public User checkUsername(String name) {
		User userTemp =  userRepository.findByUsername(name).orElseGet(() -> {
			return new User();
		});
		return userTemp;
	}
	
	// 회원정보 수정
	@Transactional
	public User updateUser(User user) {

		User originUser = userRepository.findById(user.getId()).orElseThrow(() -> {
			return new IllegalArgumentException("해당 사용자를 찾을 수 없습니다.");
		});
		
		originUser.setName(user.getName());
		originUser.setEmail(user.getEmail());
		originUser.setPhoneNumber(user.getPhoneNumber());
		originUser.setAddress(user.getAddress());
		originUser.setPassword(passwordEncoder.encode(user.getPassword()));

		return originUser;
	}
	
	public User getUser(int id) {
		return userRepository.findById(id).get();
		}
}
