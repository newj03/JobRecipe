<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>잡레시피</title>
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

<script type="text/javascript">
	function deleteCheck() {
		if(confirm("정말로 삭제하시겠습니까?")) {
			location.href="deleteResume.do?res_no=" + $("#res_no").val();
		} else {
			location.href="redirect:/resumes.do"
		}
	};
</script>
</head>
<body>
	<header>
		<jsp:include page="../include/header.jsp"></jsp:include>
	</header>
	<section>
		<div style="width: 100%; display: flex; flex-wrap: nowrap; min-height: 70vh;">
			<!-- 전체화면 -->

			<div style="width: 15%; margin-left: 3%;">
				<div id="myPageInfo" style="margin-bottom:5%;margin-top:15%;text-align:center;">
					<span class="img_profile"></span>
					<!-- 프로필 이미지 -->
					<img style="height:17vh;" src="/resources/images/default_user.png">
					<div class="my_info" style="font-weight:bold;">
						<h1>${u_email}</h1>
					</div>
				</div>
				<div id="myPageMenu">
					<div class="mypagemenu_wrap">
						<div style="display: flex;flex-direction: column; flex-wrap: nowrap;text-align:center">
							
							<div onclick="location.href='settings.do'" style="padding:1%;font-size:18pt;cursor:pointer;margin-bottom:3%;
								border:1px solid #fac5a1;color:#ff6900;border-radius:10px;">
								계정
							</div>
							<div onclick="location.href='resumes.do'" style="padding:1%;font-size:18pt;cursor:pointer;margin-bottom:3%;
								border:1px solid #fac5a1;color:#ff6900;border-radius:10px;">
								프로필
							</div>
							<div onclick="location.href='reviews.do'" style="padding:1%;font-size:18pt;cursor:pointer;margin-bottom:3%;
								border:1px solid #fac5a1;color:#ff6900;border-radius:10px;">
								내 리뷰
							</div>
							
						</div>
					</div>
				</div>
			</div>

			<div
				style="width: 60%; display: flex; flex-direction: column; margin-bottom: 5%;">
				<div style="width:100%;text-align:center;margin-top:5%;margin-bottom:3%;color:#ff6900;">
					<h1 style="font-size:22pt;">내 프로필</h1><br>
				</div>
				<div id="mainContents" class="jpcont_rgt" style="width:90%;margin-right:auto;margin-left:auto;">
					<div class="jpcont_wrap">
						<div class="layout_my_account myaccountcon">
							<div class="section_group" style="width:80%;margin-left:auto;margin-right:auto;
								text-align:center;">
								
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
													<button onclick="location.href='updateResumeForm.do?res_no=${resumeVO.res_no}'" style="background-color:#ff6900;color:white;border:0;border-radius:10px;padding:1%;margin-right: 20px;">수정</button>
													<button onclick="deleteCheck()" style="background-color:#ff6900;color:white;border:0;border-radius:10px;padding:1%;margin-right: 20px;">삭제</button>
												</div>
												<input type="hidden" id="res_no" value="${resumeVO.res_no}">
										</c:forEach>
									</c:otherwise>
								</c:choose>
								<hr style="margin-bottom:1%; border:solid 1px #fac5a1">
								<div id="btn_write" style="text-align: right;">
									<button type="button" onclick="location.href='resumeForm.do'" style="background-color:#ff6900;color:white;border:0;border-radius:10px;padding:1%;">
									 	새로 작성하기
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
					<img style="border-radius: 30px; width: 80%;"
						src="/resources/images/ad1.gif" />
				</div>
				<div
					style="margin-bottom: 3%; align-items: center; display: flex; flex-direction: column;">
					<img style="border-radius: 30px; width: 80%;"
						src="/resources/images/ad2.gif" />
				</div>
				<div
					style="margin-bottom: 3%; align-items: center; display: flex; flex-direction: column;">
					<img style="border-radius: 30px; width: 80%;"
						src="/resources/images/ad3.gif" />
				</div>

			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</footer>
	
</body>
</html>