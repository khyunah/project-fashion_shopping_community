<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

	<div class="container">
	  
		<form action="">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<div class="form-group">
				<label for="category">category</label>
				<input type="text" class="form-control" placeholder="Enter category" name="category" id="category">
			</div>
			<div class="form-group">
				<label for="gender">gender</label>
				<input type="text" class="form-control" placeholder="Enter gender" name="gender" id="gender">
			</div>
			<div class="form-group">
				<label for="name">name</label>
				<input type="text" class="form-control" placeholder="Enter name" name="name" id="name">
			</div>
			<div class="form-group">
				<label for="price">price</label>
				<input type="text" class="form-control" placeholder="Enter price" name="price" id="price">
			</div>
			<div class="form-group">
				<label for="imageurl">imgUrl</label>
				<input type="text" class="form-control" placeholder="Enter imageurl" name="imageurl" id="imageurl">
			</div>
			<div class="form-group" >
				<label for="content">content</label>
				<textarea class="form-control summernote" rows="5" id="content"></textarea>
			</div>
			
		</form>
		<button type="button" id="btn-save" class="btn btn-dark text-white">상품 등록</button>
	
	</div>
	<br/>
	<br/>
	
 <script type="text/javascript">
 	$('.summernote').summernote({
     placeholder: '내용을 입력해주세요',
     tabsize: 5,
     height: 300
   	});
 </script>
 <script src="/js/item.js"></script>	