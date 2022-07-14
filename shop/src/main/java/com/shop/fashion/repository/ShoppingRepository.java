package com.shop.fashion.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.shop.fashion.model.Category;
import com.shop.fashion.model.Item;

public interface ShoppingRepository extends JpaRepository<Item, Integer> {
	
//	@Query(value = "Select * from Item where category like '%category%'", nativeQuery = true)
//	Page<Item> CategoryItem(Category category, Pageable pageable); 
	
	@Query(value = "SELECT * FROM Item WHERE category ='shirts' and gender = 'man'", nativeQuery = true)
	Page<Item> CategoryItemManShirts(Pageable pageable);
	
	@Query(value = "SELECT * FROM Item WHERE category ='pants' and gender = 'man'", nativeQuery = true)
	Page<Item> CategoryItemManPants(Pageable pageable); 

	@Query(value = "SELECT * FROM Item WHERE category ='shirts' and gender = 'woman'", nativeQuery = true)
	Page<Item> CategoryItemWomanShirts(Pageable pageable); 
	
	@Query(value = "SELECT * FROM Item WHERE category ='pants' and gender = 'woman'", nativeQuery = true)
	Page<Item> CategoryItemWomanPants(Pageable pageable); 
	
	@Query(value = "SELECT * FROM Item WHERE category ='shirts'", nativeQuery = true)
	Page<Item> CategoryItemAce(Pageable pageable); 
	

	

}
