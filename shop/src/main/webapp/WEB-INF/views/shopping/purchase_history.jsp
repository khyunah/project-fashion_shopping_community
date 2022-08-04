<%@page import="java.text.NumberFormat"%>
<%@page import="org.springframework.security.core.userdetails.UserDetails"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.shop.fashion.model.Purchasehistory"%>
<%@page import="java.sql.Date"%>
<%@page import="com.shop.fashion.dto.KakaoPayApprovalDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>


	<div class="receipt-container">
			<div class="order-complete-row order-complete-row1">
					<h3>주문내역</h3>
			
	
			
			
	<table>
		<thead class="tbl-head">
			<tr>
				<th>상품명</th>
				<th>주문번호</th>
				<th>주문일</th>
				<th>구매가</th>
				<th>주소</th>
			</tr>
		</thead>
		<!-- 
		<c:out value="${purchaseHistoryList}"></c:out>
		 -->
				
		<tbody>
		<c:forEach items="${purchaseHistoryList}" var="purchaseHistory">
		
			<tr>
				<td>${purchaseHistory.itemName}<br/><a href="#">더보기...</a></td>
				<td>${purchaseHistory.tid}</td>
				<td>${purchaseHistory.createdAt}</td>
				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${purchaseHistory.total}"/>원</td>
				<td>${principal.user.address}</td>
			</tr>
		</c:forEach>
		</tbody>
		
	</table>

	
	</div><!-- order-complete-row1 -->		 
	</div> <!-- order-complete-wrap -->
		
</body>

</html>


	
</body>
</html>