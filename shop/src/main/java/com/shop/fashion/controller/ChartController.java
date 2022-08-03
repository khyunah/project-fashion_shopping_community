package com.shop.fashion.controller;

import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartUtils;
import org.jfree.chart.JFreeChart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.PdfWriter;
import com.shop.fashion.service.ChartService;

@Controller
public class ChartController {

	@Autowired
	private ChartService chartService;

	// 그래프 페이지
	@RequestMapping("chart1.do")
	public void graphJoinPage(HttpServletResponse response) {
		try {
			JFreeChart chart = chartService.createChart();
			System.out.println("차트 만들어서 컨트롤러 시작");
			ChartUtils.writeChartAsPNG(response.getOutputStream(), chart, 900, 550, null);
			System.out.println("그림 출력. 컨트롤러 완료");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("chart2.do")
	public void graphJoinPage2(HttpServletResponse response) {
		JFreeChart chart = chartService.createChart();
		Document document = new Document();
		
		try {
			PdfWriter.getInstance(document, new FileOutputStream("d:/test.pdf"));
			document.open();
			Image png = Image.getInstance(ChartUtils.encodeAsPNG(chart.createBufferedImage(500, 500)));
			document.add(png);
			document.close();
		} catch (IOException | DocumentException e) {
			e.printStackTrace();
		}
		String message = "완료";
		System.out.println("그림 출력. 컨트롤러 완료");
	}
}
