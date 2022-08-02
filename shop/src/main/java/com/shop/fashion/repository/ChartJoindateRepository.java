package com.shop.fashion.repository;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.qlrm.mapper.JpaResultMapper;
import org.springframework.stereotype.Repository;

import com.shop.fashion.dto.JoinDateDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ChartJoindateRepository {

	private EntityManager em;
	
	public List<JoinDateDto> getJoinDateDtoList(){
		List<JoinDateDto> list = new ArrayList<JoinDateDto>();
		
		String query = "SELECT DAY(createDate) AS dayOfYear, WEEK(createDate) AS week, WEEKDAY (createDate) AS weekDay,COUNT(createDate) "
				+ "FROM user "
				+ "GROUP BY DAYOFYEAR(createDate) "
				+ "ORDER BY dayofyear ";
		
		Query nativeQuery = em.createNativeQuery(query);
		
		JpaResultMapper jpaResultMapper = new JpaResultMapper();
		
		list = jpaResultMapper.list(nativeQuery, JoinDateDto.class);
		
		return list;
	}
	
}
