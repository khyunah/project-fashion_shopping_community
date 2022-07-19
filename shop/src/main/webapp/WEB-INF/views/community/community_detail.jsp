<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

	<input id="communityBoardId" type="hidden" value="${communityBoard}"/>
	<input id="communityReplyUser" type="hidden" value="${principal.user}"/>

    <div class="commu-detail-center-container">
      <div class="commu-detail-container">
        <div class="commu-detail-img-container">
          <img class="commu-detail-img" alt="" src="/image/model1.jpg" />
        </div>

        <div class="commu-detail-trim"></div>

        <div class="commu-detail-div-main-container">
          <div>
            <div class="commu-detail-like-icon-box" id="commu-detail-like-icon-box">
              <i style="color: black" id="before-like" class="fa-regular fa-heart fa-lg"></i>
            </div>
            <!--<button class="btn-good commu-btn">Good Look</button>-->
            <span id="likeCount" class="commu-detail-span-goodlook-count commu-detail-text">0</span>
          </div>

          <hr class="hr-goodlook-line" />

          <div style="height: 10px"></div>

          <div>
            <div class="commu-detail-div-title-container">
              <p class="commu-detail-text commu-detail-title">
                오늘의 데일리룩오늘의 데일리룩오늘의 데일리룩오늘의 데일리룩
              </p>
            </div>
            <div class="commu-detail-div-title-container">
              <span class="p-username commu-detail-text">_hh______</span>
            </div>
          </div>

          <div style="height: 20px"></div>

          <div>
            <div class="commu-detail-div-content-container">
              <span class="commu-detail-span-content commu-detail-text">
                Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nisi,
                eius cumque vitae temporibus architecto fuga ducimus dolor
                voluptatum repudiandae libero ariatur. Temporibus laborum illo
                sunt saepe voluptatem architecto neque aliquam. Lorem, ipsum
                dolor sit amet consectetur adipisicing elit. Nisi, eius cumque
                vitae temporibus architecto fuga ducimus dolor voluptatum
                repudiandae libero ariatur. Temporibus laborum illo sunt saepe
                voluptatem architecto neque aliquam. Lorem, ipsum dolor sit amet
                consectetur adipisicing elit. Nisi, eius cumque vitae temporibus
                architecto fuga ducimus dolor voluptatum repudiandae libero
                ariatur. Temporibus laborum illo sunt saepe voluptatem
                architecto neque aliquam. Lorem, ipsum dolor sit amet
                consectetur adipisicing elit. Nisi, eius cumque vitae temporibus
                architecto fuga ducimus dolor voluptatum repudiandae libero
                ariatur. Temporibus laborum illo sunt saepe voluptatem
                architecto neque aliquam. Lorem, ipsum dolor sit amet
                consectetur adipisicing elit. Nisi, eius cumque vitae temporibus
                architecto fuga ducimus dolor voluptatum repudiandae libero
                ariatur.
              </span>
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
            <div class="commu-detail-reply-firstline-container" id="reply-${reply.id}">
              <span class="commu-detail-reply-user commu-detail-reply-text">작성자</span>
              <div id="commu-detail-reply-btn-box">
                <button class="commu-detail-btn-reply-update commu-detail-btn-reply">
                  수정
                </button>
                <button class="commu-detail-btn-reply-delete commu-detail-btn-reply">
                  삭제
                </button>
              </div>
            </div>
            <div id="commu-detail-reply-content-box">
            	<textarea
	              class="commu-detail-reply-content commu-detail-reply-text"
	              readonly>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tenetur ea tempore nam veniam optio ut voluptatem dignissimos natus autem deleniti illum, cumque magnam porro unde corporis sint quaerat quo molestias!
	            </textarea>
            </div>
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
