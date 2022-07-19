package com.shop.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.fashion.model.Board;
import com.shop.fashion.model.CommunityLike;
import com.shop.fashion.model.Reply;
import com.shop.fashion.model.User;
import com.shop.fashion.repository.CommunityLikeRepository;
import com.shop.fashion.repository.CommunityReplyRepository;
import com.shop.fashion.repository.CommunityRepository;

@Service
public class CommunityService {

	@Autowired
	private CommunityReplyRepository communityReplyRepository;
	@Autowired
	private CommunityRepository communityRepository;
	@Autowired
	private CommunityLikeRepository communityLikeRepository;
	
//	@Transactional
//	public Reply insertReply(User user, int boardId, String title) {
//		
//	}
	
	// 좋아요 
	@Transactional
	public CommunityLike checkLike(int communityBoardId, int userId) {
		CommunityLike like =  communityLikeRepository.findByBoardIdAndUserId(communityBoardId, userId).orElseGet(() -> {
			return new CommunityLike();
		});
		
		// 좋아요를 취소하는 상황
		if(like.getIsLike() == 1) {
			deleteLike(like.getId());
			return null;
		// 좋아요를 누르는 상황
		} else {
			like.setBoardId(communityBoardId);
			like.setUserId(userId);
			like.setIsLike(1);
			communityLikeRepository.save(like);
			return like;
		}
	}
	
	@Transactional
	public void deleteLike(int likeId) {
		communityLikeRepository.deleteById(likeId);
	}

}
