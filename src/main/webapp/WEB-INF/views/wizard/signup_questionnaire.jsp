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
<body style="margin:0;">

	<div onclick="location.href='/hire/Search_Job.do'" style="width:100%; text-align:center;color:#ff6900;font-style:italic;margin-top:4%;margin-bottom:3%; font-weight:bold;font-size:38pt;">
		Job Recipe
	</div>
	<h1 style="text-align:center; font-size:22pt; font-weight: 600; color:#ff6900;margin-top:3%;margin-bottom:2%;">회원가입</h1>
			
	<div style="width:40%;display:flex; flex-direction: column;margin-bottom:5%; margin-right:auto; margin-left:auto;text-align:center;border:1px solid #fafafa;background-color:#fafafa;">
		<div class="question_wrap">
			<div class="question_head" style="text-align:center; margin-bottom: 5%;">
				<div class="head_title_group">
					<p class="head_title1" style="font-size: 15pt; margin-bottom: 1%">설문을 완료하시면 서비스 이용이 가능합니다.</p>
					<p class="head_desc">* 입력된 정보는 외부에 노출되지 않고, 보다 나은 서비스 제공을 위한 통계자료로만 활용됩니다.</p>
				</div>
			</div>
			<div class="question_body">
				<div class="question_container">
					<form action="insertProfile.do" method="post">
						<div class="question_wrap">
							<!-- 각 질문별 wraper -->
							<div class="question_header" style="margin-bottom: 3%;">
								<h3 style="font-size: 18pt; font-weight: 600;">성별을 알려주세요.</h3>
							</div>
							<div class="gender_radio">
								<label class="btn_radio" for="gender" style="font-size:15pt;">
									<input type="radio" name="pro_gender" id="gender" value="1">
									<span class="radio_txt">남자</span>
								</label>
								<label class="btn_radio" for="gender" style="font-size:15pt; margin-left:7%;">
									<input type="radio" name="pro_gender" id="gender" value="2">
									<span class="radio_txt">여자</span>
								</label>
							</div>
						</div>
						<div class="question_wrap" style="margin-top:5%;">
							<div class="question_header" style="margin-bottom: 3%;">
								<h3 style="font-size: 18pt; font-weight: 600;">출생연도를 알려주세요.</h3>
							</div>
							<div class="birthYear_select">
								<select id="birth_year" name="pro_birthYear" style="padding:1%;border-color:#fac5a1; border-radius:15px;">
									<option value="none">선택해주세요.</option>
									<option value="2006">2006년</option>
									<option value="2005">2005년</option>
									<option value="2004">2004년</option>
									<option value="2003">2003년</option>
									<option value="2002">2002년</option>
									<option value="2001">2001년</option>
									<option value="2000">2000년</option>
									<option value="1999">1999년</option>
									<option value="1998">1998년</option>
									<option value="1997">1997년</option>
									<option value="1996">1996년</option>
									<option value="1995">1995년</option>
									<option value="1994">1994년</option>
									<option value="1993">1993년</option>
									<option value="1992">1992년</option>
									<option value="1991">1991년</option>
									<option value="1990">1990년</option>
								</select>
							</div>
						</div>
						<div class="question_wrap" style="margin-top:5%;">
							<div class="question_header" style="margin-bottom: 3%;">
								<h3 style="font-size: 18pt; font-weight: 600;">총 경력은 얼마나 되나요?</h3>
							</div>
							<div class="career_select">
								<select id="career" name="pro_career"style="padding:1%;border-color:#fac5a1;
									border-radius:15px;">
									<option value="none">선택해주세요.</option>
									<option value="0">0</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
								</select>
								<div class="header_guide" style="padding:1%;margin-left:2%;">신입은 0을 선택해주세요.</div>
							</div>
						</div>
						<div class="question_btn" style="text-align:center; margin-top: 5%;">
							<input type="hidden" name="u_no" value="${u_no}">							
							<button id="btn_complete" type="submit" style="font-size: 17pt; background-color: #ff6900; color: white; border: 0; border-radius: 15px; width: 30%; margin-bottom: 4%; margin-left: auto; margin-right: auto; padding: 1%;">
								회원가입 완료
							</button>
						</div>
						<div class="check_font" id="info_check"style="width:90%;margin-left:auto;margin-right:auto; margin-top:1%;margin-bottom:3%;font-size:17pt;"></div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>