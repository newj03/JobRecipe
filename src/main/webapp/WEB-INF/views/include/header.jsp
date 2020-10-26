<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>HEADER</title>

<!-- <script type="text/javascript">
	function test(){
		
		if(document.getElementById("test").style.display=='none')
			document.getElementById("test").style.display='flex';
		else
			document.getElementById("test").style.display='none';
	}	
</script>
 -->
 
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
	<div style="display:flex; flex-direction: row; justify-content: space-between; flex-wrap: nowrap;
		line-height:7vh;background-color:#ff6900;">
		<div style="display:flex; flex-direction: row; flex-wrap: nowrap;">
			<div style="cursor:pointer;font-size: 25pt; font-weight: bold; font-style: italic;
				margin-right:10px; margin-left: 10px;text-align: center;color:white; padding-top:7%;"
				onclick="location.href='/hire/Search_Job.do'">
				Job Recipe
			</div>
			<div style="cursor:pointer;font-size: 12pt;margin-right:10px;margin-top:3%; padding-top:7%;
				margin-left: 30px;text-align: center;color:white" onclick="location.href='/hire/allAdvertise.do'">
				채용
			</div>
		</div>
		<!--test  -->
		<!-- <div>
			<button onclick="location.href='/admin/insertCompanyForm.do'">admin</button>
			test용 버튼 	
		</div> -->
		<div style="display:flex; flex-direction: row;flex-wrap: nowrap;">
			<c:if test="${login == null }">
				<div style="cursor:pointer;font-size: 12pt;margin-right:10px; margin-left: 10px;padding-top:3%;
					text-align: center;margin-top:13%;color:white " onclick="location.href='/sign_up.do'">
					회원가입
				</div>
				<div style="cursor:pointer;font-size: 12pt;margin-right:10px; margin-left: 10px;padding-top:3%;
					text-align: center;margin-top:13%;color:white " onclick="location.href='/sign_in.do'">
					로그인
				</div>
			</c:if>
			
			<c:if test="${login != null }">
					<div style="cursor:pointer;font-size: 12pt;margin-right:10px; margin-left: 10px;padding-top:3%;
					text-align: center;margin-top:13%;color:white " onclick="location.href='/settings.do'">
					마이페이지
				</div>
				<div style="cursor:pointer;font-size: 12pt;margin-right:10px; margin-left: 10px;padding-top:3%;
					text-align: center;margin-top:13%;color:white " onclick="location.href='/logout.do'">
					로그아웃
				</div>
			</c:if>	
		</div>
	</div>
	<hr style="border:solid 1px #fac5a1">

</body>
</html>