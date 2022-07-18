package com.shop.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.fashion.model.Board;
import com.shop.fashion.model.Reply;
import com.shop.fashion.model.User;
import com.shop.fashion.repository.CommunityReplyRepository;
import com.shop.fashion.repository.CommunityRepository;

@Service
public class CommunityService {

	@Autowired
	private CommunityReplyRepository communityReplyRepository;
	@Autowired
	private CommunityRepository communityRepository;
	
//	@Transactional
//	public Reply insertReply(User user, int boardId, String title) {
//		
//	}
}
