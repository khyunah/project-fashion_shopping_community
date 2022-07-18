function changeBoard() {
	
	let item = $("#mans_shirts").text();
	console.log(item);
	let data ={
		gender: "MAN",
		category: item
	}
	$.ajax({
		type: "POST",
		url: "/test/api/search/${data.gender}/${data.category}",
		contentType: "application/json; charset=utf-8",
		data: JSON.stringify(data),
		dataType: "json" 
	}).done(function(res, data){
		console.log(res)
		location.reload();
	}).fail(function(res){
		
	})
}

function addItem(res){
	
	var cell = document.querySelector("#list-container");
    while (cell.hasChildNodes()){
     cell.removeChild(cell.firstChild );
    }
	

	 
	
}