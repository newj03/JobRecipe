<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 추가</title>
<script src="<c:url value='/resources/js/jquery-3.1.1.js'/>" charset="utf-8"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jobJS.js"/>" charset="utf-8"></script>
<script type="text/javascript" src="<c:url value='/resources/js/bootstrap.js'/>" charset="utf-8"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">
<style>
	.star1 {
	    background: url('/resources/images/star_on.png') no-repeat 0 0;
	    background-size: auto 100%;
	    width: 15px;
	    height: 30px;
	    float:left;
	    cursor: pointer;
	}
	.star2 {
	    background: url('/resources/images/star_on.png') no-repeat right 0;
	    background-size: auto 100%;
	    width: 15px;
	    height: 30px;
	    float:left;
	    cursor: pointer;
	}
	.star1.on {background-image: url('/resources/images/star.png');}
	.star2.on {background-image: url('/resources/images/star.png');}
</style>
<script>

	
	
	var review_title = 0;
	var review_advan = 0;
	var review_weak = 0;
	var review_wish = 0;
	
	$(document).ready(function() {
		$('.review_star span').click(function() { //평점
			$(this).parent().children('span').removeClass('on');
			$(this).addClass('on').prevAll('span').addClass('on');
			$("#rev_star").val($(this).attr("id"));
			return false;
		});
		
		$("#rev_title").keyup(function() {
			var content = $(this).val();
			if(content.length > 30) {
				$("#titleText").css("color", "green");
				review_title = 1;
			} else {
				$("#titleText").css("color", "red");
			}
		});
		
		$("#rev_advan").keyup(function() {
			var content = $(this).val();
			if(content.length > 30) {
				$("#advanText").css("color", "green");
				review_advan = 1;
			} else {
				$("#advanText").css("color", "red");
			}
		});
		
		$("#rev_weak").keyup(function() {
			var content = $(this).val();
			if(content.length > 30) {
				$("#weakText").css("color", "green");
				review_weak = 1;
			} else {
				$("#weakText").css("color", "red");
			}
		});
		
		$("#rev_wish").keyup(function() {
			var content = $(this).val();
			if(content.length > 30) {
				$("#wishText").css("color", "green");
				review_wish = 1;
			} else {
				$("#wishText").css("color", "red");
			}
		})
	});
	
	function searchCompany() {
		var company = $("#c_namea").val();
		
		$.ajax({
			type: "post",
			url: "company1.do",
			data: {
				rev_name : company
			},
			success: function(result) {
				if(result=="존재하지 않는 회사입니다.") {
					alert(result);
					$("#c_namea").val("");
					$("#c_namea").focus();
				} 
				
			}
		})
	}
	
	function review_checkJob() {
		alert("찾기 버튼을 눌러주세요.");
	}

	function review_job_check() {
		var job = $('input[name="job"]:checked').val();
		$("#checkJob").val(job);
	}

	function insert_Review_Check() {
		if($('input:radio[name="rev_state"]').is(':checked') == false) {
			alert("직장 여부를 체크하세요.");
			return false;
		} else if($('input:radio[name="rev_emp"]').is(':checked') == false) {
			alert("고용형태를 체크하세요.");
			return false;
		} else if(review_title == 0) {
			alert("30자 이상 기재해 주세요.");
			return false;
		} else if(review_advan == 0) {
			alert("30자 이상 기재해 주세요.");
			return false;
		} else if(review_weak == 0) {
			alert("30자 이상 기재해 주세요.");
			return false;
		} else if(review_wish == 0) {
			alert("30자 이상 기재해 주세요.");
			return false;
		} else {
			return true;
		}
	}
</script>
</head>
<body>



	<input type="text" id="c_namea" name="rev_name" value=""/>
	<input type="button" value="회사 검색" onclick="searchCompany()"/>

	<form action="/hire/insertReview.do" onsubmit="return insert_Review_Check()">
	<input type="hidden" name="rev_name" value="${rev_name }">
	<table>
		<tr>
			<td>현직장/전직장</td>
			<td>
				<label><input type="radio" name="rev_state" value="현직장">현직장</label>
				<label><input type="radio" name="rev_state" value="전직장">전직장</label>
			</td>
		</tr>
		<tr>
			<td>직무</td>
			<td>
				<input type="text" id="checkJob" name="rev_job" required="required" placeholder="찾기" onclick="review_checkJob()">
				<input type="button" id="modalBtn" value="찾기" data-toggle="modal" data-target="#myModal">
 
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
						    		
						    		<input type="button" value="선택" data-dismiss="modal" onclick="review_job_check()">
			    				</p>
			    			</div>
			    		</div>
			    	</div>		
				</div>
			</td>
		</tr>
		<tr>
			<td>고용형태</td>
			<td>
				<label><input type="radio" name="rev_emp" value="정규직">정규직</label>
				<label><input type="radio" name="rev_emp" value="계약직">계약직</label>
				<label><input type="radio" name="rev_emp" value="인턴">인턴</label>
			</td>
		</tr>
	</table>
	* 경력 정보는 노출되지 않습니다. (현재, 또는 퇴직 당시의 경력 정보를 입력해 주세요.)
	
	<br><br><br>
	
	<table>
		<tr>
			<td>기업 총 평가</td>
			<td>
				<div class="review_star">
					<span class="star1 on" id="0.5"></span>
					<span class="star2" id="1.0"></span>
					<span class="star1" id="1.5"></span>
					<span class="star2" id="2.0"></span>
					<span class="star1" id="2.5"></span>
					<span class="star2" id="3.0"></span>
					<span class="star1" id="3.5"></span>
					<span class="star2" id="4.0"></span>
					<span class="star1" id="4.5"></span>
					<span class="star2" id="5.0"></span>
				</div>
				<input type="hidden" id="rev_star" name="rev_star" value="0.5">
			</td>
		</tr>
		<tr>	
			<td>기업 한줄 평</td>
			<td>
				<textarea name="rev_title" id="rev_title" required="required" cols="40" rows="2" style="resize: none;" placeholder="최소 30자 이상 기재해 주세요."></textarea>
				최소 30자<span id="titleText" style="color: red;"><b>√</b></span>
			</td>
		</tr>
		<tr>
			<td>기업의 장점</td>
			<td>
				<textarea name="rev_advan" id="rev_advan" required="required" cols="40" rows="5" style="resize: none;" placeholder="최소 30자 이상 기재해 주세요."></textarea>
				최소 30자<span id="advanText" style="color: red;"><b>√</b></span>
			</td>
		</tr>
		<tr>
			<td>기업의 단점</td>
			<td>
				<textarea name="rev_weak" id="rev_weak" required="required" cols="40" rows="5" style="resize: none;" placeholder="최소 30자 이상 기재해 주세요."></textarea>
				최소 30자<span id="weakText" style="color: red;"><b>√</b></span>
			</td>
		</tr>
		<tr>
			<td>경영진에게 바라는 점</td>
			<td>
				<textarea name="rev_wish" id="rev_wish" required="required" cols="40" rows="5" style="resize: none;" placeholder="최소 30자 이상 기재해 주세요."></textarea>
				최소 30자<span id="wishText" style="color: red;"><b>√</b></span>
			</td>
		</tr>
	</table>
	<input type="submit" value="추가">
	</form>

</body>
</html>