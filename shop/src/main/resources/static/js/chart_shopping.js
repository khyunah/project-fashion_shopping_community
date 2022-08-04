var context = $("#myChart");

var salesWeek = {
	labels: [],
	dataSets: [],
	render: function() {
		new Chart(context, {
			type: 'line',
			data: {
				labels: dateRange,
				datasets: [{
					label: "판매 금액",
					data: resultData,
					fill: false,
					borderWidth: 1,
					lineTension: 0,
					backgroundColor: "rgba(255, 0, 0, 0.75)",
					borderColor: "rgba(255, 0, 0, 0.65)"
				}],
			},
			options: {
				responsive: true,
				scales: {
					xAxes: [{
						/*
						gridLines: {
							display: false
						},*/
						ticks: {
							maxTicksLimit: 7,
							fontSize: 13
						}
					}],
					yAxes: [{
						/*
						gridLines: {
							display: false
						},*/
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
	},

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
			salesWeek.render();
		}).fail(function() {
			console.log("실패");
		});
	}

};

var oauthArea = {
	labels: [],
	dataSets: [],
	render: function() {
		new Chart($("#oauth-chart"), {
			type: 'bar',
			data: {
				labels: oauth,
				datasets: [{
					label: 'OAuth별 가입자 수',
					fill: false,
					data: oauthResultData,
					backgroundColor: [
						'rgba(0, 197, 37, 0.2)',
						'rgba(255, 206, 86, 0.2)'
						],
					borderColor: [
						'rgba(0, 197, 37, 0.75)',
						'rgba(255, 206, 86, 1)'
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
	},

	oauthData: function() {
		$.ajax({
			type: 'GET',
			url: '/admin/graph/join-count/oauth',
			contentType: 'application/json',
			dataType: 'json'
		}).done(function(response) {
			$.each(response, function(index, obj) {
				oauthArea.labels.push(obj.oauth);
				oauthArea.dataSets.push(obj.oauthCount);
			});
			checkOauth();
			oauthArea.render();
		}).fail(function() {
			console.log("실패");
		});
	}

};

var oauthTodayArea = {
	labels: [],
	dataSets: [],
	render: function() {
		new Chart($("#oauth-today-chart"), {
			type: 'bar',
			data: {
				labels: oauth,
				datasets: [{
					label: '오늘 가입자 수',
					fill: false,
					data: oauthTodayResultData,
					backgroundColor: [
						'rgba(0, 197, 37, 0.2)',
						'rgba(255, 206, 86, 0.2)'
						],
					borderColor: [
						'rgba(0, 197, 37, 0.75)',
						'rgba(255, 206, 86, 1)'
						],
					borderWidth: 1
				}]
			},
			options: {
				responsive: true,
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero: true,
							min: 0,
							stepSize: 1,
						}
					}]
				},
				legend: {
					display: false
				}
			}
		});
	},

	oauthTodayData: function() {
		$.ajax({
			type: 'GET',
			url: '/admin/graph/join-count/oauth-today',
			contentType: 'application/json',
			dataType: 'json'
		}).done(function(response) {
			$.each(response, function(index, obj) {
				oauthTodayArea.labels.push(obj.oauth);
				oauthTodayArea.dataSets.push(obj.oauthCount);
			});
			checkTodayOauth();
			oauthTodayArea.render();
		}).fail(function() {
			console.log("실패");
		});
	}

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
	setDataToInput();
}

function setDataToInput(){
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
}

var oauth = [];
var oauthResultData = [];

function checkOauth() {

	oauth = ['ORIGIN', 'KAKAO'];

	var index = 0;
	for (var i = 0; i < oauth.length; i++) {

		if (oauthArea.labels[index] == oauth[i]) {
			oauthResultData.push(oauthArea.dataSets[index]);
			index++;
		} else {
			oauthResultData.push(0);
		}
	}
}

var oauthTodayResultData = [];

function checkTodayOauth() {

	var index = 0;
	for (var i = 0; i < oauth.length; i++) {

		if (oauthTodayArea.labels[index] == oauth[i]) {
			oauthTodayResultData.push(oauthTodayArea.dataSets[index]);
			index++;
		} else {
			oauthTodayResultData.push(0);
		}
	}
}

salesWeek.weekData();
//oauthArea.oauthData();
//oauthTodayArea.oauthTodayData();
