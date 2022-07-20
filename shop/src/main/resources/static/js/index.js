let loading = false;

$(function(){
	$(window).scroll(function() {
		let $window = $(this);
		
		if($window.scrollTop() + $window.height() + 1 >= $(document).height()) {
			request();
		}		
		
	})
})

function request(){
   if(!loading){
	loading = true;

   
	$.ajax({
		url: "/api/boardList",
		type: "GET", 
		})
		.done(function(boardList){
			addElement(boardList);
			loading = false;
		}) 

	}

}   
	

		
function addElement(communityBoard) {
	console.log(communityBoard);
	let childElement = `<li id="card-list" class="card lCard">
            <div class="commu-container">
              <div class = "leftImgBox">
                <img class="commu-img" alt="" src="http://localhost:9090/upload/${communityBoard[0].imageUrl}"/>
              </div>
			
              <div class="div-main-container">
                <div>
                  <button class="btn-good">Good Look</button>
                  <span class="span-goodlook-count commu-text">1,000K</span>
                </div>

                <hr class="hr-goodlook-line" />

                <div class="div-title-container">
                  <h3 class="commu-text today_daily">${communityBoard[0].title}</h3>
                </div>
                <div class="div-title-container">
                  <span class="p-username commu-text">${communityBoard[0].userId}</span>
                </div>

                <div>
                  <div class="div-content-container">
                    <div class="span-content">
                      ${communityBoard[0].content}
                    </div>
                  </div>
                </div>

                <div class="commu-bottom-wrap">
                  <i class="fa-regular fa-pen-to-square"></i>
                  <button class="btn-up">up</button>

                  <input type="text" placeholder="한 마디" class="input-reply commu-input" />
                </div>

              </div>
            </div>
          </li>`;
        
      $("#card-list").append(childElement);
          
         
          
}

