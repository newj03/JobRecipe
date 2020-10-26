<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript">
	function test(){
		
		if(document.getElementById("test").style.display=='none')
			document.getElementById("test").style.display='flex';
		else
			document.getElementById("test").style.display='none';
	}

</script>
</head>
<body>
	<div class="flex-container" style="background-color: white; z-index: 50;">
		<div style="width:13%; font-size: 25pt; font-weight: bold; font-style: italic;"><a href="#">Job Recipe </a></div>
		<div style="width:5%;" class="header-menu"><a href="#">채용</a></div>
		<div style="width:5%;" class="header-menu"><a href="#">기업</a></div>
		<div style="width:77%; text-align: end;" class="header-menu">
		<a style="margin: 10px;" href="sign_up.do">회원가입</a>
		<c:if test="${login == null }">
			<a style="margin: 10px;" href="sign_in.do">로그인</a>
		</c:if>
		<c:if test="${login != null }">
			<a style="margin: 10px;" href="settings.do">마이페이지</a>
			<a style="margin: 10px;" href="logout.do">로그아웃</a>
		</c:if>	
		</div>
		
	</div>
	<form style=" z-index: 50;">
		<div class="flex-container" style=" background-color: white; justify-content: center;text-align: center;">
			<input class="search-input" style="width: 40%;" type="text" placeholder="기업/구인 검색" required="required">
			<input class="search-inputButton" type="submit" value="검색하기">
		</div>
	</form>
	<!-- 팝업 구현부분 -->
	<button onclick="test()">click</button>
	<div id="test" style="width: 100%; height: 100vh;display: none; align-items: center; position:absolute;
		top:0; left:0; justify-content: center;background-color: rgba(0,0,0,0.3);z-index: 99;">
		<!-- popup -->
		<div style="width: 50%; height: 50vh; background-color: white; z-index: 100;">
			여기는 팝업<br>
			<button onclick="test()">팝업닫기</button>
		</div>
	</div>
</body>
</html>