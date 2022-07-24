<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<input id="communityBoardId" type="hidden" value="${communityBoard.id}" />
<input id="userId" type="hidden" value="${principal.user}" />

<div class="commu-detail-btn-box">
	<c:if test="${communityBoard.user.id == principal.user.id}">
		<button type="button" class="btn-up commu-btn"
			id="commu-social-btn-update"
			onclick="location.href='/board/${communityBoard.id}/update_form'">update</button>
		<button type="button" class="btn-up commu-btn"
			id="commu-social-btn-delete"
			onclick="commu.boardDelete(${communityBoard.id})">delete</button>
		<button onclick="history.back();"
			class="commu-detail-btn-back commu-detail-btn">뒤로가기</button>
	</c:if>
</div>
<div class="commu-detail-center-container">

	<div class="commu-detail-container">

		<div class="commu-detail-img-container">
			<img class="commu-detail-img" alt="" onerror="this.src='/image/noImage.png'"
				src="/upload/${communityBoard.imageUrl}" />
		</div>

		<div class="commu-detail-trim"></div>

		<div class="commu-detail-div-main-container">

			<div id="commu-icon-box-${communityBoard.id}">
				<div class="commu-detail-like-icon-box"
					onclick="commu.communityLike(${communityBoard.id}, ${communityBoard.likeCount})">

					<c:choose>
						<c:when test="${like.user.username != null}">
							<i class="fa-solid fa-heart fa-lg"
								style="color: rgb(240, 81, 115)"></i>
						</c:when>
						<c:otherwise>
							<i style="color: black" id="before-like"
								class="fa-regular fa-heart fa-lg"></i>
						</c:otherwise>
					</c:choose>

					<span id="likeCount-${communityBoard.id}"
						class="commu-detail-span-goodlook-count commu-detail-text">${communityBoard.likeCount}</span>
				</div>

			</div>

			<hr class="hr-goodlook-line-detail" />

			<div style="height: 10px"></div>

			<div class="cdtb-container">
				<div class="commu-detail-text-box commu-detail-title">
					${communityBoard.title}
				</div>
				<div class="commu-detail-text-box">
					${communityBoard.user.username}
				</div>
			</div>

			<div style="height: 20px"></div>

			<div>
				<div class="commu-detail-div-content-container">
					<span id="communityContent"
						class="commu-detail-span-content commu-detail-text">${communityBoard.content}</span>
				</div>
			</div>

			<div style="height: 20px"></div>

			<div>
				<div class="commu-detail-reply-first-line-box">
					<button id="commu-btn-insert"
						class="commu-detail-btn-up commu-detail-btn"
						onclick="commu.insertReply(${communityBoard.id}, ${principal.user.id})">up</button>
				</div>
				<div>
					<input type="text" placeholder="한 마디"
						id="commu-input-reply-${communityBoard.id}"
						class="commu-detail-input-reply commu-detail-input" />
				</div>
			</div>

			<div style="height: 20px"></div>

			<div class="commu-detail-reply-container">
				<c:forEach var="reply" items="${communityBoard.replies}">
					<div id="commu-reply-${reply.id}">
						<input id="replyId" type="hidden" value="${reply.id}" />
						<div class="commu-detail-reply-firstline-container">
							<span class="commu-detail-reply-user commu-detail-reply-text">${reply.user.username}</span>
							<div id="commu-detail-reply-btn-box">
								<c:if test="${reply.user.id == principal.user.id}">

									<button onclick="commu.updateBtnReply()"
										class="commu-detail-btn-reply-update commu-detail-btn-reply">
										수정</button>
									<button onclick="commu.deleteReply()"
										class="commu-detail-btn-reply-delete commu-detail-btn-reply">
										삭제</button>
								</c:if>
							</div>
						</div>
						<div id="commu-detail-reply-content-box-${reply.user.id}">
							<textarea id="commu-detail-reply-origin-content-${reply.user.id}"
								class="commu-detail-reply-content commu-detail-reply-text"
								readonly>${reply.content}</textarea>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
		<div style="height: 70px"></div>
	</div>
</div>
<script src="/js/commu.js">

</script>
<script>
	$(document).ready(function () {
		if($("#commu-detail-reply-origin-content").val() != null){
			fixTextAreaHeight();
		}
	});
	
	// 댓글 불러온것 뿌릴때 태그의 높이 지정해줌
	function fixTextAreaHeight() {
	  var textEle = $(".commu-detail-reply-content");
	  textEle[0].style.height = "auto";
	  var textEleHeight = textEle.prop("scrollHeight");
	  textEle.css("height", textEleHeight);
	}

</script>
</body>
</html>
