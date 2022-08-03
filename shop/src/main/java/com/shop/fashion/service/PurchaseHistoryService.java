package com.shop.fashion.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<Purchasehistory> getPurchaseHistoryList(int userId) {
		return purchaseHistoryRepository.purchaseHistory(userId);
	}
	
	
}