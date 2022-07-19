package com.shop.fashion.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shop.fashion.model.Board;

public interface CommunityRepository extends JpaRepository<Board, Integer> {

}
