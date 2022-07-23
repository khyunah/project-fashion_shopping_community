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

    <link href="/css/style_admin.css" rel="stylesheet" type="text/css" />
    <!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet"/>	

 </head>

  <body>
    <div class="admin-menu-super-container">
    
    <div class="admin-menu-title-box">
    	<h3 class="admin-menu-title">관리자 메뉴</h3>
    </div>

     <div class="admin-menu-list-box">
       <div>
	      	<div class="admin-menu-list-item">
	        	<a href="/admin/user/select-all" class="btn">
	        		<img alt="" src="/image/users_icon.png" class="admin-menu-nav-img">
	        		<div class="admin-menu-text">회원관리</div>
	        	</a>
	        </div>
	        
	        <div class="admin-menu-list-item">
	        	<a href="/admin/shopping/select-all" class="btn">
	        		<img alt="" src="/image/product_icon.png" class="admin-menu-nav-img">
	        		<div class="admin-menu-text">상품관리</div>
	        	</a>
	        </div>
	        
	        <div class="admin-menu-list-item">
	        	<a href="/admin/community/select-all" class="btn">
	        		<img alt="" src="/image/social_icon.png" class="admin-menu-nav-img">
	        		<div class="admin-menu-text">커뮤니티관리</div>
	        	</a>
	        </div>
	        
	        <div class="admin-menu-list-item">
	        	<a href="#" class="btn">
	        		<img alt="" src="/image/setting_icon.png" class="admin-menu-nav-img">
	        		<div class="admin-menu-text">설정</div>
	        	</a>
	        </div>
       </div>
     </div>
	
    </div>
  </body>
</html>
