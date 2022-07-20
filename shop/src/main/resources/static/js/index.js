const result = document.querySelector('#result')
let pageSize = $("#pageSize").val();
let pageNumber = $("#pageNumber").text();
window.addEventListener('scroll',function(){ //스크롤 할 경우 
	result.innerHTML = window.pageYOffset //현재 스크롤 위치값을 반환합니다.

	if(result.getBoundingClientRect().bottom < 764){
		if(pageSize != pageNumber + 1){
			console.log(result.getBoundingClientRect().bottom);
			xhr_();
		}
	}
});

let xhr_ = function(){
	//let pageNumber = $("#pageNumber").text();
	const xhr = new XMLHttpRequest();
	const method = "GET";
	const url = `http://localhost:9090/community/social-add?page=${pageNumber + 1}`;
	pageNumber++;
	$("#pageNumber").text(pageNumber);
	
	// 요청을 초기화 합니다.
	xhr.open(method, url);
	
	// onreadystatechange 이벤트를 이용해 요청에 대한 응답 결과를 처리합니다.
	xhr.onreadystatechange = function (event) {
	    const { target } = event;
	
	    if (target.readyState === XMLHttpRequest.DONE) {
	        const { status } = target;
	        
	        if (status === 0 || (status >= 200 && status < 400)) {
	            // 요청이 정상적으로 처리 된 경우
	            console.log('성공');
	            $(".q-container").append(xhr.responseText);
	        } else {
	            // 에러가 발생한 경우
	            console.log('실패');
	        }
	    }
	};

// 서버에 요청을 보냅니다.
xhr.send();

}
