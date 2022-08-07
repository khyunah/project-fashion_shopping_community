package com.shop.fashion.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.fashion.auth.PrincipalUserDetail;
import com.shop.fashion.dto.CommunityDto;
import com.shop.fashion.dto.ItemReviewDto;
import com.shop.fashion.dto.KakaoPayApprovalDto;
import com.shop.fashion.dto.KakaoPayDto;
import com.shop.fashion.dto.ResponseDto;
import com.shop.fashion.model.Basket;
import com.shop.fashion.model.Item;
import com.shop.fashion.model.ItemReview;
import com.shop.fashion.repository.ItemReviewRepository;
import com.shop.fashion.service.BasketService;
import com.shop.fashion.service.KakaoPayService;
import com.shop.fashion.service.ShoppingService;
import com.shop.fashion.service.UserService;

@Controller
public class ShoppingController {

	@Autowired
	HttpSession httpSession;
	@Autowired
	BasketService basketService;
	
	@Autowired
	UserService userService;

	@Autowired
	ShoppingService shoppingService;

	@Autowired
	KakaoPayService kakaoPayService;
	
	@Autowired
	ItemReviewRepository itemReviewRepository;

	@GetMapping({ "shop/mans_form", "/shop/search/" })
	public String mansForm(@PathParam("gender") String gender, @PathParam("category") String category, Model model,
			@PageableDefault(size = 8, sort = "id", direction = Direction.DESC) Pageable pageable) {

		Page<Item> pageItems;
		if (gender == null || category == null) {
			pageItems = shoppingService.searchMans(pageable);
		} else {
			pageItems = shoppingService.searchItemCategory(category, gender, pageable);
		}

		int nowPage = pageItems.getPageable().getPageNumber() + 1; // 현재 페이지
		int startPage = Math.max(nowPage - 2, 1); // 두 int 값 중에 큰 값 반환
		int endPage = Math.min(nowPage + 2, pageItems.getTotalPages());

		// 페이지 번호를 배열로 만들어서 던져주기
		ArrayList<Integer> pageNumbers = new ArrayList<>();
		// 주의! 마지막 번호까지 저장하기
		for (int i = startPage; i <= endPage; i++) {
			pageNumbers.add(i);
		}

		model.addAttribute("pageable", pageItems);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageNumbers", pageNumbers);
		// model.addAttribute("pageItems", ca);
		return "shopping/mans_form";
	}

	@GetMapping({ "shop/womans_form", "/shop/search" })
	public String womansForm(@PathParam("gender") String gender, @PathParam("category") String category, Model model,
			@PageableDefault(size = 8, sort = "id", direction = Direction.DESC) Pageable pageable) {

		Page<Item> pageItems;
		if (gender == null || category == null) {
			pageItems = shoppingService.searchWomans(pageable);
		} else {
			pageItems = shoppingService.searchItemCategory(category, gender, pageable);
		}

		int nowPage = pageItems.getPageable().getPageNumber() + 1; // 현재 페이지
		int startPage = Math.max(nowPage - 2, 1); // 두 int 값 중에 큰 값 반환
		int endPage = Math.min(nowPage + 2, pageItems.getTotalPages());

		// 페이지 번호를 배열로 만들어서 던져주기
		ArrayList<Integer> pageNumbers = new ArrayList<>();
		// 주의! 마지막 번호까지 저장하기
		for (int i = startPage; i <= endPage; i++) {
			pageNumbers.add(i);
		}

		model.addAttribute("pageable", pageItems);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageNumbers", pageNumbers);
		return "shopping/womans_form";
	}

	@GetMapping("/shop/save_form")
	public String saveForm() {
		return "shopping/save_form";
	}

	@GetMapping("/shop/basket_form/{id}")
	public String cartForm(@PathVariable int id, Model model) {
		List<Basket> Baskets = shoppingService.getOnUserCart(id);

		int sum = basketService.sum(id);

		model.addAttribute("Baskets", Baskets);
		model.addAttribute("sumPrince", sum);

		if (sum != 0) {
			model.addAttribute("hasItem", true);
		} else {
			model.addAttribute("hasItem", false);
		}

		return "/shopping/basket_form";
	}

