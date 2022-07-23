<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<div>
<div>
<div class="card" style="width:100%; margin-bottom: 20px; ">
  <img class="card-img-top" src="/image/t.jpg" alt="Card image">
  <h4 style="margin-left:20px; margin-top:250px; position: absolute; font-family: 'Black Han Sans', sans-serif;">2022 SUMMER EVENT</h4>
</div>
	<div style="text-align: center; margin-top: 20px;">
	<span class="">
			<button onclick="location.href='/shop/mans_form'" id="showall" class="btn btn-dark m-2" >SHOW ALL</button>
			<button onclick="location.href='/shop/mans_form/?gender=MAN&category=SHIRTS'"  id="mans_shirts"  class="btn btn-dark m-2" >SHIRTS</button>
			<button onclick="location.href='/shop/mans_form/?gender=MAN&category=PANTS'"  class="btn btn-dark m-2" >PANTS</button>
			<button onclick="location.href='/shop/mans_form/?gender=MAN&category=ACCESSORY'"  class="btn btn-dark m-2" >ACCESSORY</button>
			<button onclick="location.href='/shop/mans_form/?gender=MAN&category=SHOES'"  class="btn btn-dark m-2" >SHOES</button>
			<button onclick="location.href='/shop/mans_form/?gender=MAN&category=OUTER'"  class="btn btn-dark m-2" >OUTER</button>
			
	</span>
	</div>
	<div class="h100">
	<br/>
	<section>
		<div class="container" id="mCard" >
			<div id="list-container-md" class="row">
 				<c:forEach var="item" items="${pageable.content}">
                   <div class="col-3 mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <a class="item" href="/shop/itemdetail_form/${item.id}">
                                <img class="card-img-top" src="${item.imageurl}" alt="..." style="width:200px; height: 253px; " onerror="this.src='/image/noImage.png'">
                            </a>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                    <div style="float: left; font-family: 'Black Han Sans', sans-serif;">${item.name}</div>
                                    <br/>
                                    <div style="float: right;">${item.price}원</div>         
                            </div>
                            <div class="row">
                           <div style="margin-left: 45px;">size : ${item.size}</div>
                           <div style="margin-left: 30px;">color : ${item.color}</div>
                           </div>
                        </div>
                    </div>
          		</c:forEach>
          	</div>
          </div>
      </section>
		</div>
<br/>
</div>
<div style="">
<ul class="pagination justify-content-center">
	<!-- 삼항 연산자 (set : 변수 선언) -->
	<c:set var="isDisabled" value="disabled"></c:set>
	<c:set var="isNotDisabled" value=""></c:set>
	<c:set var="isNowPage" value="acive"></c:set>
	
	<li class="page-item ${pageable.first ? isDisabled : isNotDisabled}">
		<a class="page-link" href="/shop/search/?q=${searchTitle}&page=${pageable.number - 1}">Previous</a>
	</li>	

	<c:forEach var="num" items="${pageNumbers}">
    	<c:choose>
    		<c:when test="${pageable.number + 1 eq num}">
		    	<li class="page-item active"><a class="page-link bg-primary" href="/shop/search/?q=${searchTitle}&page=${num - 1}">${num}</a></li>    			
    		</c:when>
    		<c:otherwise>
		    	<li class="page-item"><a class="page-link" href="/shop/search/?q=${searchTitle}&page=${num - 1}">${num}</a></li>    			
    		</c:otherwise>
    	</c:choose>	
    </c:forEach>
	   
  	<li class="page-item ${pageable.last ? isDisabled : isNotDisabled}">
  		<a class="page-link test" href="/shop/search/?q=${searchTitle}&page=${pageable.number + 1}">Next</a>
  	</li>	
</ul>
</div>
<br/>
</div>
<script src="../js/search.js"></script>
