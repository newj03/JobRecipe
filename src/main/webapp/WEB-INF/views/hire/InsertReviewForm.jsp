<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 추가</title>
<script src="<c:url value='/resources/js/jquery-3.1.1.js'/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jobJS.js"/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/bootstrap.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">

<style type="text/css">
/* Noto Sans KR 폰트 추가 */
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
body {
	font-family: 'Noto Sans KR', sans-serif;
}

input, textarea {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: initial;
}
</style>


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
				review_title = 0;
			}
		});
		
		$("#rev_advan").keyup(function() {
			var content = $(this).val();
			if(content.length > 30) {
				$("#advanText").css("color", "green");
				review_advan = 1;
			} else {
				$("#advanText").css("color", "red");
				review_advan = 0;
			}
		});
		
		$("#rev_weak").keyup(function() {
			var content = $(this).val();
			if(content.length > 30) {
				$("#weakText").css("color", "green");
				review_weak = 1;
			} else {
				$("#weakText").css("color", "red");
				review_weak = 0;
			}
		});
		
		$("#rev_wish").keyup(function() {
			var content = $(this).val();
			if(content.length > 30) {
				$("#wishText").css("color", "green");
				review_wish = 1;
			} else {
				$("#wishText").css("color", "red");
				review_wish = 0;
			}
		})
	});

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
<body style="margin:0;">
	
	<header>
		<jsp:include page="../include/header.jsp"></jsp:include>
	</header>
	
	<section>
		<div style="width: 100%; display: flex; flex-wrap: nowrap; min-height: 70vh;">
		<!-- 전체화면 -->
		
			<div style="width: 15%;	 margin-left: 3%;">
			</div>
			
			<div style="width: 60%;display:flex; flex-direction: column;margin-bottom:5%; ">
				<!--center  -->
				<div style="width:100%;text-align:center;margin-top:5%;margin-bottom:3%;color:#ff6900;">
					<h1 >${rev_name } Review 등록</h1>
					<hr style="border:solid 1px #fac5a1">
					</div>
					<!--//////////////////////////////////  -->
					<form action="insertReview.do"
						onsubmit="return insert_Review_Check()">
						<input type="hidden" name="rev_name" value="${rev_name }">
						<div style="width: 85%;display:flex;flex-direction: column;">
							<div style="display:flex;flex-direction: row;flex-wrap: nowrap;margin-bottom:2%;
								padding-left:4%;">
								<div style="padding-left:4%;width:35%;font-weight:bold;">현직장/전직장</div>
								<label style="width:20%;">
									<input type="radio" name="rev_state" value="현직장">현직장
								</label> 
								<label style="width:20%;">
									<input type="radio" name="rev_state" value="전직장">전직장
								</label>
							</div>
							
							<div style="display:flex;flex-direction: row;flex-wrap: nowrap;
								margin-bottom:2%;padding-left:4%;">
								<div style="padding-left:4%;width:35%;font-weight:bold;">직무</div>
								<input type="text" id="checkJob" name="rev_job" required="required"
									 placeholder="찾기" onclick="review_checkJob()"> 
								<input type="button" id="modalBtn" value="찾기" data-toggle="modal"
									data-target="#myModal" style="margin-left:1%;background-color:#fac5a1;
									color:white;border:0;">
									
								<div class="modal fade" id="myModal" role="dialog">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<b>직무 선택</b>
												<button type="button" class="close" data-dismiss="modal">
													<span>&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<p>
													<label>
														<input type="radio" name="job" value="QA">
														QA
													</label>
														&nbsp;&nbsp;&nbsp; 
													<label>
														<input type="radio" name="job" value="프로젝트매니저">
														프로젝트매니저
													</label> 
													<br> 
													<label>
														<input type="radio" name="job" value="모바일앱개발">
															모바일앱개발
													</label>
														&nbsp;&nbsp;&nbsp; 
													<label>
														<input type="radio" name="job" value="웹개발">
														웹개발
													</label> 
													<br> 
													<label>
														<input type="radio" name="job" value="DBA">
														DBA
													</label>
														&nbsp;&nbsp;&nbsp; 
													<label>
														<input type="radio" name="job" value="시스템엔지니어">
														시스템엔지니어
													</label> 
													<br> 
													<label>
														<input type="radio" name="job" value="소프트웨어엔지니어">
														소프트웨어엔지니어
													</label>
														&nbsp;&nbsp;&nbsp; 
													<label>
														<input type="radio" name="job" value="하드웨어엔지니어">
														하드웨어엔지니어
													</label> 
													<br> 
													<label>
														<input type="radio" name="job" value="네트워크/보안/운영">
														네트워크/보안/운영
													</label>
														&nbsp;&nbsp;&nbsp; 
													<label>
														<input type="radio" name="job" value="게임개발">
														게임개발
													</label> 
													<br> 
													<input type="button" value="선택" data-dismiss="modal"
															onclick="review_job_check()">
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div style="display:flex;flex-direction: row;flex-wrap: nowrap;
								margin-bottom:2%;padding-left:4%;">
								<div style="padding-left:4%;width:35%;font-weight:bold;">고용형태</div>
								<label style="width:15%;">
									<input type="radio" name="rev_emp" value="정규직">
									정규직
								</label> 
								<label style="width:15%;">
									<input type="radio" name="rev_emp" value="계약직">
									계약직
								</label> 
								<label style="width:15%;">
									<input type="radio" name="rev_emp" value="인턴">
									인턴
								</label>
							</div>
							<div style="font-style:italic;font-size:9pt;padding-left:5%;margin-bottom:5%;">
							* 경력 정보는 노출되지 않습니다. (현재, 또는 퇴직 당시의 경력 정보를 입력해 주세요.)
							</div>
							<div style="display:flex;flex-direction: row;flex-wrap: nowrap;
								margin-bottom:3%;padding-left:4%;">
								<div style="padding-left:4%;width:35%;font-weight:bold;">기업 총 평가</div>
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
							</div>
							
							<div style="display:flex;flex-direction: row;flex-wrap: nowrap;
								margin-bottom:3%;padding-left:4%;">
								<div style="padding-left:4%;width:35%;font-weight:bold;padding-top: 3%;">
									기업 한줄 평
								</div>
								<textarea name="rev_title" id="rev_title"
										required="required" cols="40" rows="2" style="resize: none;width:45%;"
										placeholder="최소 30자 이상 기재해 주세요."></textarea>
								<div style="width:15%;font-size:12pt;padding-top:3%;margin-left:3%">
									최소 30자
								</div>
								<span id="titleText" style="padding-top: 3%;color: red;">
									<b>√</b>
								</span>
							</div>
							
							<div style="display:flex;flex-direction: row;flex-wrap: nowrap;
								margin-bottom:3%;padding-left:4%;">
								<div style="padding-left:4%;width:35%;font-weight:bold;padding-top: 3%;">
									기업의 장점
								</div>
								<textarea name="rev_advan" id="rev_advan"
										required="required" cols="40" rows="5" style="resize: none;width:45%;"
										placeholder="최소 30자 이상 기재해 주세요."></textarea>
								<div style="width:15%;font-size:12pt;padding-top:3%;margin-left:3%">
									최소 30자
								</div>
								<span id="advanText" style="padding-top: 3%;color: red;">
									<b>√</b>
								</span>
							</div>
							
							<div style="display:flex;flex-direction: row;flex-wrap: nowrap;
								margin-bottom:3%;padding-left:4%;">
								<div style="padding-left:4%;width:35%;font-weight:bold;padding-top: 3%;">
									기업의 단점
								</div>
								<textarea name="rev_weak" id="rev_weak"
										required="required" cols="40" rows="2" style="resize: none;width:45%;"
										placeholder="최소 30자 이상 기재해 주세요."></textarea>
								<div style="width:15%;font-size:12pt;padding-top:3%;margin-left:3%">
									최소 30자
								</div>
								<span id="weakText" style="padding-top: 3%;color: red;">
									<b>√</b>
								</span>
							</div>
							<div style="display:flex;flex-direction: row;flex-wrap: nowrap;
								margin-bottom:3%;padding-left:4%;">
								<div style="padding-left:4%;width:35%;font-weight:bold;padding-top: 3%;">
									경영진에게 바라는 점
								</div>
								<textarea name="rev_wish" id="rev_wish"
										required="required" cols="40" rows="2" style="resize: none;width:45%;"
										placeholder="최소 30자 이상 기재해 주세요."></textarea>
								<div style="width:15%;font-size:12pt;padding-top:3%;margin-left:3%">
									최소 30자
								</div>
								<span id="wishText" style="padding-top: 3%;color: red;">
									<b>√</b>
								</span>
							</div>
							
						</div>
						<div style="width:100%;text-align:end;margin-top:5%;margin-bottom:3%;">
							<input style="width:20%;border:0;background-color:#ff6900;color:white;
								font-size:20pt;margin-right:18%;" type="submit" value="추가">
						</div>
					</form>
					<!--//////////////////////////////////  -->
				
				
			</div>
			<div style="width: 25%; align-items:center;display:flex; flex-direction: column;">
			<!--분할화면 오른쪽  -->
				<div style="margin-bottom:3%;margin-top:6%; align-items:center;display:flex; flex-direction: column;">
					<img style="border-radius: 30px;width:80%;" src="/resources/images/ad1.gif"/>
				</div>
				<div style="margin-bottom:3%; align-items:center;display:flex; flex-direction: column;">
					<img style="border-radius: 30px;width:80%;" src="/resources/images/ad2.gif"/>
				</div>
				<div style="margin-bottom:3%; align-items:center;display:flex; flex-direction: column;">
					<img style="border-radius: 30px;width:80%;" src="/resources/images/ad3.gif"/>
				</div>
				
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</footer>
</body>
</html>