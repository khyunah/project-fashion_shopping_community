package com.shop.fashion.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.shop.fashion.dto.ResponseDto;
import com.shop.fashion.model.Item;
import com.shop.fashion.service.ShoppingService;

@RestController
public class ShoppingApiController {

	
	@Autowired
	ShoppingService shoppingService;
	
	@PostMapping("/api/item")
	public ResponseDto<Integer> save(@RequestBody Item item) {
		shoppingService.saveItem(item);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
}
