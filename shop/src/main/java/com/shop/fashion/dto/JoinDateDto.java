package com.shop.fashion.dto;

import java.math.BigInteger;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;

@Data
@AllArgsConstructor
@ToString
public class JoinDateDto {
	private Date joinDate;
	private BigInteger joinCount;
}
