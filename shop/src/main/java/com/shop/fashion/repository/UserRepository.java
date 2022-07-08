package com.shop.fashion.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shop.fashion.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	// 회원가입시 아이디 중복체크
	Optional<User> findByUserId(String userId);
}
