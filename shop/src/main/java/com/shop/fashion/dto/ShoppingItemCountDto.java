package com.shop.fashion.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;

@Data
@AllArgsConstructor
@ToString
public class ShoppingItemCountDto {
	private int item_id;
	private int count;
}
