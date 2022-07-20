let index2 = {
	
		init: function() {
			$("#inputCart").bind("click", () => {
				this.putItemCart();
			});
		},

		putItemCart: function() {
			let itemId = $("#inputCart").val();
			console.log(itemId);
			
			let data = {
				itemId: $('#inputCart').val()
			}
			
			console.log(data);
			
		$.ajax({
			type: "POST",
			url: `/test/api/cart?itemId=${itemId}`,
			dataType: "json"
		})
		.done(function(data) {
				alert("장바구니에 추가되었습니다.");
				console.log("good");

		})
		.fail(function(error) {
			alert("장바구니에 추가하지 못했습니다.");
		});
		
	}, 
	

}

index2.init();