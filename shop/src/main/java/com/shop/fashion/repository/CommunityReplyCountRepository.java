package com.shop.fashion.repository;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.qlrm.mapper.JpaResultMapper;
import org.springframework.stereotype.Repository;

import com.shop.fashion.dto.CommunityCountDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class CommunityReplyCountRepository {
	
	private final EntityManager em;
	
	// 댓글 수
	public List<CommunityCountDto> getReplyCountList(int boardId){
		List<CommunityCountDto> list = new ArrayList<>();
		
		String query = "SELECT a.boardId as id, COUNT(a.boardId) AS count "
				+ "FROM reply AS a "
				+ "WHERE boardId = " + boardId;
		
		Query nativeQuery = em.createNativeQuery(query);
		JpaResultMapper jpaResultMapper = new JpaResultMapper();
		list = jpaResultMapper.list(nativeQuery, CommunityCountDto.class);
		
		return list;
	}
	
	// 댓글수 전부 
	public List<CommunityCountDto> getTotalReplyCountList(){
		List<CommunityCountDto> list = new ArrayList<>();
		
		String query = "SELECT a.boardId AS id, COUNT(a.boardId) AS count "
				+ "FROM reply AS a "
				+ "GROUP BY boardId ";
		
		Query nativeQuery = em.createNativeQuery(query);
		JpaResultMapper jpaResultMapper = new JpaResultMapper();
		list = jpaResultMapper.list(nativeQuery, CommunityCountDto.class);
		
		return list;
	}
}
