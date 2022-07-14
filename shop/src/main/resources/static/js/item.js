let index = {
	
	init: function() {
		$("#btn-save").bind("click", () => {
			this.save();
		});
		
		$("#btn-delete").bind("click", () => {
			this.deleteById();
		});
		
		$("#btn-update").bind("click", () => {
			this.update();
		});

		$("#btn-reply-save").bind("click", () => {
			this.replySave();
		});
		/*
		$("#btn-put-cart").bind("click", () =>{
			this.putItemCart();
		});
		*/
	},
	
	save: function() {
		
		// 데이터 가져오기
		let data = {
			category: $("#category").val(),
			content: $("#content").val(),
			gender: $("#gender").val(),
			imageurl: $("#imageurl").val(),
			name: $("#name").val(),
			price: $("#price").val()
		}
		
		console.log("데이터 확인");
		console.log(data);
		
		$.ajax({
			type: "POST",
			url: "/api/item",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		})
		.done(function(data, textStatus, xhr) {
			if(data.status) {
				alert("새로운 제품을 추가했습니다.");
				location.href = "/";
			}
		})
		.fail(function(error) {
			alert("제품 추가를 실패했습니다.");
		});
	},
	
	deleteById: function() {
		let id = $("#board-id").text();
		
		$.ajax({
			type:"DELETE",
			url: "/api/board/" + id // 페이지x 데이터 리턴
		}) 
		.done(function(data) {
			if(data.status) {
				alert("삭제가 완료되었습니다.");
				location.href="/";
			}
		})
		.fail(function() {
			alert("삭제 실패.");
		});
	},
	
	update: function() {
		let boardId = $("#id").val();
		
		let data = {
			title: $("#title").val(),
			content: $("#content").val(),
			price: $("#price").val(),
			imgUrl: $("#imgUrl").val()
		}
		
		$.ajax({
			type: "PUT",
			url: "/api/board/" + boardId,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			async: false // 필요에 따라 동기적으로 받을 때 true 지정
		})
		.done(function(data) {
			if(data.status) {
				alert("글 수정이 완료되었습니다.");
				location.href="/";
			}
		})
		.fail(function(error) {
			alert("글 수정에 실패하였습니다.")
		});
	},
	
	// 댓글 등록
	replySave: function() {

		// 데이터 가져오기 (boardId : 해당 게시글 id)
		let data = {
			boardId: $("#board-id").text(),
			content: $("#reply-content").val()
		}
		
		console.log("데이터 확인");
		console.log(data);
		
		// ``백틱 (자바스크립트 변수를 문자열 안에 넣어서 사용할 수 있다.)
		$.ajax({
			type: "POST",
			url: `/api/board/${data.boardId}/reply`,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		})
		.done(function(response) {
			if(response.status) {
				// if문 안에 숫자 무조건 true 처리됨
				// response - int status, T data
				console.log("if : " + response.status);
				console.log(response.data);
				addReplyElement(response.data);
			}
		})
		.fail(function(error) {
			alert("댓글 작성에 실패하였습니다.");
			console.log(error);
		});
		
	}, // end of replySave
	
	replyDelete: function(boardId, replyId) {
		
		$.ajax({
			type: "DELETE",
			url: `/api/board/${boardId}/reply/${replyId}`,
			dataType: "json"
		})
		.done(function(response) {
			console.log(response);
			alert("댓글 삭제 성공");
			location.href=`/board/${boardId}`
		})
		.fail(function() {
			console.log(response);
			alert("댓글 삭제 실패");
		});
	},
	
	putItemCart: function(boardid, userid) {
	 	// 데이터 가져오기
		let bid = boardid; 
		let uid = userid; 
		console.log("데이터 확인");
		console.log(bid);
		console.log(uid);
		
		$.ajax({
			type: "POST",
			url: `/api/cart/${bid}`,
			dataType: "json"
		})
		.done(function(data) {
			if(data.status) {
				alert("장바구니에 추가되었습니다.");
				location.href = `/board/cart_form/${uid}`;
			}
		})
		.fail(function(error) {
			alert("장바구니에 추가하지 못했습니다.");
		});
		
	},
	
	topright: function(boardid, userid) {
	 	// 데이터 가져오기
		let bid = boardid; 
		let uid = userid; 
		console.log("데이터 확인");
		console.log(bid);
		console.log(uid);
		
		$.ajax({
			type: "DELETE",
			url: `/api/cart/${bid}`,
			dataType: "json"
		})
		.done(function(data) {
			if(data.status) {
				alert("상품을 취소하였습니다.");
				location.href = `/board/cart_form/${uid}`;
			}
		})
		.fail(function(error) {
			alert("취소하지 못했습니다.");
		});
		
	}
	
}

function addReplyElement(reply) {
	let principalId = $("#principal-id").val();
	
	let childElement = `<li class="list-group-item d-flex justify-content-between" id="reply--${reply.id}">
			<div>${reply.content}</div>
			<div class="d-flex">
				<div>작성자 : ${reply.user.username}&nbsp;&nbsp;</div>
				<c:if test="${reply.user.id == principalId}">
					<button class="badge badge-danger" onclick="index.replyDelete(${reply.board.id}, ${reply.id});">삭제</button>				
				</c:if>
			</div>
		</li>`;
	
	// === 데이터 타입까지 같은가
	$("#reply--box").prepend(childElement); // 앞으로 붙임
	$("#reply-content").val("");
}

index.init();