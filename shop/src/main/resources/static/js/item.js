let domain;

let index = {	
	getDomain: function(){
		$.ajax({
			type: "get",
			url: "/test/api/getDomain"
		}).done(function(res){
			index.insertDomain(res);
			domain = res;
			
			
		}).fail(function() {
			
		});
	},

	init: function() {
		$("#btn-save").bind("click", () => {
			this.save();
		});
		$("#gender").change("change", () => {
			console.log("sdfsdfsdf"+domain);
			this.genderCategory();
		});
		
		
	},
	
	genderCategory : function() {
		if($("#gender").val() == 'MAN') {	
			manCategory();
			console.log($("#gender").val());
			
		}else if($("#gender").val() == 'WOMAN'){
			womanCategory();
			console.log($("#gender").val());
			
		}
	},
	
	categorySize : function() {
		var cell = document.getElementById("size");

		while ( cell.hasChildNodes() )
		{
		     cell.removeChild( cell.firstChild );       
		}
		
		console.log($("#gender").val())
		console.log($("#category-select").val())
		if($("#gender").val() == 'MAN' && $("#category-select").val() == 'SHIRTS') {
			mansShirtsSize();
		}else{

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
	
	insertDomain: function(res){
		domain = res;
	}
}
index.getDomain();
index.genderCategory();
index.init();


function womanCategory(){
	var cell = document.getElementById("category-select");

		while ( cell.hasChildNodes() )
		{
		     cell.removeChild( cell.firstChild );       
		}
	console.log(domain.manCategory);
	domain.womanCategory.forEach((item)=>{
		console.log(item)
		let option =`<option value="${item}">${item}</option>`;
		$("#category-select").append(option);
	});
}

function manCategory(){
	var cell = document.getElementById("category-select");

		while ( cell.hasChildNodes() )
		{
		     cell.removeChild( cell.firstChild );       
		}
	domain.manCategory.forEach((item)=>{
		let option =`<option value="${item}">${item}</option>`;
		$("#category-select").append(option);
	});

}

function mansShirtsSize(){
	manCategory = domain.manCategory;
	console.log(manCategory)
	for(var i = 0; i <manCategory.length; i++){
		let item = manCategory[i]
		let option =`<option value="SHIRTS">${item}element</option>`;
		$("#size").append(option);
	}
}

