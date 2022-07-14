package com.shop.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.fashion.model.Category;
import com.shop.fashion.model.Item;
import com.shop.fashion.repository.ShoppingRepository;

@Service
public class ShoppingService {
	
	@Autowired
	ShoppingRepository shoppingRepository;
	
//	@Transactional(readOnly = true)
//	public Page<Item> searchCategory(Pageable pageable, Category category) {
//		System.out.println(category);
//		return shoppingRepository.CategoryItem(category, pageable);
//	}
	@Transactional(readOnly = true)
	public Page<Item> searchManShirts(Pageable pageable) {
		return shoppingRepository.CategoryItemManShirts(pageable);
	}
	
	@Transactional
	public void saveItem(Item item) {
		shoppingRepository.save(item);
	}
	
	@Transactional
	public void modifyBoard(int id, Item item) { // title, content
		Item itemEntity = shoppingRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("해당 게시글은 찾을 수 없습니다.");
		});
		itemEntity.setCategory(item.getCategory());
		itemEntity.setContent(item.getContent());
		itemEntity.setGender(item.getGender());
		itemEntity.setId(item.getId());
		itemEntity.setImageurl(item.getImageurl());
		itemEntity.setName(item.getName());
		itemEntity.setPrice(item.getPrice());
		// 더티체킹 - @Transactional만 걸어주면 됨
	}

}
