<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="left_nav.jsp"%>

<div class="admin-container">
	<div class="container col-4">
        <h2>메인 메뉴 추가하기</h2>
        <form>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <div class="form-group">
                <label for="sortNum">메뉴순서</label>
                <input type="number" class="form-control" id="sortNum" name="sortNum">
            </div>
            <div class="form-group">
                <label for="menuName">메뉴명</label>
                <input type="text" class="form-control" id="menuName" name="menuName">
            </div>
            <div class="form-group">
                <label for="address">주소</label>
                <input type="text" class="form-control" id="address" name="address">
            </div>
            <div class="form-group">
                <label for="role">권한</label>
                <input type="number" class="form-control" id="role" name="role">
            </div>
            <button  type="button" class="btn btn-primary">메뉴추가</button>
        </form>
    </div>
</div>

</body>
</html>