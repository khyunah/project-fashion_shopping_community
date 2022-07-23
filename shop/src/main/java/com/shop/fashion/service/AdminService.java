package com.shop.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.fashion.model.CommunityBoard;
import com.shop.fashion.model.Item;
import com.shop.fashion.model.RollType;
import com.shop.fashion.model.User;
import com.shop.fashion.repository.CommunityRepository;
import com.shop.fashion.repository.ShoppingRepository;
import com.shop.fashion.repository.UserRepository;

@Service
public class AdminService {

	@Autowired
	private UserRepository userRepository;
	@Autowired
	private ShoppingRepository shoppingRepository;
	@Autowired
	private CommunityRepository communityRepository;
	
	// 회원정보 전체 조회
	@Transactional
	public Page<User> getUserAll(Pageable pageable){
		return userRepository.findAll(pageable);
	}
	
	// 회원 삭제
	@Transactional
	public void deleteUser(int id) {
		userRepository.deleteById(id);
	}
	
	// 회원에게 관리자 권한 부여
	@Transactional
	public void changeUserRole(int id, boolean result) {
		User user = userRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("유저가 존재하지 않습니다.");
		});
		if(result) {
			user.setRole(RollType.ADMIN);
		} else {
			user.setRole(RollType.USER);
		}
	}
	
	// 상품정보 전체 조회
	@Transactional
	public Page<Item> getItemAll(Pageable pageable){
		return shoppingRepository.findAll(pageable);
	}

	// 커뮤니티 전체 조회
	@Transactional
	public Page<CommunityBoard> getBoardAll(Pageable pageable){
		return communityRepository.findAll(pageable);
	}
	
	// 커뮤니티 보드 삭제
	@Transactional
	public void deleteCommunityBoard(int id) {
		communityRepository.deleteById(id);
	}
}
