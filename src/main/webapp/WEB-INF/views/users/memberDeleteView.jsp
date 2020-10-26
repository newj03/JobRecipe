<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<%-- <link type="text/css" href="<c:url value="/resources/css/jobCSS.css" />" rel="stylesheet"> --%>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>회원탈퇴</title>
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
<script type="text/javascript">
$(document).ready(function(){
	// 취소
	$(".cencle").on("click", function(){
		
		location.href = "/";
				    
	})

	$("#submit").on("click", function(){
		if($("#u_pw").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#u_pw").focus();
			return false;
		}	
	});
})
</script>
<body>
<header>
	<jsp:include page="../include/header.jsp"></jsp:include>
</header>
<section>
	<div
		style="width: 100%; display: flex; flex-wrap: nowrap; min-height: 70vh;">
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
						<hr>
						<div id="container">
							<form action="memberDelete.do" method="post">
								<div class="form-group has-feedback" style="margin-top:5%;margin-bottom:5%">
									<label class="control-label" for="u_email" style="margin-bottom:3%">이메일</label> 
									<input class="form-control" type="text" id="u_email" name="u_email"
										value="${sessionScope.u_email}" readonly="readonly" />
								</div>
								<div class="form-group has-feedback" style="margin-bottom:5%">
									<label class="control-label" for="u_pw"style="margin-bottom:3%">패스워드</label> 
									<input class="form-control" type="password" id="u_pw" name="u_pw" />
								</div>
								<div class="form-group has-feedback">
									<button class="btn btn-success" type="submit" id="submit">회원탈퇴</button>
									<button class="cencle btn btn-danger" type="button">취소</button>
								</div>
							</form>
							<div>
								<c:if test="${msg == false}">
									비밀번호가 맞지 않습니다.
								</c:if>
							</div>
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