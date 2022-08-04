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
			randerBar('second-chart', dateRange, '판매 수량', countList);
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

	// 날짜 x축 
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
			randerBar('chart-4', salesItem.labels, '판매 금액', salesItem.dataSets);
			randerBar('chart-5', salesItem.labels, '판매 수량', countSets);
		}).fail(function() {
			console.log("실패");
		});
	}, 
	
	setDataToInput: function (){
		
	}

};

function randerBar(context, labels, label, data) {
	new Chart($(`#${context}`), {
		type: 'bar',
		data: {
			labels: labels,
			datasets: [{
				label: label,
				fill: false,
				data: data,
				backgroundColor: [
					'rgba(255, 99, 132, 0.2)', 
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(255, 159, 64, 0.2)'
					],
				borderColor: [
					'rgba(255, 99, 132, 1)', 
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)' 
					],
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

