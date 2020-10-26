<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<div onclick="location.href='/hire/Search_Job.do'" style="width:100%; text-align:center;color:#ff6900;font-style:italic;margin-top:4%;margin-bottom:3%; font-weight:bold;font-size:38pt;">
		Job Recipe
	</div>
	<h1 style="text-align:center; font-size:22pt; font-weight: 600; color:#ff6900;margin-top:3%;margin-bottom:2%;">비밀번호 찾기</h1>
	<div style="width:40%;display:flex; flex-direction: column;margin-bottom:5%; margin-right:auto; margin-left:auto;text-align:center;border:1px solid #fafafa;background-color:#fafafa;">
		<form method="post" action="find_pass.do">
			<fieldset>
				<legend>비밀번호 찾기</legend>
				<span>비밀번호 안내를 받으실 이메일 주소를 적어주세요.</span> 
				<label> 
					<input id="user_email" name="u_email" placeholder="이메일 주소" type="email">
				</label>
				<input name="commit" type="submit" value="비밀번호 찾기">
			</fieldset>
		</form>
	</div>
</body>
</html>