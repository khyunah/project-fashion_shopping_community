package com.shop.fashion.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.shop.fashion.dto.JoinCountDto;
import com.shop.fashion.dto.OAuthCountDto;
import com.shop.fashion.dto.ShoppingCountAndSumDto;
import com.shop.fashion.model.User;
import com.shop.fashion.service.AdminService;
import com.shop.fashion.service.ChartService;

@Controller
public class ChartController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private ChartService chartService;

	// 회원 그래프 페이지
	@GetMapping("/admin/graph-join")
	public String joinDataChartPage(Model model, Pageable pageable) {
		// 총 가입자 수
		List<JoinCountDto> totalCount = chartService.getTotalJoinCountList();
		if (totalCount.size() != 0) {
			model.addAttribute("totalCount", totalCount.get(0));
		} else {
			model.addAttribute("totalCount", null);
		}

		// oauth 별 가입자 수
		List<OAuthCountDto> oauthCount = chartService.getOAuthJoinCountList();
		if (oauthCount.size() != 0) {
			model.addAttribute("oauthCount", oauthCount.get(0));
		} else {
			model.addAttribute("oauthCount", null);
		}

		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("MM월 dd일");
		String today = sf.format(date);
		model.addAttribute("today", today);

		Page<User> userPage = adminService.selectTodayJoinUser(pageable);
		model.addAttribute("userPage", userPage);
		return "admin/chart_user";
	}

	// 상품 그래프 페이지
	@GetMapping("/admin/graph-sales")
	public String salesChartPage(Model model, Pageable pageable) {
		// 총 판매 금액, 판매량
		List<ShoppingCountAndSumDto> totalList = chartService.getTotalSalesList();
		if(totalList != null) {
			model.addAttribute("totalList", totalList.get(0));
		}

		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("MM월 dd일");
		String today = sf.format(date);
		model.addAttribute("today", today);

		return "admin/chart_shopping";
	}
}
