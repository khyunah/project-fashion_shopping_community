let index = {
	
	init: function() {
		$("#btn-save").bind("click", () => {
			this.save();
		});
		
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
				location.href = "/shop/save_form";
			}
		})
		.fail(function(error) {
			alert("제품 추가를 실패했습니다.");
		});
	}
	}

index.init();