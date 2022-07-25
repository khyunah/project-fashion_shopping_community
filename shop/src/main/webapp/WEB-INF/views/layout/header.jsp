<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
      <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
        <sec:authorize access="isAuthenticated()">
          <sec:authentication property="principal" var="principal" />
        </sec:authorize>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Nerdy</title>

    <!-- CSS 적용 경로 -->
    <link href="${path}/css/headerstyles.css" rel="stylesheet" />
    <link href="${path}/css/communityBoard.css" rel="stylesheet" />
    <link href="/css/style_user.css" rel="stylesheet" type="text/css" />
    <link href="/css/style_community_home.css" rel="stylesheet" type="text/css" />
    <link href="/css/style_community_detail.css" rel="stylesheet" type="text/css" />
    <link href="/css/style_community_social.css" rel="stylesheet" type="text/css" />
    <link href="/css/kakao_pay.css" rel="stylesheet" type="text/css" />

    <!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet"
      id="bootstrap-css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet" />


    <!-- 폰트 설정 -->
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Hahmlet:wght@100;300&display=swap"
      rel="stylesheet">
    <link
      href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Song+Myung&display=swap"
      rel="stylesheet" />

    <!-- 아이콘 폰트어썸 -->
    <script src="https://kit.fontawesome.com/decc5cea51.js" crossorigin="anonymous"></script>

    <!-- summer note 설정 -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

    </head>
    
    <body>

        <header>

          <nav class="navbar navbar-expand-md bg-white navbar-dark">
            <!-- Brand -->
            <a class="navbar-brand" href="/">
              <h1 style="color: black; font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; ">YOU SINSA</h1>
            </a>

            <!-- Toggler/collapsibe Button -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
              <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Navbar links -->
            <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
              <ul class="navbar-nav mr-5">
                <c:choose>
                  <c:when test="${principal.user eq null}">
                    <li class="nav-item">
                      <a class="nav-link text-dark" href="/community/social-main"
                        style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold;">SOCIAL</a>
                    </li>
                    <li class="nav-item">
                      <div class="dropdown">
                        <button class="nav-link dropbtn bg-white text-dark"
                          style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold;">STORE
                          <i class="fa fa-caret-down"></i>
                        </button>
                        <div class="dropdown-content bg-white">
                          <a href="/shop/mans_form"
                            style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold;">MAN's</a>
                          <a href="/shop/save_form"
                            style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold;">WOMAN's</a>
                          <a href="/shop/basket_form"
                            style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold;">ACCESSORIES</a>
                        </div>
                      </div>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link text-dark" href="/security/login_form"
                        style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold;">LOGIN</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link text-dark" href="/security/join_form"
                        style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold;">JOIN</a>
                    </li>
                  </c:when>
                  <c:when test="${principal.user.role eq 'USER'}">
                    <!-- 로그인 성공하면(회원이면) 글 작성 가능 -->
                    <li class="nav-item">
                      <div class="dropdown">
                        <button class="nav-link dropbtn bg-white text-dark" 
                        style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold;">SOCIAL
                        	<i class="fa fa-caret-down"></i>
                        </button>
                        <div class="dropdown-content bg-white">
                          <a href="/community/social-main"
                            style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold;">SOCIAL MAIN</a>
                          <a href="/board/write"
                            style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold;">WRITE</a>
                        </div>
                      </div>
                    </li>
                    <li class="nav-item">
                      <div class="dropdown">
                        <button class="nav-link dropbtn bg-white text-dark"
                          style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold;">STORE
                          <i class="fa fa-caret-down"></i>
                        </button>
                        <div class="dropdown-content bg-white">
                          <a href="/shop/mans_form"
                            style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold;">MAN's</a>
                          <a href="/shop/womans_form/?gender=WOMAN"
                            style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold;">
                            WOMAN's</a>
                          <a href="/shop/save_form"
                            style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold;">ADD
                            ITEM</a>

                        </div>
                      </div>
                    </li>
                    <a class="nav-link text-dark" href="/shop/basket_form/${principal.user.id}"><img
                        src="/image/basket.png" class="basket"></a>
                    <li class="nav-item">
                      <a class="nav-link text-dark" href="/user/update_form"><img src="/image/myinfo.png"
                          class="myinfo"></a>
                    </li>
                    <li class="nav-item">
                      <!-- 시큐리티를 적용하면 자동 로그아웃 처리 된다. -->
                      <a class="nav-link text-dark" href="/logout"
                        style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold;">LOGOUT</a>
                    </li>
                  </c:when>
                  <c:when test="${principal.user.role eq 'ADMIN'}">
                    <!-- 로그인 성공하면(회원이면) 글 작성 가능 -->

                    <li class="nav-item">
                      <div class="dropdown">
                        <button class="nav-link dropbtn bg-white text-dark" 
                        style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold;">SOCIAL
                        	<i class="fa fa-caret-down"></i>
                        </button>
                        <div class="dropdown-content bg-white">
                          <a href="/community/social-main"
                            style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold;">SOCIAL MAIN</a>
                          <a href="/board/write"
                            style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold;">WRITE</a>
                        </div>
                      </div>
                    </li>
                    <li class="nav-item">
                      <div class="dropdown">
                        <button class="nav-link dropbtn bg-white text-dark"
                          style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold;">STORE
                          <i class="fa fa-caret-down"></i>
                        </button>
                        <div class="dropdown-content bg-white">
                          <a href="/shop/mans_form"
                            style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold;">MAN's</a>
                          <a href="/shop/womans_form"
                            style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold;">WOMAN's</a>
                          <a href="/shop/save_form"
                            style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold;">ADD
                            ITEM</a>
                        </div>
                      </div>
                    </li>
                    <a class="nav-link text-dark" href="/board/cart_form/${principal.user.id}"><img
                        src="/image/basket.png" class="basket"></a>
                    <li class="nav-item">
                      <a class="nav-link text-dark" href="/user/update_form"><img src="/image/myinfo.png"
                          class="myinfo"></a>
                    </li>
                    <li class="nav-item">
                      <!-- 시큐리티를 적용하면 자동 로그아웃 처리 된다. -->
                      <a class="nav-link text-dark" href="/logout"
                        style="font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif; font-weight: bold;">LOGOUT</a>
                    </li>
                  </c:when>
                </c:choose>
              </ul>
            </div>
          </nav>
        </header>
        <br />
        <!-- 자바 스크립트 추가할 때는 그 페이지의 밑에 작성 -->
