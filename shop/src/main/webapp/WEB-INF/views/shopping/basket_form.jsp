<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="left">
<br/>
   <input type="hidden" id="item1" value="${hasItem}">
  <table style="table-layout: fixed; width: 100%"> 
     <tr>
  	  <th></th>		
      <th>NAME</th>
      <th>SIZE</th>
      <th>Color</th>
      <th>Count</th>
      <th>Price</th>
      <th></th>
     </tr>
   <c:forEach var="Basket" items="${Baskets}"> 
  	 <tr id="tr">
      <td><img src="${Basket.item.imageurl}" class="img-fluid rounded-start" alt="..."></td>
      <td>${Basket.item.name}</td>
      <td>${Basket.item.size}</td>
      <td>${Basket.item.color}</td>
      <td>${Basket.count}</td>
      <td>${Basket.item.price}원</td>
      <td><button class="btn btn-dark" id="btn-basket-delete" type="submit" onclick="basketItemDelete(${Basket.id},${principal.user.id})" style="border-radius: 15px;">취소</button></td>
     </tr>
   </c:forEach>
  </table>
  </div>
 <div class="right" >
	<button class="btn btn-dark" type="submit" style="width: 250px; border-radius: 20px;"> 결제<div id='sum'>${sumPrince}</div></button>
	 <c:forEach var="Basket" items="${Baskets}"> 
		 <hr/>
		 <div>name: ${Basket.item.name}</div>
		 <div>size: ${Basket.item.size}</div>
		 <div>color: ${Basket.item.color}</div>
		 <div>count: ${Basket.count}</div>
		 <div>price: ${Basket.item.price}원</div>
	 </c:forEach>
	<hr/>
</div>
<br/>	
<c:choose>
<c:when test="${principal.user.role eq 'USER'}">

</c:when>
</c:choose>
<hr/>
<img src="/image/kakao_pay.png" onclick="location.href='/security/kakaoPay/callback'">
<script src="/js/basket.js"></script>