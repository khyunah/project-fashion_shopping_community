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
			return new IllegalArgumentException("회원이 존재하지 않습니다.");
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
	
	// 상품 삭제
	@Transactional
	public void deleteItem(int id) {
		shoppingRepository.deleteById(id);
	}
	
	// 상품 조회
	@Transactional
	public Item getItem(int id) {
		return shoppingRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("상품이 존재하지 않습니다.");
		});
	}
	
	// 상품 수정
	@Transactional
	public Item updateItem(Item item) {
		Item itemEntity = shoppingRepository.findById(item.getId()).orElseThrow(() -> {
			return new IllegalArgumentException("상품이 존재하지 않습니다.");
		});
		itemEntity.setName(item.getName());
		itemEntity.setContent(item.getContent());
		itemEntity.setAmount(item.getAmount());
		itemEntity.setCategory(item.getCategory());
		itemEntity.setColor(item.getColor());
		itemEntity.setGender(item.getGender());
		itemEntity.setImageurl(item.getImageurl());
		itemEntity.setPrice(item.getPrice());
		itemEntity.setSize(item.getSize());
		
		return itemEntity;
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
