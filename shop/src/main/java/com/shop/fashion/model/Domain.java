package com.shop.fashion.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Domain {
	

	
	private List<String> manCategory = List.of("SHIRTS","PANTS", "SHOES", "OUTER", "A");
	private List<String> womanCategory = List.of("SHIRTS","PANTS","SKIRT");
	private List<String> shirt = List.of("SHIRTS","PANTS");
	private List<String> pants = List.of("SHIRTS","PANTS");
	
	
}
