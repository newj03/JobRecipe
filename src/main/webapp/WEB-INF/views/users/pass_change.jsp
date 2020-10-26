<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>잡레시피</title>
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
<body>

	<table border="1" width="300" height="300" align="center">
		<tr>
			<td>
				<span style="color: green; font-weight: bold;">변경할 비밀번호를
					입력해주세요.</span> <br> <br> <br> <br>		
			</td>
		</tr>
		<tr>
			<td>
				<form action="pass_change.do" method="post">
					<br>
					<div>
						<input type="hidden" name="u_email" value="${u_email}">
						변경할 비밀번호 입력 : <input type="password" name="u_pw"
							placeholder="비밀번호를 입력하세요.">
					</div>

					<br> <br>
					<button type="submit" name="submit">비밀번호 변경</button>
				</form>
			</td>
		</tr>
	</table>

</body>
</html>
