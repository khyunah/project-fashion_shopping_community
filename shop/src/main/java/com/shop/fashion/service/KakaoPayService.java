package com.shop.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
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

@Service
public class KakaoPayService {
	
	private String pageToken;
	
	public KakaoPayDto kakaoPayReady() {
		
		HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "0cc011820dd3ab78c54a4882959dd0ae");
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "gorany");
        params.add("item_name", "기면진 구나몁");
        params.add("quantity", "1");
        params.add("total_amount", "2100");
        params.add("tax_free_amount", "100");
        params.add("approval_url", "http://localhost:9090/kakaoPaySuccess");
        params.add("cancel_url", "http://localhost:9090/kakaoPayCancel");
        params.add("fail_url", "http://localhost:9090/kakaoPaySuccessFail");
 
        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<KakaoPayDto> response = restTemplate.exchange(
        		"https://kapi.kakao.com/v1/payment/ready", HttpMethod.POST, request, KakaoPayDto.class);
         
        KakaoPayDto dto = response.getBody();

//        dto.setTid(response.getBody().getTid());
        System.out.println(dto.getTid());
        pageToken = dto.getTid();
        
        return dto;
	}
	
	
	public KakaoPayApprovalDto kakaoPaySuccess(String pg_token) {
		
		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "0cc011820dd3ab78c54a4882959dd0ae");
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
		
		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();

		params.add("cid", "TC0ONETIME");
		params.add("tid", pageToken);
		params.add("partner_order_id", "1001");
		params.add("partner_user_id", "gorany");
		params.add("pg_token", pg_token);
		params.add("total_amount", "2100");
		
		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(params, headers);
		
		RestTemplate restTemplate = new RestTemplate();
		
		ResponseEntity<KakaoPayApprovalDto> response = restTemplate.exchange(
				"https://kapi.kakao.com/v1/payment/approve", HttpMethod.POST, request, KakaoPayApprovalDto.class);
	
		KakaoPayApprovalDto dto = response.getBody();
		 
		 
		 return dto;
	
	}
}
