package com.shop.fashion.service;

import java.awt.Color;
import java.awt.Font;
import java.util.List;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.StandardChartTheme;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.fashion.dto.JoinDateDto;
import com.shop.fashion.repository.ChartJoindateRepository;

@Service
public class ChartService {
	
	@Autowired
	private ChartJoindateRepository chartJoindateRepository;
	
	public List<JoinDateDto> getJoinDateList(){
		return chartJoindateRepository.getJoinDateDtoList();
	}
	
	public JFreeChart createChart() {
		List<JoinDateDto> list = chartJoindateRepository.getJoinDateDtoList();
		System.out.println("레파짓토리 완료후 서비스 시작");
		
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		for (JoinDateDto joinDateDto : list) {
			dataset.setValue(joinDateDto.getJoinCount(), "Join count", joinDateDto.getJoinDate());
		}
		
		JFreeChart chart = null;
		String title = "JoinCount";
		
		chart = ChartFactory.createBarChart(
				title, 
				"Date", 
				"Join User Count", 
				dataset, 
				PlotOrientation.VERTICAL, 
				true, true, false);
		
		chart.getTitle().setFont(new Font("돋움", Font.BOLD, 15));
		chart.getLegend().setItemFont(new Font("돋움", Font.PLAIN, 10));
		
		Font font = new Font("돋움", Font.PLAIN, 12);
		Color color = new Color(20,20,20);
		StandardChartTheme chartTheme = (StandardChartTheme) StandardChartTheme.createJFreeTheme();
		
		chartTheme.setAxisLabelPaint(color);
		chartTheme.setLegendItemPaint(color);
		chartTheme.setItemLabelPaint(color);
		chartTheme.setSmallFont(font);
		
		chartTheme.setAxisLabelPaint(color);
		chartTheme.setLegendItemPaint(color);
		chartTheme.setItemLabelPaint(color);
		chartTheme.apply(chart);
		return chart;
	}
}
