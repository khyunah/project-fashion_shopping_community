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

    <!-- CSS 적용 경로 -->
    <link href="${path}/css/headerstyles.css" rel="stylesheet" />
    <link href="/css/style_user.css" rel="stylesheet" type="text/css" />
    <link
      href="/css/style_community_home.css"
      rel="stylesheet"
      type="text/css"
    />
    <link
      href="/css/style_community_detail.css"
      rel="stylesheet"
      type="text/css"
    />
    <link
      href="/css/style_community_social.css"
      rel="stylesheet"
      type="text/css"
    />
    <link href="/css/style_admin.css" rel="stylesheet" type="text/css" />
    <link href="/css/style_admin_user.css" rel="stylesheet" type="text/css" />

    <!-- 부트스트랩 -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
    />
    <link
      href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
      rel="stylesheet"
      id="bootstrap-css"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- include summernote css/js -->
    <link
      href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
      rel="stylesheet"
    />

    <!-- 폰트 설정 -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Hahmlet:wght@100;300&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Song+Myung&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap"
      rel="stylesheet"
    />

    <!-- 아이콘 폰트어썸 -->
    <script
      src="https://kit.fontawesome.com/decc5cea51.js"
      crossorigin="anonymous"
    ></script>

    <!-- summer note 설정 -->
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
  </head>

  <body>
    <div class="container">
      <h2>회원정보 관리</h2>
      
      <hr/>

      <div class="setting-user-header-container">
        <div class="d-flex m-2">
          <div class="dropdown">
            <button
              type="button"
              class="btn btn-light dropdown-toggle"
              data-toggle="dropdown"
            >
              column
            </button>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="#">Link</a>
              
            </div>
          </div>
          <form class="form-inline" action="#" method="get">
            <input
              type="text"
              class="form-control"
              name="keyword"
              value="${keyword}"
              placeholder="검색어를 입력해주세요."
              id="keyword"
            />
            <button type="submit" class="btn btn-dark ml-2">검색</button>
          </form>
        </div>

        <div class="setting-user-btn-box">
          <a href="#userid포함시켜서" class="btn btn-success">수정</a>
          <a href="#userid포함시켜서" class="btn btn-warning">삭제</a>
        </div>
      </div>
      
      <div style="height: 70px;"></div>

      <table class="table table-dark table-hover">
        <thead>
          <tr>
            <th>ID</th>
            <th>USERNAME</th>
            <th>NAME</th>
            <th>EMAIL</th>
            <th>PHONENUMBER</th>
            <th>ADDRESS</th>
            <th>OAUTH</th>
            <th>CREATEDATE</th>
          </tr>
        </thead>
        <tbody>
	        <c:forEach var="user" items="${userPage.content}">
	        	<tr onclick="aa(this)">
		            <td>${user.id}</td>
		            <td>${user.username}</td>
		            <td>${user.name}</td>
		            <td>${user.email}</td>
		            <td>${user.phoneNumber}</td>
		            <td>${user.address}</td>
		            <td>${user.oauth}</td>
		            <td>${user.createDate}</td>
		        </tr>
	        </c:forEach>
        </tbody>
      </table>
      
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
      function aa(target) {
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
        console.log(th_value[0]);
      }
    </script>
  </body>
</html>
