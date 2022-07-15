package com.shop.fashion.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.shop.fashion.dto.RequestItemDto;
import com.shop.fashion.dto.ResponseDto;
import com.shop.fashion.model.Category;
import com.shop.fashion.model.Gender;
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
	
	@PostMapping("/test/api/search/{gender}/{category}")
	public ResponseDto<Page<Item>> searchMansShirts(
			@RequestBody RequestItemDto itemDto, @PageableDefault(page = 0, direction = Direction.DESC, size = 5) Pageable pageable) {
		Page<Item> page = shoppingService.searchItemCategory(itemDto.getCategory(), itemDto.getGender(), pageable);
		return new ResponseDto<Page<Item>>(HttpStatus.OK.value(), page);
	}
	
}
		