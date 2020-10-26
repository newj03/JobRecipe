<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>잡레시피</title>
<link type="text/css" href="<c:url value="/resources/css/jobCSS.css" />" rel="stylesheet">
<script type="text/javascript" src="<c:url value="/resources/js/jobJS.js"/>"></script>
<script src="<c:url value='/resources/js/jquery-3.1.1.js'/>"></script>
<script type="text/javascript">
	function applyCheck() {
		if(confirm("선택한 이력서로 지원하시겠습니까?")) {
			alert("지원을 완료했습니다.")
			location.href="/hire/aAllInfo.do";
		} else {
			location.href="redirect:/apply.do?ad_no" + $("#ad_no").val();
		}
	};
</script>

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
	<header>
		<jsp:include page="../include/header.jsp"></jsp:include>
	</header>
	<section>
		<div style="width: 100%; display: flex; flex-wrap: nowrap; min-height: 70vh;">
			<!-- 전체화면 -->

			<div style="width: 15%; margin-left: 3%;">
				
			</div>

			<div style="width: 60%; display: flex; flex-direction: column; margin-bottom: 5%;">
				<div style="width:100%;text-align:center;margin-top:5%;margin-bottom:3%;color:#ff6900;">
					<h1 style="font-size:22pt;font-weight: bolder;">지원하기</h1><br>
				</div>
				
				
				<div style="width:100%;text-align: left;margin-top:5%;margin-left: 18%;color:#ff6900;">
					<h2 style="font-size:22pt;">공고 정보</h2><br>
				</div>
				<div id="mainContents" class="jpcont_rgt" style="width:90%;margin-right:auto;margin-left:auto;">
					<div class="jpcont_wrap">
						<div class="layout_my_account myaccountcon">
							<div class="section_group" style="width:80%;margin-left:auto;margin-right:auto; text-align:center;">								
								<hr style="margin-bottom:1%; border:solid 1px #fac5a1">
								<div style="display:flex; flex-direction:column; flex-wrap:nowrap;">
								<input type="hidden" id="ad_no" value="${adVO.ad_no}">
									<ul>
										<li class="ad_date">
											<div style="display:flex; flex-direction: unset;margin-left:2%; flex-wrap:nowrap;margin-top:1%;">
											<span class="tit" style="text-align: center;width:20%;font-weight:bold;"> 
													마감일
											</span>
											<span class="cont" style="width:45%;padding-left: 3%;border:1px solid #ff6900; border-radius:10px;"> 
												<span class="day_text">
													${adVO.ad_date }
												</span>
											</span>
											</div>
										</li>
										<li class="ad_job">
											<div style="display:flex; flex-direction: row;margin-left:2%; flex-wrap:nowrap;margin-top:1%;">
											<span class="tit" style="text-align: center;width:20%;font-weight:bold;">  
													직무
											</span> 
											<span class="cont" style="width:45%;padding-left: 3%;border:1px solid #ff6900; border-radius:10px;"> 
												<span>${adVO.ad_job }</span>
											</span>
											</div>
										</li>
										<li class="ad_carr">
											<div style="display:flex; flex-direction: row;margin-left:2%; flex-wrap:nowrap;margin-top:1%;">
											<span class="tit" style="text-align: center;width:20%;font-weight:bold;"> 
													경력
											</span> 
											<span class="cont" style="width:45%;padding-left: 3%;border:1px solid #ff6900; border-radius:10px;"> 
												<span>${adVO.ad_carr}</span>
											</span>
											</div>
										</li>
										<li class="ad_emp">
											<div style="display:flex; flex-direction: row;margin-left:2%; flex-wrap:nowrap;margin-top:1%;">
											<span class="tit" style="text-align: center;width:20%;font-weight:bold;"> 
												고용형태
											</span> 
											<span class="cont" style="width:45%;padding-left: 3%;border:1px solid #ff6900; border-radius:10px;"> 
												${adVO.ad_emp} 
											</span>
											</div>
										</li>
										<c:if test="${not empty adVO.ad_skill }">
											<li class="ad_skill">
												<div style="display:flex; flex-direction: row;margin-left:2%; flex-wrap:nowrap;margin-top:1%;">
												<span class="tit" style="text-align: center;width:20%;font-weight:bold;"> 
														스킬
												</span> 
												<span class="cont" style="width:45%;padding-left: 3%;border:1px solid #ff6900; border-radius:10px;"> 
													<span>${adVO.ad_skill}</span>
												</span>
												</div>
											</li>
										</c:if>
										<c:if test="${empty adVO.ad_skill }">
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
								</div>
								
								<hr style="margin-bottom:1%; border:solid 1px #fac5a1">
								
								<div style="width:100%;text-align: left;margin-top:20%;margin-left: 5%;color:#ff6900;">
									<h2 style="font-size: 20pt;">이력서 선택</h2><br>
								</div>
								
								<hr style="margin-bottom:1%; border:solid 1px #fac5a1">
								<c:choose>
									<c:when test="${resumeVOList.size() eq 0}">
											<div style="margin-top:7%;margin-bottom:5%;">작성한 이력서가 없습니다.</div>
									</c:when>
									<c:otherwise>
										<c:forEach var="resumeVO" items="${resumeVOList}">
											<div style="display:flex; flex-direction:row; flex-wrap:nowrap;">
												<div style="width:60%;font-size: 15pt;">
													${resumeVO.res_title}
												</div>
												<div style="width:20%;font-size: 11pt;">${resumeVO.write_date}</div>
												<input type="checkbox" name="res_no" value="${resumeVO.res_no}"> 
											</div>
											<input type="hidden" id="res_no" value="${resumeVO.res_no}">
										</c:forEach>
									</c:otherwise>
								</c:choose>
								<hr style="margin-bottom:1%; border:solid 1px #fac5a1">
								<div id="btn_write" style="text-align: left;">
									<button type="button" onclick="location.href='resumeForm.do'" style="background-color:#ff6900;color:white;border:0;border-radius:10px;padding: 1%;">
									 	새로 작성하기
									</button>
									<button type="button" onclick="applyCheck()" style="background-color:#ff6900;width: 12%;color:white;border:0;border-radius:10px;margin-left: 68%;padding: 1%;">
										지원하기
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div
				style="width: 25%; align-items: center; display: flex; flex-direction: column;">
				<!--분할화면 오른쪽  -->
				<div
					style="margin-bottom: 3%; margin-top: 6%; align-items: center; display: flex; flex-direction: column;">
					<img style="border-radius: 30px; width: 90%;"
						src="/resources/images/ad1.gif" />
					<div
						style="margin-top: 2%; font-size: 20pt; font-weight: bold; font-style: italic;">Kaja
						Airline</div>
				</div>
				<div
					style="margin-bottom: 3%; align-items: center; display: flex; flex-direction: column;">
					<img style="border-radius: 30px; width: 90%;"
						src="/resources/images/ad2.gif" />
					<div
						style="margin-top: 2%; font-size: 20pt; font-weight: bold; font-style: italic;">Kaja
						Company</div>
				</div>
				<div
					style="margin-bottom: 3%; align-items: center; display: flex; flex-direction: column;">
					<img style="border-radius: 30px; width: 90%;"
						src="/resources/images/ad3.gif" />
					<div
						style="margin-top: 2%; font-size: 20pt; font-weight: bold; font-style: italic;">Kaja
						hire</div>
				</div>

			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</footer>
</body>
</html>