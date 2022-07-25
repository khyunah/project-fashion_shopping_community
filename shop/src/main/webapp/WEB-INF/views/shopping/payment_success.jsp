<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

	<!-- 
    <div class="pay-form-header"
        style="height: 200px; line-height: 200px; text-align: center; background-color: rgb(0, 0, 0); color: white;">
        <h3 style="display: block; width: 100%; font-size: 25px;">
            주문해 주셔서 감사합니다.
        </h3>
    </div>


    <div class="pay-form-body"
        style="width: 800px; height: 400px; background-color: antiquewhite; position: absolute; top: 30%; left: 50%; transform: translateX(-50%);">
        <h4>
            주문정보
        </h4>


    </div>
	 -->


<div class = "jumbotron">
		<div class = "order-container" style="text-align: center">
			<h1 class = "order-complete display-3">주문 완료</h1>		
		</div>
	</div>
	<div>
	
	<div class="order-complete-container" style="text-align: center">
		<h2 class="alert alert-danger">주문해 주셔서 감사합니다.</h2>
	</div>

	<div class="order-complete-container alert alert-info" style="text-align: center">
		<div style="text-align: center" >
		<p>결제일시: ${pageTokenInfo.approvedAt}</p>
		<p>주문번호: ${pageTokenInfo.partnerOrderId}</p>
		<p>상품명: ${pageTokenInfo.itemName}</p>
		<p>상품수량: ${pageTokenInfo.quantity}</p>
		<p>결제 금액: ${pageTokenInfo.amount.total}</p>
		<p>결제 방법 : ${pageTokenInfo.paymentMethodType}</p>	
		</div>
	</div>	
	
	<div style="text-align: center">
	<button style="margin-left: 20px;" class="btn btn-dark" onclick="location.href='/'">홈으로</button>	
	</div>
	</div>

</body>

</html>



	
<script type="text/javascript" src="/js/kakao_pay.js"></script>	
</body>
</html>