var salesWeek = {
	labels: [],
	dataSets: [],

	weekData: function() {
		$.ajax({
			type: 'GET',
			url: '/admin/graph/sales-result/week',
			contentType: 'application/json',
			dataType: 'json'
		}).done(function(response) {
			$.each(response, function(index, obj) {
				salesWeek.labels.push(obj.salesDate);
				salesWeek.dataSets.push(obj.totalIncome);
				countSets.push(obj.totalCount);
			});
			checkData();
			salesWeek.setDataToInput();
			renderLine('myChart', dateRange, '판매 금액', resultData, 'rgba(255, 0, 0, 0.65)');
			randerBar('second-chart', dateRange, '판매 수량', countList, weekBackColor, weekBorderColor);
		}).fail(function() {
			console.log("실패");
		});
	}, 
	
	setDataToInput: function (){
		// 오늘 판매금액, 판매량
		$("#today-income").text(resultData[6]);
		$("#today-count").text(countList[6]);
	
		// 금주 판매금액, 판매량
		var weekIncome = 0;
		$.each(salesWeek.dataSets, function(index, count) {
			weekIncome += count;
		});
		var weekCount = 0;
		$.each(countSets, function(index, income){
			weekCount += income;
		});
		
		$("#week-income").text(weekIncome);
		$("#week-count").text(weekCount);
	}, 

};

// 화면에 뿌려줄 날짜 
var dateRange = [];
// 0값을 넣어주기 위한 비교 날짜 리스트 
var checkDate = [];
// 연산을 통한 결과 금액 리스트 
var resultData = [];

// 통신을 통해 얻어온 countList
var countSets = [];
// 날짜별로 정리한 countList 
var countList = [];

function checkData() {

	for (var i = 6; i >= 0; i--) {
		dateRange.push(moment().subtract(i, 'd').format("MM-DD"));
		checkDate.push(moment().subtract(i, 'd').format("YYYY-MM-DD"));
	}

	var index = 0;
	for (var i = 0; i < checkDate.length; i++) {

		if (salesWeek.labels[index] == checkDate[i]) {
			resultData.push(salesWeek.dataSets[index]);
			countList.push(countSets[index]);
			index++;
		} else {
			resultData.push(0);
			countList.push(0);
		}
	}
}

var salesItem = {
	labels: [],
	dataSets: [],

	weekData: function() {
		$.ajax({
			type: 'GET',
			url: '/admin/graph/sales-result/item',
			contentType: 'application/json',
			dataType: 'json'
		}).done(function(response) {
			$.each(response, function(index, obj) {
				salesItem.labels.push(obj.name);
				salesItem.dataSets.push(obj.totalIncome);
				countSets.push(obj.totalCount);
			});
			salesItem.setDataToInput();
			randerBar('chart-4', salesItem.labels, '판매 금액', salesItem.dataSets, topBackColor, topBorderColor);
			randerBar('chart-5', salesItem.labels, '판매 수량', countSets, topBackColor, topBorderColor);
		}).fail(function() {
			console.log("실패");
		});
	}, 
	
	setDataToInput: function (){
		$.each(salesItem.labels, function(index, name){
			$(".chart-top5-item").append(
				`<tr class="chart-top5-item-row-${index + 1}">
			        <td>${index + 1}</td>
			        <td>${name}</td>
			      </tr>`
			);
		});
		$.each(salesItem.dataSets, function(index, income){
			$(`.chart-top5-item-row-${index + 1}`).append(
				`<td>${income}</td>`
			);
		});
		$.each(countSets, function(index, count){
			$(`.chart-top5-item-row-${index + 1}`).append(
				`<td>${count}</td>`
			)
		});
	}
};

var top5User = {
	labels: [],
	dataSets: [],

	userData: function() {
		$.ajax({
			type: 'GET',
			url: '/admin/graph/sales-result/user',
			contentType: 'application/json',
			dataType: 'json'
		}).done(function(response) {
			$.each(response, function(index, obj) {
				top5User.labels.push(obj.name);
				top5User.dataSets.push(obj.totalIncome);
				countSets.push(obj.totalCount);
			});
			top5User.setDataToInput();
			randerBar('chart-6', top5User.labels, '구매 금액', top5User.dataSets, top5UserBackColor, top5UserBorderColor);
			randerBar('chart-7', top5User.labels, '구매 수량', countSets, top5UserBackColor, top5UserBorderColor);
		}).fail(function() {
			console.log("실패");
		});
	}, 
	
	setDataToInput: function (){
		$.each(top5User.labels, function(index, name){
			$(".chart-top5-user").append(
				`<tr class="chart-top5-user-row-${index + 1}">
			        <td>${index + 1}</td>
			        <td>${name}</td>
			      </tr>`
			);
		});
		$.each(top5User.dataSets, function(index, income){
			$(`.chart-top5-user-row-${index + 1}`).append(
				`<td>${income}</td>`
			);
		});
		$.each(countSets, function(index, count){
			$(`.chart-top5-user-row-${index + 1}`).append(
				`<td>${count}</td>`
			)
		});
	}
};

