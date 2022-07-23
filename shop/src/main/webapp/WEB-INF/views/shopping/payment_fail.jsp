<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

	<div class = "jumbotron">
		<div class = "order-container" style="text-align: center">
			<h1 class = "order-complete display-3">주문이 실패했습니다</h1>		
		</div>
	</div>
	<div>
	
	<div class="order-complete-container" style="text-align: center">
		<h2 class="alert alert-danger">다시 시도하세요</h2>
	</div>

	
	
	<div style="text-align: center">
	<button style="margin-left: 20px;" class="btn btn-dark" onclick="history.back();">장바구니</button>	
	<button style="margin-left: 20px;" class="btn btn-dark" onclick="location.href='/'">홈으로</button>	
	</div>
	</div>
<script type="text/javascript" src="/js/kakao_pay.js"></script>	
</body>
</html>