package com.shop.fashion.service;

import java.util.List;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
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
	
	public JFreeChart createChart() {
		List<JoinDateDto> list = chartJoindateRepository.getJoinDateDtoList();
		
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		for (JoinDateDto joinDateDto : list) {
			dataset.setValue(joinDateDto.getCount(), "가입자 수", joinDateDto.getDayoOfMonth());
		}
		
		JFreeChart chart = null;
		String title = "날짜 별 가입자 수";
		
		chart = ChartFactory.createBarChart(
				title, 
				"날짜", 
				"가입자 수", 
				dataset, 
				PlotOrientation.VERTICAL, 
				true, true, true);
		
		// 글씨체 바꾸기 부터 
		return chart;
	}
}
