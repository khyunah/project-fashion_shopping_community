>## 팀 프로젝트 : Milano 밀라노

### SNS와 쇼핑몰을 합친 통합형 웹 사이트입니다. 
밀라노는 파리와 함께 세계 패션의 중심도시이자 사르디니아 왕국의 수도이기도 하였습니다.  
저희 밀라노 웹사이트 또한 패션의 성지로 만들자라는 의미로 밀라노라 이름 지었습니다.

<br><br>

>## 프로젝트 기간 
#### 20220707 - 20220726 ( 약 20일간 진행 )
<br>

>## 프로젝트 의도
현대인은 바쁜 사회에서 살아가고 있습니다. 바쁘지만 자기 관리가 필수인 요즘, 첫 인상은 매우 중요합니다.  
바쁜 현대인들을 대신하여 깔끔한 인상에 도움이 되는 패션 정보를 서로 공유, 구매까지 하나의 사이트에서 할 수 있도록 하고자 했습니다.  
한국의 쇼핑몰은 이미 수도 없이 많기에 차별화를 두기 위해서 SNS 서비스를 추가 했습니다.  
SNS 서비스를 선택한 이유는 한국은 전세계 SNS 이용율인 53.6% 보다 높은 89.3%를 기록하고 있기 때문에   
SNS형 서비스로 쉽게 접근하고 흥미를 자극할 수 있도록 통합했습니다.  

<br><br>

<hr>

<br><br><br>

>## 1. 프로젝트 대표적인 기능 
<br>

### 쇼핑
- 상품&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 상품보기, 상세보기
- 장바구니 | 담기, 취소하기
- 구매&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 카카오페이로 결제하기
<br>

### SNS
- 게시글 | 등록, 수정, 삭제, 상세보기
- 좋아요 | 좋아요, 좋아요 취소
- 댓글&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 등록, 수정, 삭제
<br> 

### 회원정보 
- 회원 가입 
- 회원 정보 수정 

<br><br><br>

># 2. 사용한 기술 
<br>

# Back-End

<img src="https://img.shields.io/badge/JAVA-007396?style=for-the-badge&logo=JAVA&logoColor=white"> <img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=Spring&logoColor=white"> <img src="https://img.shields.io/badge/Spring Boot-6DB33F?style=for-the-badge&logo=Spring Boot&logoColor=white"> <img src="https://img.shields.io/badge/Spring Security-6DB33F?style=for-the-badge&logo=Spring Security&logoColor=white"> <img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white">

Spring MVC 패턴을 이용한 Spring Boot 기반의 기술.  
Spring Security 라이브러리를 이용해서 보안성 향상.  
Spring JpaRepository를 이용한 ORM 방식으로 데이터 베이스 관리.
카카오 개발자의 카카오 페이 문서 활용.

<br><br>

# Front-End

<img src="https://img.shields.io/badge/html-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/Bootstrap-7952B3?style=for-the-badge&logo=Bootstrap&logoColor=white">

HTML과 CSS를 이용한 전반적인 디자인 레이아웃.  
Bootstrap을 이용한 반응형 레이아웃.
<br><br>

<hr>

<br><br><br>

># 3. 프로젝트 기능 상세 설명
<br><br><br><br>

> # 메인 페이지  
<br>

## 화면분할과 권한별 Header
SNS와 쇼핑몰을 같이 볼 수 있도록 메인 페이지의 화면을 2개의 공간으로 분리하여 한눈에 볼 수 있도록 하였습니다.  
왼쪽의 SNS 영역에서는 밀라노 웹사이트의 모든 이용자가 올리는 게시글을 확인할 수 있습니다.  
오른쪽의 쇼핑몰 영역에서는 랜덤으로 상품을 랜더링하여 쇼핑몰의 아이템을 홍보하는 효과를 주었습니다.   

| 화면분할 |권한별 Header |
|------|---|
|<img src="https://user-images.githubusercontent.com/89136556/181404557-4c1ea5c9-1beb-451c-85c2-95bab6d853d7.png"  width="400" height="300">|<img src="https://user-images.githubusercontent.com/89136556/181415942-f574baf8-efcc-419a-9cd5-0dd7f86553db.png"  width="400" height="300">|

<br><br><br>

## 스크롤시 이미지 추가적으로 랜더링 
스크롤이 바닥에 닿이면 GET 메소드르 HTTP통신을 하여 이미지를 더 랜더링 하도록 했습니다.  

