package com.shop.fashion.repository;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.qlrm.mapper.JpaResultMapper;
import org.springframework.stereotype.Repository;

import com.shop.fashion.dto.JoinDateDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class ChartJoindateRepository {

	private final EntityManager em;
	
	public List<JoinDateDto> getJoinDateDtoList(){
		List<JoinDateDto> list = new ArrayList<JoinDateDto>();
		
		String query = "SELECT DATE(a.createDate) AS joinDate,COUNT(createDate) AS joinCount "
				+ "FROM user AS a "
				+ "WHERE DAYOFYEAR(createDate) BETWEEN DAYOFYEAR(NOW()) -7 AND DAYOFYEAR(NOW()) "
				+ "GROUP BY DAYOFYEAR(createDate) "
				+ "ORDER BY joinDate ";
		
		Query nativeQuery = em.createNativeQuery(query);
		
		JpaResultMapper jpaResultMapper = new JpaResultMapper();
		
		list = jpaResultMapper.list(nativeQuery, JoinDateDto.class);
		System.out.println("레파짓토리 완료");
		System.out.println(list.get(0).getJoinDate());
		System.out.println(list.get(0).getJoinCount());
		return list;
	}
	
}
