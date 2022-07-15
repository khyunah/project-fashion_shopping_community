<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>


<span class="left">
<br/>
<c:forEach var="board" items="${Items}">
 <div class="card mb-3" style="max-width: 700px;"> 
  <div class="row g-0">
    <div class="col-md-4">
      <img src="${Item.imageurl}" class="img-fluid rounded-start" alt="...">
    </div>
    <div class="col-md-8">
    <button type="submit" class="topright btn btn-dark" onclick="index.topright(${Item.id}, ${principal.user.id}">
    취소
    </button>
      <div class="card-body mt-3">
        <h5 class="card-title"> ${Item.name}</h5>
        <p class="card-text">${Item.content}</p>
        <p class="card-text" style="margin-top: 50px;">${Item.price}원</p>
      </div>
    </div>
  </div>
 </div>
</c:forEach>
</span>
<span class="right">
<br/>	
<c:choose>
<c:when test="${principal.user.role eq USER}">
 <div class="pay card mb-3" style="width: 600px; height: 300px;  padding: 10px; left: 50%;">
 	<br/>
 	<h1 class="col-md" style="text-align: center;font-family: fantasy;">결제목록</h1>
 	<p style="position:absolute; bottom: 50%; margin-left: 15px; font-family: fantasy;">상품 개수 ${basket.count} 10개</p>
 	<p style="position:absolute; bottom: 30%; margin-left: 15px; font-family: 'Black Han Sans', sans-serif; font-size: 35px;"><span style="font-family: fantasy; font-size: 25px;">총 결제 금액</span>${item.price.sum} 30,000
 	<span style="font-family: fantasy; font-size: 25px;">원</span></p>

 	<button type="button" class="btn btn-dark" style="position: relative; bottom: 0%; width: 100%;">결제하기</button>
 </div>
</c:when>
</c:choose>
</span>
<hr/>