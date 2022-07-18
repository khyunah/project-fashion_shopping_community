<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ include file="layout/header.jsp" %>

    <div class="mainWrap">
      <div class="cardWrap cardWrapLeft">

        <ul class="card-list leftCards">
          
		<c:forEach items="${boardList}" var="communityBoard">
          <li class="card lCard">
            <div class="commu-container">
              <div class = "leftImgBox">
                <img class="commu-img" alt="" src="http://localhost:9090/${communityBoard.imageUrl}"/>
              </div>
			
              <div class="div-main-container">
                <div>
                  <button class="btn-good">Good Look</button>
                  <span class="span-goodlook-count commu-text">1,000K</span>
                </div>

                <hr class="hr-goodlook-line" />

                <div class="div-title-container">
                  <h3 class="commu-text today_daily">${communityBoard.title}</h3>
                </div>
                <div class="div-title-container">
                  <span class="p-username commu-text">${communityBoard.user.username}</span>
                </div>

                <div>
                  <div class="div-content-container">
                    <div class="span-content">
                      ${communityBoard.content}
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
          </li>
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
    <!-- 
    <script src="/js/index.js">
    
     -->

    </script>

    </html>