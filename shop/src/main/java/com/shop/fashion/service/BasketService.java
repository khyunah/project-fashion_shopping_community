package com.shop.fashion.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.fashion.dto.BasketSumDto;
import com.shop.fashion.model.Basket;
import com.shop.fashion.model.Item;
import com.shop.fashion.model.User;
import com.shop.fashion.repository.BasketRepository;
import com.shop.fashion.repository.BasketSumRepository;

@Service
public class BasketService {

	@Autowired
	private BasketRepository basketRepository;

	@Autowired
	private BasketSumRepository basketSumRepository;

	@Transactional
	public void putCart(Item Itemid, User userId) {
		Basket basket = new Basket();
		basket.setItem(Itemid);
		basket.setUser(userId);
		basket.setCount(1);
		List<Basket> basketEntity = basketRepository.findByItemIdAndUserId(Itemid.getId(), userId.getId());

		if (basketEntity.size() != 0) {
			basketEntity.get(0).setCount(basketEntity.get(0).getCount() + 1);

		} else {
			basketRepository.save(basket);
		}

	}

	@Transactional
	public int sum(int userId) {
		System.out.println(basketSumRepository.getBasketSum(userId));
		List<BasketSumDto> basketSum = basketSumRepository.getBasketSum(userId);
		System.out.println(basketSum);
		if (basketSum != null) {
			return basketSum.get(0).getSum().intValue();
		} else {
			return 0;
		}

	}

	@Transactional
	public void deleteBasketItemById(int basketId) {
		basketRepository.deleteById(basketId);
	}

}
