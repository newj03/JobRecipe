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
<body style="margin:0;">
	
	<header>
		<jsp:include page="../include/header.jsp"></jsp:include>
	</header>
	
	<section>
		<div style="width: 100%; display: flex; flex-wrap: nowrap; min-height: 70vh;">
		<!-- 전체화면 -->
		
			<div style="width: 15%;	 margin-left: 3%;">
			<!--  left -->
				<!-- <div style="display:flex; flex-direction: column; border">
					<img style="height:17vh;" src="/resources/images/default_user.png">
					<div>이름</div>
					<div>아이디</div>
					<div>...</div>
					<div>...</div>
					<div>...</div>
				</div> -->
			</div>
			
			<div style="width: 60%;display:flex; flex-direction: column;margin-bottom:5%; ">
				<!--center  -->
				<div style="width:95%;text-align:center;margin-top:5%;margin-bottom:3%;color:#ff6900;">
					<h1 id="rev_name" style="font-size: 2.5rem;">${rev_name } Review</h1>
					<hr style="border:solid 1px #fac5a1">
				

					<c:if test="${empty alist }">
						<div style="padding-top:15%;min-height:30vh;font-size:40pt;color:#ff6900">
							?
							<div style="font-size:20pt;margin-top:5%;">
							리뷰가 없습니다.
							</div>
							<div style="font-size:20pt;">
							근무한 경험이 있으시다면, 첫 리뷰를 작성해 주세요.
							</div>
						</div>
					
						<input type="button" value="리뷰 추가" style="width:30%;font-size:20pt;background-color:#ff6900;
						color:white;border:0;" onclick="location.href='InsertReviewForm.do?rev_name=${rev_name }';">
					</c:if>
				</div>
				
				<c:if test="${!empty alist }">
					<div class="review_list" >
						<div style="display: flex; flex-wrap: nowrap; flex-direction: row;
							font-size:18pt;margin-bottom:3%;">
							<div style="font-weight:bold;margin-right:2%;">
								평 점 : 
							</div>
							<div class="review_allStar" style="margin-right:2%;">
								<span class="star1 on" id="0.5"></span> <span class="star2"
									id="1.0"></span> <span class="star1" id="1.5"></span> <span
									class="star2" id="2.0"></span> <span class="star1" id="2.5"></span>
								<span class="star2" id="3.0"></span> <span class="star1" id="3.5"></span>
								<span class="star2" id="4.0"></span> <span class="star1" id="4.5"></span>
								<span class="star2" id="5.0"></span>
							</div>

							<div style="font-weight:bold;color:#ff6900;">${allStar }</div>
							<div style="width: 50%; text-align:end">
								<input type="button" value="Review 추가" style="background-color:#ff6900;color:white;
									font-size:15pt;border:0;"
									onclick="location.href='InsertReviewForm.do?rev_name=${rev_name }';">
							</div>
							
						</div>
						<c:forEach var="imsi" items="${alist }">
							<div style="border:1px solid #fac5a1;border-radius:15px;padding-left:1%;width:92%;padding:1%;">
							<table>
								
								<tr>
									<td id="review_list_td"><input type="text" id="star"
										value="${imsi.rev_star }" style="display: none;">
										<div class="review_star">
											<span class="star1 on" id="0.5"></span> <span class="star2"
												id="1.0"></span> <span class="star1" id="1.5"></span> <span
												class="star2" id="2.0"></span> <span class="star1" id="2.5"></span>
											<span class="star2" id="3.0"></span> <span class="star1"
												id="3.5"></span> <span class="star2" id="4.0"></span> <span
												class="star1" id="4.5"></span> <span class="star2" id="5.0"></span>
										</div></td>
								</tr>
								<tr>
									<td><input type="text" id="no" value="${imsi.rev_no }"
										style="display: none;">${imsi.rev_job } |
										${imsi.rev_state } | ${imsi.rev_date }</td>
								</tr>
							</table>
							<div style="display: flex; flex-wrap: nowrap; flex-direction: column;margin-top:2%;">
								<div style="font-weight:bold;color:red;font-size:12pt;margin-bottom:1%;">
									
								</div>
								<div>
									<b>"${imsi.rev_title }"</b>
								</div>
							</div>
							<div style="display: flex; flex-wrap: nowrap; flex-direction: column;margin-top:2%;">
								<div style="font-weight:bold;color:blue;font-size:12pt;margin-bottom:1%;">
									장점
								</div>
								<div>
									${imsi.rev_advan }
								</div>
							</div>
							<div style="display: flex; flex-wrap: nowrap; flex-direction: column;margin-top:2%;">
								<div style="font-weight:bold;color:red;font-size:12pt;margin-bottom:1%;">
									단점
								</div>
								<div>
									${imsi.rev_weak }
								</div>
							</div>
							<div style="display: flex; flex-wrap: nowrap; flex-direction: column;margin-top:2%;">
								<div style="font-weight:bold;color:green;font-size:12pt;margin-bottom:1%;">
									경영진에게 바라는 점
								</div>
								<div>
									${imsi.rev_wish }
								</div>
							</div>	
							<div id="cnt" style="text-align:end;margin-top:2%;margin-bottom:1%;">
								<input type="button" id="rev_cnt" style="background-color:white;color:#ff6900;
									font-size:9pt;border:1px solid #ff6900;margin-right:6%;"value="도움이 돼요 ${imsi.rev_cnt }">
							</div>
						
						</div>
						</c:forEach>
						<div style="text-align:center;margin-right:1%;margin-top:3%;">
						<c:if test="${startPage > pageBlock }">
							<a
								href="reviewAll.do?rev_name=${rev_name }&page=${startPage - 5 }">[이전]</a>
						</c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage }"
							step="1">
							<c:if test="${i == page }">
								[${i }]
							</c:if>
							<c:if test="${i != page }">
								<a href="reviewAll.do?rev_name=${rev_name }&page=${i }">[${i }]</a>
							</c:if>
						</c:forEach>
						<c:if test="${endPage < pageCount }">
							<a
								href="reviewAll.do?rev_name=${rev_name }&page=${startPage + 5 }">[다음]</a>
						</c:if>
						</div>
					</div>
				</c:if>
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