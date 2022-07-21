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

import com.shop.fashion.model.User;
import com.shop.fashion.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	// 회원관리 페이지에 기본화면 전체조회 
	@GetMapping("/admin/user/select-all")
	public String selectAllUser(@PageableDefault(size = 20, sort = "id", direction = Direction.DESC) Pageable pageable, Model model){
		Page<User> userPage = adminService.getUserAll(pageable);
		
		int nowPage = userPage.getPageable().getPageNumber() + 1;	// 0 이 시작
		int startPage = Math.max(nowPage - 2, 1);	// 두 int 값 중에 큰 값을 반환 
		int endPage = Math.min(nowPage + 2, userPage.getTotalPages());

		ArrayList<Integer> pageNumbers = new ArrayList<>();
		
		for (int i = startPage; i <= endPage; i++) {
			pageNumbers.add(i);
		}
		
		model.addAttribute("userPage", userPage);
		model.addAttribute("pageNumbers", pageNumbers);
		return "admin/setting_user";
	}
}
