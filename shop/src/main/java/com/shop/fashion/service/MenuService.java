package com.shop.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.fashion.model.Menu;
import com.shop.fashion.repository.MenuRepository;

@Service
public class MenuService {
	
	@Autowired
	private MenuRepository menuRepository;
	
	@Transactional
	public Menu menuSave(Menu menu) {
		return menuRepository.save(menu);
	}
}