	// /shopping/itemdetail_form/${item.id}
	@GetMapping("/shop/itemdetail_form/{id}")
	public String itemDetailform(@PathVariable int id, @AuthenticationPrincipal PrincipalUserDetail userDetail, Model model,
			@PageableDefault(size = 4, sort = "id", direction = Direction.DESC) Pageable pageable) {
		model.addAttribute("item", shoppingService.itemDetail(id));
		model.addAttribute("user", userService.getUser(userDetail.getUser().getId()));
		
		Page<ItemReview> pageItems;
		
		pageItems = shoppingService.findItemReviews(id, pageable);
		
		int nowPage = pageItems.getPageable().getPageNumber() + 1; // 현재 페이지
		int startPage = Math.max(nowPage - 2, 1); // 두 int 값 중에 큰 값 반환
		int endPage = Math.min(nowPage + 2, pageItems.getTotalPages());

		// 페이지 번호를 배열로 만들어서 던져주기
		ArrayList<Integer> pageNumbers = new ArrayList<>();
		// 주의! 마지막 번호까지 저장하기
		for (int i = startPage; i <= endPage; i++) {
			pageNumbers.add(i);
		}

		model.addAttribute("pageable", pageItems);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageNumbers", pageNumbers);
		return "shopping/itemdetail_form";
	}

	@GetMapping("/security/kakaoPay/callback/{id}")
	public String kakaoPayReady(@PathVariable int id) {
		System.out.println("kakaopayReady: " + id);
		KakaoPayDto dto = kakaoPayService.kakaoPayReady(id);
		httpSession.setAttribute("kakao", dto);
		return "redirect:" + dto.getNextRedirectPcUrl();
	}

	@GetMapping("/kakaoPaySuccess")
	public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, @AuthenticationPrincipal PrincipalUserDetail userDetail) {
		KakaoPayDto kakaopayDto = (KakaoPayDto) httpSession.getAttribute("kakao");
		System.out.println("kakaopaySuccess" + userDetail.getUser().getId());
		KakaoPayApprovalDto dto = kakaoPayService.kakaoPaySuccess(pg_token, userDetail.getUser().getId(),
				kakaopayDto.getTid(), userDetail.getUser().getId());
		model.addAttribute("pageTokenInfo", dto);
		
		httpSession.removeAttribute("kakao");
		
		List<Basket> baskets = basketService.getBasket(userDetail.getUser().getId());
		
		for (int i = 0; i < baskets.size(); i++) {	
			
			basketService.deleteId(baskets.get(i).getId());
		}
		
		return "shopping/payment_success";
	}

	@GetMapping("/kakaoPayCancel")
	public String kakaoPayCancel() {
		return "shopping/payment_cancel";
	}

	@GetMapping("/kakaoPayFail")
	public String kakaoPayFail() {
		return "shopping/payment_fail";
	}
	// http://locahost:9090/review/upload/3	
	// Request Param
	// ?name="홍길동"&age=100
	// Object 
	@PostMapping("/review/upload/{id}")
	public String ReviewUpload(ItemReviewDto fileDto, @AuthenticationPrincipal PrincipalUserDetail detail, @PathVariable int id) {
		
		//1. URI 정확히 타서 정확한 파라미터 값을 받는가 !!! 
		//2. form 통해서 데이터 확인 !!! 
		// ITEM 
		// Item Object 새로 Object 생성 해야 한다. !!! 
		// 새로 만들기 (fileDto, user, id(itemId) )
		
		// select id 
		// 서비스 
		// 작업에 최소 단위를 묶음으로 묶어서 하나의 서비스(기능) 
		// (이미지 업로드 기능) 
		// (테이블에 데이터를 저장 save (ImteReview !!))
		
		// 아이템 리뷰 테이블에 C (object) 
		shoppingService.writeReview(fileDto, detail.getUser(), id);
		// controller (0)
		// or 
		// JPS 페이지 반환 ()
		// json {baset64 --> 역질렬화  }
		// json {파일이름  }
		// path 
		return "redirect:/shop/itemdetail_form/"+id;
	}
	
	@PostMapping("/review/update/{id}")
	public String ReviewUpdate(@PathVariable int id, ItemReviewDto fileDto) {

		shoppingService.itemReviewUpdate(id, fileDto);
		
		ItemReview itemReview = itemReviewRepository.ItemReviewFindById(id).get(0);
		
		int itemId = itemReview.getItem().getId();
		

		return "redirect:/shop/itemdetail_form/"+itemId;
	}
	


}
