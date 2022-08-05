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

.chart-category-container {
	display: flex;
	justify-content: flex-end;
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
	margin-right: 30px;
	min-width: 180px;
	text-align: center;
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

.chart-third-text {
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

.chart-second-result-container {
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

.second-chart-div {
	width: 300px;
}

.chart-top {
	width: 370px;
}
</style>


<div class="admin-container">
	<!-- 
쇼핑 그래프
카테고리별 판매수량, 판매금액
맨, 우먼별 판매수량, 판매금액
 -->

	<div class="container">
		<div class="chart-category-container">
			<a href="/admin/graph-join" type="button"
				class="btn btn-outline-dark">회원 통계</a> <a href="/admin/graph-sales"
				type="button" class="btn btn-outline-dark">상품 통계</a> <a href=""
				type="button" class="btn btn-outline-dark">SNS 통계</a>
		</div>

		<p class="chart-table-title">판매 통계</p>
		<div class="c-container">
			<div class="chart-container">
				<div class="chart-text-container">
					<p class="chart-today">${today}</p>

					<table class="table table-bordered table-sm">
						<thead class="chart-text">
							<tr>
								<th>기간</th>
								<th>판매 금액</th>
								<th>판매량</th>
							</tr>
						</thead>
						<tbody class="chart-text">
							<tr>
								<td>오늘</td>
								<td id="today-income"></td>
								<td id="today-count"></td>
							</tr>
							<tr>
								<td>금주</td>
								<td id="week-income"></td>
								<td id="week-count"></td>
							</tr>
							<tr>
								<td>총</td>
								<td id="total-income">${totalList.totalIncome}</td>
								<td id="total-count">${totalList.totalCount}</td>
							</tr>
						</tbody>
					</table>

				</div>

				<div class="chart-result-container" style="margin-right: 50px;">
					<p class="chart-p">금주 판매 금액</p>
					<div>
						<canvas id="myChart"></canvas>
					</div>
				</div>
				<div class="chart-second-result-container">
					<div class="second-chart-div">
						<p class="chart-p">금주 판매 수량</p>
						<canvas id="second-chart"></canvas>
					</div>
				</div>
			</div>
		</div>

		<p class="chart-table-title">금주 판매 Top 5</p>
		<div class="c-container">
			<div class="chart-container">
				<div class="chart-text-container">
					<p class="chart-today">${today}</p>

					<table class="table table-bordered table-sm">
						<thead class="chart-text">
							<tr>
								<th>순위</th>
								<th>아이템</th>
								<th>판매 금액</th>
								<th>판매량</th>
							</tr>
						</thead>
						<tbody class="chart-text chart-top5-item"></tbody>
					</table>

				</div>

				<div class="chart-top" style="margin-right: 50px;">
					<p class="chart-p">금주 Top 5 상품 판매 금액</p>
					<div>
						<canvas id="chart-4"></canvas>
					</div>
				</div>
				<div class="chart-top">
					<p class="chart-p">금주 Top 5 상품 판매 수량</p>
					<canvas id="chart-5"></canvas>
				</div>
			</div>

		</div>

		<p class="chart-table-title">이번달 구매 Top 5</p>
		<div class="c-container">
			<div class="chart-container">
				<div class="chart-text-container">
					<p class="chart-today">${today}</p>

					<table class="table table-bordered table-sm">
						<thead class="chart-text ">
							<tr>
								<th>순위</th>
								<th>회원ID</th>
								<th>판매 금액</th>
								<th>판매량</th>
							</tr>
						</thead>
						<tbody class="chart-text chart-top5-user"></tbody>
					</table>

				</div>

				<div class="chart-top" style="margin-right: 50px;">
					<p class="chart-p">이번달 구매 Top 5 고객별 구매 금액</p>
					<div>
						<canvas id="chart-6"></canvas>
					</div>
				</div>
				<div class="chart-top">
					<p class="chart-p">이번달 구매 Top 5 고객별 구매 수량</p>
					<canvas id="chart-7"></canvas>
				</div>
			</div>

		</div>
		
		<p class="chart-table-title">이번달 카테고리별 판매 현황</p>
		<div class="c-container">
			<div class="chart-container">
				<div class="chart-text-container">
					<p class="chart-today">${today}</p>

					<table class="table table-bordered table-sm">
						<thead class="chart-text">
							<tr>
								<th>순위</th>
								<th>카테고리</th>
								<th>판매 금액</th>
								<th>판매량</th>
							</tr>
						</thead>
						<tbody class="chart-text chart-category"></tbody>
					</table>

				</div>

				<div class="chart-top" style="margin-right: 50px;">
					<p class="chart-p">이번달 카테고리별 판매 금액</p>
					<div>
						<canvas id="chart-8"></canvas>
					</div>
				</div>
				<div class="chart-top">
					<p class="chart-p">이번달 카테고리별 판매 수량</p>
					<canvas id="chart-9"></canvas>
				</div>
			</div>

		</div>
		
	</div>
</div>
<script src="/js/chart_shopping.js"></script>

</body>
</html>
