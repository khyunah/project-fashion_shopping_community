<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="left_nav.jsp"%>

<div class="container admin-container">

	<div style="height: 50px;"></div>
	<h2>상품정보 관리</h2>
	<div style="height: 20px;"></div>

	<hr />

	<div class="setting-header-container">

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
					<input type="text" class="form-control" name="keyword"
						value="${keyword}" placeholder="검색어를 입력해주세요." id="keyword" />
					<button type="submit" class="btn btn-dark ml-2">검색</button>
				</form>
			</div>

		</div>

		<div class="setting-btn-box">
			<button type="button" class="btn btn-primary" onclick="admin.shoppingDetail()">상세보기</button>
			<a href="/admin/shopping/save_form" class="btn btn-warning">등록</a> 
			<button type="button" class="btn btn-success" onclick="admin.shoppingUpdateForm()">수정</button>
			<button type="button" class="btn btn-danger" onclick="admin.shoppingDelete()">삭제</button>
		</div>
		
	</div>

	<div style="height: 70px;"></div>

	<table class="table table-dark table-hover">
		<thead>
			<tr>
				<th>ID</th>
				<th>ITEM</th>
				<th>NAME</th>
				<th>PRICE</th>
				<th>CATEGORY</th>
				<th>GENDER</th>
				<th>AMOUNT</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${itemPage.content}">
				<tr onclick="clickList(this)">
					<td>${item.id}</td>
					<td><div class="admin-shopping-img-box">
							<img class="card-img-top" src="${item.imageurl}" alt="Card image"
								style="width: 100%">
						</div></td>
					<td>${item.name}</td>
					<td>${item.price}</td>
					<td>${item.category}</td>
					<td>${item.gender}</td>
					<td>${item.amount}</td>
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
							href="/admin/user/select-all?page=${num - 1}">${num}</a></li>
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
