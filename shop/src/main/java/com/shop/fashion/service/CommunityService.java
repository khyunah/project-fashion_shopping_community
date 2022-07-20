package com.shop.fashion.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.fashion.model.CommunityBoard;
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
	
	// 메인 화면 페이저블
	@Transactional
	public Page<CommunityBoard> getCommunityBoardList(Pageable pageable){
		return communityRepository.findAll(pageable);
	}
	
	// 상세보기 화면 게시물
	@Transactional
	public CommunityBoard detailCommunityBoard(int id) {
		return communityRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("게시물이 존재하지 않습니다.");
		});
	}
	
	// 좋아요 화면에 랜더링 하기 위한 확인 작업 
	@Transactional
	public CommunityLike isLike(int boardId, int userId) {
		return communityLikeRepository.findByBoardIdAndUserId(boardId, userId).orElseGet(() -> {
			return new CommunityLike();
		});
	}
	
	// 소셜에 좋아요 랜더링 
	@Transactional
	public List<CommunityLike> myLike(int userId){
		return communityLikeRepository.findByUserId(userId);
	}

	// 댓글 처리하기 전에 보드가 있나 확인
	@Transactional
	public CommunityBoard checkBoard(int id) {
		return communityRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("게시물이 존재하지 않아 댓글쓰기에 실패하였습니다.");
		});
	}

	// 댓글 쓰기
	@Transactional
	public Reply insertReply(int boardId, Reply reply, User user) {
		System.out.println("서비스단에  : " + boardId);
		// 댓글쓰는 중에 게시물 삭제했는지 체크 
		CommunityBoard board = checkBoard(boardId);
		reply.setUser(user);
		reply.setBoard(board);
		System.out.println("게시물 존재하고 넘어감");
		return communityReplyRepository.save(reply);
	}
	
	// 댓글 삭제
	@Transactional
	public void deleteReply(int id) {
		communityReplyRepository.deleteById(id);
	}
	
	// 댓글 수정
	@Transactional
	public Reply updateReply(Reply reply) {
		Reply replyEntity = communityReplyRepository.findById(reply.getId()).orElseThrow(() -> {
			return new IllegalArgumentException("게시물이 존재하지 않아 댓글수정에 실패하였습니다.");
		});
		replyEntity.setContent(reply.getContent());
		return replyEntity;
	}
	
	// 좋아요 
	@Transactional
	public CommunityLike checkLike(int communityBoardId, User user) {
		CommunityBoard board = checkBoard(communityBoardId);

		CommunityLike like =  communityLikeRepository.findByBoardIdAndUserId(communityBoardId, user.getId()).orElseGet(() -> {
			return new CommunityLike();
		});
		
		// 좋아요를 취소하는 상황
		if(like.getIsLike() == 1) {
			board.setLikeCount(board.getLikeCount() - 1);
			deleteLike(like.getId());
			return null;
		// 좋아요를 누르는 상황
		} else {
			board.setLikeCount(board.getLikeCount() + 1);
			like.setBoard(board);
			like.setUser(user);
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
