<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>


	<div class="container mr-3">
		<div class="d-flex mr-5 justify-content-end">
			<form class="form-inline" action="/board/search" method="get">
			<!-- name값이 키값이 되고 value값이 값으로 매핑 -->
			  <input type="text" class="form-control" name="q" value="${searchTitle}" placeholder="찾는 상품을 입력해주세요" id="email" style="width: 350px">
			  <button type="submit" class="btn btn-dark ml-2">검색</button>
			</form>	
		</div>
	</div>
		<hr/>
	<div class="container">	
<div class="card" style="width:100%; ">
  <img class="card-img-top" src="/image/t.jpg" alt="Card image">
  <div class="card-img-overlay">
   <h4 style="margin-top: 220px; font-family: 'Black Han Sans', sans-serif;">2022 SUMMER EVENT</h4>
   
  </div>
</div>
</div>
<br/>
	<div style="text-align: center;">
	<span class="">
			<button type="submit" name="showall" value="${searchMan}" class="btn btn-dark m-2" >Show ALL</button>
			<button type="submit" name="manT" value="${searchTshirts} }" class="btn btn-dark m-2" >T-shirts</button>
			<button type="submit" name="manP" value="${searchPants}" class="btn btn-dark m-2" >Pants</button>
			<button type="submit" name="manS" value="${searchShoes}" class="btn btn-dark m-2" >Shoes</button>
	</span>
	</div>
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5	">
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4">
 				<c:forEach var="board" items="${pageable.content}">
                    	<div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <a class="item" href="/board/${board.id}">
                                <img class="card-img-top" src="${board.imgUrl}" alt="...">
                            </a>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                    <div style="float: left; font-family: 'Black Han Sans', sans-serif;">${board.title}</div>
                                    <div style="float: right;">${board.price}원</div>         
                            </div>
                           <div style="margin-left: 23px;">${board.content}</div>
                        </div>
                    </div>
          		</c:forEach>
          	</div>
          </div>
      </section>



<br/>
<ul class="pagination justify-content-center">
	<!-- 삼항 연산자 (set : 변수 선언) -->
	<c:set var="isDisabled" value="disabled"></c:set>
	<c:set var="isNotDisabled" value=""></c:set>
	<c:set var="isNowPage" value="acive"></c:set>
	
	<li class="page-item ${pageable.first ? isDisabled : isNotDisabled}">
		<a class="page-link" href="/board/search/?q=${searchTitle}&page=${pageable.number - 1}">Previous</a>
	</li>	

	<c:forEach var="num" items="${pageNumbers}">
    	<c:choose>
    		<c:when test="${pageable.number + 1 eq num}">
		    	<li class="page-item active"><a class="page-link bg-primary" href="/board/search/?q=${searchTitle}&page=${num - 1}">${num}</a></li>    			
    		</c:when>
    		<c:otherwise>
		    	<li class="page-item"><a class="page-link" href="/board/search/?q=${searchTitle}&page=${num - 1}">${num}</a></li>    			
    		</c:otherwise>
    	</c:choose>	
    </c:forEach>
	   
  	<li class="page-item ${pageable.last ? isDisabled : isNotDisabled}">
  		<a class="page-link test" href="/board/search/?q=${searchTitle}&page=${pageable.number + 1}">Next</a>
  	</li>	
</ul>
<br/>
