<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>공고 추가</title>
<script src="<c:url value='/resources/js/jquery-3.1.1.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/bootstrap.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">
<script type="text/javascript" src="<c:url value="/resources/js/jobJS.js"/>"></script>
<link type="text/css" href="<c:url value="/resources/css/jobCSS.css" />" rel="stylesheet">

<script>
	var adminMsg = "${msg}";
	if(adminMsg == "success")
		alert("공고가 추가되었습니다.");
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
	
</head>
<body>
	
	<header>
		<jsp:include page="../include/header.jsp"></jsp:include>
	</header>
	
	<section>
		<div style="width: 100%; display: flex; flex-wrap: nowrap; min-height: 70vh;">
		<!-- section 기본화면 셋팅 -->
			<div style="width: 60%; display: flex; flex-direction: column;margin-left:40%;margin-bottom: 5%;">
			<form action="insertAdvertise.do" method="post" onsubmit="return admin_addAdvertise()">
			<div>
				<span>채용 제목</span>
				<input type="text" name="ad_title" required="required" style="width: 15%; border: 1px solid #ff6900; border-radius: 10px; margin-bottom: 1%;">
			</div>
			<div>
				<span>기업명</span>
				<input type="text" name="ad_name" value="${c_name }" readonly="readonly"style="width: 15%; border: 1px solid #ff6900; border-radius: 10px; margin-bottom: 1%;">
			</div>
			<div>
				<span>마감일</span>
				<input type="date" name="ad_date" required="required"style="width: 15%; border: 1px solid #ff6900; border-radius: 10px; margin-bottom: 1%;">
			</div>
			<div>
				<span>직무</span>
				<input type="text" id="checkJob" name="ad_job" required="required" placeholder="찾기" onclick="admin_checkJob()"style="width: 15%; border: 1px solid #ff6900; border-radius: 10px; margin-bottom: 1%;">
				<input type="button" id="modalBtn" value="찾기" data-toggle="modal" data-target="#myModal" style="font-size: 12pt;font-weight: 600;background-color:#ff6900;width: 5%;color:white;border:0;border-radius:10px;padding: 1%;">	 
			    <div class="modal fade" id="myModal" role="dialog">
			    	<div class="modal-dialog">
			    		<div class="modal-content"> 
			    			<div class="modal-header">
			    				<b>직무 선택</b>
			    				<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
			    			</div>
			    			<div class="modal-body">
			    				<p>
			    					<label><input type="radio" name="job" value="QA">QA</label> &nbsp;&nbsp;&nbsp;
						    		<label><input type="radio" name="job" value="프로젝트매니저">프로젝트매니저</label> <br>
						    		<label><input type="radio" name="job" value="모바일앱개발">모바일앱개발</label> &nbsp;&nbsp;&nbsp;
						    		<label><input type="radio" name="job" value="웹개발">웹개발</label> <br>
						    		<label><input type="radio" name="job" value="DBA">DBA</label> &nbsp;&nbsp;&nbsp;
						    		<label><input type="radio" name="job" value="시스템엔지니어">시스템엔지니어</label> <br>
						    		<label><input type="radio" name="job" value="소프트웨어엔지니어">소프트웨어엔지니어</label> &nbsp;&nbsp;&nbsp;
						    		<label><input type="radio" name="job" value="하드웨어엔지니어">하드웨어엔지니어</label> <br>
						    		<label><input type="radio" name="job" value="네트워크/보안/운영">네트워크/보안/운영</label> &nbsp;&nbsp;&nbsp;
						    		<label><input type="radio" name="job" value="게임개발">게임개발</label> <br>
						    		
						    		<input type="button" value="선택" data-dismiss="modal" onclick="admin_job_check()">
			    				</p>
			    			</div>
			    		</div>
			    	</div>		
				</div>
			</div>
			<div>
				<span>경력</span>
				<label><input type="checkbox" name="ad_carrBae" value="신입">신입</label>
				<label><input type="checkbox" name="ad_carrBae" value="경력">경력</label>
				<label><input type="checkbox" name="ad_carrBae" value="경력무관">경력무관</label>
			</div>
			<div>
				<div class="adminEmpDiv">
				<span>고용형태</span>
					<input type="radio" class="emp" id="emp1" name="ad_emp" value="정규직"><label for="emp1">정규직</label>
					<input type="radio" class="emp" id="emp2" name="ad_emp" value="계약직"><label for="emp2"">계약직</label>
					<input type="radio" class="emp" id="emp3" name="ad_emp" value="인턴"><label for="emp3">인턴</label>			
				</div>
			</div>
			<div>
				<span>스킬</span>
				<input type="text" name="ad_skill"style="width: 15%; border: 1px solid #ff6900; border-radius: 10px; margin-bottom: 1%;">
			</div>
			<div>
				<span>주요업무</span>
				<input type="text" name="ad_upmu"style="width: 15%; border: 1px solid #ff6900; border-radius: 10px; margin-bottom: 1%;">
			</div>
			<div>
				<div id="lienDiv">
				<span>자격요건</span>
					<input type="text" id="lien1" name="lien1" style="width: 15%; border: 1px solid #ff6900; border-radius: 10px; margin-bottom: 1%;">
					<input type="button" id="lienBtn" value="추가" onclick="admin_addLien()" style="font-size: 12pt;font-weight: 600;background-color:#ff6900;width: 5%;color:white;border:0;border-radius:10px;padding: 1%;">
					<br>
				</div>
			</div>
			<div>
				<div id="dealDiv">
				<span>우대사항</span>
					<input type="text" name="deal1"style="width: 15%; border: 1px solid #ff6900; border-radius: 10px; margin-bottom: 1%;">
					<input type="button" id="dealBtn" value="추가" onclick="admin_addDeal()" style="font-size: 12pt;font-weight: 600;background-color:#ff6900;width: 5%;color:white;border:0;border-radius:10px;padding: 1%;"> <br>
				</div>
			</div>
			<div>
				<span>채용절차</span>
				<input type="text" name="ad_pro"style="width: 15%; border: 1px solid #ff6900; border-radius: 10px; margin-bottom: 1%;">
			</div>
			<div>
				<div id="cpDiv">
				<span>복리후생</span>
					<input type="text" name="cp1" style="width: 15%; border: 1px solid #ff6900; border-radius: 10px; margin-bottom: 1%;">
					<input type="button" id="cpBtn" value="추가" onclick="admin_addCp()" style="font-size: 12pt;font-weight: 600;background-color:#ff6900;width: 5%;color:white;border:0;border-radius:10px;padding: 1%;"> <br>
				</div>
			</div>
			<div>
				<div id="ectDiv">
				<span>기타</span>
					<input type="text" name="ect1" style="width: 15%; border: 1px solid #ff6900; border-radius: 10px; margin-bottom: 1%;">
					<input type="button" id="ectBtn" value="추가" onclick="admin_addEct()" style="font-size: 12pt;font-weight: 600;background-color:#ff6900;width: 5%;color:white;border:0;border-radius:10px;padding: 1%;"> <br>
				</div>
			</div>
			<div style="margin-top: 3%;">
				<input type="submit" value="공고 추가" style="font-size: 12pt;font-weight: 600;background-color:#ff6900;width: 12%;color:white;border:0;border-radius:10px;padding: 1%;">		
			</div>
		</form>
		</div>
	</div>	
	</section>
	
	<footer>
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</footer>
	
<!-- 유진 -->
</body>
</html>