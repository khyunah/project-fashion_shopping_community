package com.shop.fashion.controller;

import java.util.ArrayList;
import java.util.List;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.shop.fashion.model.Basket;
import com.shop.fashion.model.Item;
import com.shop.fashion.service.ShoppingService;


@Controller
public class ShoppingController {
	
	@Autowired
	ShoppingService shoppingService;

	@GetMapping({"shop/mans_form", "/shop/search"})
	public String mansForm(@PathParam("gender") String gender, @PathParam("category") String category, Model model,
			@PageableDefault(size=8, sort="id", direction = Direction.DESC) Pageable pageable) {

		Page<Item> pageItems;
		if(gender == null || category == null) {
			pageItems = shoppingService.searchMans(pageable);
		}else {
			pageItems = shoppingService.searchItemCategory(category, gender, pageable);
		}
		//Page<Item> ca = shoppingService.searchMansShirts(categorys.toString(), c.toString() , pageable);
		
		
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
		//model.addAttribute("pageItems", ca);
		return "shopping/mans_form";
	}
	
	@GetMapping("/shop/save_form")
	public String saveForm() {
		return "shopping/save_form";
	}
	
	@GetMapping("/shop/basket_form/{id}")
	public String cartForm(@PathVariable int id, Model model) {
		List<Basket> Baskets = shoppingService.getOnUserCart(id);
		model.addAttribute("Baskets", Baskets);
		
		return "shopping/basket_form";
	}
	// /shopping/itemdetail_form/${item.id}
	@GetMapping("/shop/itemdetail_form/{id}")
	public String itemDetailform(@PathVariable int id, Model model) {
		model.addAttribute("item", shoppingService.itemDetail(id));
		return "shopping/itemdetail_form";
	}
	
}
