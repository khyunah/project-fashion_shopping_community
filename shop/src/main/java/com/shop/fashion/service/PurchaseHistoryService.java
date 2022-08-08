package com.shop.fashion.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.fashion.model.Basket;
import com.shop.fashion.model.Purchasehistory;
import com.shop.fashion.repository.PurchaseHistoryRepository;

@Service
public class PurchaseHistoryService {

	@Autowired
	PurchaseHistoryRepository purchaseHistoryRepository;
	
	@Transactional
	public void save(Purchasehistory purchasehistory) {
		purchaseHistoryRepository.save(purchasehistory);
	}
	
	@Transactional
	public List<Purchasehistory> getPurchaseHistoryGroupList(int userId) {
		return purchaseHistoryRepository.purchaseHistoryGroupList(userId);
	}
	
	@Transactional
	public List<Purchasehistory> getPurchaseHistoryList(int userId) {
		return purchaseHistoryRepository.purchaseHistoryList(userId);
	}
	
	@Transactional
	public int getPurchaseItemId(int userId) {
		return purchaseHistoryRepository.purchaseitemId(userId);
	}
//	@Transactional
//	public List<Basket> findByUserId(int userId) {
//		return purchaseHistoryRepository.findByUserId(userId);
//	}
//	
	
}
