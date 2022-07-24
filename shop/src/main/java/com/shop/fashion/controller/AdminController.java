package com.shop.fashion.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.shop.fashion.model.CommunityBoard;
import com.shop.fashion.model.Item;
import com.shop.fashion.model.User;
import com.shop.fashion.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;

	// 회원관리 페이지에 기본화면 전체조회
	@GetMapping("/admin/user/select-all")
	public String selectAllUser(@PageableDefault(size = 20, sort = "id", direction = Direction.DESC) Pageable pageable,
			Model model) {
		Page<User> userPage = adminService.getUserAll(pageable);

		int nowPage = userPage.getPageable().getPageNumber() + 1; 
		int startPage = Math.max(nowPage - 2, 1); 
		int endPage = Math.min(nowPage + 2, userPage.getTotalPages());

		ArrayList<Integer> pageNumbers = new ArrayList<>();

		for (int i = startPage; i <= endPage; i++) {
			pageNumbers.add(i);
		}

		model.addAttribute("userPage", userPage);
		model.addAttribute("pageNumbers", pageNumbers);
		return "admin/setting_user";
	}
	
	// 상품관리 페이지에 기본화면 전체 조회 
	@GetMapping("/admin/shopping/select-all")
	public String selectAllShopping(@PageableDefault(size = 16, sort = "id", direction = Direction.DESC) Pageable pageable,
			Model model) {
		Page<Item> itemPage = adminService.getItemAll(pageable);
		
		int nowPage = itemPage.getPageable().getPageNumber() + 1;
		int startPage = Math.max(nowPage - 2, 1);
		int endPage = Math.min(nowPage + 2, itemPage.getTotalPages());

		ArrayList<Integer> pageNumbers = new ArrayList<>();

		for (int i = startPage; i <= endPage; i++) {
			pageNumbers.add(i);
		}

		model.addAttribute("itemPage", itemPage);
		model.addAttribute("pageNumbers", pageNumbers);
		return "admin/setting_shopping";
	}
	
	// 상품 상세보기 
	@GetMapping("/admin/shopping/item-detail/{id}")
	public String detailItemDetail(@PathVariable int id, Model model) {
		Item item = adminService.getItem(id);
		model.addAttribute("item", item);
		return "admin/admin_shopping_detail";
	}

	// 상품 등록 페이지 
	@GetMapping("/admin/shopping/save_form")
	public String shoppingSaveForm() {
		return "admin/admin_shopping_save_form";
	}
	
	// 상품 수정 페이지
	@GetMapping("/admin/shopping-item/update_form/{id}")
	public String updateFormItem(@PathVariable int id, Model model) {
		Item item = adminService.getItem(id);
		model.addAttribute("item", item);
		return "admin/admin_shopping_update_form";
	}
	
	// 커뮤니티 관리 페이지에 기본화면 전체 조회
	@GetMapping("/admin/community/select-all")
	public String selectAllCommunity(@PageableDefault(size = 20, sort = "id", direction = Direction.DESC) Pageable pageable,
			Model model) {
		Page<CommunityBoard> communityBoardPage = adminService.getBoardAll(pageable);
		
		int nowPage = communityBoardPage.getPageable().getPageNumber() + 1; 
		int startPage = Math.max(nowPage - 2, 1);
		int endPage = Math.min(nowPage + 2, communityBoardPage.getTotalPages());

		ArrayList<Integer> pageNumbers = new ArrayList<>();

		for (int i = startPage; i <= endPage; i++) {
			pageNumbers.add(i);
		}

		model.addAttribute("communityBoardPage", communityBoardPage);
		model.addAttribute("pageNumbers", pageNumbers);
		return "admin/setting_community";
	}
	
}
