<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="user-header-line">
	<h2 class="user-header-text">L o g i n</h2>
</div>
<div style="height: 40px;"></div>
<form class="user-form" action="/security/login-user" method="post"
	onsubmit="">

	<div class="user-input-container">
		<label class="user-input-label"> <span class="label-txt">ENTER
				YOUR ID</span> <input type="text" class="input" name="username"
			id="username" required>
			<div class="line-box">
				<div class="line"></div>
			</div>
		</label>
	</div>

	<div class="user-empty-box"></div>

	<div class="user-input-container">
		<label class="user-input-label"> <span class="label-txt">ENTER
				YOUR PASSWORD</span> <input id="password" type="password" class="input"
			name="password" required>
			<div class="line-box">
				<div class="line"></div>
			</div>
		</label>
	</div>

	<div class="user-empty-box"></div>
	<div class="user-empty-box"></div>

	<div>
		<button type="submit" id="btn-login" class="user-btn">login</button>
		<a class="user-kakao-login"
			href="https://kauth.kakao.com/oauth/authorize?client_id=0d6bcf296d67c35ad944b2a3d38df9be&redirect_uri=http://localhost:9090/security/kakao/callback&response_type=code">
			<img src="/image/kakao_login.png" width="86" height="50">
		</a>
	</div>

</form>

</body>
</html>
