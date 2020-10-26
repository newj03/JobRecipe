<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
.label_tit{
font-family: 'Roboto', 'Noto Sans Korean', '돋움', dotum, Arial, sans-serif;
-webkit-font-smoothing: antialiased;
position: relative;
width: 157px;
font-size: 14px;
color: #333333;
text-align: left;
vertical-align: top;
display: block;
padding-bottom: 9px;
height: 14px;
line-height: 14px;
font-weight: normal;
}
</style>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body style="margin:0;">
<script src="<c:url value='/resources/js/jquery-3.1.1.js'/>"></script>	

<script>
$(function(){

	//비밀번호 확인
		$('#pw2').blur(function(){
		   if($('#pw').val() != $('#pw2').val()){
		    	if($('#pw2').val()!=''){
			    alert("비밀번호가 일치하지 않습니다.");
		    	    $('#pw2').val('');
		          $('#pw2').focus();
		       }
		    }
		})  	   
	});

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
								<form action="change_password.do" method="post">
									<div style="display: flex; flex-direction: column;width:90%;margin-left:auto;
										margin-right:auto;margin-top:5%;margin-bottom:10%;">
										<div style="display: flex; flex-direction: row;flex-wrap: nowrap;margin-bottom:7%;">
											<div style="width: 11%;font-weight:bold;font-size:12pt;margin-right:2%;padding-top: 2%;">
												아이디
											</div>
											<input type="text" readonly value="${sessionScope.u_email}" 
												style="border:1px solid #ff6900;border-radius:10px;padding:1%;"/>
										</div>
										
										<div style="display: flex; flex-direction: row;flex-wrap: nowrap;margin-bottom:7%;">
											<div style="font-weight:bold;font-size:12pt;margin-right:2%;padding-top: 2%;">
												현재 비밀번호
											</div>
											<input type="password" name="cur_pw"placeholder="비밀번호(8자리 이상)"
											title="비밀번호는 8자 이상이어야 합니다."  style="border:1px solid #ff6900;border-radius:10px;padding:1%;"/>
										</div>
										
										<div style="display: flex; flex-direction: row;flex-wrap: nowrap;margin-bottom:7%;">
											<div style="width:11%;font-weight:bold;font-size:12pt;margin-right:2%;padding-top: 2%;">
												새 비밀번호
											</div>
											<input type="password" name="u_pw" id="pw" placeholder="비밀번호(8자리 이상)"
												title="비밀번호는 8자 이상이어야 합니다." style="border:1px solid #ff6900;
												border-radius:10px;padding:1%;margin-right:2%;"/>
											<input type="password" name="user_password_confirmation"
											id="pw2" placeholder="비밀번호 확인" title="비밀번호는 8자 이상이어야 합니다."
												style="border:1px solid #ff6900;border-radius:10px;padding:1%;"/>											
										</div>
										
										<!-- <div style="display: flex; flex-direction: row;flex-wrap: nowrap;margin-bottom:7%;">
										</div> -->
										<div style="text-align:end;">
											<input type="submit" style="background-color: #ff6900; color: white;border: 0; border-radius: 10px;" value="비밀번호변경">
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
	

</body>
</html>





