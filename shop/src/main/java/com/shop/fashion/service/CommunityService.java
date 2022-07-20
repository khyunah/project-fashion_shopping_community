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
		String imageFileName = uuid.toString() +"." + extracktExt(fileDto.getFile().getOriginalFilename());
		
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

	private String extracktExt(String originalFileName) {
		int pos = originalFileName.lastIndexOf(".");
		return originalFileName.substring(pos + 1);
	}
	
		
	
	@Transactional
	public CommunityBoard boardDetail(int id) {
		return communityRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("해당 글은 찾을 수 없습니다");
		});
	}
	
	
	@Transactional
	public void modifyBoard(int id, CommunityBoard board) { // title, content
		CommunityBoard boardEntity = communityRepository.findById(id).orElseThrow(()->{
			return new IllegalArgumentException("해당 글은 찾을 수 없습니다");
		});
		
		boardEntity.setTitle(board.getTitle());
		boardEntity.setContent(board.getContent());
		boardEntity.setUser(board.getUser());
		boardEntity.setImageUrl(board.getImageUrl());
	}
	
	
	@Transactional
	public void deleteById(int id) {
		communityRepository.deleteById(id);
	}
	
}
