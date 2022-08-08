package com.shop.fashion.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
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
public class Purchasehistory {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String tid;
	private String paymentMethodType;
	private String itemName;
	private int total;
	private Date createdAt;
	
	@ManyToOne
	@JoinColumn(name = "userId")
	private User user;
	private String address;
	@ManyToOne
	private Item itemId;
	private int count;
}
