<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<title>JobRecipe</title>
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

<style>

/* sign in FORM */
#logreg-forms {
	width: 412px;
	margin: 10vh auto;
	background-color: #f3f3f3;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	transition: all 0.3s cubic-bezier(.25, .8, .25, 1);
}

#logreg-forms form {
	width: 100%;
	max-width: 410px;
	padding: 15px;
	margin: auto;
}

#logreg-forms .form-control {
	position: relative;
	box-sizing: border-box;
	height: auto;
	padding: 10px;
	font-size: 16px;
}

#logreg-forms .form-control:focus {
	z-index: 2;
}

#logreg-forms .form-signin input[type="email"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

#logreg-forms .form-signin input[type="password"] {
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

#logreg-forms .social-login {
	width: 100%;
	text-align: center;
	margin-bottom: 14px;
}

#logreg-forms .social-btn {
	font-weight: 100;
	color: white;
	width: 100%;
	font-size: 0.9rem;
}

#logreg-forms a {
	display: block;
	padding-top: 10px;
	color: lightseagreen;
}

#logreg-form .lines {
	width: 200px;
	border: 1px solid red;
}

#logreg-forms button[type="submit"] {
	margin-top: 10px;
}

#logreg-forms .facebook-btn {
	background-color: #3C589C;
}

#logreg-forms .google-btn {
	background-color: #DF4B3B;
}

#logreg-forms .form-reset, #logreg-forms .form-signup {
	display: none;
}

#logreg-forms .form-signup .social-btn {
	width: 210px;
}

#logreg-forms .form-signup input {
	margin-bottom: 2px;
}

.form-signup .social-login {
	width: 210px !important;
	margin: 0 auto;
}
</style>
<script type="text/javascript">
	var msg = '${msg}'
	if(msg == 'success') {
		alert('로그인을 하세요 ');
	}
</script>
</head>
<body>
	<div style="width:100%; text-align:center;color:#ff6900;font-style:italic;margin-top:4%;margin-bottom:4%;
	font-weight:bold;font-size:38pt;">
		Job Recipe
	</div>
	<div id="logreg-forms">
		<form class="form-signin" action="signinCheck.do" method="post">
			<h1 class="h3 mb-3 font-weight-normal" style="text-align: center">로그인</h1>
			<input type="email" name="u_email" class="form-control" placeholder="이메일 ">
			<input type="password" name="u_pw" class="form-control" placeholder="비밀번호">
			<c:if test="${msg==false}">
			   <p style="color:#f00;">로그인에 실패했습니다. 아이디 또는 패스워드를 다시 입력해주세요.</p>
			</c:if>
			<button class="btn btn-success btn-block" type="submit"><i class="fas fa-sign-in-alt"></i> 로그인</button>
			<a href="./findPw.do" id="forgot_pswd">비밀번호 찾기</a>
			<hr>
			<!-- <p>Don't have an account!</p>  -->
			<button class="btn btn-primary btn-block" type="button" id="btn-signup" onclick="location.href='sign_up.do'">
				<i class="fas fa-user-plus"></i>회원가입
			</button>
		</form>
	</div>
	
</body>
</html>