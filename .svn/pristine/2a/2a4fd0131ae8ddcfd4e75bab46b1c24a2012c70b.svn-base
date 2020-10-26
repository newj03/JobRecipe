<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>잡레시피</title>
</head>
<body>
	<div class="question_wrap">
		<div class="question_head">
			<div class="head_title_group">
				<p class="head_title1">설문을 완료하시면 서비스 이용이 가능합니다.</p>
				<p class="head_desc">* 입력된 정보는 외부에 노출되지 않고, 보다 나은 서비스 제공을 위한 통계자료로만 활용됩니다.</p>
				
			</div>
		</div>
			<div class="question_body">
				<div class="question_container">
					<form action="insertProfile.do" method="post">
						<div class="question_wrap"> <!-- 각 질문별 wraper -->
							<div class="question_header">
								<h3>성별을 알려주세요.</h3>
							</div>
							<div class="gender_radio">
								<label class="btn_radio" for="gender_man">
									<input type="radio" name="pro_gender" id="gender_man" value="1">
									<span class="radio_txt">남자</span>
								</label>
								<label class="btn_radio" for="gender_woman">
									<input type="radio" name="pro_gender" id="gender_woman" value="2">
									<span class="radio_txt">여자</span>
								</label>
							</div>
						</div>
						<div class="question_wrap">
							<div class="question_header">
								<h3>출생연도를 알려주세요.</h3>
							</div>
							<div class="birthYear_select">
								<select id="birth_year" name="pro_birthYear">
									<option>선택해주세요.</option>
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
						<div class="question_wrap">
							<div class="question_header">
								<h3>총 경력은 얼마나 되나요?</h3>
								<span class="header_guide">신입은 0을 선택해주세요.</span>
							</div>
							<div class="career_select">
								<select id="career" name="pro_career">
									<option>선택해주세요.</option>
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
							</div>
						</div>
						<div class="question_btn">
							<input type="hidden" name="u_no" value="${u_no}">
							<button id="btn_next" type="submit">다음</button>
						</div>
					</form>
				</div>
			</div>
	</div>
</body>
</html>