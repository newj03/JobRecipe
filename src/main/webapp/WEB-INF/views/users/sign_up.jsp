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
	
		// 이메일 중복 체크 검사(1 = 중복 / 0 != 중복)
		$("#u_email").blur(function() {
			var u_email = $('#u_email').val();
			var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			$.ajax({
				url : 'emailCheck.do?u_email='+ u_email,
				type : 'get',
				success : function(data) {
					console.log("1 = 중복o / 0 = 중복x : "+ data);							
					
					if (data == 1) {
							// 1 : 이메일 중복
							$("#email_check").text("사용중인 이메일입니다.");
							$("#email_check").css("color", "red");
							$("#reg_submit").attr("disabled", true);
					} else {
						
						if (u_email.match(regExp) != null) {
							$("#email_check").text("");
							$("#reg_submit").attr("disabled", false);
				
						} else if(u_email == ""){
							
							$('#email_check').text('이메일을 입력해주세요.');
							$('#email_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);				
							
						} else {
						
							$('#email_check').text("이메일 형식에 맞게 입력해주세요.");
							$('#email_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);
							    
						}
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
		
		$("#u_pwCheck").blur(function() {
			var pw = $("#u_pw").val();
			var pwCheck = $("#u_pwCheck").val(); 
			
			if(pw != pwCheck) {
				$('#pw_check').text("비밀번호가 다릅니다.");
				$('#pw_check').css('color', 'red');
				$("#reg_submit").attr("disabled", true);
			} else {
				$('#pw_check').text("");
				$("#reg_submit").attr("disabled", false);
			}
		});
	});
</script>
</head>
<body>
	<div onclick="location.href='/hire/Search_Job.do'" style="width:100%; text-align:center;color:#ff6900;font-style:italic;margin-top:4%;margin-bottom:3%; font-weight:bold;font-size:38pt;">
		Job Recipe
	</div>
	<h1 style="text-align:center; font-size:22pt; font-weight: 600; color:#ff6900;margin-top:3%;margin-bottom:2%;">회원가입</h1>
	<div style="width:40%;display:flex; flex-direction: column;margin-bottom:5%; margin-right:auto; margin-left:auto;text-align:center;border:1px solid #fafafa;background-color:#fafafa;">
	<form action="signupMember.do" method="post">
		<div class="signup_warp">
			<hr style="border:1px solid #e8e8e8">
			<!-- 이용 약관 체크 -->
			<div class="users_terms" style="margin-bottom: 5%;">
				<div class="terms_top" style="display:flex; flex-direction: row;justify-content: center;
					flex-wrap: nowrap;margin-bottom:4%;">
					<h2 style="font-size:16pt;color:green;">전체동의</h2>
					<label class="btn_check" for="agree_all" style="padding-top: 1%;margin-left: 1%;">
						<input type="checkbox" id="agree_all" name="agree_all" value="0" onclick="users_agreeAll();">
						<!-- <span class="check_icon"></span> -->
					</label>
				</div>
				<div class="terms_body">
					<div class="terms_title1" style="display:flex; flex-direction: row;justify-content: center;
					flex-wrap: nowrap;margin-bottom:3%;">
					<!-- 개인정보 회원 이용약관 동의 제목 -->
						<div>
							<h2 style="font-size:16pt;">
								개인정보 회원 이용약관 동의<span class="txt_gra"> (필수)</span> <!-- txt_gra 등의 클래스는 폰트 색상 등 변경 -->
							</h2>
						</div>
						<label class="btn_check" for="tou_service" style="padding-top:1%;margin-left: 1%;"> <!-- tou : terms of use -->
							<input type="checkbox" id="tou_service" name="u_tou_service" value="0" onclick="users_changeCkboxVal('tou_service');">
							<!-- <span class="check_icon"></span> -->
						</label>
					</div>
					<div class="sub_check" style="display:flex; flex-direction: row;justify-content: center;
					flex-wrap: nowrap;margin-bottom:3%;">
						<div>
							<h3 style="font-size:16pt;">
								필수적 개인정보 수집 및 이용 동의<span class="txt_gra"> (필수)</span>
							</h3>
						</div>
						<label class="btn_check" for="tou_privacy" style="padding-top:1%;margin-left: 1%;">
							<input type="checkbox" id="tou_privacy" name="u_tou_privacy" value="0" onclick="users_changeCkboxVal('tou_privacy');">
							<!-- <span class="check_icon"></span> -->
						</label>
					</div>
					<div class="sub_check" style="display:flex; flex-direction: row;justify-content: center;
					flex-wrap: nowrap;margin-bottom:3%;">
						<div>
							<h3 style="font-size:16pt;">
								선택적 개인정보 수집 및 이용 동의<span class="txt_gre"> (선택)</span> <!-- gre는 gra와 다른 색상으로 (필수/선택 구분) -->
							</h3>
						</div>
						<label class="btn_check" for="tou_privacy_optional" style="padding-top:1%;margin-left: 1%;">
							<input type="checkbox" id="tou_privacy_optional" name="u_privateInfo" value="0" onclick="users_changeCkboxVal('tou_privacy_optional');"> <!-- 체크시 rec_users 테이블로 넘어가는 정보 -->
							<!-- <span class="check_icon"></span> -->
						</label>
					</div>
					<div class="terms_con2">
					
					</div>
					<div class="terms_title3" style="display:flex; flex-direction: row;justify-content: center;
					flex-wrap: nowrap;margin-bottom:3%;">
						<div>
							<h2 style="font-size:16pt;">
								채용 뉴스레터 등 마케팅 정보 수신<span class="txt_gre"> (선택)</span>
							</h2>
						</div>
						<label class="btn_check" for="user_subscribe_news" style="padding-top:1%;margin-left: 1%;">
							<input type="checkbox" id="user_subscribe_news" name="u_newsLetter" value="0" onclick="users_changeCkboxVal('user_subscribe_news');"> <!-- 체크시 rec_users 테이블로 넘어가는 정보 -->
							<!-- <span class="check_icon"></span> -->
						</label>
					</div>
						<div class="sub_check">
							<h3>잡레시피에서 제공하는 채용 정보 및 유용한 정보를 받겠습니다.</h3>
						</div>
					<div class="terms_con3">
						이용약관과 개인정보 수집 및 이용(필수)에 대한 안내 모두 동의해주세요.
					</div>
				</div>
			</div>
			
			<!-- 회원 정보(로그인 관련) 입력 -->
			<div class="users_loginInfo" style="display:flex; flex-direction: column;justify-content: center;
					flex-wrap: nowrap;">
				<input type="text" class="form-control" id="u_email" name="u_email" placeholder="이메일"
					style="text-align: center; width:50%;border:1px solid #fac5a1;border-radius:15px;margin-left:auto;margin-right:auto;
					margin-top:1%;margin-bottom:1%;font-size:17pt;">
				<div class="check_font" id="email_check" style="width:90%;margin-left:auto;margin-right:auto;
					margin-top:1%;margin-bottom:1%;font-size:17pt;"></div>
				
				<input type="password" id="u_pw" name="u_pw" placeholder="비밀번호"
				style="text-align: center; width:50%;border:1px solid #fac5a1;border-radius:15px;margin-left:auto;margin-right:auto;
					margin-top:1%;margin-bottom:1%;font-size:17pt;">
				
				<input type="password" id="u_pwCheck" name="u_pwCheck" placeholder="비밀번호 확인"
				style="text-align: center; width:50%;border:1px solid #fac5a1;border-radius:15px;margin-left:auto;margin-right:auto;
					margin-top:1%;margin-bottom:1%;font-size:17pt;">
				<div class="check_font" id="pw_check"style="width:90%;margin-left:auto;margin-right:auto;
					margin-top:1%;margin-bottom:3%;font-size:17pt;"></div>
				
				<input type="submit" id="reg_submit" value="동의 및 회원가입" style="font-size:17pt; background-color:#ff6900; color:white;
					border:0;border-radius:15px;width:50%;margin-bottom:4%;margin-left:auto;margin-right:auto;padding:1%;">
			</div>
				<!-- <table>
					<tr>
						<td>
							<input type="text" class="form-control" id="u_email" name="u_email" placeholder="이메일">
							<div class="check_font" id="email_check"></div>
						</td>
					</tr>
					<tr>
						<td><input type="password" id="u_pw" name="u_pw" placeholder="비밀번호"></td>
					</tr>
					<tr>
						<td>
							<input type="password" id="u_pwCheck" name="u_pwCheck" placeholder="비밀번호 확인">
							<div class="check_font" id="pw_check"></div>
						</td>
					</tr>
					<tr>
						<td style="text-align: center;"><input type="submit" id="reg_submit" value="동의 및 회원가입"></td>
					</tr>
				</table> -->
			</div>
		</form>
	</div>
</body>
</html>