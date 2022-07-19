$(function(){
	let index = 0;
	$(window).scroll(function() {
		let $window = $(this);
		let scrollTop = $window.scrollTop();
		let windowHeight = $window.height();
		let documentHeight = $(document).height();
		
		if(scrollTop + windowHeight + 1 >= documentHeight) {
			index++;
			console.log("들어옴")
			request();
		}		
		
	})
})

function request(){
   
	$.ajax({
		url: "/api/boardList",
		type: "GET", 
				
		success : function(data){						
			console.log(data);
			alert("통신 성공")
			},
		error :function(){
			alert("request error!");
			}
		
		}); 
			
	}    

