package com.shop.fashion.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.shop.fashion.dto.RequestFileDto;
import com.shop.fashion.model.Image;
import com.shop.fashion.model.User;
import com.shop.fashion.repository.CommunityRepository;

@Service
public class CommunityService {
	
	@Value("${file.path}")
	private String uploadFolder;
	
	@Autowired
	private CommunityRepository communityRepository;
	
	@Autowired
	public void upload(RequestFileDto fileDto) {
		
		UUID uuid = UUID.randomUUID();
		String imageFileName = uuid + "_" + "story";
		String newFileName = (imageFileName.trim()).replaceAll("\\s", "");
		
		Path imageFilePath = Paths.get(uploadFolder + newFileName);
		
		try {
			Files.write(imageFilePath, fileDto.getFile().getBytes());
			
			Image imageEntity = fileDto.toEntity(newFileName);
			communityRepository.save(imageEntity);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
