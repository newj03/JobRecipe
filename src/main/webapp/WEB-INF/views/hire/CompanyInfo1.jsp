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


<script>
	$(document).ready(function() {
		$("#companyTable li").on("click", function() { //리스트에서 공고 클릭
			var one = $(this);
			var ad_no = one.find("#companyNo").text();
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

<section style="color:#333333;">
	<div style="width: 100%; display: flex; flex-wrap: nowrap; min-height: 70vh;">
		<div style="width: 30%;	display:flex;align-items:center; flex-direction: column;">
			<select style="width:30%; padding:2%;border-color:#fac5a1;align-self: flex-end;border-radius:10px;
    			margin-right: 5%;margin-bottom:3%;font-weight:bold;" id="order" name="order" onchange="advertiseOrder1()">
				<option value="평점순">평점순</option>
				<option value="마감일">마감일</option>
			</select>
			<div style="overflow: auto; width: 90%;">
				<div id="companyOrder">
					<div id="companyTable">
						<hr style="margin-bottom:1%; border:solid 1px #fac5a1">
						<c:forEach var="vo" items="${info }">
							<li>
							<div style="display:flex; flex-direction: column;flex-wrap: nowrap;
								cursor:pointer; margin-left:3%;" <%-- onclick="location.href='aAllInfo.do?ad_no=${vo.ad_no }'" --%>>
								<div id="companyNo" style="display: none;">${vo.ad_no }</div>
								<div style="display:flex; flex-direction: row;flex-wrap: nowrap;">
									<div style="font-size:6pt;border:solid 1px #fac5a1;border-radius:5px;
									padding: 1%;margin-top: auto;margin-bottom: auto;color: #ff6900;margin-right:1%;">
										title
									</div>
									<div id="ad_title" class="title">
										${vo.ad_title }
									</div>
								</div>
									<div class="company">${vo.companyVO.c_name }</div>
									
								<div style="display:flex; flex-direction: row;flex-wrap: nowrap;justify-content: space-between;">
									<div class="star">${vo.ad_date }</div>
									<c:if test="${vo.companyVO.c_star==null }">
										<div class="company">평점 : 0</div>
									</c:if>
									<c:if test="${vo.companyVO.c_star!=null }">
										<div class="company">평점 : ${vo.companyVO.c_star }</div>
									</c:if>
								</div>
							
								
							</div>
							</li>
							<hr style="margin-bottom:1%; border:solid 1px #fac5a1">
						</c:forEach>
					</div>
				</div>
				<div >
				<ul>
				<!-- 게시판 하단의 페이징  -->
					<c:if test="${pageMaker.prev}">
						<li id="center">
							<a href="aAllInfo1.do${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a>
						</li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<li id="center">
							<a href="aAllInfo1.do${pageMaker.makeQuery(idx)}">${idx}</a></li>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li id="center">
							<a href="aAllInfo1.do${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
					</c:if>
				</ul>
				</div>
			</div>
		</div>
		<div style="width: 60%;border:1px solid #fac5a1 ;display:flex; flex-direction: column;padding-bottom:5%;
			    border-radius: 13px;">
			<div id="advertisementOrder">
			<div class="box2">
			<div style="overflow:auto; max-height:92vh;padding-left:2%;">
				<div style="display:flex; flex-direction: row; flex-wrap:nowrap;margin-top:1%;">
					<img style="border-radius: 30px;width:15%;" src="/resources/images/default_comp.png"/>
					<div style="display:flex;width:85%; flex-direction: column;">
						<h1 style="width:90%;padding-left:2%; margin-bottom:0;" class="ad_title">
							${imsi.ad_title}
						</h1>
						<div style="display:flex; padding-left:2%; flex-direction: column; flex-wrap:nowrap;">
							<div style="font-weight:bold;font-size:15pt;">${imsi.ad_name } </div>
							<div style="font-size:12pt;color:#fafafa;">${imsi.companyVO.c_loc }</div>
						</div>
					</div>
				</div>
				
				<hr style="margin-bottom:1%; border:solid 1px #fac5a1">
				<div class="job_posting_tab">
					<ul class="tab_list">
						<li class="on">
							<button type="button" style="font-weight:bold;border:1px solid #fac5a1; border-radius:15px;">
								상세
							</button>
						</li>
						
						<li>
							<button type="button" style="font-weight:bold;border:1px solid #fac5a1; border-radius:15px;"
								onclick="location.href='reviewAll.do?rev_name=${imsi.ad_name }'">리뷰</button>
						</li>
						
						<li>
							<button type="button" style="font-weight:bold;border:1px solid #fac5a1; border-radius:15px;" onclick="location.href='/apply.do?ad_no=${imsi.ad_no}'">
								지원하기
							</button>						
						</li>
					</ul>
				</div>
				
				
				<ul>
					<li class="ad_date">
						<div style="display:flex; flex-direction: row;margin-left:2%; flex-wrap:nowrap;margin-top:1%;">
						<span class="tit" style="text-align: center;width:20%;font-weight:bold;"> 
								마감일
						</span>
						<span class="cont"  style="width:45%;padding-left: 3%;border:1px solid #ff6900; border-radius:10px;"> 
							<span class="day_text">
								${imsi.ad_date }
							</span>
							<input style="border: none; width: 100px; color: red;"
								type="text" id="Day1" value="" readonly />
						</span>
						</div>
					</li>
					<li class="ad_job">
						<div style="display:flex; flex-direction: row;margin-left:2%; flex-wrap:nowrap;margin-top:1%;">
						<span class="tit" style="text-align: center;width:20%;font-weight:bold;">  
								직무
						</span> 
						<span class="cont"  style="width:45%;padding-left: 3%;border:1px solid #ff6900; border-radius:10px;"> 
							<span>${imsi.ad_job }</span>
						</span>
						</div>
					</li>
					<li class="ad_carr">
						<div style="display:flex; flex-direction: row;margin-left:2%; flex-wrap:nowrap;margin-top:1%;">
						<span class="tit" style="text-align: center;width:20%;font-weight:bold;"> 
								경력
						</span> 
						<span class="cont" style="width:45%;padding-left: 3%;border:1px solid #ff6900; border-radius:10px;"> 
							<span>${imsi.ad_carr}</span>
						</span>
						</div>
					</li>
					<li class="ad_emp">
						<div style="display:flex; flex-direction: row;margin-left:2%; flex-wrap:nowrap;margin-top:1%;">
						<span class="tit" style="text-align: center;width:20%;font-weight:bold;"> 
							고용형태
						</span> 
						<span class="cont" style="width:45%;padding-left: 3%;border:1px solid #ff6900; border-radius:10px;"> 
							${imsi.ad_emp} 
						</span>
						</div>
					</li>
					<c:if test="${not empty imsi.ad_skill }">
						<li class="ad_skill">
							<div style="display:flex; flex-direction: row;margin-left:2%; flex-wrap:nowrap;margin-top:1%;">
							<span class="tit" style="text-align: center;width:20%;font-weight:bold;"> 
									스킬
							</span> 
							<span class="cont" style="width:45%;padding-left: 3%;border:1px solid #ff6900; border-radius:10px;"> 
								<span>${imsi.ad_skill }</span>
							</span>
							</div>
						</li>
					</c:if>
					<c:if test="${empty imsi.ad_skill }">
						<li class="ad_skill">
							<div style="display:flex; flex-direction: row;margin-left:2%; flex-wrap:nowrap;margin-top:1%;">
							<span class="tit" style="text-align: center;width:20%;font-weight:bold;"> 
									스킬
							</span> 
							<span class="cont" style="width:45%;padding-left: 3%;border:1px solid #ff6900; border-radius:10px;"> 
								<span>-</span>
							</span>
							</div>
						</li>
					</c:if>
				</ul>
				<br>
				<hr style="margin-bottom:4	%; border:solid 1px #fac5a1">
				<div style="display:flex; flex-direction: column;margin-left:2%; flex-wrap:nowrap;
					width:75;margin-top:3%;">
					
					<!-- 시작 -->
					<div style="display:flex; flex-direction: row;flex-wrap:nowrap;
						justify-content: space-around;text-align:center; margin-bottom:2%;">
						<div style="width:40%;">
							<c:if test="${not empty imsi.ad_upmu }">
							<div style="width:90%;display:flex; flex-direction: row;flex-wrap:nowrap;">
								<h3 class="title" style="margin-right:2%;width: 35%;">주요업무</h3>
								<div class="text" style="width:60%;border:1px solid #fac5a1; border-radius:10px;">
									${imsi.ad_upmu}
								</div>
							</div>
							</c:if>
							<c:if test="${empty imsi.ad_upmu }">
							<div style="width:90%;display:flex; flex-direction: row;flex-wrap:nowrap;">
								<h3 class="title" style="margin-right:2%;width: 35%;">주요업무</h3>
								<div class="text"style="width:60%;border:1px solid #fac5a1; border-radius:10px;">-</div>
							</div>
							</c:if>
						</div>
						<div style="width:40%;">
							<c:if test="${not empty imsi.ad_lien }">
								<div class="ad_lien"style="width:90%;display:flex; flex-direction: row;flex-wrap:nowrap;">
									<h3 class="title"  style="margin-right:2%;width: 35%;">자격요건</h3>
									<div class="text" style="width:60%;border:1px solid #fac5a1; border-radius:10px;">
										${fn:replace(imsi.ad_lien, newLienChar, "<br>") }
									</div>
								</div>
							</c:if>
							<c:if test="${empty imsi.ad_lien }">
								<div class="ad_lien"style="width:90%;display:flex; flex-direction: row;flex-wrap:nowrap;">
									<h3 class="title"  style="margin-right:2%;width: 35%;">자격요건</h3>
									<div class="text" style="width:60%;border:1px solid #fac5a1; border-radius:10px;">
										-
									</div>
								</div>
							</c:if>
						</div>
					</div>
					<div style="display:flex; flex-direction: row;flex-wrap:nowrap;
						justify-content: space-around;text-align:center; margin-bottom:2%;">
						<div style="width:40%;">
							<c:if test="${not empty imsi.ad_deals }">
							<div style="width:90%;display:flex; flex-direction: row;flex-wrap:nowrap;">
								<h3 class="title" style="margin-right:2%;width: 35%;">우대사항</h3>
								<div class="text" style="width:60%;border:1px solid #fac5a1; border-radius:10px;">
									${fn:replace(imsi.ad_deals, newLienChar, "<br>") }
								</div>
							</div>
							</c:if>
							<c:if test="${empty imsi.ad_deals }">
							<div style="width:90%;display:flex; flex-direction: row;flex-wrap:nowrap;">
								<h3 class="title" style="margin-right:2%;width: 35%;">우대사항</h3>
								<div class="text"style="width:60%;border:1px solid #fac5a1; border-radius:10px;">-</div>
							</div>
							</c:if>
						</div>
						<div style="width:40%;">
							<c:if test="${not empty imsi.ad_pro }">
								<div class="ad_lien"style="width:90%;display:flex; flex-direction: row;flex-wrap:nowrap;">
									<h3 class="title"  style="margin-right:2%;width: 35%;">채용절차</h3>
									<div class="text" style="width:60%;border:1px solid #fac5a1; border-radius:10px;">
										${imsi.ad_pro }
									</div>
								</div>
							</c:if>
							<c:if test="${ empty imsi.ad_pro }">
								<div class="ad_lien"style="width:90%;display:flex; flex-direction: row;flex-wrap:nowrap;">
									<h3 class="title"  style="margin-right:2%;width: 35%;">채용절차</h3>
									<div class="text" style="width:60%;border:1px solid #fac5a1; border-radius:10px;">
										-
									</div>
								</div>
							</c:if>
						</div>
					</div>
					
					<div style="display:flex; flex-direction: row;flex-wrap:nowrap;
						justify-content: space-around;text-align:center; margin-bottom:2%;">
						<div style="width:40%;">
							<c:if test="${not empty imsi.ad_cp }">
							<div style="width:90%;display:flex; flex-direction: row;flex-wrap:nowrap;">
								<h3 class="title" style="margin-right:2%;width: 35%;">복리후생</h3>
								<div class="text" style="width:60%;border:1px solid #fac5a1; border-radius:10px;">
									${fn:replace(imsi.ad_cp, newLienChar, "<br>") }
								</div>
							</div>
							</c:if>
							<c:if test="${ empty imsi.ad_cp }">
							<div style="width:90%;display:flex; flex-direction: row;flex-wrap:nowrap;">
								<h3 class="title" style="margin-right:2%;width: 35%;">복리후생</h3>
								<div class="text"style="width:60%;border:1px solid #fac5a1; border-radius:10px;">-</div>
							</div>
							</c:if>
						</div>
						<div style="width:40%;">
							<c:if test="${not empty imsi.ad_ect }">
								<div class="ad_lien"style="width:90%;display:flex; flex-direction: row;flex-wrap:nowrap;">
									<h3 class="title"  style="margin-right:2%;width: 35%;">기타</h3>
									<div class="text" style="width:60%;border:1px solid #fac5a1; border-radius:10px;">
										${fn:replace(imsi.ad_ect, newLienChar, "<br>") }
									</div>
								</div>
							</c:if>
							<c:if test="${ empty imsi.ad_ect }">
								<div class="ad_lien"style="width:90%;display:flex; flex-direction: row;flex-wrap:nowrap;">
									<h3 class="title"  style="margin-right:2%;width: 35%;">기타</h3>
									<div class="text" style="width:60%;border:1px solid #fac5a1; border-radius:10px;">
										-
									</div>
								</div>
							</c:if>
						</div>
					</div>
					
				</div>

				<br>
				<br>
				<br>

			</div>
		</div>
		</div>	
		</div>
		<div style="width: 24%;margin-left:1%; align-items:center;display:flex; flex-direction: column;
			border:1px solid #e6e8ff;border-radius:15px;">
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
				<img style="border-radius: 30px;width:90%;" src="/resources/images/ad3.gif"/>
				<!-- <div style="margin-top:2%; font-size:20pt; font-weight:bold;font-style: italic;">Kaja hire</div> -->
			</div>
				
		</div>
		
	</div>
</section>
	<footer>
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</footer>
	
</body>
</html>