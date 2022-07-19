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
				
		success : function(boardList){						
			console.log("통신 성공");
			console.log(boardList[0]);
			addElement(boardList[0]);
			
			},
		error :function(){
			alert("request error!");
			}
		
		}); 
			
	}   
	

function addElement(communityBoard) {
	let childElement = `<li class="card lCard">
            <div class="commu-container">
              <div class = "leftImgBox">
                <img class="commu-img" alt="" src="http://localhost:9090/upload/${communityBoard.imageUrl}"/>
              </div>
			
              <div class="div-main-container">
                <div>
                  <button class="btn-good">Good Look</button>
                  <span class="span-goodlook-count commu-text">1,000K</span>
                </div>

                <hr class="hr-goodlook-line" />

                <div class="div-title-container">
                  <h3 class="commu-text today_daily">${communityBoard[8]}</h3>
                </div>
                <div class="div-title-container">
                  <span class="p-username commu-text">${communityBoard[2][1]}</span>
                </div>

                <div>
                  <div class="div-content-container">
                    <div class="span-content">
                      ${communityBoard[2]}
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
      
      console.log(childElement);
          
      $("#card lCard").append(childElement);
          
         
          
}

