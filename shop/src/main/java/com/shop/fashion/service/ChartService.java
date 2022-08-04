package com.shop.fashion.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.fashion.dto.JoinCountDto;
import com.shop.fashion.dto.OAuthCountDto;
import com.shop.fashion.dto.ShoppingCountAndSumDto;
import com.shop.fashion.repository.ShoppingChartRepository;
import com.shop.fashion.repository.UserChartRepository;

@Service
public class ChartService {
	
	@Autowired
	private UserChartRepository userChartRepository;
	@Autowired
	private ShoppingChartRepository shoppingChartRepository;
	
	// 일자별 가입자수 
	public List<JoinCountDto> getWeekJoinCountList(){
		return userChartRepository.getWeekJoinCountList();
	}
	
	// 이번주 가입자 수
	public List<JoinCountDto> getWeekTotalJoinCountList(){
		return userChartRepository.getWeekTotalJoinCountList();
	}
	
	// 오늘 가입자수 
	public List<JoinCountDto> getTodayJoinCountList(){
		return userChartRepository.getTodayJoinCountList();
	}
	
	// 총 가입자수
	public List<JoinCountDto> getTotalJoinCountList(){
		return userChartRepository.getTotalJoinCountList();
	}
	
	// oauth 별 가입자 수
	public List<OAuthCountDto> getOAuthJoinCountList(){
		return userChartRepository.getOAuthJoinCountList();
	}
	
	// oauth 별 오늘 가입자 수
	public List<OAuthCountDto> getOAuthTodayJoinCountList(){
		return userChartRepository.getOAuthTodayJoinCountList();
	}
	
	// 금주 판매 금액, 판매량
	public List<ShoppingCountAndSumDto> getWeekSalesList(){
		return shoppingChartRepository.getWeekSalesList();
	}
	
	// 총 판매금액, 판매량 
	public List<ShoppingCountAndSumDto> getTotalSalesList(){
		return shoppingChartRepository.getTotalSalesList();
	}
}
