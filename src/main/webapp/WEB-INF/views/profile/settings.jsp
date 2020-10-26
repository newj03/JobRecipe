<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value="/resources/js/jobJS.js"/>"></script>

<style>
ul {
	list-style: none;
}
</style>

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

			<div style="width: 60%; display: flex; flex-direction: column; margin-bottom: 5%;">
				<div style="width:100%;text-align:center;margin-top:5%;margin-bottom:3%;color:#ff6900;">
					<h1 style="font-size:22pt;">계정 설정</h1><br>
					
					
				</div>
				<div id="mainContents" class="jpcont_rgt" style="width:90%;margin-right:auto;margin-left:auto;">
					<div class="jpcont_wrap">
						<div class="layout_my_account myaccountcon">
							<div class="section_group">
								<div style="display: flex; flex-direction: row;flex-wrap: nowrap;">
									<div onclick="location.href='./newsletter.do'" style="cursor:pointer;padding:1%;
										border:1px solid #fac5a1;color:#ff6900;border-radius:10px;margin-right:2%;">
										이메일 수신 설정
									</div>
									<div onclick="location.href='./change_password.do'" style="cursor:pointer;padding:1%;
										border:1px solid #fac5a1;color:#ff6900;border-radius:10px;margin-right:2%;">
										비밀번호 변경
									</div>
									<div onclick="location.href='./memberDelete.do'" style="cursor:pointer;padding:1%;
										border:1px solid #fac5a1;color:#ff6900;border-radius:10px;margin-right:2%;">
										회원 탈퇴
									</div>
								</div>
								<hr style="margin-bottom:1%; border:solid 1px #fac5a1">
								<div class="my_information_group">
									<!--email_list.scss.erb-->
									<ul class="email_list">
										<li class="" id="email-3325885">
											<div class="row1">
												<label>${sessionScope.u_email}</label>
											</div>
											<div class="row2">
												<span class="state">기본 이메일 주소</span>
											</div>
										</li>
									</ul>
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