package com.shop.fashion.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class Item {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(nullable = false)
	private String name;
	@Column(nullable = false)
	private int price;
	@Enumerated(value = EnumType.STRING)
	private Category category;
	@Enumerated(value = EnumType.STRING)
	private Gender gender;
	@Column(nullable = false)
	private String content;
	@Column(nullable = false)
	private String imageurl;
	@Column(nullable = false)
	private String color;
	@Column(nullable = false)
	private String size;
}
