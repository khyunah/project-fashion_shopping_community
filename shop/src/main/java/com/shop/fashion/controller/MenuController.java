package com.shop.fashion.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.shop.fashion.model.Menu;
import com.shop.fashion.service.MenuService;

@Controller
public class MenuController {
	
	@Autowired
	private MenuService menuService;
	
	// 메뉴 만들기 페이지 
	@GetMapping("/admin/menu-save/form")
	public String saveMenuForm() {
		return "admin/menu_save_form";
	}
	
	// 메뉴 저장하기
	@PostMapping("/admin/menu-save")
	public String saveMenu(@RequestBody Menu menu) {
		menuService.menuSave(menu);
		return "admin/menu_home";
	}
}
