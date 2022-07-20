<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

	<input id="communityBoardId" type="hidden" value="${communityBoard.id}"/>
	<input id="userId" type="hidden" value="${principal.user}"/>

    <div class="commu-detail-center-container">
      <div class="commu-detail-container">
        <div class="commu-detail-img-container">
        <!-- ---------------------------------
	        TODO 
	        이미지 주소 사용자가 올린 주소로 고치기  
        ---------------------------------- -->
          <img class="commu-detail-img" alt="" src="http://localhost:9090/upload/${communityBoard.imageUrl}" />
        <button id="commu-detail-btn-update" class="commu-detail-btn-up commu-detail-btn">수정</button>
		 <button id="commu-detail-btn-delete" class="commu-detail-btn-up commu-detail-btn">삭제</button>
        </div>

        <div class="commu-detail-trim"></div>

        <div class="commu-detail-div-main-container">
          <div>
            <div class="commu-detail-like-icon-box" id="commu-detail-like-icon-box">
		        
		        <c:choose>
		        	<c:when test="${like.user.username != null}">
		        		<i class="fa-solid fa-heart fa-lg" style="color: rgb(240, 81, 115)"></i>
		        	</c:when>
		        	<c:otherwise>
		        		<i style="color: black" id="before-like" class="fa-regular fa-heart fa-lg"></i>
		        	</c:otherwise>
		        </c:choose>
		        
            </div>
            <span id="likeCount" class="commu-detail-span-goodlook-count commu-detail-text">${communityBoard.likeCount}</span>
        	 
          </div>

          <hr class="hr-goodlook-line" />

          <div style="height: 10px"></div>

          <div>
            <div class="commu-detail-div-title-container">
              <p id="communityTitle" class="commu-detail-text commu-detail-title">${communityBoard.title}</p>
            </div>
            <div class="commu-detail-div-title-container">
              <span class="p-username commu-detail-text">${communityBoard.user.username}</span>
            </div>
          </div>

          <div style="height: 20px"></div>

          <div>
            <div class="commu-detail-div-content-container">
              <span id="communityContent" class="commu-detail-span-content commu-detail-text">${communityBoard.content}</span>
            </div>
          </div>

          <div style="height: 20px"></div>

          <div>
          	<div class="commu-detail-reply-first-line-box">
          		<i class="fa-regular fa-pen-to-square"></i>
            	<button id="commu-detail-btn-up" class="commu-detail-btn-up commu-detail-btn">up</button>
          	</div>
            <div>
              <input
                type="text"
                placeholder="한 마디"
                id="commu-input-reply"
                class="commu-input-reply commu-detail-input"/>
            </div>
          </div>
          
          <div style="height: 20px"></div>

          <div class="commu-detail-reply-container">
          	<c:forEach var="reply" items="${communityBoard.replies}">
          		<div id="commu-reply-${reply.id}">
          			<input id="replyId" type="hidden" value="${reply.id}"/>
	          		<div class="commu-detail-reply-firstline-container">
		              <span class="commu-detail-reply-user commu-detail-reply-text">${reply.user.username}</span>
		              <div id="commu-detail-reply-btn-box">
		              	<c:if test="${reply.user.id == principal.user.id}">
		              		<button onclick="commu_detail.updateBtnReply()" class="commu-detail-btn-reply-update commu-detail-btn-reply">
			                  수정
			                </button>
			                <button onclick="commu_detail.deleteReply()" class="commu-detail-btn-reply-delete commu-detail-btn-reply">
			                  삭제
			                </button>
		              	</c:if>
		              </div>
		            </div>
		            <div id="commu-detail-reply-content-box">
		            	<textarea class="commu-detail-reply-content commu-detail-reply-text" readonly>${reply.content}</textarea>
		            </div>
          		</div>
          	</c:forEach>
            
          </div>
        </div>
        <div style="height: 70px"></div>
      </div>
    </div>
<script src="/js/commu-detail.js">

</script>
<script>
	$(document).ready(function () {
	  fixTextAreaHeight();
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
