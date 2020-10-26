<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>잡레시피</title>
<link type="text/css" href="<c:url value="/resources/css/jobCSS.css" />" rel="stylesheet">
<script type="text/javascript" src="<c:url value="/resources/js/jobJS.js"/>"></script>
<script src="<c:url value='/resources/js/jquery-3.1.1.js'/>"></script>
<script type="text/javascript">
	$(function() {
		//전체선택 체크박스 클릭 
		$("#agree_all").click(function(){
			//만약 전체 선택 체크박스가 체크된 상태일 경우
			if($("#agree_all").prop("checked")) {
				//해당화면에 전체 checkbox들을 체크
				$("input[type=checkbox]").prop("checked",true);
			//전체선택 체크박스가 해제된 경우 
			} else {
				//해당화면에 모든 checkbox들의 체크를 해제
				$("input[type=checkbox]").prop("checked",false);
			} 
		});
	});
</script>
</head>
<body>
	<form action="signupMember.do" method="post">
		<div class="signup_warp">
			<h1>회원가입</h1>
			<!-- 이용 약관 체크 -->
			<div class="users_terms">
				<div class="terms_top">
					<h2>전체동의</h2>
					<label class="btn_check" for="agree_all">
						<input type="checkbox" id="agree_all" name="agree_all" value="0" onclick="users_agreeAll();">
						<!-- <span class="check_icon"></span> -->
					</label>
				</div>
				<div class="terms_body">
					<div class="terms_title1"> <!-- 개인정보 회원 이용약관 동의 제목 -->
						<div>
							<h2>
								개인정보 회원 이용약관 동의<span class="txt_gra"> (필수)</span> <!-- txt_gra 등의 클래스는 폰트 색상 등 변경 -->
							</h2>
						</div>
						<label class="btn_check" for="tou_service"> <!-- tou : terms of use -->
							<input type="checkbox" id="tou_service" name="u_tou_service" value="0" onclick="users_changeCkboxVal('tou_service');">
							<!-- <span class="check_icon"></span> -->
						</label>
					</div>
					<div class="terms_con1"> <!-- 개인정보 회원 이용약관 동의 내용 -->
					
					</div>
					<div class="terms_title2"> <!-- 개인정보 수집 및 이용 제목 -->
						<h2>개인정보 수집 및 이용</h2>
					</div>
					<div class="sub_check">
						<div>
							<h3>
								필수적 개인정보 수집 및 이용 동의<span class="txt_gra"> (필수)</span>
							</h3>
						</div>
						<label class="btn_check" for="tou_privacy">
							<input type="checkbox" id="tou_privacy" name="u_tou_privacy" value="0" onclick="users_changeCkboxVal('tou_privacy');">
							<!-- <span class="check_icon"></span> -->
						</label>
					</div>
					<div class="sub_check">
						<div>
							<h3>
								선택적 개인정보 수집 및 이용 동의<span class="txt_gre"> (선택)</span> <!-- gre는 gra와 다른 색상으로 (필수/선택 구분) -->
							</h3>
						</div>
						<label class="btn_check" for="tou_privacy_optional">
							<input type="checkbox" id="tou_privacy_optional" name="u_privateInfo" value="0" onclick="users_changeCkboxVal('tou_privacy_optional');"> <!-- 체크시 rec_users 테이블로 넘어가는 정보 -->
							<!-- <span class="check_icon"></span> -->
						</label>
					</div>
					<div class="terms_con2">
					
					</div>
					<div class="terms_title3">
						<div>
							<h2>
								채용 뉴스레터 등 마케팅 정보 수신<span class="txt_gre"> (선택)</span>
							</h2>
						</div>
						<label class="btn_check" for="user_subscribe_news">
							<input type="checkbox" id="user_subscribe_news" name="u_newsLetter" value="0" onclick="users_changeCkboxVal('user_subscribe_news');"> <!-- 체크시 rec_users 테이블로 넘어가는 정보 -->
							<!-- <span class="check_icon"></span> -->
						</label>
						<div class="sub_check">
							<h3>잡레시피에서 제공하는 채용 정보 및 유용한 정보를 받겠습니다.</h3>
						</div>
					</div>
					<div class="terms_con3">
						이용약관과 개인정보 수집 및 이용(필수)에 대한 안내 모두 동의해주세요.
					</div>
				</div>
			</div>
			
			<!-- 회원 정보(로그인 관련) 입력 -->
			<div class="users_loginInfo">
				<table>
					<tr>
						<td><input type="text" name="u_email" placeholder="이메일"></td>
					</tr>
					<tr>
						<td><input type="password" name="u_pw" placeholder="비밀번호"></td>
					</tr>
					<tr>
						<td><input type="password" name="u_pwCheck" placeholder="비밀번호 확인"></td>
					</tr>
					<tr>
						<td style="text-align: center;"><input type="submit" value="동의 및 회원가입"></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</body>
</html>