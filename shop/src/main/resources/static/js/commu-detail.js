let commu_detail = {
	
	init: function(){
		$(".commu-detail-btn-up").bind('click', () => {
			this.replyInsert();
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
	}
	
}