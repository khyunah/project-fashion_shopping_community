<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<div class="container">
	<input type="hidden" id="principal--id" value="${item.id}">

	<button class="btn text-white" onclick="history.back();" style="background-color: #453675;">Back</button>
	<c:if test="${principal.user.role eq USER}">
		<a href="/item/${item.id}/update_form" class="btn btn-warning">수정</a>
		<button class="btn btn-danger" id="btn-delete">삭제</button>	
	</c:if>
	<br/><br/>
	<div>
		itemcode : <span id="item-id"><i>${item.id}</i></span><br/>
		itemcategory : <span><i>${item.category}</i></span><br/>
	</div>
	<br/><br/>
	<input type="hidden" id="itemname" value="${item.name}">
	<input type="hidden" id="itemgender" value="${item.gender}">
	<div class="form-group m-2 inline row">
		<div>
			<img style="width: 460px; height: 580px;" src="${item.imageurl}" alt=""/>
		</div>
		<div style="margin-left: 150px;">
			<hr/>
			<h2 style="font-size: 38px;">${item.name}</h2>
			<hr/>
			<h2 style="font-size: 38px;"><span style="font-size: 25px; font-weight: bold;">판매가</span>&nbsp;&nbsp;${item.price}원</h2>
			<hr/>
			<h2 style="font-size: 38px;"><span style="font-size: 25px; font-weight: bold;">Size :</span>&nbsp;&nbsp;${item.size}</h2>
			<hr/>
			<input type="hidden" id=userid value="${principal.user.id}"></input>
			<button type="button" id="inputCart" value="${item.id}" class="btn text-white" style="background-color: #453675;">장바구니에 넣기</button>
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