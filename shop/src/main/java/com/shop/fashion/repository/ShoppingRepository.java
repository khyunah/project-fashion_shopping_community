package com.shop.fashion.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.shop.fashion.model.Basket;
import com.shop.fashion.model.Item;

public interface ShoppingRepository extends JpaRepository<Item, Integer> {
	
	@Query(value = "SELECT * FROM Item WHERE gender = 'man'", nativeQuery = true)
	Page<Item> CategoryItemMans(Pageable pageable);
	
	@Query(value = "SELECT * FROM Item WHERE category =:category and gender = :gender", nativeQuery = true)
	Page<Item> CategoryItem(@Param(value = "category")String category,@Param(value="gender")String gender , Pageable pageable);
	
	@Query(value = "SELECT * FROM Basket WHERE userid = ?1", nativeQuery = true)
	List<Basket> findByUserId(@Param(value = "id")int id);

	

}
