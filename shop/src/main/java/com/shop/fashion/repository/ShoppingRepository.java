package com.shop.fashion.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.shop.fashion.model.Category;
import com.shop.fashion.model.Item;

public interface ShoppingRepository extends JpaRepository<Item, Integer> {
	
	@Query(value = "Select * from Item where category like '%category%'", nativeQuery = true)
	Page<Item> CategoryItem(Category category, Pageable pageable); 
	

}
