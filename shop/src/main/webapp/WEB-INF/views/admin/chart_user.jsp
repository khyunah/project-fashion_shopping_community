<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="left_nav.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
<style>
.admin-container {
	padding-top: 50px;
}
.c-container {
	display: flex;
	margin-bottom: 70px;
	width: 100%;
	padding-top: 5px;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

.chart-container {
	width: 100%;
	height: 330px;
	display: flex;
	justify-content: center;
}

.chart-text-container {
	width: 150px;
	margin-right: 30px;
}

.chart-today {
	font-size: 23px;
	font-family: 'Gowun Dodum', sans-serif;
	font-weight: bold;
}

.chart-text {
	font-size: 16px;
	font-family: 'Gowun Dodum', sans-serif;
	font-weight: bold;
}

.chart-oauth-text {
	font-size: 16px;
	font-family: 'Gowun Dodum', sans-serif;
	font-weight: bold;
	text-align: center;
	margin-top: 15px;
	margin-bottom: 10px;
}

.chart-result-container {
	width: 500px;
}

.chart-oauth-result-container {
	width: 300px;
}

.chart-p {
	text-align: center;
	margin-bottom: 20px;
	font-family: 'Gowun Dodum', sans-serif;
	font-weight: bold;
	font-size: 18px;
}

.chart-table-title {
	margin-bottom: 20px;
	font-family: 'Gowun Dodum', sans-serif;
	font-weight: bold;
	font-size: 25px;
}

.oauth-today-chart-div {
	width: 250px;
}

.oauth-canvas-div {
	width: 200px;
}

</style>

<div class="admin-container">

	<div class="container">

		<p class="chart-table-title">회원 가입자 수 통계</p>
		<div class="c-container">
			<div class="chart-container">
				<div class="chart-text-container">
					<p class="chart-today">${today}</p>
					<c:choose>
						<c:when test="${todayCount == null}">
							<p class="chart-text">오늘 가입자 수 &emsp; 0</p>
						</c:when>
						<c:otherwise>
							<p class="chart-text">오늘 가입자 수 &emsp; ${todayCount.joinCount}</p>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${weekCount == null}">
							<p class="chart-text">금주 가입자 수 &emsp; 0</p>
						</c:when>
						<c:otherwise>
							<p class="chart-text">금주 가입자 수 &emsp; ${weekCount.joinCount}</p>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${totalCount == null}">
							<p class="chart-text">총 가입자 수 &emsp; 0</p>
						</c:when>
						<c:otherwise>
							<p class="chart-text">총 가입자 수 &emsp; ${totalCount.joinCount}</p>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="chart-result-container" style="margin-right: 50px;">
					<p class="chart-p">금주 일자별 가입자 수</p>
					<div>
						<canvas id="myChart"></canvas>
					</div>
				</div>
				<div class="chart-oauth-result-container">
					<div class="oauth-today-chart-div">
					<p class="chart-p">OAuth별 오늘 가입자</p>
						<canvas id="oauth-today-chart"></canvas>
					</div>
					<div class="oauth-canvas-div">
						<p class="chart-oauth-text">OAuth별 총 가입자</p>
						<canvas id="oauth-chart"></canvas>
					</div>
				</div>

			</div>

		</div>
		
		<p class="chart-table-title">오늘 가입한 회원</p>
		<div class="setting-user-btn-box" style="display: flex; justify-content: flex-end; margin-bottom: 10px;">
			<a href="/admin/user/select?keyword=&column=" class="btn btn-dark">전체조회</a>
			<button type="button" class="btn btn-success"
				onclick="admin.userChangeRole()">권한설정</button>
			<button type="button" class="btn btn-danger"
				onclick="admin.userDelete()">삭제</button>
		</div>
		
		<table class="table table-bordered table-hover">
			<%@ include file="admin_user_list.jsp"%>
		</table>

	</div>
</div>
<script src="/js/chart.js"></script>
<script>
function clickList(target) {
	let list = target.parentNode;
	let trs = list.getElementsByTagName("tr");

	// 선택안된 
	var backColor = "white";
	var textColor = "black";
	// 선택 된
	var orgBColor = "#cbcbcb";
	var orgTColor = "black";

	let th_value = [];

	for (var i = 0; i < trs.length; i++) {
		if (trs[i] != target) {
			trs[i].style.backgroundColor = backColor;
			trs[i].style.color = textColor;
		} else {
			trs[i].style.backgroundColor = orgBColor;
			trs[i].style.color = orgTColor;
			var td = trs[i].getElementsByTagName("td");
			for (let j = 0; j < td.length; j++) {
				th_value[j] = td[0].innerText;
			}
		}
	}
	var id = th_value[0];
	$("#admin-object-id").text(id);
}
</script>

</body>
</html>