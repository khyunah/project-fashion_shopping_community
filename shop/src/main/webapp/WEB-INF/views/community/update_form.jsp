<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ include file="../layout/header.jsp"%>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>


<style>
  .container {
    margin-top: 100px;
  }

  .btn {
    float: right;
  }
</style>

<input type="hidden" value="${pricipal.user.id}" id="pricipal--id">
  <button class="btn bg-secondary" onclick="history.back();">돌아가기</button>
  <c:if test="${communityBoard.userId.id == principal.user.id}">
    <a href="/board/${communityBoard.id}/update_form" class="btn btn-warning">수정</a>
    <button class="btn btn-danger" id="btn-delete">삭제</button>
  </c:if>

<div class="container justify-content space-between">
 
   <form action="/board/upload" enctype="multipart/form-data" method="post">
    <div class="form-group">
      <label for="title" id=title>title</label>
      <input value="${communityBoard.title}" type="text" class="form-control" placeholder="Enter title" name="title" id="title" />
    </div>

    <div class="form-group">
      <label for="image" id=image>image</label>
      <div class="input-group">
        <input value="${communityBoard.imageUrl}" type="file" name="file" class="custom-file-input" id="image" required="required" />
        <label class="custom-file-label" for="customFile"></label>
      </div>
    </div>

    <div class="form-group mt-3">
      <label for="content">content</label>
      <textarea class="form-control" rows="5" id="content" name="content" placeholder="내용을 입력하세요">
      ${communityBoard.content}
      </textarea>
    </div>
    <div class="form-group mt-3">
  <button type="submit" id="btn-save" class="btn btn-dark">글 쓰기 완료</button>
	</div>
  </form>
</div>

<br />
<br />
<script>
  $(".custom-file-input").bind("change", function () {
    console.log($(this).val());
    let fileName = $(this).val().split("\\").pop();
    $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
  });
</script>
