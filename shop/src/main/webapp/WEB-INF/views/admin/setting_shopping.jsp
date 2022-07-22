<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
  <sec:authentication property="principal" var="principal" />
</sec:authorize>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Nerdy</title>

	<link href="/css/style_admin.css" rel="stylesheet" type="text/css" />
	<link href="/css/style_admin_user.css" rel="stylesheet" type="text/css" />

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  </head>

  <body>
  <%@ include file="left_nav.jsp" %>

    <div class="container">
    
    <div style="height: 50px;"></div>
      <h2>회원정보 관리</h2>
      <div style="height: 20px;"></div>

      <hr/>
      
       <div class="setting-user-header-container">

        <div class="d-flex">
        
          <div class="form-group mr-2">
  			<select class="form-control" id="sel1">
			  <option>ID</option>
			  <option>ITEMNAME</option>
			  <option>CATEGORY</option>
			  <option>PRICE</option>
			</select>
		   </div>
		   
          <div>
          	<form class="form-inline" action="#" method="get">
	            <input
	              type="text"
	              class="form-control"
	              name="keyword"
	              value="${keyword}"
	              placeholder="검색어를 입력해주세요."
	              id="keyword"/>
	            <button type="submit" class="btn btn-dark ml-2">검색</button>
	        </form>
          </div>
          
        </div>

        <div class="setting-user-btn-box">
          <a href="#userid포함시켜서" class="btn btn-success">수정</a>
          <a href="#userid포함시켜서" class="btn btn-warning">삭제</a>
        </div>
        
      </div>
      
      <div style="height: 70px;"></div>
      
		<c:forEach var="item" items="${itemPage.content}">
		  <div class="card" style="width:400px">
		    <img class="card-img-top" src="${item.imageUrl}" alt="Card image" style="width:100%">
		    <div class="card-body">
		      <h6 class="card-title">${item.name}</h6>
		      <p class="card-text">${item.price} 원</p>
		      <p class="card-text">${item.category}</p>
		      <p class="card-text">${item.gender}</p>
		    </div>
		  </div>
		</c:forEach>

    </div>
    <div style="height: 100px"></div>
    <div class="admin-pagenation-container">
      <ul class="pagination justify-content-center">
        <c:set var="isDisabled" value="disabled"></c:set>
        <c:set var="isNotDisabled" value=""></c:set>
        <c:set var="isNowPage" value="active"></c:set>

        <li class="page-item ${userPage.first ? isDisabled : isNotDisabled}">
          <a
            class="page-link"
            href="/admin/user/select-all?page=${userPage.number - 1}"
            >이전</a
          >
        </li>

        <c:forEach var="num" items="${pageNumbers}">
          <c:choose>
            <c:when test="${userPage.number + 1 eq num}">
              <li class="page-item active">
                <a
                  class="page-link"
                  href="/admin/user/select-all?page=${num - 1}"
                  >${num}</a
                >
              </li>
            </c:when>
            <c:otherwise>
              <li class="page-item">
                <a class="page-link" href="/admin/user/select-all?page=${num - 1}">${num}</a>
              </li>
            </c:otherwise>
          </c:choose>
        </c:forEach>

        <li class="page-item ${userPage.last ? isDisabled : isNotDisabled}">
          <a class="page-link" href="/admin/user/select-all?page=${userPage.number + 1}" >다음</a>
        </li>
      </ul>
    </div>

    <script>
      function clickList(target) {
        let bb = target.parentNode;
        let trs = bb.getElementsByTagName("tr");

        // 선택안된 
        var backColor = "#32383e";
        var textColor = "#ffffff";
        // 선택 된
        var orgBColor = "black";
        var orgTColor = "#ffffff";

        let th_value = [];

        for (var i = 0; i < trs.length; i++) {
          if (trs[i] != target) {
            trs[i].style.backgroundColor = backColor;
            trs[i].style.color = textColor;
          } else {
            trs[i].style.backgroundColor = orgBColor;
            trs[i].style.color = orgTColor;
            var td = trs[i].getElementsByTagName("td");
            for (let j = 0; j < td.length; j++) {
              th_value[j] = td[0].innerText;
            }
          }
        }
      }
    </script>
  </body>
</html>
