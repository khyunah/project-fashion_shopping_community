<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<form class="user-form" action="/security/join-user" method="post" onsubmit="return checkPassword()">

	<div class="user-input-container">
		<label class="user-input-label">
			<span class="label-txt">ENTER YOUR ID</span>
			<input type="text" class="input" name="username" id="username" required>
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
		<button type="button" id="btn-checkUsername" class="user-btn">check id</button>
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
				<input type="text" class="input" name="name" required>
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label>
			
			<label class="user-input-label">
				<span class="label-txt">ENTER YOUR EMAIL</span>
				<input type="email" class="input" name="email" required>
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
				<input type="text" class="input" name="address" required>
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label>
			
			<label class="user-input-label">
				<span class="label-txt">ENTER YOUR PHONE</span>
				<input type="number" class="input" name="phoneNumber" required>
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label>
		</div>
	</div>

	<div class="user-empty-box"></div>
	<div class="user-empty-box"></div>
	<div class="user-empty-box"></div>
	
	<button type="submit" id="btn-join" class="user-btn">sign up</button>
</form>

<script>
$(document).ready( function(){
	$( ".input" ).focus( function(){
	  $( this ).parent().find( ".label-txt" ).addClass( "label-active" );
	});
	
	$( ".input" ).focusout( function(){
	  if ( $( this ).val() == '' ) {
	    $( this ).parent().find( ".label-txt" ).removeClass( "label-active" );
	  };
	});
	
	$( "#username" ).keyup( function() {
		$( "#checkIdResult" ).text(null);
	});
	
	$( "#password, #passwordCheck" ).keyup( function() {
	      let password = $( "#password" ).val();
	      let passwordCheck = $( "#passwordCheck" ).val();
	      if( password == passwordCheck ) {
	    	  $( "#checkPasswordResult" ).text( "일치" );
	      } else {
	    	  $( "#checkPasswordResult" ).text( "불일치" );
	      }
	});
	
	$( "#btn-checkUsername" ).bind( "click" , function(){
		let data = {
			username: $( "#username" ).val()
		}
		
		console.log(username);
		$.ajax({
			type: "POST",
			url: "/security/join-usernameCheck",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(response){
			console.log(response)
			if(response.data.username != null){
				$( "#checkIdResult" ).text( "사용 불가능" );
			} else {
				$( "#checkIdResult" ).text( "사용 가능" );
			}
		}).fail(function(error){
			
		});
	});
	
});

function checkPassword(){
	if($("#checkIdResult").text() == "사용 불가능" || $("#checkIdResult").text() == ""){
		alert("아이디 중복확인을 해주세요.");
		return false;
	} else if($("#checkPasswordResult").text() == "불일치" || $("#checkPasswordResult") == ""){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
} 

</script>
</body>
</html>
