var context = $("#myChart");

var chartArea = {
	labels: [],
	dataSets: [],
	render: function() {
		new Chart(context, {
			type: 'line',
			data: {
				labels: dateRange,
				datasets: [{
					label: "가입자 수",
					data: resultData,
					fill: false,
					borderWidth: 1,
					lineTension: 0,
					backgroundColor: "rgba(255, 102, 0, 0.75)",
					borderColor: "rgba(255, 102, 0, 0.65)"
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
							stepSize: 1,
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

	joinData: function() {
		$.ajax({
			type: 'GET',
			url: '/admin/graph/join-count/week',
			contentType: 'application/json',
			dataType: 'json'
		}).done(function(response) {
			$.each(response, function(index, obj) {
				chartArea.labels.push(obj.joinDate);
				chartArea.dataSets.push(obj.joinCount);
			});
			checkData();
			chartArea.render();
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

var dateRange = [];
var checkDate = [];
var resultData = [];

function checkData() {

	// 날짜 x축 
	for (var i = 6; i >= 0; i--) {
		dateRange.push(moment().subtract(i, 'd').format("MM-DD"));
		checkDate.push(moment().subtract(i, 'd').format("YYYY-MM-DD"));
	}

	var index = 0;
	for (var i = 0; i < checkDate.length; i++) {

		if (chartArea.labels[index] == checkDate[i]) {
			resultData.push(chartArea.dataSets[index]);
			index++;
		} else {
			resultData.push(0);
		}
	}
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

chartArea.joinData();
oauthArea.oauthData();
oauthTodayArea.oauthTodayData();
