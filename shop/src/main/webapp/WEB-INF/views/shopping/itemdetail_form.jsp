<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<div class="container">
	<input type="hidden" id="principal--id" value="${item.id}">

	<button class="btn bg-secondary" onclick="history.back();">돌아가기</button>
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
			<br/>
			<h2 style="font-size: 28px;"><span style="font-size: 25px; font-weight: bold;">배송비</span>&nbsp;&nbsp;2500원</h2>
			<hr/>
			<h2 style="font-size: 38px;"></h2>
			<div class="form-group">
				<label for="colors">color :</label>
					<select id=colors name="colors">
					
					</select>
			</div>
			<br/>
			<div class="form-group">
				<label for=sizes>color :</label>
					<select id=sizes name="sizes">
					
					</select>
			</div>
			<hr/>
			<input type="hidden" id=userid value="${principal.user.id}"></input>
			<button type="button" id="inputCart" value="${item.id}" class="btn btn-dark text-white">장바구니에 넣기</button>
		</div>	
	</div>
	<hr/>
	<div class="form-group m-2">
	<button type="button" class="btn btn-dark text-white">상품상세</button>
	</div>
	<br/>
	<h4>${item.content}</h4>
	<br/><br/>
	<hr/>
	<br/>
	<div class="card">
		<div>
			<div class="card-body"><textarea rows="1" class="form-control" id="reply-content"></textarea></div>
			<div class="card-footer"><button type="button" class="btn btn-dark text-white" id="btn-reply-save">후기 등록</button></div>
		</div>
	</div>
<br/>
	<div class="card">
		<div class="card-header">후기 목록</div>
	</div>
	<!-- 오류방지를 위해 id에 하이픈(-) 하나 더 붙여준다 -->
	<ul class="list-group" id="reply--box">	
		<c:forEach var="reply" items="${Item.replies}">
		<li class="list-group-item d-flex justify-content-between" id="reply--${reply.id}">
			<div>${reply.content}</div>
			<div class="d-flex">
				<!-- 본인 댓글만 삭제할 수 있도록 처리 -->
				<div>작성자 : ${reply.user.username}&nbsp;&nbsp;</div>
				<c:if test="${reply.user.id eq principal.user.id}">
					<button class="badge badge-danger" onclick="index.replyDelete(${board.id}, ${reply.id});">삭제</button>				
				</c:if>
				<!-- ajax 통신할 때는 이벤트 바인딩 onclick으로 처리! (렌더링 순서때문에 이벤트 핸들러가 등록이 안됨) -->
			</div>
		</li>
		</c:forEach>
	</ul>

<br/><br/>
</div>

<script src="/js/item.js"></script>
<script src="/js/basket.js"></script>