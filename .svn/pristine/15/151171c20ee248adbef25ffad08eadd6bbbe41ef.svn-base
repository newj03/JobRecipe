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
</head>
<body>

<jsp:useBean id="now" class="java.util.Date" />

<h2>검색창</h2>

<div>
	<select name="searchType">
		<option value="n"<c:out value="${search.searchType == null ? 'selected' : '' }"/>>----</option>
		<option value="ad_title"<c:out value="${search.searchType eq 'ad_title' ? 'selected' : '' }"/>>제목</option>
		<option value="c_name"<c:out value="${search.searchType eq 'c_name' ? 'selected' : '' }"/>>회사이름</option>
		<option value="c_addr"<c:out value="${search.searchType eq 'c_addr' ? 'selected' : '' }"/>>회사주소</option>
		<option value="ad_job"<c:out value="${search.searchType eq 'ad_job' ? 'selected' : '' }"/>>직무</option>	
		<option value="ad_skill"<c:out value="${search.searchType eq 'ad_skill' ? 'selected' : '' }"/>>스킬</option>
		<option value="ad_upmu"<c:out value="${search.searchType eq 'ad_upmu' ? 'selected' : '' }"/>>주요업무</option>
		<option value="ad_lien"<c:out value="${search.searchType eq 'ad_lien' ? 'selected' : '' }"/>>자격요건</option>					
	</select>
	<input maxlength="20" type="text" name="keyword" id="keywordInput" placeholder="기업, 채용공고를 검색해 보세요.">
	<button id="searchButton">검색</button>
</div>

<h2>D-day 순</h2>

<table border=2>
	<tr>
		<td colspan="6"><h1>채용공고</h1></td> 
	</tr>
	<tr><td>게시판 제목</td><td>D-day</td><td>회사 이름</td><td>회사 위치</td><td>회사 주소</td><td>조회수</td></tr>
	<c:forEach var="imsi" items="${list}">
		<tr>
			<td><a href="aAllInfo.do?ad_no=${imsi.ad_no }" >${imsi.ad_title }</a></td> <!-- 게시판 제목 -->
			
			<fmt:parseDate var="date" value="${imsi.ad_date }" pattern="yyyy-MM-dd" />
			<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowDate" />
			<fmt:parseNumber value="${date.time / (1000*60*60*24)}" integerOnly="true" var="endDate" />
			
			<td>
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
			</td>  <!-- 마감일 -->
			<td>${imsi.companyVO.c_name }</td> <!-- 회사 이름 -->
			<td>${imsi.companyVO.c_loc }</td> <!-- 회사 위치 -->
			<td>${imsi.companyVO.c_addr }</td> <!-- 상세 위치 -->
			<td>${imsi.ad_count }</td> <!-- 조회수 -->
		</tr>
	</c:forEach>
</table>

<br><br><br>

<h2>조회수 순</h2>
<table border=2>
	<tr>
		<td colspan="6"><h1>채용공고</h1></td> 
	</tr>
	<tr><td>게시판 제목</td><td>D-day</td><td>회사 이름</td><td>회사 위치</td><td>회사 주소</td><td>조회수</td></tr>
	<c:forEach var="imsi" items="${list1}">
		<tr>
			<td><a href="aAllInfo.do?ad_no=${imsi.ad_no }">${imsi.ad_title }</a></td> <!-- 게시판 제목 -->
			
			<fmt:parseDate var="date" value="${imsi.ad_date }" pattern="yyyy-MM-dd" />
			<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowDate" />
			<fmt:parseNumber value="${date.time / (1000*60*60*24)}" integerOnly="true" var="endDate" />
			
			<td>
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
			</td>  <!-- 마감일 -->
			<td>${imsi.companyVO.c_name }</td> <!-- 회사 이름 -->
			<td>${imsi.companyVO.c_loc }</td> <!-- 회사 위치 -->
			<td>${imsi.companyVO.c_addr }</td> <!-- 상세 위치 -->
			<td>${imsi.ad_count }</td> <!-- 조회수 -->
		</tr>
	</c:forEach>
</table> 
</body>
</html>