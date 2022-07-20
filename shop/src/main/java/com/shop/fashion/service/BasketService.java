package com.shop.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.fashion.model.Basket;
import com.shop.fashion.model.Item;
import com.shop.fashion.model.User;
import com.shop.fashion.repository.BasketRepository;

@Service
public class BasketService {

	@Autowired
	private BasketRepository basketRepository;
	
	@Transactional
	public void putCart(Item Itemid, User userId) {
		Basket basket = new Basket();
		basket.setItem(Itemid);
		basket.setUser(userId);
		basketRepository.save(basket);
			
	}
	
}
