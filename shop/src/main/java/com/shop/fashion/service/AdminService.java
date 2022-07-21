package com.shop.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.fashion.model.User;
import com.shop.fashion.repository.UserRepository;

@Service
public class AdminService {

	@Autowired
	private UserRepository userRepository;
	
	@Transactional
	public Page<User> getUserAll(Pageable pageable){
		return userRepository.findAll(pageable);
	}
}
