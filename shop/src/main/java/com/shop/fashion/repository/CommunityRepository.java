package com.shop.fashion.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shop.fashion.model.CommunityBoard;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.shop.fashion.model.CommunityBoard;

public interface CommunityRepository extends JpaRepository<CommunityBoard, Integer>{

	
}
