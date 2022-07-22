let user = {
	
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

function checkPassword(){
	if($("#checkPasswordResult").text() == "불일치" || $("#checkPasswordResult").text() == ""){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	} else {
		user.update();
		return true;
	}
} 

$(document).ready( function(){
	$( "#password, #passwordCheck" ).keyup( function() {
	      let password = $( "#password" ).val();
	      let passwordCheck = $( "#passwordCheck" ).val();
	      if(password == "" && passwordCheck == "") {
               $("#checkPasswordResult").text("");
           } else if (password == passwordCheck) {
               $("#checkPasswordResult").text("일치");
           } else if (password != passwordCheck) {
               $("#checkPasswordResult").text("불일치");
           }
	});
	
	if($("#isOauth").val() == "kakao"){
		$("input[name=name]").attr("readonly", true);
		$("input[name=email]").attr("readonly", true);
	}
});
