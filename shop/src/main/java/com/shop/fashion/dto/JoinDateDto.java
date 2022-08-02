package com.shop.fashion.dto;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class JoinDateDto {
	private BigDecimal dayoOfMonth;
	private BigDecimal week;
	private BigDecimal weekDay;
	private BigDecimal count;
}
