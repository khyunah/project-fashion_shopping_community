<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="communityBoard" items="${communityBoardList.content}">
	<input id="communityBoardId" type="hidden" value="${communityBoard.id}" />

	<div class="commu-container">
		<div class="commu-img-box">
			<a href="/community/${communityBoard.id}"> 
			<img class="commu-img" alt="" src="/upload/${communityBoard.imageUrl}"
				onerror="this.src='/image/noImage.png'" />
			</a>
		</div>

		<div class="div-main-container">
			<div id="commu-icon-box-${communityBoard.id}">
				<div
					onclick="commu.communityLike(${communityBoard.id}, ${communityBoard.likeCount})">
					<c:set var="myLike" value="0"></c:set>
					<c:forEach var="like" items="${likeList}">
						<c:if test="${like.board.id == communityBoard.id}">
							<c:set var="myLike" value="ok"></c:set>
						</c:if>
					</c:forEach>

					<c:choose>
						<c:when test="${myLike == 'ok'}">
							<i class="fa-solid fa-heart fa-lg"
								style="color: rgb(240, 81, 115)"></i>
						</c:when>
						<c:otherwise>
							<i style="color: black" id="before-like"
								class="fa-regular fa-heart fa-lg"></i>
						</c:otherwise>
					</c:choose>
					<span id="likeCount-${communityBoard.id}"
						class="span-goodlook-count commu-text">${communityBoard.likeCount}</span>
				</div>

			</div>

			<hr class="hr-goodlook-line" />

			<div style="height: 10px"></div>

			<div>
				<div class="div-title-container">
					<p class="commu-text commu-title commu-home-title">${communityBoard.title}</p>
				</div>
				<div class="div-title-container">
					<span class="p-username commu-text commu-home-username">${communityBoard.user.username}</span>
				</div>
			</div>

			<div style="height: 20px"></div>

			<div>
				<div class="div-content-container">
					<span class="span-content commu-home-text">${communityBoard.content}</span>
				</div>
			</div>

		</div>

	</div>
</c:forEach>
