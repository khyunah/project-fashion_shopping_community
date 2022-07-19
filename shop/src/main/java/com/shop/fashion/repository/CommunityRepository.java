package com.shop.fashion.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shop.fashion.model.CommunityBoard;

public interface CommunityRepository extends JpaRepository<CommunityBoard, Integer> {

}
