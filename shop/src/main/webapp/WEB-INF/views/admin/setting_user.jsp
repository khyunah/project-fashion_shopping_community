<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="left_nav.jsp"%>

<div class="container admin-container">

	<div style="height: 50px;"></div>
	<h2>회원정보 관리</h2>
	<div style="height: 20px;"></div>

	<hr />

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
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<input type="text" class="form-control" name="keyword"
						value="${keyword}" placeholder="검색어를 입력해주세요." id="keyword" />
					<button type="submit" class="btn btn-dark ml-2">검색</button>
				</form>
			</div>

		</div>

		<div class="setting-user-btn-box">
			<button type="button" class="btn btn-success" onclick="admin.userChangeRole()">권한설정</button>
			<button type="button" class="btn btn-danger" onclick="admin.userDelete()">삭제</button>
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
				<th>ROLE</th>
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
					<td>${user.role}</td>
					<td>${user.createDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


	<div style="height: 100px"></div>
	<div class="admin-pagenation-container">
		<ul class="pagination justify-content-center">
			<c:set var="isDisabled" value="disabled"></c:set>
			<c:set var="isNotDisabled" value=""></c:set>
			<c:set var="isNowPage" value="active"></c:set>

			<li class="page-item ${userPage.first ? isDisabled : isNotDisabled}">
				<a class="page-link"
				href="/admin/user/select-all?page=${userPage.number - 1}">이전</a>
			</li>

			<c:forEach var="num" items="${pageNumbers}">
				<c:choose>
					<c:when test="${userPage.number + 1 eq num}">
						<li class="page-item active"><a class="page-link"
							href="/admin/user/select-all?page=${num - 1}">${num}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="/admin/user/select-all?page=${num - 1}">${num}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<li class="page-item ${userPage.last ? isDisabled : isNotDisabled}">
				<a class="page-link"
				href="/admin/user/select-all?page=${userPage.number + 1}">다음</a>
			</li>
		</ul>
	</div>
	<div class="admin-id-box">
		<span id="admin-object-id" style="display: none;"></span>
	</div>
	
</div>

<script src="/js/admin.js"></script>
</body>
</html>
