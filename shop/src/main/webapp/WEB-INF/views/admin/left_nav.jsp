<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Nerdy</title>

    <link href="/css/style_admin.css" rel="stylesheet" type="text/css" />
    <!-- 부트스트랩 -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
    />
    <link
      href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
      rel="stylesheet"
      id="bootstrap-css"
    />
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- include summernote css/js -->
    <link
      href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
      rel="stylesheet"
    />

    <!-- 폰트 설정 -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Hahmlet:wght@100;300&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Song+Myung&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap"
      rel="stylesheet"
    />

    <!-- 아이콘 폰트어썸 -->
    <script
      src="https://kit.fontawesome.com/decc5cea51.js"
      crossorigin="anonymous"
    ></script>

 </head>

  <body>
    <div class="admin-menu-super-container">
    
    <div class="admin-menu-title-box">
    	<h3 class="admin-menu-title">관리자 메뉴</h3>
    </div>

     <div class="admin-menu-list-box">
       <div>
	      	<div class="admin-menu-list-item">
	        	<a href="#" class="btn">
	        		<img alt="" src="/image/users_icon.png" class="admin-menu-nav-img">
	        		<div class="admin-menu-text">회원관리</div>
	        	</a>
	        </div>
	        
	        <div class="admin-menu-list-item">
	        	<a href="#" class="btn">
	        		<img alt="" src="/image/product_icon.png" class="admin-menu-nav-img">
	        		<div class="admin-menu-text">상품관리</div>
	        	</a>
	        </div>
	        
	        <div class="admin-menu-list-item">
	        	<a href="#" class="btn">
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
