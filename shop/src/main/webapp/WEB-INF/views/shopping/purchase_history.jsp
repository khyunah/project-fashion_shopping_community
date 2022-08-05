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

	<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">상품 상세 보기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <table>
		<thead class="tbl-head">
			<tr> 
				<th>상품명</th>
			</tr>
		</thead>
		
		<tbody>
		<c:forEach items="${purchaseHistoryList}" var="purchaseHistory">
			<tr>
				<td>${purchaseHistory.itemName}</td>
			</tr>
		</c:forEach>
		</tbody>
		
		</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


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
				<th>상품 상세보기</th>
			</tr>
		</thead>
		
		 <c:out value="${purchaseHistoryList}"/>
				
		<tbody>
		<c:forEach items="${purchaseHistoryGroupList}" var="purchaseHistory">
			<tr>
				<td>${purchaseHistory.itemName}</td>
				<td>${purchaseHistory.tid}</td>
				<td>${purchaseHistory.createdAt}</td>
				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${purchaseHistory.total}"/>원</td>
				<td>${purchaseHistory.user.address}</td>
				<td><a href="/user" role="button"  class="btn text-white" style="background-color: #453675;" data-bs-toggle="modal" data-bs-target="#exampleModal">
					  상세보기
					</a>
				</td>
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