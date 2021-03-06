package com.shop.fashion.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.fashion.model.Basket;
import com.shop.fashion.model.Item;
import com.shop.fashion.model.User;
import com.shop.fashion.repository.BasketRepository;
import com.shop.fashion.repository.ShoppingRepository;

@Service
public class ShoppingService {

	@Autowired
	ShoppingRepository shoppingRepository;

	@Autowired
	BasketRepository basketRepository;

	@Transactional(readOnly = true)
	public Page<Item> searchMans(Pageable pageable) {
		return shoppingRepository.CategoryItemMans(pageable);
	}

	@Transactional(readOnly = true)
	public Page<Item> searchWomans(Pageable pageable) {
		return shoppingRepository.CategoryItemWomans(pageable);
	}

	@Transactional
	public void saveItem(Item item) {
		shoppingRepository.save(item);
	}

	@Transactional(readOnly = true)
	public Page<Item> searchItemCategory(String category, String gender, Pageable pageable) {
		return shoppingRepository.CategoryItem(category, gender, pageable);
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

	@Transactional(readOnly = true)
	public List<Basket> getOnUserCart(int userid) {
		List<Basket> basket = basketRepository.findByUserId(userid);
		return basket;
	}

	@Transactional
	public Item itemDetail(int itemId) {
		return shoppingRepository.findById(itemId).orElseThrow(() -> {
			return new IllegalArgumentException("해당 게시글은 찾을 수 없습니다.");
		});
	}

	@Transactional
	public List<Item> itemDetails(String name, String gender) {
		System.out.println(shoppingRepository.detailItemSizeColor(name, gender));
		return shoppingRepository.detailItemSizeColor(name, gender);
	}

	@Transactional
	public void putCart(int itemid, User user, int basketid) {
		Basket basket = basketRepository.findById(basketid).get();
		basket.setUser(user);
	}

}
