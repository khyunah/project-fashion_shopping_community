package com.shop.fashion.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.fashion.dto.JoinCountDto;
import com.shop.fashion.dto.OAuthCountDto;
import com.shop.fashion.service.ChartService;

@Controller
public class ChartController {

	@Autowired
	private ChartService chartService;
	
	// 주간 일자별 가입자 수 그래프
	@GetMapping("/admin/graph/join-count/week")
	@ResponseBody
	public List<JoinCountDto> getWeekJoinCountList(){
		List<JoinCountDto> list = chartService.getWeekJoinCountList();
		return list;
	}
	
	// Oauth별 가입자 그래프
	@GetMapping("/admin/graph/join-count/oauth")
	@ResponseBody
	public List<OAuthCountDto> getOAuthJoinCountList(){
		List<OAuthCountDto> list = chartService.getOAuthJoinCountList();
		return list;
	}
	
	// Oauth별 오늘 가입자 그래프
	@GetMapping("/admin/graph/join-count/oauth-today")
	@ResponseBody
	public List<OAuthCountDto> getOAuthTodayJoinCountList(){
		List<OAuthCountDto> list = chartService.getOAuthTodayJoinCountList();
		return list;
	}

}