var category = {
	labels: [],
	dataSets: [],

	categoryData: function() {
		$.ajax({
			type: 'GET',
			url: '/admin/graph/sales-result/category',
			contentType: 'application/json',
			dataType: 'json'
		}).done(function(response) {
			$.each(response, function(index, obj) {
				category.labels.push(obj.name);
				category.dataSets.push(obj.totalIncome);
				countSets.push(obj.totalCount);
			});
			checkCategory();
			category.setDataToInput();
			randerBar('chart-8', category.labels, '판매 금액', category.dataSets, categoryBackColor, categoryBorderColor);
			randerBar('chart-9', category.labels, '판매 수량', countSets, categoryBackColor, categoryBorderColor);
		}).fail(function() {
			console.log("실패");
		});
	}, 
	
	setDataToInput: function (){
		$.each(category.labels, function(index, name){
			$(".chart-category").append(
				`<tr class="chart-category-row-${index + 1}">
			        <td>${index + 1}</td>
			        <td>${name}</td>
			      </tr>`
			);
		});
		$.each(category.dataSets, function(index, income){
			$(`.chart-category-row-${index + 1}`).append(
				`<td>${income}</td>`
			);
		});
		$.each(countSets, function(index, count){
			$(`.chart-category-row-${index + 1}`).append(
				`<td>${count}</td>`
			)
		});
	}
};


function checkCategory(){
	var categoryList = [
		'SHIRTS', 'PANTS', 'ACCESSORY', 'SHOES', 'SKIRT', 'ONEPIECE', 'OUTER'
	];
	var checkCategory = [];
	for(var i = 0; i < category.labels.length; i++){
		for(var j = 0; j < categoryList.length; j++){
			if(category.labels[i] == categoryList[j]){
				// 넘어온리스트의 값이 비교리스트의 값과 일치하면 넘어가고 
				// 일치하지 않으면 
			}
		}
	}
	
	$.each(categoryList, function(index, category){
		category.labels.push(category);
		category.dataSets.push(0);
		countSets.push(0);
	});

}


var weekBackColor = [
	'rgba(255, 99, 132, 0.7)', 
	'rgba(54, 162, 235, 0.7)',
	'rgba(255, 206, 86, 0.7)',
	'rgba(75, 192, 192, 0.7)',
	'rgba(153, 102, 255, 0.7)',
	'rgba(255, 159, 64, 0.7)'
];

var weekBorderColor = [
	'rgba(255, 99, 132, 1)', 
	'rgba(54, 162, 235, 1)',
	'rgba(255, 206, 86, 1)',
	'rgba(75, 192, 192, 1)',
	'rgba(153, 102, 255, 1)',
	'rgba(255, 159, 64, 1)'
];

var topBackColor = [
	'rgba(255, 0, 0, 0.7)',
	'rgba(255, 86, 0, 0.7)',
	'rgba(255, 190, 0, 0.7)',
];

var topBorderColor = [
	'rgba(255, 0, 0, 1)',
	'rgba(255, 86, 0, 1)',
	'rgba(255, 190, 0, 1)',
];

var top5UserBackColor = [
	'rgba(0, 185, 0, 0.7)',
	'rgba(176, 190, 0, 0.7)',
	'rgba(255, 190, 0, 0.7)'
];

var top5UserBorderColor = [
	'rgba(0, 185, 0, 1)',
	'rgba(176, 190, 0, 1)',
	'rgba(255, 190, 0, 1)'
];

var categoryBackColor = [
	'rgba(0, 0, 255, 0.8)',
	'rgba(0, 154, 255, 0.7)',
	'rgba(136, 214, 255, 0.7)'
];

var categoryBorderColor = [
	'rgba(0, 0, 255, 1)',
	'rgba(0, 154, 255, 1)',
	'rgba(136, 214, 255, 1)'
];

function randerBar(context, labels, label, data, backColor, borderColor) {
	new Chart($(`#${context}`), {
		type: 'bar',
		data: {
			labels: labels,
			datasets: [{
				label: label,
				fill: false,
				data: data,
				backgroundColor: backColor,
				borderColor: borderColor,
				borderWidth: 1
			}]
		},
		options: {
			responsive: true,
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			},
			legend: {
				display: false
			}
		}
	});
};

function renderLine(context, labels, label, data, color) {
	new Chart($(`#${context}`), {
		type: 'line',
		data: {
			labels: labels,
			datasets: [{
				label: label,
				data: data,
				fill: false,
				borderWidth: 1,
				lineTension: 0,
				backgroundColor: color,
				borderColor: color
			}],
		},
		options: {
			responsive: true,
			scales: {
				xAxes: [{
					ticks: {
						maxTicksLimit: 7,
						fontSize: 13
					}
				}],
				yAxes: [{
					ticks: {
						min: 0,
						fontSize: 13
					}
				}],
			},
			legend: {
				display: false
			}
		}
	});
}

salesWeek.weekData();
salesItem.weekData();
top5User.userData();
category.categoryData();
