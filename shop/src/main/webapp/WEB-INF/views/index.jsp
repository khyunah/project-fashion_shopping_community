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
          
          <c:forEach var="item" items="${itemList}" begin="0" end="3" varStatus="status">
              
          <div class="card cardRight">
            <div>
            <img class="cardRightImgBox" src="${status.current.imageurl}">
            </div>
            <div class="card-body index-card-body">
              <h4 class="card-title">상품명 : ${status.current.name}</h4>
              <p class="card-text">가격 : ${status.current.price}</p>
              <button class="cardRightBtn" onclick="location.href='shop/itemdetail_form/${status.current.id}'">See Detail</button>
            </div>
          </div>

          </c:forEach>
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