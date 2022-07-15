let index = {
	init: function() {
		$("#btn-save").bind("click", ()=> {
			console.log("버튼 클릭");
			this.save(); 
		});
	},
	
	save: function() {
		
		let data = {
			title: $("#title").val(),
			image: $("#image").val(),
			content: $("#content").val()
		}
		
		console.log(data);
	}
}

index.init();