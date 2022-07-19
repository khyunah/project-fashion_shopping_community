<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ include file="layout/header.jsp" %>

    <div class="mainWrap">
      <div class="cardWrap cardWrapLeft">

        <ul class="card-list leftCards">

		<c:forEach items="${boardList}" var="communityBoard" varStatus="status">
          <%@ include file="index_list.jsp" %>
		</c:forEach>

        </ul>

      </div>



      <div class="cardWrap cardWrapRight">
        <div class="container">
          <div class="card cardRight">
            <div class="cardRightImgBox">
            </div><!-- mainImageBox -->
            <div class="card-body">
              <h4 class="card-title">John Doe</h4>
              <p class="card-text">Some example text.</p>
              <button class="cardRightBtn">See Detail</button>
            </div>
          </div>

          <div class="card cardRight">
            <div class="cardRightImgBox">
            </div><!-- mainImageBox -->
            <div class="card-body">
              <h4 class="card-title">John Doe</h4>
              <p class="card-text">Some example text.</p>
              <button class="cardRightBtn">See Detail</button>
            </div>
          </div>

          <div class="card cardRight">
            <div class="cardRightImgBox">
            </div><!-- mainImageBox -->

            <div class="card-body">
              <h4 class="card-title">John Doe</h4>
              <p class="card-text">Some example text.</p>
              <button class="cardRightBtn">See Detail</button>
            </div>
          </div>

          <div class="card cardRight">
            <div class="cardRightImgBox">
            </div><!-- mainImageBox -->
            <div class="card-body">
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
    
  <script src="/js/index.js"></script>

    </html>