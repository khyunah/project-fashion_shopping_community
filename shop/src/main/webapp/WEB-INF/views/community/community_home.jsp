<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

 	<input id="userId" type="hidden" value="${principal.user}"/>

<c:forEach var="communityBoard" items="${communityBoardList.content}">
	<input id="communityBoardId" type="hidden" value="${communityBoard.id}"/>
	<div class="commu-container">
        <div>
            <img class="commu-img" alt="" src="/image/model1.jpg">
        </div>

        <div class="div-main-container">
            <div>
            	<div id="commu-like-icon-box">
            		<c:set var="myLike" value="0"></c:set>
	            	<c:forEach var="like" items="${likeList}">
	            		<c:if test="${like.board.id == communityBoard.id}">
	            			<c:set var="myLike" value="ok"></c:set>
	            		</c:if>
	            	</c:forEach>
	            	
	           		<c:choose>
			        	<c:when test="${myLike == 'ok'}">
			        		<i class="fa-solid fa-heart fa-lg" style="color: rgb(240, 81, 115)"></i>
			        	</c:when>
			        	<c:otherwise>
			        		<i style="color: black" id="before-like" class="fa-regular fa-heart fa-lg"></i>
			        	</c:otherwise>
			        </c:choose>
            	</div>
            	<span id="likeCount" class="span-goodlook-count commu-text">${communityBoard.likeCount}</span>
            </div>

            <hr class="hr-goodlook-line" />

            <div style="height: 10px"></div>

            <div>
                <div class="div-title-container">
                    <p class="commu-text commu-title">${communityBoard.title}</p>
                </div>
                <div class="div-title-container">
                    <span class="p-username commu-text">${communityBoard.user.username}</span>
                </div>
            </div>

            <div style="height: 20px"></div>

            <div>
                <div class="div-content-container">
                    <span class="span-content commu-text">${communityBoard.content}</span>
                </div>
            </div>

            <div style="height: 20px"></div>

            <div>
                <div class="commu-reply-firstline">
                    <i class="fa-regular fa-pen-to-square"></i>
                    <button type="button" class="btn-up commu-btn" id="commu-btn-insert">up</button>
                </div>

                <div>
                    <input type="text" placeholder="한 마디" class="input-reply commu-input" id="commu-input-reply"/>
                </div>
            </div>
        </div>
        <div style="height: 70px"></div>
    </div>
</c:forEach>

<script src="/js/commu.js"></script>
</body>

</html>