<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<div class="container">
	<input type="hidden" id="principal--id" value="${item.id}">

	
	<c:if test="${principal.user.role eq USER}">
		<a href="/item/${item.id}/update_form" class="btn btn-warning">수정</a>
		<button class="btn btn-danger" id="btn-delete">삭제</button>	
	</c:if>
	<br/><br/>
	<br/><br/>
	<input type="hidden" id="itemname" value="${item.name}">
	<input type="hidden" id="itemgender" value="${item.gender}">
	<div class="form-group m-2 inline row">
		<div style="width: 420px;">
			<img style="width: 420px; height: 580px;" src="${item.imageurl}" alt=""/>
		</div>
		<div style="width: 420px; margin-left: 120px; margin-bottom: 20px;">
			<h2 style="font-size: 38px; font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold;">${item.name}</h2>
			<br/>
			<h2 style="font-size: 38px; font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold;"><span style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold;">판매가</span>&nbsp;&nbsp;${item.price}원</h2>
			<br/>
			<h2 style="font-size: 38px; font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold;"><span style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold;">Size :</span>&nbsp;&nbsp;${item.size}</h2>
			<br/>
			<input type="hidden" id=userid value="${principal.user.id}"></input>
			<button type="button" id="inputCart" value="${item.id}" class="btn text-white" style="background-color: #453675;">장바구니에 넣기</button>
			<button class="btn text-white" onclick="history.back();" style="background-color: #453675;">뒤로 가기</button>
		</div>	
	</div>
	<hr/>
	<div class="form-group m-2">
	<button type="button" class="btn text-white" style="background-color: #453675;">상품상세</button>
	<img alt="" src="">
	</div>
	<br/>
	<h4>${item.content}</h4>
	<br/><br/>
	<hr/>
	<br/>

<br/>
	

<script src="/js/item.js"></script>
<script src="/js/basket.js"></script>