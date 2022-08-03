var context = $("#myChart");

var chartArea = {
	labels: [],
	dataSets: [],
	render: function() {
		new Chart(context, {
			type: 'line',
			data: {
				labels: chartArea.labels,
				datasets: [{
					label: "가입자 수",
					lineTension: 0.3,
					backgroundColor: "rgba(2,117,216,0.2)",
					borderColor: "rgba(2,117,216,1)",
					pointRadius: 5,
					pointBackgroundColor: "rgba(2,117,216,1)",
					pointBorderColor: "rgba(255,255,255,0.8)",
					pointHoverRadius: 5,
					pointHoverBackgroundColor: "rgba(2,117,216,1)",
					pointHitRadius: 50,
					pointBorderWidth: 2,
					data: chartArea.dataSets,
				}],
			},
			options: {
				responsive: true,
				scales: {
					xAxes: [{
						time: {
							unit: 'date'
						},
						gridLines: {
							display: false
						},
						ticks: {
							maxTicksLimit: 7
						}
					}],
					yAxes: [{
						/*          y값에 따라 최소, 최대치 표시를 자동으로 설정하기 위해 주석처리
									  ticks: {
									  min: 0,
									  max: 40000,
									  maxTicksLimit: 5
									},*/
						gridLines: {
							color: "rgba(0, 0, 0, .125)",
						}
					}],
				},
				legend: {
					display: false
				}
			}
		});
	},
	showData: function() {
		console.log("메소드 확인");
		labels = [];
		dataSets = [];
		$.ajax({
			type: 'GET',
			url: '/admin/graph-join/test',
			contentType: 'application/json',
			//dataType 정의
			dataType: 'json'
		}).done(function(response) {
			$.each(response, function(index, obj) {
				chartArea.labels.push(obj.joinDate);
				chartArea.dataSets.push(obj.joinCount);
			});
			chartArea.render();
		}).fail(function() {
			console.log("실패");
		});
	}
};
