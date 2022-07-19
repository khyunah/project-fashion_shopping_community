package com.shop.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;

import com.shop.fashion.auth.PrincipalUserDetail;
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

	// 댓글 쓰기
	@Transactional
	public Reply insertReply(int boardId, Reply reply, User user) {
		System.out.println("서비스단에  : " + boardId);
		// 댓글쓰는 중에 게시물 삭제했는지 체크 
		Board board = communityRepository.findById(boardId).orElseThrow(() -> {
			return new IllegalArgumentException("게시물이 존재하지 않아 댓글쓰기에 실패하였습니다.");
		});
		reply.setUser(user);
		reply.setBoard(board);
		System.out.println("게시물 존재하고 넘어감");
		return communityReplyRepository.save(reply);
	}
	
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
