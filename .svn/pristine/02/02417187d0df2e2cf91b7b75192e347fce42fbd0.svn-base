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
<body>
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


	<div>
		<h3>비밀번호 변경</h3>
		<hr>

<!-- pattern=".{8,}" -->

		<form action="change_password.do" method="post">
		
			<div>
				<span class="label_tit">아이디</span>
				<input type="text" readonly value="${sessionScope.u_email}"  />
			</div>
			
			<div>
				<input type="hidden" name="u_email" value="${sessionScope.u_email}">
				<span class="label_tit">현재 비밀번호</span>
				<input type="password" name="user_current_password" placeholder="비밀번호(8자리 이상)" title="비밀번호는 8자 이상이어야 합니다.">
			</div>
			
			<div>
				<span class="label_tit">새 비밀번호</span>
				<input type="password" name="u_pw" id="pw" placeholder="비밀번호(8자리 이상)" title="비밀번호는 8자 이상이어야 합니다.">
			</div>
			
			<div>
				<input type="password" name="user_password_confirmation" id="pw2" placeholder="비밀번호 확인" title="비밀번호는 8자 이상이어야 합니다.">
			</div>
			
			<div>
				<input type="submit" value="비밀번호변경">
			</div>
		</form>
	</div>

</body>
</html>





