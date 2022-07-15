let index = {
	save : function(){
		$("#btn-save").bind("click", () => {
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


	