package com.shop.fashion.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.shop.fashion.auth.PrincipalUserDetail;
import com.shop.fashion.dto.CommunityDto;
import com.shop.fashion.model.CommunityBoard;
import com.shop.fashion.model.CommunityLike;
import com.shop.fashion.model.Item;
import com.shop.fashion.service.CommunityService;

@Controller
public class CommunityController {

	@Autowired
	private CommunityService communityService;

	@GetMapping("/")
	public String index(Model model,
			@PageableDefault(size = 2, sort = "id", direction = Direction.DESC) Pageable pageable,
			@AuthenticationPrincipal PrincipalUserDetail userDetail) {
		Page<CommunityBoard> communityBoardList = communityService.getCommunityBoardList(pageable);
		model.addAttribute("communityBoardList", communityBoardList);

		List<Item> itemList = communityService.getItemList();
		Collections.shuffle(itemList);
		model.addAttribute("itemList", itemList);

		if (userDetail != null) {
			List<CommunityLike> likeList = communityService.myLike(userDetail.getUser().getId());
			model.addAttribute("likeList", likeList);
		}

		return "index";
	}

	@GetMapping("/index/index-add")
	public String addIndex(Model model,
			@PageableDefault(size = 2, sort = "id", direction = Direction.DESC) Pageable pageable,
			@AuthenticationPrincipal PrincipalUserDetail userDetail) {
		Page<CommunityBoard> communityBoardList = communityService.getCommunityBoardList(pageable);
		model.addAttribute("communityBoardList", communityBoardList);

		if (userDetail != null) {
			List<CommunityLike> likeList = communityService.myLike(userDetail.getUser().getId());
			model.addAttribute("likeList", likeList);
		}
		return "community/add_community_index";
	}

	@GetMapping("/board/write")
	public String write() {
		return "community/write_form";
	}

	@PostMapping("/board/upload")
	public String storyUpload(CommunityDto fileDto, @AuthenticationPrincipal PrincipalUserDetail detail) {
		communityService.upload(fileDto, detail.getUser());
		return "redirect:/";
	}

	// ???????????? ??????
	@GetMapping("/board/{id}/update_form")
	public String updateForm(@PathVariable int id, Model model) {
		model.addAttribute("boardList", communityService.boardDetail(id));
		return "community/update_form";
	}

	// ????????????
	@PostMapping("/board/{id}/update")
	public String updateForm(@PathVariable int id, CommunityDto dto) {
		communityService.boardUpdate(id, dto);
		return "redirect:/community/" + id;
	}

	// ???????????? ????????????
	@GetMapping("/community/{boardId}")
	public String communityDetail(@PathVariable int boardId, Model model,
			@AuthenticationPrincipal PrincipalUserDetail userDetail) {
		CommunityBoard board = communityService.detailCommunityBoard(boardId);
		model.addAttribute("communityBoard", board);

		CommunityLike checkLike = communityService.isLike(boardId, userDetail.getUser().getId());
		model.addAttribute("like", checkLike);
		return "community/community_detail";
	}

	// ?????? ?????? ?????? ????????? ??????
	@GetMapping("/community/social-main")
	public String communityHome(@PageableDefault(size = 3, direction = Direction.DESC, sort = "id") Pageable pageable,
			Model model, @AuthenticationPrincipal PrincipalUserDetail userDetail) {
		Page<CommunityBoard> communityBoardList = communityService.getCommunityBoardList(pageable);
		model.addAttribute("communityBoardList", communityBoardList);

		List<CommunityLike> likeList = communityService.myLike(userDetail.getUser().getId());
		model.addAttribute("likeList", likeList);
		return "community/community_social";
	}

	// ?????? ?????? ???????????? ????????? ??????
	@GetMapping("/community/social-add")
	public String addCommunityBoard(
			@PageableDefault(size = 3, direction = Direction.DESC, sort = "id") Pageable pageable, Model model,
			@AuthenticationPrincipal PrincipalUserDetail userDetail) {
		Page<CommunityBoard> communityBoardList = communityService.getCommunityBoardList(pageable);
		model.addAttribute("communityBoardList", communityBoardList);

		List<CommunityLike> likeList = communityService.myLike(userDetail.getUser().getId());
		model.addAttribute("likeList", likeList);
		return "community/add_community_board";
	}

	// ?????? ?????? ?????????
	@GetMapping("/community/my-page")
	public String myCommunityPage(@PageableDefault(size = 3, direction = Direction.DESC, sort = "id") Pageable pageable,
			Model model, @AuthenticationPrincipal PrincipalUserDetail userDetail) {
		Page<CommunityBoard> myCommu = communityService.myCommunity(userDetail.getUser().getId(), pageable);
		model.addAttribute("communityBoardList", myCommu);

		List<CommunityLike> likeList = communityService.myLike(userDetail.getUser().getId());
		model.addAttribute("likeList", likeList);
		return "community/community_social";
	}

}
