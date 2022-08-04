package com.shop.fashion.repository;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.qlrm.mapper.JpaResultMapper;
import org.springframework.stereotype.Repository;

import com.shop.fashion.dto.ShoppingCountAndSumDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class ShoppingChartRepository {

	private final EntityManager em;
	
	// 이번주 일자별 판매금액, 판매량
	public List<ShoppingCountAndSumDto> getWeekSalesList(){
		List<ShoppingCountAndSumDto> list = new ArrayList<ShoppingCountAndSumDto>();
		
		String query = "SELECT DATE(a.createDate) AS salesDate, SUM(b.price) AS totalIncome, SUM(a.count) AS totalCount "
				+ "FROM purchasehistory AS a "
				+ "INNER JOIN item AS b "
				+ "ON a.itemId = b.id "
				+ "WHERE DAYOFYEAR(a.createDate) BETWEEN DAYOFYEAR(NOW()) -6 AND DAYOFYEAR(NOW()) "
				+ "GROUP BY DATE(a.createDate) "
				+ "ORDER BY salesDate ";
		
		Query nativeQuery = em.createNativeQuery(query);
		JpaResultMapper jpaResultMapper = new JpaResultMapper();
		list = jpaResultMapper.list(nativeQuery, ShoppingCountAndSumDto.class);
		
		return list;
	}
	
	// 총 판매금액, 판매량
	public List<ShoppingCountAndSumDto> getTotalSalesList(){
		List<ShoppingCountAndSumDto> list = new ArrayList<ShoppingCountAndSumDto>();
		
		String query = "SELECT DATE(a.createDate) AS salesDate, SUM(b.price) AS totalAmount, SUM(a.count) AS totalCount "
				+ "FROM purchasehistory AS a "
				+ "INNER JOIN item AS b "
				+ "ON a.itemId = b.id ";
		
		Query nativeQuery = em.createNativeQuery(query);
		JpaResultMapper jpaResultMapper = new JpaResultMapper();
		list = jpaResultMapper.list(nativeQuery, ShoppingCountAndSumDto.class);
		
		return list;
	}
}
