<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>리뷰</title>
<style>
	.star1 {
	    background: url('/resources/images/star_on.png') no-repeat 0 0;
	    background-size: auto 100%;
	    width: 15px;
	    height: 30px;
	    float:left;
	}
	.star2 {
	    background: url('/resources/images/star_on.png') no-repeat right 0;
	    background-size: auto 100%;
	    width: 15px;
	    height: 30px;
	    float:left;
	}
	.star1.on {background-image: url('/resources/images/star.png');}
	.star2.on {background-image: url('/resources/images/star.png');}
</style>
<script src="<c:url value='/resources/js/jquery-3.1.1.js'/>"></script>
<script>
	var msg = "${msg}";
	if(msg == "success")
		alert("추가되었습니다.");
	
	var allStar = (Math.round("${allStar}"*2)/2).toFixed(1);
	
	$(document).ready(function() {
		$(".review_allStar span").each(function(i, e) { //평균 평점
			if($(this).attr("id") === allStar) {
				$(this).addClass('on').prevAll('span').addClass('on');
			}
		})
		
		$(".review_list table").each(function(i, e) { //각 리뷰 평점들
			var table = $(this);
			var td = table.find("#review_list_td");
			var div = td.find(".review_star");
			var star = td.find("#star").val();
			
			div.find("span").each(function(i, e) {
				if($(this).attr("id") === star) {
					$(this).addClass('on').prevAll('span').addClass('on');
				}
			})
		});
		
		$("#cnt input").click(function() { //추천수 증가
			var cnt = $(this);
			var table = cnt.parent().parent().parent();
			var no = table.find("#no").val();
			var rev_name = $("#rev_name").text();
			
			$.ajax({
				type: "post",
				url: "reviewCntUp.do",
				data: {
					rev_no : no,
					rev_name : rev_name
				},
				success: function(result) {
					cnt.val("도움이 돼요 " + result);
				}
			})
		})
		
		$(".review_star span").each(function(i, e) { //평균 평점
			if($(this).attr("id") === '${reviewVO.rev_star}') {
				$(this).addClass('on').prevAll('span').addClass('on');
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

</head>
<body>
	<header>
		<jsp:include page="../include/header.jsp"></jsp:include>
	</header>
	<section>
	<div style="width: 100%; display: flex; flex-wrap: nowrap; min-height: 70vh;">
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
	<div style="width: 60%; display: flex; flex-direction: column;margin-left:15%;margin-bottom: 5%;">
		<h1 id="rev_name">${reviewVO.rev_name}</h1>
	
			<br><br>
			
				<table>
					<tr>
						<td><input type="text" id="no" value="${reviewVO.rev_no}" style="display: none;">${reviewVO.rev_job } | ${reviewVO.rev_state } | ${reviewVO.rev_date }</td>
					</tr>
					<tr>
						<td id="review_list_td">
							<input type="text" id="star" value="${reviewVO.rev_star }" style="display: none;">
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
						</td>
					</tr>
					<tr>
						<td><b>"${reviewVO.rev_title }"</b></td> <!-- 한 줄 평가 -->
					</tr>
					<tr>
						<td style="color: blue;"><b>장점</b></td>
					</tr>
					<tr>
						<td style="white-space: pre;">${reviewVO.rev_advan }</td>
					</tr>
					<tr>
						<td style="color: red;"><b>단점</b></td>
					</tr>
					<tr>
						<td style="white-space: pre;">${reviewVO.rev_weak }</td>
					</tr>
					<tr>
						<td><b>경영진에게 바라는 점</b></td>
					</tr>
					<tr>
						<td style="white-space: pre;">${reviewVO.rev_wish }</td>
					</tr>
					<tr>
						<td><input type="button" value="전체 리뷰 보기" onclick="location.href='reviews.do'"></td>
					</tr>
				</table>
			
			<br><br>
		</div>
	</div>
	</section>
	<footer>
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</footer>
</body>
</html>