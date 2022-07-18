package com.shop.fashion.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.fashion.dto.CommunityDto;
import com.shop.fashion.model.CommunityBoard;
import com.shop.fashion.model.User;
import com.shop.fashion.repository.CommunityRepository;

@Service
public class CommunityService {
	
	@Value("${file.path}")
	private String uploadFolder;
	
	@Autowired
	private CommunityRepository communityRepository;
	
	public List<CommunityBoard> getCommunityBoardList() {
		return communityRepository.findAll();
	}

	@Transactional
	public void upload(CommunityDto fileDto, User user) {
		
		UUID uuid = UUID.randomUUID();
		String imageFileName = uuid + "_" + "community.png";
		String newFileName = (imageFileName.trim()).replaceAll("\\s", "");
		
		Path imageFilePath = Paths.get(uploadFolder + newFileName);
		
		try {
			Files.write(imageFilePath, fileDto.getFile().getBytes());
			
			CommunityBoard communityBoardEntity = fileDto.toEntity(newFileName, user);
			communityRepository.save(communityBoardEntity);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
