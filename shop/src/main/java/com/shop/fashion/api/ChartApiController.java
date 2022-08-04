package com.shop.fashion.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.shop.fashion.dto.JoinCountDto;
import com.shop.fashion.dto.OAuthCountDto;
import com.shop.fashion.dto.ShoppingCountAndSumDto;
import com.shop.fashion.dto.ShoppingItemDto;
import com.shop.fashion.service.ChartService;

@RestController
public class ChartApiController {

	@Autowired
	private ChartService chartService;
	
	// 주간 일자별 가입자 수 그래프
	@GetMapping("/admin/graph/join-count/week")
	public List<JoinCountDto> getWeekJoinCountList(){
		return chartService.getWeekJoinCountList();
	}
	
	// Oauth별 가입자 그래프
	@GetMapping("/admin/graph/join-count/oauth")
	public List<OAuthCountDto> getOAuthJoinCountList(){
		return chartService.getOAuthJoinCountList();
	}
	
	// Oauth별 오늘 가입자 그래프
	@GetMapping("/admin/graph/join-count/oauth-today")
	public List<OAuthCountDto> getOAuthTodayJoinCountList(){
		return chartService.getOAuthTodayJoinCountList();
	}
	
	// 주간 일자별 판매량, 금액 그래프 
	@GetMapping("/admin/graph/sales-result/week")
	public List<ShoppingCountAndSumDto> getWeekSalesList(){
		return chartService.getWeekSalesList();
	}
	
	// 주간 아이템별 판매량, 금액 그래프
	@GetMapping("/admin/graph/sales-result/item")
	public List<ShoppingItemDto> getItemSalesList(){
		return chartService.getItemSalesList();
	}
}
