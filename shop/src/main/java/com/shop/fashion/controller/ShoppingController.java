package com.shop.fashion.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.shop.fashion.model.Category;
import com.shop.fashion.model.Item;
import com.shop.fashion.service.ShoppingService;


@Controller
public class ShoppingController {
	
	@Autowired
	ShoppingService shoppingService;

	@GetMapping("shop/mans_form")
	public String mansForm(Category c, Model model,
			@PageableDefault(size=20, sort="id", direction = Direction.DESC) Pageable pageable) {
	
		Category categorys = c == null ? Category.SHIRTS : c;
		
		Page<Item> pageItems = shoppingService.searchCategory(pageable, categorys);
		
		int nowPage = pageItems.getPageable().getPageNumber() + 1; // 현재 페이지
		int startPage = Math.max(nowPage - 2, 1); // 두 int 값 중에 큰 값 반환
		int endPage = Math.min(nowPage + 2, pageItems.getTotalPages());
		
		// 페이지 번호를 배열로 만들어서 던져주기
		ArrayList<Integer> pageNumbers = new ArrayList<>();
		// 주의! 마지막 번호까지 저장하기
		for (int i = startPage; i <= endPage; i++) {
			pageNumbers.add(i);
		}
		
		model.addAttribute("pageable", pageItems);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageNumbers", pageNumbers);
		model.addAttribute("pageItems", pageItems);
		return "shopping/mans_form";
	}
	
	@GetMapping("/shop/save_form")
	public String saveForm() {
		return "shopping/save_form";
	}
}
