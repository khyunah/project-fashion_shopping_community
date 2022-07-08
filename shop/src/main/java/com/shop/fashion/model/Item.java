package com.shop.fashion.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Item {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(nullable = false)
	private String name;
	@Column(nullable = false)
	private int price;
	@Column(nullable = false)
	private Category category;
	@Column(nullable = false)
	private Gender gender;
	@Column(nullable = false)
	private String content;
}
