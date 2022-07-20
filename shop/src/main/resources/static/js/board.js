let index = {
	init: function() {
		$("#btn-delete").bind("click", ()=> {
			this.deleteById(); 
		});

		$("#btn-update").bind("click", ()=> {
			this.update(); 
		});


	},
	
	
	deleteById: function() {	
		
		let id = $("#board-id").text();
		
		$.ajax({			
			type:"DELETE",
			url:`/api/board/${id}`
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
	
	
	update: function() {
		
		
		let boardId = $("#id").val();
		
		let data = {
			title: $("#title").val(),
			content: $("#content").val()
		}	
		
		$.ajax({
			type: "PUT",
			url: `/api/board/${boardId}`,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			async: false
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
		
	}
	

	
}




index.init();