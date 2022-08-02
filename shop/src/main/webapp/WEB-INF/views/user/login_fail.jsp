<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="order-complete-wrap">
	<div class="order-complete-box">
		<p class="p1">로그인 실패</p>
		<p class="p2">아이디와 비밀번호를 확인해 주세요.</p>
	</div>

	<button style="float: right; margin-right: 190px;"
		onclick="location.href='/'" class="btn btn-dark">홈으로</button>
	<button style="float: right; margin-right: 5px;"
		onclick="history.back()" class="btn btn-dark">로그인</button>
</div>
</body>
</html>