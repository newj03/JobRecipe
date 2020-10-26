<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link type="text/css" href="<c:url value="/resources/css/jobCSS.css" />" rel="stylesheet">
<script type="text/javascript" src="<c:url value="/resources/js/jobJS.js"/>"></script>

<style>
ul {
	list-style: none;
}
</style>

</head>
<body>
	<header>
		<jsp:include page="../include/header.jsp"></jsp:include>
		<a href="../profile/hire/Search_Job.do">검색</a>
	</header>
	<section>
		<div id="myPageMyInformationMenu" class="mypage_menu"
			style="position: fixed; left: 0x; top: 100px;">
			<nav id="profile-left-menu">
				<h2>계정</h2>
				<hr>
				<ul>
					<li class="active">
						<a href="./settings.do"> 
							<span class="txt">계정 설정</span> <span class="num notranslate"></span>
						</a>
					</li>
					<li class="">
						<a href="./change_password.do"> 
							<span class="txt">비밀번호 변경</span> <span class="num notranslate"></span>
						</a>
					</li>
					<li class="">
						<a href="./newsletter.do"> 
							<span class="txt">이메일 수신 설정</span> <span class="num notranslate"></span>
						</a>
					</li>
				</ul>
			</nav>
		</div>
		
		<div id="myPageInfo">
			<span class="img_profile"></span> <!-- 프로필 이미지 -->
			<div class="my_info">
				<h1>${u_email}</h1>
			</div>
		</div>
		
		<div id="myPageMenu">
			<div class="mypagemenu_wrap">
				<div class="table_row_div">
					<a href="settings.do">계정</a>
					<a href="resumes.do">내 프로필</a>
					<a href="#">활동내역</a>
					<a href="#">관심정보</a>
				</div>
			</div>
		</div>
		
		<div id="mainContents" class="jpcont_rgt"
			style="position: relative; left: 300px; top: 100px;">
			<div class="jpcont_wrap">
				<div class="layout_my_account myaccountcon">
					<div class="section_group">
						<h2 class="tit">계정</h2>
						<hr>
						<section class="my_information">
							<div class="my_information_group">
								<dl class="email">
									<dt>이메일</dt>
									<dd>
										등록된 모든 이메일로 로그인할 수 있습니다.<br> 
										기본 이메일로 설정하여 잡플래닛의 유용한 정보와 소식을 받아보세요.<br>
									</dd>
								</dl>
								<!--email_list.scss.erb-->
								<ul class="email_list">
									<li class="" id="email-3325885">
										<div class="row1">
											<span class="email">wjdrn15@naver.com</span>
										</div>
										<div class="row2">
											<span class="state">기본 이메일 주소</span>
										</div>
									</li>
								</ul>
	
								<dl class="facebook">
									<dt>페이스북 연동</dt>
									<dd>
										<div class="facebook_etc">
											<span class="off">페이스북에 연결되지 않았습니다.</span>
										</div>
										<a href="/users/auth/facebook" class="btn_share"> <span
											class="blt"></span>페이스북 연동
										</a>
									</dd>
								</dl>
							</div>
						</section>
					</div>
					<!--//section_group-->
				</div>
			</div>
	
			<div class="myaccountcon_bottom">
				<a class="mobile_logout" data-method="delete" href="/users/sign_out"
					rel="nofollow">로그아웃</a>
				<div class="member_out">
					잡플래닛을 더 이상 이용하지 않는다면 <a href="./memberDelete.do" class="link_blue">회원탈퇴</a> 
				</div>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</footer>
</body>
</html>