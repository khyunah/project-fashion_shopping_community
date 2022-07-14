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
	
	@Transactional(readOnly = true)
	public Page<Item> searchCategory(Pageable pageable, Category category) {
		return shoppingRepository.CategoryItem(category, pageable);
	}
	
	@Transactional
	public void saveItem(Item item) {
		shoppingRepository.save(item);
	}
}
