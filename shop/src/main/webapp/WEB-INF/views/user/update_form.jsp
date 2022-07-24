<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="user-header-line">
	<h2 class="user-header-text">U p d a t e</h2>
</div>
<div style="height: 40px;"></div>

<c:choose>
	<c:when test="${principal.user.oauth == 'ORIGIN'}">
		<c:set var="isOauth" value="origin"></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="isOauth" value="kakao"></c:set>
	</c:otherwise>
</c:choose>

<input type="hidden" value="${isOauth}" id="isOauth">
<input type="hidden" value="${principal.user.id}" id="id">

<form class="user-form" action="/user/profile-update/${principal.user.id}"
	enctype="multipart/form-data" method="post">

	<div class="user-input-container">
		<label class="user-input-label"> <span class="label-txt">YOUR
				ID</span> <input type="text" class="input" name="username" id="username"
			value="${principal.user.username}" readonly="readonly">
			<div class="line-box">
				<div class="line"></div>
			</div>
		</label>
	</div>

	<div class="user-empty-box"></div>
	<div class="user-empty-box"></div>
	<div class="user-empty-box"></div>

	<c:choose>
		<c:when test="${isOauth == 'kakao'}">
			<input id="password" type="hidden" class="input" name="password"
				value="">
		</c:when>
		<c:otherwise>
			<div class="user-input-container">
				<div>
					<label class="user-input-label"> <span class="label-txt">ENTER
							YOUR PASSWORD</span> <input id="password" type="password" class="input"
						name="password" required>
						<div class="line-box">
							<div class="line"></div>
						</div>
					</label> <label class="user-input-label"> <span class="label-txt">PASSWORD
							CHECK</span> <input id="passwordCheck" type="password" class="input"
						required>
						<div class="line-box">
							<div class="line"></div>
						</div>
					</label>
				</div>
			</div>
		</c:otherwise>
	</c:choose>

	<div class="user-empty-box"></div>
	<span class="user-check-span" id="checkPasswordResult"></span>

	<div class="user-empty-box"></div>
	<div class="user-empty-box"></div>
	<div class="user-empty-box"></div>

	<div class="user-input-container">
		<div>
			<label class="user-input-label"> <span class="label-txt">YOUR
					NAME</span> <input id="name" type="text" class="input" name="name"
				value="${principal.user.name}" required>
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label> <label class="user-input-label"> <span class="label-txt">YOUR
					EMAIL</span> <input id="email" type="email" class="input" name="email"
				value="${principal.user.email}" required>
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label>
		</div>
	</div>

	<div class="user-empty-box"></div>

	<div class="user-input-container">
		<div>
			<label class="user-input-label"> <span class="label-txt">YOUR
					ADDRESS</span> <input id="address" type="text" class="input"
				name="address" value="${principal.user.address}" required>
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label> <label class="user-input-label"> <span class="label-txt">YOUR
					PHONE</span> <input id="phoneNumber" type="number" class="input"
				name="phoneNumber" value="${principal.user.phoneNumber}" required>
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label>
		</div>
	</div>

	<div class="user-input-container">
		<label class="user-input-label"> <span class="label-txt">PROFILE
				IMAGE</span>

		</label>
		<div class="form-group">
			<div class="input-group">
				<input type="file" name="file" class="custom-file-input" id="image" required="required" width="200" height="230"/>
				<label class="custom-file-label" for="customFile"></label>
			</div>
		</div>
	</div>


	<div class="user-empty-box"></div>
	<div class="user-empty-box"></div>
	<div class="user-empty-box"></div>

	<button type="submit" id="btn-update" class="user-btn"
		onsubmit="return checkPassword()">update</button>
</form>
<script>
	$(".custom-file-input").bind(
			"change",
			function() {
				console.log($(this).val());
				let fileName = $(this).val().split("\\").pop();
				$(this).siblings(".custom-file-label").html(fileName);
			});
</script>
<script src="/js/user.js"></script>
</body>
</html>
