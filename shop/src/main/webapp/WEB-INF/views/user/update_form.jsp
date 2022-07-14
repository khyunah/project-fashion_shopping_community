<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<form>
  <input type="hidden" value="${principal.user.id}" id="id">
  <label>
    <p class="label-txt">ID</p>
    <input type="text" class="input" name="username" id="username" value="${principal.user.username}" readonly="readonly">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <br/>
  <label>
    <p class="label-txt">ENTER YOUR PASSWORD</p>
    <input id="password" type="paaword" class="input" name="password" required>
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <label>
    <p class="label-txt">PASSWORD CHECK</p>
    <input id="passwordCheck" type="password" class="input" required>
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <br/>
  <span id="checkPasswordResult"></span>
  <br/><br/><br/>
  <label>
    <p class="label-txt">NAME</p>
    <input type="text" class="input" id="name" value="${principal.user.name}" required>
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <label>
    <p class="label-txt">EMAIL</p>
    <input type="email" class="input" id="email" value="${principal.user.email}" required>
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <br/>
  <label>
    <p class="label-txt">ADDRESS</p>
    <input type="text" class="input" id="address" value="${principal.user.address}" required>
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <label>
    <p class="label-txt">PHONE</p>
    <input type="number" class="input" id="phoneNumber" value="${principal.user.phoneNumber}" required>
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <br/><br/><br/>
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
