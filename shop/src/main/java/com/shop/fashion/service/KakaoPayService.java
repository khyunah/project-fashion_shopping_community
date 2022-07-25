package com.shop.fashion.service;

import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.shop.fashion.dto.KakaoPayApprovalDto;
import com.shop.fashion.dto.KakaoPayDto;
import com.shop.fashion.model.Basket;
import com.shop.fashion.repository.BasketRepository;

@Service
public class KakaoPayService {
	
	@Value("${seller.key}")
	private String sellerName;
	
	@Autowired
	BasketRepository basketRepository;
	
	public KakaoPayDto kakaoPayReady(int basketid) {
		Basket basket = basketRepository.findById(basketid).orElseThrow(() ->{
			return new NoSuchElementException("없음");
		});
		
		
		HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "0cc011820dd3ab78c54a4882959dd0ae");
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", basket.getUser().getName());
        params.add("partner_user_id", sellerName);
        params.add("item_name", basket.getItem().getName());
        params.add("quantity", String.valueOf(basket.getCount()));
        params.add("total_amount", String.valueOf((basket.getCount() * basket.getItem().getPrice())));
        params.add("tax_free_amount", "100");
        params.add("approval_url", "http://localhost:9090/kakaoPaySuccess");
        params.add("cancel_url", "http://localhost:9090/kakaoPayCancel");
        params.add("fail_url", "http://localhost:9090/kakaoPayFail");
 
        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<KakaoPayDto> response = restTemplate.exchange(
        		"https://kapi.kakao.com/v1/payment/ready", HttpMethod.POST, request, KakaoPayDto.class);
         
        KakaoPayDto dto = response.getBody();   
        dto.setBasketid(basketid);
        return dto;
	}
	
	
	public KakaoPayApprovalDto kakaoPaySuccess(String pg_token, int basketId) {
		Basket basket = basketRepository.findById(basketId).orElseThrow(() -> {
			return new NoSuchElementException("없음");
		});
		
		
		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "0cc011820dd3ab78c54a4882959dd0ae");
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
		
		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();

		params.add("cid", "TC0ONETIME");
		params.add("tid", pg_token);
		params.add("partner_order_id", basket.getUser().getName());
		params.add("partner_user_id", sellerName);
		params.add("pg_token", pg_token);
		params.add("total_amount", String.valueOf((basket.getCount() * basket.getItem().getPrice())));
		
		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(params, headers);
		
		RestTemplate restTemplate = new RestTemplate();
		
		ResponseEntity<KakaoPayApprovalDto> response = restTemplate.exchange(
				"https://kapi.kakao.com/v1/payment/approve", HttpMethod.POST, request, KakaoPayApprovalDto.class);
	
		KakaoPayApprovalDto dto = response.getBody();
		 
		 
		 return dto;
	
	}
}
