<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>JobRecipe</title>
<link type="text/css" href="<c:url value="/resources/css/jobCSS.css" />" rel="stylesheet">
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
<body>
	<jsp:useBean id="now" class="java.util.Date" />
	<header>
		<jsp:include page="./include/header.jsp"></jsp:include>
	</header>
	
	<section>
		<div style="width: 100%; display: flex; flex-wrap: nowrap; min-height: 70vh;">
		<!-- 전체화면 -->
		
			<div style="width: 5%;	 margin-left: 3%;">
				<!-- <div style="display:flex; flex-direction: column; border">
					<img style="height:17vh;" src="/resources/images/default_user.png">
					<div>이름</div>
					<div>아이디</div>
					<div>...</div>
					<div>...</div>
					<div>...</div>
				</div> -->
			</div>
			
			<div style="width: 70%;display:flex; flex-direction: column;margin-bottom:5%; ">
				<div style="font-size: 20pt;display:flex; flex-direction: row; padding-left:7%; 
					justify-content: space-between; font-weight: bold;color:#ff6900; margin-bottom:3%;">
					<div style="margin-left: 35%;">마감 임박 구인</div>
					<div onclick="location.href='/hire/allAdvertise.do'" style="cursor:pointer;font-size: 7pt;margin-right:7%;margin-top: 2%;
						border:1px solid; border-radius:10px;padding:1%;">
						+ 구인더보기
					</div>
				</div>
				<hr style="width: 80%;margin-bottom:1%; border:solid 1px #fac5a1">
				
				<c:forEach var="imsi" items="${list}">
				<fmt:parseDate var="date" value="${imsi.ad_date }" pattern="yyyy-MM-dd" />
				<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowDate" />
				<fmt:parseNumber value="${date.time / (1000*60*60*24)}" integerOnly="true" var="endDate" />
					<div style="margin-left:12%;margin-right:10%;display:flex; flex-direction: row;
						align-items: center;cursor:pointer;color:#333333;" onclick="location.href='aAllInfo.do?ad_no=${imsi.ad_no }'">

						<div style="width:30%;font-size: 15pt;">${imsi.ad_title }</div>
						<div style="width:15%;font-size: 13pt;">${imsi.companyVO.c_name }</div>
						<div style="width:30%;display:flex; flex-direction: column;">
							<div style="font-size:10pt;font-weight:bold;margin-bottom:5%;">
								
								${imsi.companyVO.c_addr }
							</div>
							<div style="font-size:10pt;font-weight:bold;">
								${imsi.companyVO.c_loc }
							</div>
						</div>
						<div style="width:10%;display:flex; flex-direction: column;align-items:center;">
							<div style="font-size:8pt;margin-bottom:5%;">
								조회수
							</div>
							<div style="font-size:10pt;font-weight:bold;">
								${imsi.ad_count }
							</div>
						</div>
						<div style="width:10%;display:flex; flex-direction: column;align-items:center;">
							<div style="font-size:8pt;margin-bottom:5%;">
								D-days
							</div>
							<div style="font-size:10pt;font-weight:bold;">
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
					<hr style="width: 80%;margin-bottom:1%; border:solid 1px #fac5a1">
				</c:forEach>
				
				<div style="font-size: 20pt;display:flex; flex-direction: row; padding-left:7%; 
					justify-content: space-between; font-weight: bold;color:#ff6900; margin-bottom:3%;
					margin-top:7%;">
					<div style="margin-left: 33%;">가장 많이 찾는 공고</div>
					<div onclick="location.href='/hire/allAdvertise.do'" style="cursor:pointer;font-size: 7pt;margin-right:7%;margin-top: 2%;
						border:1px solid; border-radius:10px;padding:1%;">
						+ 구인더보기
					</div>
				</div>
				<hr style="width: 80%;margin-bottom:1%; border:solid 1px #fac5a1">
				
				<c:forEach var="imsi" items="${list1}">
					<div style="margin-left:12%;margin-right:10%;display:flex; flex-direction: row;
						align-items: center; cursor:pointer;color:#333333;" onclick="location.href='aAllInfo.do?ad_no=${imsi.ad_no }'">

						<div style="width:30%;font-size: 15pt;">${imsi.ad_title }</div>
						<div style="width:10%;font-size: 13pt;">${imsi.companyVO.c_name }</div>
						<div style="width:30%;display:flex; flex-direction: column;">
							<div style="font-size:10pt;font-weight:bold;margin-bottom:5%;">
								
								${imsi.companyVO.c_addr }
							</div>
							<div style="font-size:10pt;font-weight:bold;">
								${imsi.companyVO.c_loc }
							</div>
						</div>
						<div style="width:10%;display:flex; flex-direction: column;align-items:center;">
							<div style="font-size:8pt;margin-bottom:5%;">
								조회수
							</div>
							<div style="font-size:10pt;font-weight:bold;">
								${imsi.ad_count}
							</div>
						</div>
						<div style="width:10%;display:flex; flex-direction: column;align-items:center;">
							<div style="font-size:8pt;margin-bottom:5%;">
								D-days
							</div>
							<div style="font-size:10pt;font-weight:bold;">
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
					<hr style="width: 80%;margin-bottom:1%; border:solid 1px #fac5a1">
				</c:forEach>
				
				
			</div>
			<div style="width: 25%; align-items:center;display:flex; flex-direction: column;">
			<!--분할화면 오른쪽  -->
				<div style="margin-bottom:3%;margin-top:6%; align-items:center;display:flex; flex-direction: column;">
					<img style="border-radius: 30px;width:80%;" src="/resources/images/ad1.gif"/>
					<!-- <div style="margin-top:2%; font-size:20pt; font-weight:bold;font-style: italic;">Kaja Airline</div> -->
				</div>
				<div style="margin-bottom:3%; align-items:center;display:flex; flex-direction: column;">
					<img style="border-radius: 30px;width:80%;" src="/resources/images/ad2.gif"/>
					<!-- <div style="margin-top:2%; font-size:20pt; font-weight:bold;font-style: italic;">Kaja Company</div> -->
				</div>
				<div style="margin-bottom:3%; align-items:center;display:flex; flex-direction: column;">
					<img style="border-radius: 30px;width:80%;" src="/resources/images/ad3.gif"/>
					<!-- <div style="margin-top:2%; font-size:20pt; font-weight:bold;font-style: italic;">Kaja hire</div> -->
				</div>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="./include/footer.jsp"></jsp:include>
	</footer>
	

<script>
	$(function() {
		$('#searchButton').click(function() {
			if($("select option:selected").val()=="n") {
				alert("검색할 카테고리를 선택해 주세요.");
			} else if($("#keywordInput").val().trim()=="" || $("#keywordInput").val().trim()==null) {
				alert("검색할 내용을 입력해 주세요.");
				$("#keywordInput").focus();
			} else {
				self.location = "../../hire/Search_Job2.do"
					+ '${pageMaker.makeQuery(1)}'
					+ "&searchType="
					+ $("select option:selected").val()
					+ "&keyword="
					+ encodeURIComponent($('#keywordInput').val());
			}
		});
	});
</script>
</body>
</html>