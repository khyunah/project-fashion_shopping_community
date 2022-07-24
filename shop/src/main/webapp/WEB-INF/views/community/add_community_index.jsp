<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="communityBoard" items="${communityBoardList.content}">
	<input id="communityBoardId" type="hidden" value="${communityBoard.id}" />

	<c:choose>
		<c:when test="${principal.user.username eq null}">
			<div class="commu-home-box" onclick="commu.guestCheck()">
		</c:when>
		<c:otherwise>
			<div class="commu-home-box">
		</c:otherwise>
	</c:choose>
		<div class="commu-container">
			<div>
				<a href="/community/${communityBoard.id}"> <img
					class="commu-img" alt=""
					src="http://localhost:9090/upload/${communityBoard.imageUrl}"
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

				<div style="height: 20px"></div>

				<div>
					<div class="commu-reply-firstline">
						<button type="button" class="btn-up commu-btn"
							id="commu-btn-insert"
							onclick="commu.insertReply(${communityBoard.id}, ${principal.user.id})">up</button>
					</div>

					<div>
						<input type="text" placeholder="한 마디"
							class="input-reply commu-input"
							id="commu-input-reply-${communityBoard.id}" />
					</div>
				</div>
			</div>
			<div style="height: 70px"></div>
		</div>
	</div>
</c:forEach>
