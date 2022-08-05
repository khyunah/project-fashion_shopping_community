package com.shop.fashion.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.shop.fashion.model.Basket;
import com.shop.fashion.model.Purchasehistory;

public interface PurchaseHistoryRepository extends JpaRepository<Purchasehistory, Integer>{
	
	@Query(value = "SELECT * FROM Purchasehistory WHERE userId = ? GROUP BY tid", nativeQuery = true)
	List<Purchasehistory> purchaseHistoryGroupList(@Param("userId") int id);
	
	@Query(value = "SELECT * FROM Purchasehistory WHERE userId = ?", nativeQuery = true)
	List<Purchasehistory> purchaseHistoryList(@Param("userId") int id);

	
}
