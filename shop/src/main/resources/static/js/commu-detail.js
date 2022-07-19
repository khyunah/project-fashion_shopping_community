let commu_detail = {
	
	init: function(){
		$("#commu-detail-btn-up").bind('click', () => {
			this.replyInsert();
		});
		
		$("#commu-detail-like-icon-box").bind('click', () => {
			this.communityLike();
		});
		
	},
	
	replyInsert: function() {
		//let communityBoardId = $("#communityBoardId").val();
		let communityBoardId = 1;
		
		let data = {
			content: $("#commu-input-reply").val(),
		}
		console.log(data.replyContent);
		
		$.ajax({
			type: "POST",
			url: `/community/reply-insert/${communityBoardId}`,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(response){
			console.log("성공");
			console.log(response);
			addReply(response.data)
		}).fail(function(error){
			console.log("실패");
		});
	},
	
	communityLike: function(){
		let communityBoardId = $("#communityBoardId").val();
		let likeCount = $("#likeCount").text();
		
		$.ajax({
			type: "GET",
			url: `/community/check-like/1`, // 화면에 랜더링 작업하고나서 보드 번호  변수로 주소 변경 해주기 
			dataType: "json"
		}).done(function(response){
			changeLikeIcon(response, likeCount);
		}).fail(function(error){
			alert('서버오류 ! 다시 실행해주세요.');
		});
	}, 

}

// 댓글 추가 
function addReply(reply){
	let childReply = `
		<div class="commu-detail-reply-firstline-container">
          <span class="commu-detail-reply-user commu-detail-reply-text">${reply.user.username}</span>
          <div>
            <button class="commu-detail-btn-update commu-detail-btn-reply">
              수정
            </button>
            <button class="commu-detail-btn-delete commu-detail-btn-reply">
              삭제
            </button>
          </div>
        </div>
        <textarea class="commu-detail-reply-content commu-detail-reply-text">${reply.content}</textarea>
	`;
	
	$(".commu-detail-reply-container").prepend(childReply);
	$("#commu-input-reply").val("");
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
