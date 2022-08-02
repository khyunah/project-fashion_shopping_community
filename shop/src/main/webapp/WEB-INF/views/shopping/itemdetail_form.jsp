<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<div class="container">
	<input type="hidden" id="principal--id" value="${item.id}">
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
	<button type="button" class="btn text-white" style="background-color: #453675;">상품 설명</button>
	</div>
	<br/>
	<h4>${item.content}</h4>
	<br/><br/>
	<hr/>
	<div>
		<button type="button" class="btn text-white" style="background-color: #453675;">상품리뷰 작성하기</button>
		<c:forEach var="itemReviews" items="${item.itemReviews}">
					<div id="commu-reply-${itemReview.id}">
						<div class="commu-detail-reply-firstline-container">
							<span class="commu-detail-reply-user commu-detail-reply-text">${itemReviews.user.username}</span>
							<div id="commu-detail-reply-btn-box">
								<c:if test="${itemReviews.user.id == principal.user.id}">

									<button onclick="commu.updateBtnReply(${itemReviews.id})"
										class="commu-detail-btn-reply-update-${itemReviews.id} commu-detail-btn-reply">수정</button>
									<button onclick="commu.deleteReply(${itemReviews.id})"
										class="commu-detail-btn-reply-delete-${itemReviews.id} commu-detail-btn-reply">
										삭제</button>
								</c:if>
							</div>
						</div>
						<div id="commu-detail-reply-content-box-${itemReviews.id}">
							<textarea id="commu-detail-reply-content-${itemReviews.id}"
								class="commu-detail-reply-content commu-detail-reply-text"
								readonly>${itemReviews.content}</textarea>
						</div>
					</div>
				</c:forEach>
		
	</div>
	<br/>

<br/>
</div>

<script src="/js/item.js"></script>
<script src="/js/basket.js"></script>