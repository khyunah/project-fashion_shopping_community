let commu_detail = {
	
	init: function(){
		$("#commu-detail-btn-up").bind('click', () => {
			this.insertReply();
		});
		
		$(".commu-detail-btn-reply-update").bind('click', () => {
			this.updateBtnReply();
		});
		
		$("#commu-detail-like-icon-box").bind('click', () => {
			this.communityLike();
		});
		
		$(document).on('click', ".commu-detail-btn-reply-update-finish", function(){
			commu_detail.finishUpdateReply();
		});
		

		
		$("#commu-detail-btn-delete").bind('click', () => {
			this.boardDelete();
		});
		
	},
	
	// 댓글쓰기
	insertReply: function() {
		let communityBoardId = $("#communityBoardId").val();
		let userId = $("#userId").val();
		
		let data = {
			content: $("#commu-input-reply").val(),
		}

		$.ajax({
			type: "POST",
			url: `/community/reply-insert/${communityBoardId}`,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(response){
			console.log("성공");
			console.log(response);
			addReply(response.data, userId);
		}).fail(function(error){
			console.log("실패");
		});
	},
	
	// 댓글 삭제
	deleteReply: function(){
		let id = $("#replyId").val();
		
		$.ajax({
			type: "GET",
			url: `/community/reply-delete/${id}`,
			dataType: "json"
		}).done(function(response){
			console.log("성공");
			// 삭제 성공하면 해당 html 삭제해주기 비동기방식으로 해보기 
			removeReply(id);
		}).fail(function(error){
			console.log("실패");
		})
	},
	
	// 댓글 수정버튼 클릭시 
	updateBtnReply: function(){
		changeReply();
	},
	
	// 댓글 수정 완료시 
	finishUpdateReply: function(){
		console.log("완료버튼 누름");
		let data = {
			id: $("#replyId").val(),
			content: $(".commu-detail-reply-content").text(),
		}
		console.log(data.content); 
		
		$.ajax({
			type: "POST",
			url: `/community/reply-update`,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(response){
			console.log("성공");
			console.log(response);

		}).fail(function(error){
			console.log("실패");
		});
	},
	
	// 좋아요
	communityLike: function(){
		let communityBoardId = $("#communityBoardId").val();
		let likeCount = $("#likeCount").text();
		
		$.ajax({
			type: "GET",
			url: `/community/check-like/${communityBoardId}`,
			dataType: "json"
		}).done(function(response){
			changeLikeIcon(response, likeCount);
		}).fail(function(error){
			alert('서버오류 ! 다시 실행해주세요.');
		});
	}, 
	
	
	boardUpdate: function() {
		let id = $("#boardId").val();
		let data = {
			title: $("#communityBoardTitle").val(),
			content: $("#communityBoardContent").val()
		}
		
		$.ajax({
			type: "PUT",
			url: `/api/board/${id}`,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		})
		.done(function(data) {
			if(data.status) {
				alert("글 수정이 완료 되었습니다");
				location.href="/";
			}
		})
		.fail(function(error){
			alert("글 쓰기에 실패하였습니다");			
		});
	},
	
	
	
	boardDelete: function() {
		let boardId = $("#communityBoardId").val();
		$.ajax({			
			type:"DELETE",
			url:`/api/board/${boardId}`
		})
		.done(function(data){
			if(data.status) {
				alert("삭제가 완료되었습니다.");
				location.href = "/";
			}
		})
		.fail(function(){
			alert("삭제에 실패했습니다.");
		});
	},
	

}

// 댓글 추가 
function addReply(reply, userId){
	let childReply = `
		<div id="commu-reply-${reply.id}">
			<input id="replyId" type="hidden" value="${reply.id}"/>
			<div class="commu-detail-reply-firstline-container">
		      <span class="commu-detail-reply-user commu-detail-reply-text">${reply.user.username}</span>
		      <div id="commu-detail-reply-btn-box">
              	<c:if test="${reply.user.id == userId}">
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
	`;
	
	$(".commu-detail-reply-container").prepend(childReply);
	$("#commu-input-reply").val("");
}

function removeReply(replyId){
	
	$(`#commu-reply-`+ replyId).remove();
}

// 댓글 수정버튼 클릭시 
function changeReply(){
	
	let finishBtn = `
		<button class="commu-detail-btn-reply-update-finish commu-detail-btn-reply">
          완료
        </button>
	`;
	
	$("#commu-detail-reply-btn-box").prepend(finishBtn);
	document.getElementById("commu-detail-reply-content-box").innerHTML =
		`<textarea id="commu-detail-reply-content" class="commu-detail-reply-content commu-detail-reply-text">${reply.count}</textarea>`;
}

// 좋아요 아이콘 변경 함수
function changeLikeIcon(response, likeCount){
	if(response.data == null){
		document.getElementById("commu-detail-like-icon-box").innerHTML =
			'<i style="color: black" id="before-like" class="fa-regular fa-heart fa-lg"></i>';
		likeCount--;
		$("#likeCount").text(likeCount);
	} else {
		document.getElementById("commu-detail-like-icon-box").innerHTML =
			'<i class="fa-solid fa-heart fa-lg" style="color: rgb(240, 81, 115)"></i>';
		likeCount++;
		$("#likeCount").text(likeCount);
	}
}

commu_detail.init();
