<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<style>
ul {
	list-style: none;
}
</style>

</head>
<body>


<div id="myPageMenuWrap">
    <div id="myPageMenu">
        <div class="mypagemenu_wrap">
            <div class="table_row_div">
                <!-- 내 정보 -->
                <a href="./settings.do">계정</a>
                <!-- 이력서 관리 -->
                <a href="./reviews.do"> 내 프로필</a>

                <!-- 내 활동내역 -->
                <a href="./reviews.do">활동내역</a>
                <!-- //내 활동내역 -->
                
                <!-- 팔로잉 -->
                <a href="./company_follows">관심정보</a>
            </div>
        </div>
    </div>
</div>

<div id="sideContents" class="jpcont_lft">
            <div class="jpcont_wrap">
  <div id="myPageMyActivityMenu" class="mypage_menu">
    <nav id="profile-left-menu">
      <h2>활동내역</h2>
      <ul>
        <li class="active">
          <a href="./reviews.do">
            <span>리뷰</span>
            <span>(0)</span>
          </a>
        </li>
        <li class="">
          <a href="./drafts.do">
            <span>작성중</span>
            <span>
              (0)
            </span>
          </a>
        </li>
      </ul>
    </nav>
  </div>
</div>

        </div>        

    <div>
        <h2>내 기업리뷰</h2>
        <h3><span class="num" id="content_count">0</span>개의 리뷰를 작성하셨습니다.</h3>
        <table border=1>
            <caption>내 기업리뷰</caption>
            <thead>
               <tr>
                    <th>기업명</th>
                    <th>고용형태</th>
                    <th>작성일</th>
                    <th>수정/삭제</th>
               </tr>
            </thead>
            <c:forEach items="${list}" var="list">
            <tbody>
               	 <tr>
                	<td>${list.rev_name}</td>
                	<td>${list.rev_emp}</td>
                	<td>${list.rev_date}</td>
                	<td><input type="checkbox" name="rd" value="1"></td>
               	</tr>
            </tbody>
            </c:forEach>         
        </table>
        
        <div>
            <button onclick="insertReview();">기업리뷰 작성</button>
            <a href="/faqs/13">FAQ 바로가기</a>
         </div>
        <div>
            <span class="text">작성한 기업리뷰가 없습니다.</span>
        </div>  
      </div> 


<script type="text/javaScript">
function insertReview(){
     location.href = "/InsertReviewForm.do";
}
</script>



</body>
</html>