package com.shop.fashion.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.shop.fashion.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	// 회원가입시 아이디 중복체크
	Optional<User> findByUsername(String username);

	@Query(value = "SELECT * FROM user WHERE username LIKE %:username%", nativeQuery = true)
	User mSearchUserName(@Param("username") String username);

}
