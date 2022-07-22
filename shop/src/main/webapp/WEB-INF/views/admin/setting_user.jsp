<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="left_nav.jsp" %>

    <div class="container">
    
    <div style="height: 50px;"></div>
      <h2>회원정보 관리</h2>
      <div style="height: 20px;"></div>

      <hr/>
      
       <div class="setting-header-container">

        <div class="d-flex">
        
          <div class="form-group mr-2">
  			<select class="form-control" id="sel1">
			  <option>ID</option>
			  <option>USERNAME</option>
			  <option>NAME</option>
			  <option>OAUTH</option>
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
          <a href="#userid포함시켜서" class="btn btn-success">권한설정</a>
          <a href="#userid포함시켜서" class="btn btn-danger">삭제</a>
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
	        	<tr onclick="clickList(this)">
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
    <input id="admin-object-id" value="" type="hidden">

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
        
        var id = th_value[0];
        $("#admin-object-id").val(id);
      }
    </script>
  </body>
</html>
