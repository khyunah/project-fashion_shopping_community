<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="layout/header.jsp" %>

    <div class="mainWrap">
      <div class="cardWrap cardWrapLeft">
      <input id="pageSize" type="hidden" value="${communityBoardList.pageable.pageSize}">
	  <input id="pageNumber" type="hidden" value="${communityBoardList.number}">
      <input id="itemList" type="hidden" value="${itemList}">  
      
        <ul class="card-list leftCards">
		<%@ include file="community/add_community_index.jsp" %>
        </ul>
      </div>

      <div class="cardWrap cardWrapRight">
        <div class="container index-container">
          
          <div class="card cardRight">
            <div>
            <img class="cardRightImgBox" src="${itemList[0].imageurl}">
            </div>
            <div class="card-body index-card-body">
              <h4 class="card-title">${itemList[0].name}</h4>
              <p class="card-text">${itemList[0].price}</p>
              <button class="cardRightBtn">See Detail</button>
            </div>
          </div>

          <div class="card cardRight">
            <div>
            <img class="cardRightImgBox" src="${itemList[1].imageurl}">
            </div>
            <div class="card-body index-card-body">
              <h4 class="card-title">${itemList[1].name}</h4>
              <p class="card-text">${itemList[1].price}</p>
              <button class="cardRightBtn">See Detail</button>
            </div>
          </div>

          <div class="card cardRight">
            <div>
            	<img class="cardRightImgBox" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJ6yI5v-1UCyMx8CdTpABg9QzItPHcPLZh7_1ZnzOpTg&s">
            </div>
            <div class="card-body index-card-body">
              <h4 class="card-title">3</h4>
              <p class="card-text">Some example text3.</p>
              <button class="cardRightBtn">See Detail</button>
            </div>
          </div>

          <div class="card cardRight">
            <div>
            <img class="cardRightImgBox" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJ6yI5v-1UCyMx8CdTpABg9QzItPHcPLZh7_1ZnzOpTg&s">
            </div>
            <div class="card-body index-card-body">
              <h4 class="card-title">4</h4>
              <p class="card-text">Some example text4.</p>
              <button class="cardRightBtn">See Detail</button>
            </div>
          </div>
        </div><!-- container -->
      </div>
 
      <!--cardWrap-->
    </div>
    <!--mainWrap-->

    </body>
    
  <script src="/js/commu.js"></script>
  <script src="/js/index_scroll.js"></script>
  <script>history.scrollRestoration = "manual"</script>

    </html>