<br><br><br><br><br><br><br><br>

> # 회원 관련 페이지
<br>

## HTML의 input 태그를 활용한 Validation 처리

|회원가입|로그인|
|------|---|
|<img src="https://user-images.githubusercontent.com/89136556/181414680-5a58f103-9010-4e4d-a7ae-ab429432518e.gif" width="400" height="300">|<img src="https://user-images.githubusercontent.com/89136556/181424254-2564f39a-49f7-4c0d-812b-ce223a85c69d.png" width="400" height="300">|

|회원정보 수정|내가 쓴 게시글|
|------|---|
|<img src="https://user-images.githubusercontent.com/89136556/181425426-bd283e00-06a2-4474-ac40-7ce3cbe8839b.gif" width="400" height="300">|<img src="https://user-images.githubusercontent.com/89136556/181425666-51c77305-fb71-4c41-a53d-e1b322b9b30d.png" width="400" height="300">|

<br><br><br><br><br><br><br><br>

> # SNS 페이지 
<br>

## 게시글 CRUD / 본인이 작성한 게시물일 경우 수정, 삭제 버튼 보이기
## 게시글 아래 댓글 CRUD / 본인이 작성한 댓글일 경우 수정, 삭제 버튼 보이기
## 좋아요 기능

|게시글 등록, 수정|게시글 삭제|
|------|---|
|<img src="https://user-images.githubusercontent.com/89136556/181426802-fc78bf65-d086-4b88-a643-cc8ee8d7d3f0.gif" width="400" height="300">|<img src="https://user-images.githubusercontent.com/89136556/181426862-b7975d3b-8a60-4a64-bc8f-8f7ddccb034b.png" width="400" height="300">|

|댓글 등록, 수정|댓글 삭제|
|------|---|
|<img src="https://user-images.githubusercontent.com/89136556/181427584-c3e0838e-d71d-41ac-a4dc-06afefb0babb.gif" width="400" height="300">|<img src="https://user-images.githubusercontent.com/89136556/181427778-3f8f2e6c-7f92-4bf2-ad0e-1740dd430581.gif" width="400" height="300">|

|좋아요|
|------|
|<img src="https://user-images.githubusercontent.com/89136556/181428059-d59a70af-b508-4d81-8a49-47d29d344db9.gif" width="400" height="300">|

<br><br><br><br><br><br><br><br>

> # 쇼핑몰 페이지
<br>

## 아이템 카테고리별 조회 / 상세보기 
## 장바구니 담기 / 취소하기 
## 결제하기 - 카카오페이

|아이템 카테고리별 조회, 상세보기|장바구니 담기, 취소하기|
|------|---|
|<img src="https://user-images.githubusercontent.com/89136556/181428611-0a0c97e1-c6a0-4e84-b9d1-df4614bf2031.gif" width="400" height="300">|<img src="https://user-images.githubusercontent.com/89136556/181428810-f8acb86c-697e-4cab-989f-79ce9319310c.gif" width="400" height="300">|

|아이템 카카오페이 결제|
|------|
|<img src="https://user-images.githubusercontent.com/89136556/181429071-3b5de05c-f39d-4143-bffb-f3879d6f0aa9.gif" width="400" height="300">|

<br><br><br><br><br><br><br><br>

> # 관리자 페이지
<br>

## 회원 페이지 | 카테고리별 검색 / 권한설정 / 삭제
## 쇼핑 페이지 | 카테고리별 검색 / 상품 CRUD
## 커뮤니티 페이지 | 카테고리별 검색 / 삭제

|관리자 페이지|회원 페이지|
|------|---|
|<img src="https://user-images.githubusercontent.com/89136556/181430404-16c09bdf-7d33-4df3-9649-a36e5433a508.gif" width="400" height="300">|<img src="https://user-images.githubusercontent.com/89136556/181441472-a415b292-b097-4d1d-9f9a-3ae1c239dd8a.gif" width="400" height="300">|

|쇼핑 페이지|커뮤니티 페이지|
|------|---|
|<img src="https://user-images.githubusercontent.com/89136556/181446031-602094b4-7e6d-4bee-aa5c-2a97b954a438.gif" width="400" height="300">|<img src="https://user-images.githubusercontent.com/89136556/181446385-b3651a1e-0e0d-4a63-8186-1388da802ddd.gif" width="400" height="300">|

<br><br><br>

