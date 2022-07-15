package com.shop.fashion.dto;

import org.springframework.web.multipart.MultipartFile;

import com.shop.fashion.model.Image;
import com.shop.fashion.model.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RequestFileDto {

	
	private MultipartFile file;
	private String uuid; 
	private String storyText; 
	
	public Image toEntity(String storyImageUrl) {
		return Image.builder()
				.imageUrl(storyImageUrl)
				.originImageTitle(file.getOriginalFilename())
				.build();
	}
}
