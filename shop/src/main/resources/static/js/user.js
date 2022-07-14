let user = {
	init: function(){
		$("#btn-update").bind("click", () => {
			this.update();
		});
	},
	
	update: function(){
		let data = {
			id: $("#id").val(),
			username: $("#username").val(),
			password: $("#password").val(),
			name: $("#name").val(),
			email: $("#email").val(),
			address: $("#address").val(),
			phoneNumber: $("#phoneNumber").val()
		}
		
		console.log(JSON.stringify(data));

		$.ajax({
			type: "PUT",
			url: "/user/update",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(response){
			console.log(response.data)
			if(response.data.username != null){
				alert("회원정보 수정이 완료되었습니다.");
				location.href = "/user/update_form";
			}
		}).fail(function(){
			alert("회원정보 수정이 정상 처리되지 않았습니다.");
		});
	}
}

user.init();
