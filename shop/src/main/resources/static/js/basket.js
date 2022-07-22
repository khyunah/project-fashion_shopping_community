

let index2 = {
	
		init: function() {
			$("#inputCart").bind("click", () => {
				this.putItemCart();
			});
	
		},

		putItemCart: function() {
			let itemId = $("#inputCart").val();
			
			let data = {
				itemId: $('#inputCart').val()
			}		
			
		$.ajax({
			type: "POST",
			url: `/test/api/cart?itemId=${itemId}`,
			dataType: "json"
		})
		.done(function(data) {
				alert("장바구니에 추가되었습니다.");
		})
		.fail(function(error) {
			alert("장바구니에 추가하지 못했습니다.");
		});
		
	}, 
	
	
	

}

index2.init();

	 function basketItemDelete(basket) {
		
		
		
		$.ajax({
			type: "DELETE",
			url: `/test/api/basket/${basket}`,
			dataType: "json"
		})
		.done(function(res) {
			console.log();
			location.href=`/shop/basket_form/${res.data}`
		})
		.fail(function() {
			alert("취소 실패");
		});
		}
		