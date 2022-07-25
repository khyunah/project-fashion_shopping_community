package com.shop.fashion.test;

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

import com.shop.fashion.auth.PrincipalUserDetail;
import com.shop.fashion.model.CommunityBoard;
import com.shop.fashion.model.CommunityLike;
import com.shop.fashion.model.User;
import com.shop.fashion.repository.UserRepository;
import com.shop.fashion.service.CommunityService;

@Controller
//@RestController
public class TestApiController {

	@Autowired
	UserRepository userRepository;
	@Autowired
	CommunityService communityService;

	@GetMapping("/test/commu")
	public String communityHome() {
		return "community/community_home";
	}

	// 소셜 메인 처음 랜더링 주소
	@GetMapping("/test/commu-index")
	public String communityHome(@PageableDefault(size = 3, direction = Direction.DESC, sort = "id") Pageable pageable,
			Model model, @AuthenticationPrincipal PrincipalUserDetail userDetail) {
		Page<CommunityBoard> communityBoardList = communityService.getCommunityBoardList(pageable);
		model.addAttribute("communityBoardList", communityBoardList);

		System.out.println("페이지 갯수 : " + communityBoardList.getPageable().getPageSize());

		List<CommunityLike> likeList = communityService.myLike(userDetail.getUser().getId());
		model.addAttribute("likeList", likeList);
		return "community/community_home";
	}

}
