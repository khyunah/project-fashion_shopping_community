<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="layout/header.jsp" %>

    <div class="mainWrap">
      <div class="cardWrap cardWrapLeft">
      <input id="pageSize" type="hidden" value="${communityBoardList.pageable.pageSize}">
	  <input id="pageNumber" type="hidden" value="${communityBoardList.number}">

        <ul class="card-list leftCards">

		<%@ include file="community/add_community_index.jsp" %>

        </ul>

      </div>

      <div class="cardWrap cardWrapRight">
        <div class="container index-container">
          <div class="card cardRight">
            <div class="cardRightImgBox">
            </div><!-- mainImageBox -->
            <div class="card-body index-card-body">
              <h4 class="card-title">John Doe</h4>
              <p class="card-text">Some example text.</p>
              <button class="cardRightBtn">See Detail</button>
            </div>
          </div>

          <div class="card cardRight">
            <div class="cardRightImgBox">
            </div><!-- mainImageBox -->
            <div class="card-body index-card-body">
              <h4 class="card-title">John Doe</h4>
              <p class="card-text">Some example text.</p>
              <button class="cardRightBtn">See Detail</button>
            </div>
          </div>

          <div class="card cardRight">
            <div class="cardRightImgBox">
            </div><!-- mainImageBox -->

            <div class="card-body index-card-body">
              <h4 class="card-title">John Doe</h4>
              <p class="card-text">Some example text.</p>
              <button class="cardRightBtn">See Detail</button>
            </div>
          </div>

          <div class="card cardRight">
            <div class="cardRightImgBox">
            </div><!-- mainImageBox -->
            <div class="card-body index-card-body">
              <h4 class="card-title">John Doe</h4>
              <p class="card-text">Some example text.</p>
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