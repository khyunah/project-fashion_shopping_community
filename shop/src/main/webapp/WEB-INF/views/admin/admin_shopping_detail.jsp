<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="left_nav.jsp"%>

<div class="container">

	<div style="height: 50px;"></div>
	<h2>상품 상세보기</h2>
	<div style="height: 20px;"></div>

	<div style="display: flex; justify-content: end;">
		<input type="hidden" id="itemId" value="${item.id}"> 
		<a href="/admin/shopping/select-all" class="btn btn-primary">목록보기</a> 
		<a href="/admin/shopping-item/update_form/${item.id}" class="btn btn-warning">수정</a>
		<button class="btn btn-danger" id="btn-delete">삭제</button>
	</div>

	<br /> <br />

	<div class="form-group m-2 inline row">
		<div>
			<img style="width: 460px; height: 580px;" src="${item.imageurl}"
				alt="" />
		</div>
		<div style="margin-left: 150px;">
			<hr />
			<h2 style="font-size: 38px;">상품명 : ${item.name}</h2>
			<hr />
				<span style="font-size: 25px; font-weight: bold;">가격 : </span>&nbsp;&nbsp;${item.price}원
			<br />
				<span style="font-size: 25px; font-weight: bold;">색상 : </span>&nbsp;&nbsp;${item.color}
			<br />
				<span style="font-size: 25px; font-weight: bold;">사이즈 : </span>&nbsp;&nbsp;${item.size}
			<hr />
				<span style="font-size: 25px; font-weight: bold;">카테고리 : </span>&nbsp;&nbsp;${item.category}
			<hr />
		</div>
	</div>
	<hr />
	<br />
	<h4>${item.content}</h4>
	<br /> <br />
	
	<br /> <br />
</div>

<script src="/js/item.js"></script>
