package com.shop.fashion.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.shop.fashion.model.Basket;


public interface BasketRepository extends JpaRepository<Basket, Integer> {

	@Query(value = "SELECT * FROM board WHERE userid = ?1", nativeQuery = true)
	List<Basket> findByUserId(@Param(value = "id")int id);
	
}
