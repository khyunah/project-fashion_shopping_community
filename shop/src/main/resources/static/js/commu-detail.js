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
		let data = {
			replyContent: $(".commu-input-reply").val()
		}
		
		$.ajax({
			type: "POST",
			url: "",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8'",
			dataType: "json"
		}).done(function(response){
			console.log("성공");
		}).fail(function(error){
			console.log("실패");
		});
	},
	
	communityLike: function(){
		let communityBoardId = $("#communityBoardId").val();
		let likeCount = $("#likeCount").text();
		console.log(likeCount);

		$.ajax({
			type: "GET",
			url: `/community/check-like/1`, // 화면에 랜더링 작업하고나서 보드 번호  변수로 주소 변경 해주기 
			dataType: "json"
		}).done(function(response){
			likeChange(response, likeCount);
		}).fail(function(error){
			alert('서버오류 ! 다시 실행해주세요.');
		});
	}
}

function likeChange(response, likeCount){
	if(response.data == null){
		document.getElementById("commu-detail-like-icon-box").innerHTML =
			'<i style="color: black" id="before-like" class="fa-regular fa-heart fa-lg"></i>';
		console.log("좋아요 취소중 " + likeCount);
		likeCount--;
		$("#likeCount").text(likeCount);
	} else {
		document.getElementById("commu-detail-like-icon-box").innerHTML =
			'<i class="fa-solid fa-heart fa-lg" style="color: rgb(240, 81, 115)"></i>';
		console.log("좋아요중 " + likeCount);
		likeCount++;
		$("#likeCount").text(likeCount);
	}
}

commu_detail.init();
