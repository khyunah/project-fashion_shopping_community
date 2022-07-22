let domain;

let index = {	
	getDomain: function(){
		$.ajax({
			type: "get",
			url: "/test/api/getDomain",
			dateType:"json",
			success: function(res){
				domain = res
				index.genderCategory();
				index.init();
			}
		}).fail(function() {
			index.getDomain();
		});
	},

	init: function() {
		$("#btn-save").bind("click", () => {
			this.save();
		});
		$("#gender").change("change", () => {
			this.genderCategory();
		});
		$("#btn-reply-save").bind("click", () => {
			this.replySave();
		});
	},
	
	genderCategory : function() {
		if($("#gender").val() == 'MAN') {	
			loadCategory('MAN');
			$("#category").change("change", () => {
			categorySize();
		});
			
		}else if($("#gender").val() == 'WOMAN'){
			loadCategory('WOMAN');
			$("#category").change("change", () => {
			categorySize();
		});	
		}
		
	},
		
	save: function() {

		// 데이터 가져오기
		let data = {
			category: $("#category").val(),
			content: $("#content").val(),
			gender: $("#gender").val(),
			imageurl: $("#imageurl").val(),
			name: $("#name").val(),
			price: $("#price").val(),
			size: $("#size").val(),
			color: $("#color").val()
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
				if (data.status) {
					alert("새로운 제품을 추가했습니다.");
					location.href = "/shop/save_form";
				}
			})
			.fail(function(error) {
				alert("제품 추가를 실패했습니다.");
			});
	},
	
}
index.getDomain();

function loadCategory(gender){
	var cell = document.getElementById("category");
	while ( cell.hasChildNodes()){
		cell.removeChild( cell.firstChild );
	}
	let category = domain.genderCategory[gender];	
	
	category.forEach((item)=>{
		let option =`<option value="${item}">${item}</option>`;
		$("#category").append(option);
	}); 
}


function categorySize(){
	
	var cell = document.getElementById("size");
	while (cell.hasChildNodes()){
		cell.removeChild( cell.firstChild );       
	}
	let size = domain.categorySize[$("#category").val()];
	
	size.forEach((item)=>{
		let option =`<option value="${item}">${item}</option>`;
		$("#size").append(option);
	})
}

window.onload = function () {
  itemDetailSizeandColor();
};

function itemDetailSizeandColor(){
		
		let data = {
			name :$("#itemname").val(),
			gender: $("#itemgender").val()
		}

		$.ajax({
			type: "POST",
			url: `/test/api/itemdetail`,
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(data),
			dataType: "json"
		}).done(function(data) {
			var colors = [];
			for(var i = 0; i < data.length; i++){
				if(colors.indexOf(data[i].color) == -1){
					colors.push(data[i].color);
					let option =`<option value='${data[i].color}'>${data[i].color}</option>`;
					$("#colors").append(option);
				}
			}
			console.log(colors)
			
			
					
		})
		.fail(function(error) {
		});
}

	