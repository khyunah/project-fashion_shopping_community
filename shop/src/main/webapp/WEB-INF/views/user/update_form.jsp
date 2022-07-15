<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<form class="user-form" >
	<input type="hidden" value="${principal.user.id}" id="id">  
  
  	<div class="user-input-container">
		<label class="user-input-label">
			<span class="label-txt">ENTER YOUR ID</span>
			<input type="text" class="input" name="username" id="username" value="${principal.user.username}" readonly="readonly">
			<div class="line-box">
				<div class="line"></div>
			</div>
		</label>
	</div>

	<span class="user-check-span" id="checkIdResult"></span>
	
	<div class="user-empty-box"></div>
	<div class="user-empty-box"></div>
	<div class="user-empty-box"></div>
	
	<div>
		<button type="button" id="btn-checkUsername">check id</button>
	</div>
	
	<div class="user-empty-box"></div>
  
	<div class="user-input-container">
		<div>
			<label class="user-input-label">
				<span class="label-txt">ENTER YOUR PASSWORD</span>
				<input id="password" type="paaword" class="input" name="password" required>
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label>
			
			<label class="user-input-label">
				<span class="label-txt">PASSWORD CHECK</span>
				<input id="passwordCheck" type="password" class="input" required>
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label>
		</div>
	</div>

	<div class="user-empty-box"></div>
	<span class="user-check-span" id="checkPasswordResult"></span>
	
	<div class="user-empty-box"></div>
	<div class="user-empty-box"></div>
	<div class="user-empty-box"></div>
  
	<div class="user-input-container">
		<div>
			<label class="user-input-label">
				<span class="label-txt">ENTER YOUR NAME</span>
				<input type="text" class="input" name="name" value="${principal.user.name}" required>
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label>
			
			<label class="user-input-label">
				<span class="label-txt">ENTER YOUR EMAIL</span>
				<input type="email" class="input" name="email" value="${principal.user.email}" required>
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label>
		</div>
	</div>

	<div class="user-empty-box"></div>

	<div class="user-input-container">
		<div>
			<label class="user-input-label">
				<span class="label-txt">ENTER YOUR ADDRESS</span>
				<input type="text" class="input" name="address" value="${principal.user.address}" required>
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label>
			
			<label class="user-input-label">
				<span class="label-txt">ENTER YOUR PHONE</span>
				<input type="number" class="input" name="phoneNumber" value="${principal.user.phoneNumber}" required>
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label>
		</div>
	</div>

	<div class="user-empty-box"></div>
	<div class="user-empty-box"></div>
	<div class="user-empty-box"></div>

	<button type="button" id="btn-update">update</button>
</form>

<script src="/js/user.js"></script>
<script>
$(document).ready( function(){
	$( "#password, #passwordCheck" ).keyup( function() {
	      let password = $( "#password" ).val();
	      let passwordCheck = $( "#passwordCheck" ).val();
	      if( password == passwordCheck ) {
	    	  $( "#checkPasswordResult" ).text( "일치" );
	      } else {
	    	  $( "#checkPasswordResult" ).text( "불일치" );
	      }
	});
});

function checkPassword(){
	if($("#checkPasswordResult").text() == "불일치" || $("#checkPasswordResult") == ""){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
} 

</script>
</body>
</html>
