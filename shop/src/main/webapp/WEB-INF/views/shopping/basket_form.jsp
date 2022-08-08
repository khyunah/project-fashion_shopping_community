<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="left">
<br/>
   <input type="hidden" id="item1" value="${hasItem}">
  <table style="table-layout: fixed; width: 100%"> 
     <tr>
  	  <th></th>		
      <th style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold; color: #453675; margin-right: 20px;">NAME</th>
      <th style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold; color: #453675; margin-right: 20px;">SIZE</th>
      <th style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold; color: #453675; margin-right: 20px;">Count</th>
      <th style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold; color: #453675; margin-right: 20px;">Price</th>
      <th ></th>
     </tr>
   <c:forEach var="Basket" items="${Baskets}"> 
   <input type="hidden" value="${Basket.id}" id="id">
	<c:choose>
		<c:when test="${checkAmount }">
			
		</c:when>
	</c:choose>
  	 <tr id="tr">
      <td><img src="${Basket.item.imageurl}" class="img-fluid" alt="..." style="border-radius: 15px; margin-bottom: 10px;"></td>
      <td style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold; color: #453675;">${Basket.item.name}</td>
      <td style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold; color: #453675;">${Basket.item.size}</td>
      <td style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold; color: #453675;">${Basket.count}</td>
      <td style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold; color: #453675;">$${Basket.item.price}</td>
      <td><button class="btn" id="btn-basket-delete" type="submit" onclick="basketItemDelete(${Basket.id},${principal.user.id})" style="border-radius: 15px;font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold; background-color: #453675; color: white; margin-right: 20px;">취소</button></td>
     </tr>
   </c:forEach>
  </table>
  </div>
  
 <div class="right">
	<button class="btn btn-dark" onclick="location.href='/security/kakaoPay/callback/${principal.user.id}'" type="submit" style="width: 250px; border-radius: 20px; font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold; background-color: #453675; color: white; margin-right: 20px;"> 결제<div id='sum'>$${sumPrince}</div></button>
	 <c:forEach var="Basket" items="${Baskets}"> 
		 <hr/>
		 <div style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold; color: #453675;">name: ${Basket.item.name}</div>
		 <div style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold; color: #453675;">size: ${Basket.item.size}</div>
		 <div style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold; color: #453675;">count: ${Basket.count}</div>
		 <div style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold; color: #453675;">price: $${Basket.item.price}</div>
	 </c:forEach>
	<hr/>
</div>
<br/>	
<c:choose>
<c:when test="${principal.user.role eq 'USER'}">

</c:when>
</c:choose>
<hr/>

<script src="/js/basket.js"></script>