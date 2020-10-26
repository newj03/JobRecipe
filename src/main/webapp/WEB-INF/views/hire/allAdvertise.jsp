<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value="/resources/js/jobJS.js"/>"></script>
<script src="<c:url value='/resources/js/jquery-3.1.1.js'/>"></script>
<style type="text/css">
/* Noto Sans KR 폰트 추가 */
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
body {
	font-family: 'Noto Sans KR', sans-serif;
}

input {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: initial;
}
</style>

</head>
<body style="margin:0;">
<jsp:useBean id="now" class="java.util.Date" />
	<header>
		<jsp:include page="../include/header.jsp"></jsp:include>
	</header>
	
	<section>
		<div style="width: 100%; display: flex; flex-wrap: nowrap; min-height: 70vh;">
		<!-- 전체화면 -->
		
			<div style="width: 10%;	 margin-left: 3%;">
				<!-- <div style="display:flex; flex-direction: column; border">
					<img style="height:17vh;" src="/resources/images/default_user.png">
					<div>이름</div>
					<div>아이디</div>
					<div>...</div>
					<div>...</div>
					<div>...</div>
				</div> -->
			</div>
			
			<div style="width: 65%;display:flex; flex-direction: column;margin-bottom:5%; justify-contents">
				<div style="width:100%;text-align:center;margin-top:5%;margin-bottom:3%;color:#ff6900;">
					<h1>채용공고</h1>
				</div>
				<div style="width:100%;text-align:center;\margin-bottom:5%;">
					<form action="Search_Job2.do" method="post">
						<input style="width:60%;font-size:15pt;border:1px solid #ff6900;padding:1%;" 
							type="text" name="keyword" placeholder="기업, 채용공고를 검색해 보세요.">
						<input style="width:20%;font-size:15pt;background-color:#ff6900;color:white;border:0;padding:1%;" 
							type="submit" value="검색">
					</form>
				</div>
				<br>

				<!-- <table border=2>
					<tr>
						<td colspan="6"><h1>채용공고</h1></td>
					</tr>
					<tr>
						<td>게시판 제목</td>
						<td>D-day</td>
						<td>회사 이름</td>
						<td>회사 위치</td>
						<td>회사 주소</td>
						<td>조회수</td>
					</tr> -->
				
					<c:if test="${empty list }">
						<h6>해당하는 공고가 없습니다.</h6>
					</c:if>
					<c:if test="${!empty list }">
					
					<hr style="width: 80%; margin-bottom: 1%; border: solid 1px #fac5a1">

					<c:forEach var="imsi" items="${list}">
					<fmt:parseDate var="date" value="${imsi.ad_date }" pattern="yyyy-MM-dd" />
					<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowDate" />
					<fmt:parseNumber value="${date.time / (1000*60*60*24)}" integerOnly="true" var="endDate" />
						<div
							style="margin-left: 12%; margin-right: 10%; display: flex; flex-direction: row; align-items: center; cursor: pointer;"
							onclick="location.href='aAllInfo.do?ad_no=${imsi.ad_no }'">

							<div style="width: 30%; font-size: 15pt;">${imsi.ad_title }</div>
							<div style="width: 15%; font-size: 13pt;">${imsi.companyVO.c_name }</div>
							<div style="width: 30%; display: flex; flex-direction: column;">
								<div
									style="font-size: 10pt; font-weight: bold; margin-bottom: 5%;">

									${imsi.companyVO.c_addr }</div>
								<div style="font-size: 10pt; font-weight: bold;">
									${imsi.companyVO.c_loc }</div>
							</div>
							<div
								style="width: 10%; display: flex; flex-direction: column; align-items: center;">
								<div style="font-size: 8pt; margin-bottom: 5%;">조회수</div>
								<div style="font-size: 10pt; font-weight: bold;">
									${imsi.ad_count }</div>
							</div>
							<div
								style="width: 10%; display: flex; flex-direction: column; align-items: center;">
								<div style="font-size: 8pt; margin-bottom: 5%;">D-days</div>
								<div style="font-size: 10pt; font-weight: bold;">
									<c:choose>
										<c:when test="${endDate-nowDate+1 < 0 }">
			  							마감된 공고입니다.
			  							</c:when>
										<c:when test="${endDate-nowDate+1 == 0 }">
			  							오늘 마감입니다.
			  							</c:when>
										<c:otherwise>
										D - ${endDate-nowDate+1 }   
			  							</c:otherwise>
									</c:choose>
								</div>
							</div>

						</div>
						<hr style="width: 80%; margin-bottom: 1%; border: solid 1px #fac5a1">
					</c:forEach>
					<div style="text-align:center;margin-top:2%;">
						<c:if test="${pageMaker.prev}">
								<a href="allAdvertise.do${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							<a href="allAdvertise.do${pageMaker.makeQuery(idx)}">${idx}</a>
						</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<a href="allAdvertise.do${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a>
						</c:if>
					</div>
				</c:if>
					
			</div>
			<div style="width: 25%; align-items:center;display:flex; flex-direction: column;">
			<!--분할화면 오른쪽  -->
				<div style="margin-bottom:3%;margin-top:6%; align-items:center;display:flex; flex-direction: column;">
					<img style="border-radius: 30px;width:90%;" src="/resources/images/ad1.gif"/>
					<div style="margin-top:2%; font-size:20pt; font-weight:bold;font-style: italic;">Kaja Airline</div>
				</div>
				<div style="margin-bottom:3%; align-items:center;display:flex; flex-direction: column;">
					<img style="border-radius: 30px;width:90%;" src="/resources/images/ad2.gif"/>
					<div style="margin-top:2%; font-size:20pt; font-weight:bold;font-style: italic;">Kaja Company</div>
				</div>
				<div style="margin-bottom:3%; align-items:center;display:flex; flex-direction: column;">
					<img style="border-radius: 30px;width:90%;" src="/resources/images/ad3.gif"/>
					<div style="margin-top:2%; font-size:20pt; font-weight:bold;font-style: italic;">Kaja hire</div>
				</div>
				
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</footer>
	
	

</body>
</html>
