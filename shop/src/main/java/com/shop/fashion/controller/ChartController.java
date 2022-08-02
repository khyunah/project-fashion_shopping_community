package com.shop.fashion.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.shop.fashion.service.ChartService;

@Controller
public class ChartController {

	@Autowired
	private ChartService graphService;
	
	
}
