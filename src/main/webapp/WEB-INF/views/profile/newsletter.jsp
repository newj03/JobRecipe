<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
	var today = new Date();   
	
	var year = today.getFullYear(); // 년도
	var month = today.getMonth() + 1;  // 월
	var date = today.getDate();  // 날짜



	function newsCheck() {
		if(confirm(year+"년 "+month+"월 "+date+"일 이메일 수신 여부를 변경하였습니다. 동의하십니까?")) {
			location.href="redirect:/newsletter.do"
		} else {
			location.href="redirect:/newsletter.do"
		}
	};
</script>

</head>
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
								<hr style="margin-bottom:1%; border:solid 1px #fac5a1">
								<form action="newsletter.do" method="post">
									<input type="hidden" name="u_email"
										value="${sessionScope.u_email}">
									<div class="jpcont_wrap">
										<div class="section_group">
											<h3 class="tit">이메일 수신 설정</h3>
											<section class="my_newsletter">
												<div class="my_newsletter_section">
													<span class="tit_agree">맞춤 정보 및 뉴스레터(광고성)</span>
													<p class="txt">잡플래닛이 찾은 맞춤 채용 및 유용한 정보 알림</p>

													<label class="btn_check round btn_check_action check_chk">
														수신동의 <input type="radio" name="newsck" value="1">
														동의안함 <input type="radio" name="newsck" value="0">
														<input type="submit" onclick="newsCheck();" style="margin-left: 10%;background-color: #ff6900; color: white;border: 0; border-radius: 10px;" value="전송" /> 
														
														<span class="check_icon round"></span> <span class="check_txt"></span>
													</label>

												</div>

												<div class="my_newsletter_section">
													<span class="tit_agree">콘텐츠 승인여부</span>
													<p class="txt">작성한 콘텐츠(리뷰, 연봉, 면접 등)의 승인, 수정요청 등에 대한 알림</p>
													<p class="txt">(수신 설정에 상관 없이 발송되는 승인여부 안내 메일입니다.)</p>
												</div>
											</section>
										</div>
									</div>
								</form>
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


<!--     <script type="text/javascript">
      $(document).ready(function () {
        $('#rd2').click(function () {
          // checkbox

          // var check = $('#rd2').is(":checked");
          // alert(check);

          // var check = $('input[id="rd2"]').is(':checked');
          // alert(check);

          var check = $('input:checkbox[id="rd2"]').is(':checked');
          alert(check);
        });
      });
    </script> -->
</body>
</html>