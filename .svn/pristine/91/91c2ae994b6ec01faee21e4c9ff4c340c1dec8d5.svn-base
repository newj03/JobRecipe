<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 추가</title>
	<link type="text/css" href="<c:url value="/resources/css/jobCSS.css" />" rel="stylesheet">
	<script type="text/javascript" src="<c:url value="/resources/js/jobJS.js"/>"></script>
	<script src="<c:url value='/resources/js/jquery-3.1.1.js'/>"></script>	
</head>
<body>

	<header>
		<jsp:include page="../include/header.jsp"></jsp:include>
	</header>
	
	<section>
		<div style="width: 100%;  min-height: 70vh; text-align: center;">
		<!-- section 기본화면 셋팅 -->
		
			<div class="text-h1">회사 검색</div>
			<div style="display: flex; align-items: center; flex-direction: column; 
				justify-content: center;">
				<!--회사 검색 부분 container -->
				<div style="width: 50%;">
					<input class="search-input" type="text" id="c_name" name="c_name"
						placeholder="회사명" onclick="this.value=''">
					<button class="search-inputButton" type="button"
						onclick="admin_company_search()">검색</button>
				</div>
				<!--검색 입력창 부분  -->

				<div id="company_search" style="margin-top: 2%;display: none;">
					<div class="company_search_table">
						<c:choose>
							<c:when test="${empty vo }">
								<!-- 해당하는 회사 없음 -->
								<div style="color: red;" class="text-h2">
									검색하신 회사가 없습니다!
								</div>
							</c:when>
							<c:otherwise>
							<div style="color: #000099;">
								<div class="text-h2">검색 결과</div>
								<div style="display: flex; flex-wrap: nowrap; margin-top: 1%; " >
									
									<div class="search-input" style="width: 35%;">회 사 명</div>
									<input type="text"  id="name1" name="c_name" class="search-input"
											value="${vo.c_name }" readonly="readonly">
								</div>
								<div style="display: flex; flex-wrap: nowrap;" >	
								<!-- 회사위치 부분 -->
									<div class="search-input" style="width: 35%;">회사위치</div> 
									<input type="text" id="loc1" name="c_loc" class="search-input"
											value="${vo.c_loc }">
								</div>
								<!-- 회사주소 부분 -->
								<div style="display: flex; flex-wrap: nowrap;" >
									<div class="search-input" style="width: 35%;">회사주소</div>
									<input type="text" id="addr1" name="c_addr" class="search-input"
											value="${vo.c_addr }">
								</div>
								<!-- 수정 삭제 버튼 부분 -->
								<div style="display: flex; flex-wrap: nowrap; justify-content:flex-end; padding-top: 3%;">
									<button style="width: 22%; align-items: center;" class="search-inputButton" 
										onclick="admin_company_update()">수정</button>
									<button style="width: 22%; align-items: center;" class="search-inputButton"
										onclick="admin_company_del()">삭제</button>
								</div>
								<!-- 공고 입력으로 이동하는 부분 데이터 가져감 hidden -->
								<div style="text-align: end;">
								<form action="insertAdvertiseForm.do" method="post">
									<input type="hidden" name="c_name" value="${vo.c_name }">
									<input type="submit" value="공고 입력" class="search-inputButton" style="width: 47%; padding:2%;">
								</form>
								</div>
							</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				
				<hr style="width: 55%; ">
				
				<!-- 입력부분 -->
				<div style="text-align: center; width: 50%;">
				<div class="text-h1">회사 추가</div>
				<div style="display: flex; flex-direction: row; flex-wrap: nowrap; justify-content: center;">
					<div class="insert_divtext">회사명</div>
					<input class="search-input" type="text" id="name" placeholder="회사명" 
						onclick="this.value=''" required="required">
				</div>
				<div style="display: flex; flex-direction: row; flex-wrap: nowrap; justify-content: center;">
					<div class="insert_divtext">회사 위치</div>
					<input class="search-input" type="text" id="loc" placeholder="회사 위치" 
						onclick="this.value=''" required="required">
				</div>
				<div style="display: flex; flex-direction: row; flex-wrap: nowrap; justify-content: center;">
					<div class="insert_divtext">회사 주소</div>
					<input class="search-input" type="text" id="addr" placeholder="회사 주소" 
						onclick="this.value=''" required="required">
				</div>
				<div style="text-align: end; width: 87%;margin-top: 1%;">
					<input class="insert_divtext" style="width: 22%; padding-bottom: 5px; border: 1px solid;" 
						type="button" value="회사 추가하기" onclick="admin_company_add()">
				</div>
				</div>
			</div>
		</div>	
	</section>
	
	<footer>
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</footer>

<!-- 유진 -->
</body>
</html>