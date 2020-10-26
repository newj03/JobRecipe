<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" href="<c:url value="/resources/css/Category.css" />" rel="stylesheet">
<link type="text/css" href="<c:url value="/resources/css/Info1.css" />" rel="stylesheet">
<link type="text/css" href="<c:url value="/resources/css/Info2.css" />" rel="stylesheet">
<fmt:parseDate var="day" value="${imsi.ad_date }" pattern="yyyy-MM-dd" />
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/Company.css" />" rel="stylesheet">
<link type="text/css" href="<c:url value="/resources/css/jobCSS.css" />" rel="stylesheet">
<script type="text/javascript" src="<c:url value="/resources/js/jobJS.js"/>"></script>
<script src="<c:url value='/resources/js/jquery-3.1.1.js'/>"></script>
<script>
	$(document).ready(function() {
		$("#companyTable li").off("click").on("click", function() { //리스트에서 공고 클릭
			var li = $(this);
			var p = li.children();
			var ad_no = p.eq(0).text();
			$.ajax({
				type: "post",
				url: "aInfo.do",
				data: {
					ad_no : ad_no
				},
				success: function(result) {
					var order_result = $("#advertisementOrder").html(result).find(".box2");
					$("#advertisementOrder").html(order_result);
				}
			});
		});
	})

	var Dday = new Date('<fmt:formatDate value="${day }" pattern="yyyy-MM-dd" />'); //디데이
	var now = new Date();
	
	var gap = now.getTime() - Dday.getTime();
	var result = Math.floor(gap/ (1000*60*60*24)) * -1;
	
	if(result == 0) {
		$("#Day1").val("오늘 마감입니다!")
	} else if(result > 0){
		$("#Day1").val("(D- " + result + "일)");
	}
	
	function advertise_end() { //마감된 공고면 전페이지로 넘어감
		if(result < 0) {
			alert("마감된 공고입니다.");
			history.go(-1);
		} else if(result == 0) {
			$("#Day1").val("오늘 마감입니다!")
		} else if(result > 0){
			$("#Day1").val("(D- " + result + "일)");
		}
	}
	
</script>
</head>
<body onload="advertise_end()">

<%
    request.setCharacterEncoding("UTF-8");
	pageContext.setAttribute("newLienChar", "#");
%>

<header>
	<jsp:include page="../include/header.jsp"></jsp:include>
</header> 


  	<div class="box1" style="overflow:scroll; width:300px; height:900px;">
	
		<select id="order" name="order" onchange="advertiseOrder()">
			<option value="마감일">마감일</option>
			<option value="평점수">평점수</option> 
		</select>
		
		<div id="companyOrder">
			<ul id="companyTable">
				
				<c:forEach var="vo" items="${info }">
					<li>
						<div id="companyNo" style="display: none;">${vo.ad_no }</div>
						<p class="company">${vo.companyVO.c_name }</p>
						<p id="ad_title" class="title"><a href="#">${vo.ad_title }</a></p>
						<p class="star">${vo.ad_date }</p>
						<p>${vo.companyVO.c_star }</p>
					</li>
					<hr>
				</c:forEach>
			</ul>		
		</div>
		
		<ul>  
		<!-- 게시판 하단의 페이징  -->
		    <c:if test="${pageMaker.prev}">
		    	<li id="center"><a href="aAllInfo.do${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
		    </c:if> 
		
		    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
		    	<li id="center"><a href="aAllInfo.do${pageMaker.makeQuery(idx)}">${idx}</a></li>
		    </c:forEach>
		
		    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		    	<li id="center"><a href="aAllInfo.do${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
		    </c:if> 
	  	</ul>
	</div>

<!-- ----------------------------------------------------------------------------- -->

<div id="advertisementOrder">
	<div class="box2">
		<h1 class="ad_title">${imsi.ad_title}</h1>
		<span class="ad_name">${imsi.ad_name }</span>
        <span class="var">|</span>           
        <span class="location">${imsi.companyVO.c_loc }</span>
        	 	
	<div class="job_posting_tab">
    	<ul class="tab_list">
      		<li class="on">
        		<button type="button">상세</button>
      		</li>
      		<li>
        		<button type="button" onclick="location.href='reviewAll.do?rev_name=${imsi.ad_name }'">리뷰</button>
      		</li>
    	</ul>
 	</div>
	<ul>
    	<li class="ad_date">
            <span class="tit">
              	<i class="jp-calendar"></i> 마감일
            </span>
            <span class="cont">
                <span class="day_text">${imsi.ad_date }</span>
                <input style="border: none; width: 100px; color: red;" type="text" id="Day1" value="" readonly/>
            </span>
		</li>
        <li class="ad_job">
            <span class="tit">
              	<i class="jp-briefcase"></i> 직무
            </span>
            <span class="cont">
              	<span>${imsi.ad_job }</span>
            </span>
       	</li>
        <li class="ad_carr">
        	<span class="tit">
              	<i class="jp-bar-chart"></i> 경력
            </span>
            <span class="cont">
              	<span>${imsi.ad_carr}</span>
            </span>
       	</li>
        <li class="ad_emp">
            <span class="tit">
              	<i class="jp-check-circle"></i> 고용형태
            </span>
            <span class="cont">${imsi.ad_emp} </span>
        </li>
        <c:if test="${not empty imsi.ad_skill }">
	        <li class="ad_skill">
	            <span class="tit">
	              	<i class="jp-server"></i> 스킬
	            </span>
	            <span class="cont">
	                <span>${imsi.ad_skill }</span>
	            </span>
	        </li>
        </c:if>
	</ul>
      
	<br>
	<c:if test="${not empty imsi.ad_upmu }">
		<h3 class="title">주요업무</h3>
		<div class="text">
    		${imsi.ad_upmu}
		</div>
	</c:if>
	
	<br>
	
	<c:if test="${not empty imsi.ad_lien }">
		<div class="ad_lien">
	    	<h3 class="title">자격요건</h3>
	    	<div class="text">
	      		${fn:replace(imsi.ad_lien, newLienChar, "<br>") }
	    	</div>
		</div>
	</c:if>

	<br><br><br>

	<c:if test="${not empty imsi.ad_deals }">
		<div class="list">
	    	<h3 class="title">우대사항</h3>
	    	<div class="text">
	        	${fn:replace(imsi.ad_deals, newLienChar, "<br>") }
	    	</div>
		</div>
	</c:if>

	<c:if test="${not empty imsi.ad_pro }">
		<div class="list">
	    	<h3 class="title">채용절차</h3>
	    	<div class="text">
	        	${imsi.ad_pro }
	    	</div>
		</div>
	</c:if>

	<c:if test="${not empty imsi.ad_cp }">
		<div class="list">
	    	<h3 class="title">복리후생</h3>
	    	<div class="text">
	        	${fn:replace(imsi.ad_cp, newLienChar, "<br>") }
			</div>
		</div>
	</c:if>

	<c:if test="${not empty imsi.ad_ect }">
		<div class="list">
	    	<h3 class="title">기타</h3>
	    	<div class="text">
	        	${fn:replace(imsi.ad_ect, newLienChar, "<br>") }
	    	</div>
	  	</div>
	</c:if>

	<c:if test="${not empty imsi.companyVO.c_addr }">
		<div class="list">
	    	<h3 class="title">주소</h3>
	    	<div class="text">
	    		${imsi.companyVO.c_addr }
	    	</div>
	  	</div>
	</c:if>
	
	</div>
</div>

	<footer>
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</footer>
	
</body>
</html>