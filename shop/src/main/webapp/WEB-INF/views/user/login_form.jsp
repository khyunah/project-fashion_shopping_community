<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/css/style.css" rel="stylesheet" type="text/css"/>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
﻿<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>﻿
<title>Insert title here</title>
</head>
<body>
<form action="/security/login-user" method="post">

  <label>
    <p class="label-txt">ENTER YOUR ID</p>
    <input type="text" class="input" name="username" id="username" required>
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <br/>

  <br/>
  <label>
    <p class="label-txt">ENTER YOUR PASSWORD</p>
    <input id="password" type="password" class="input" name="password" required>
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>

  <br/><br/><br/>
  <div>
  	<button type="submit" id="btn-login">login</button>
  </div>
  
</form>
<script src="/js/user.js"></script>

</body>
</html>
