package com.shop.fashion.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shop.fashion.model.Image;

public interface CommunityRepository extends JpaRepository<Image, Integer>{

}
