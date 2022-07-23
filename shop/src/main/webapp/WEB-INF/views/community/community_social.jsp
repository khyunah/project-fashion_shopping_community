<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

    <div class="community-container">
    	<%@ include file="add_community_board.jsp" %>
        
        <div class="commu-profile-box">
            <img class="card-img-top commu-profile-img" src="/image/profile.jpg" alt="Card image">
            <div class="card-body commu-profile-text-box">
              ﻿<h5 class="card-title" id="commu-profile-username">${principal.user.username}</h5>
              <a href="/community/my-page" class="commu-profile-btn commu-profile-btn-my">MY SOCIAL</a>
              <a href="/board/write" class="commu-profile-btn commu-profile-btn-write-community-board">WRITE</a>
              <a href="" class="commu-profile-btn commu-profile-btn-top">TOP</a>
            </div>
        </div>
    </div>

	<p id="result"></p>
	<input id="pageNumber" type="hidden" value="${communityBoardList.number}">

    <script>history.scrollRestoration = "manual"</script>
    <script src="/js/commu.js"></script>
    <script src="/js/social_scroll.js"></script>
    
</body>

</html>