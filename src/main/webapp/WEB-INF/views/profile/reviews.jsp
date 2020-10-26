<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value="/resources/js/jobJS.js"/>"></script>
<style>
</style>
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
			<!-- 전체화면 -->
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

			<div style="width: 60%; display: flex; flex-direction: column; margin-bottom: 5%;">
				<div style="width:100%;text-align:center;margin-top:5%;margin-bottom:3%;color:#ff6900;">
					<h1 style="font-size:22pt;">내 리뷰</h1><br>
					
					
				</div>
				<div id="mainContents" class="jpcont_rgt" style="width:90%;margin-right:auto;margin-left:auto;">
					<div class="jpcont_wrap">
						<div class="layout_my_account myaccountcon">
							<div class="section_group">
								
								<hr style="margin-bottom:1%; border:solid 1px #fac5a1">
								
								<div style="margin-left: 10%">
									<div>
										<h2>내 기업리뷰</h2>
										<h3>${reviewCnt}개의 리뷰를 작성하셨습니다.</h3>
									</div>
									<div style="display: flex; flex-direction: row;flex-wrap: nowrap;">
										<c:choose>
											<c:when test="${list.size() eq 0}">
												<div>
													작성된 리뷰가 없습니다.
												</div>
											</c:when>
											<c:otherwise>
												<c:forEach items="${list}" var="reviewVO">
													<div>
														<h3>기업명</h3>
														<a href="getReview.do?rev_no=${reviewVO.rev_no}">${reviewVO.rev_name}</a>
													</div>
													<div style="margin-left: 10%">
														<h3>고용형태</h3>
														${reviewVO.rev_emp}
													</div>
													<div style="margin-left: 10%">
														<h3>작성일</h3>
														${reviewVO.rev_date}
													</div>
													<div style="margin-left: 10%">
														<h3>관리</h3>
														<a href="./updateReviewView.do?rev_no=${reviewVO.rev_no}">수정</a>
														/<a href="./deleteReview.do?rev_no=${reviewVO.rev_no}">삭제</a>
													</div>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</div>									
								</div>
								
								<hr style="margin-bottom:1%; border:solid 1px #fac5a1">
								
								<div style="text-align: right;">
									<button onclick="insertReview();" style="background-color:#ff6900;color:white;border:0;border-radius:10px;padding:1%;">기업리뷰 작성</button>
								</div>
								
							</div>
						</div>
					</div>					
				</div>


				
			</div>
			<div
				style="width: 25%; align-items: center; display: flex; flex-direction: column;">
				<!--분할화면 오른쪽  -->
				<div
					style="margin-bottom: 3%; margin-top: 6%; align-items: center; display: flex; flex-direction: column;">
					<img style="border-radius: 30px; width: 80%;"
						src="/resources/images/ad1.gif" />
				</div>
				<div
					style="margin-bottom: 3%; align-items: center; display: flex; flex-direction: column;">
					<img style="border-radius: 30px; width: 80%;"
						src="/resources/images/ad2.gif" />
				</div>
				<div
					style="margin-bottom: 3%; align-items: center; display: flex; flex-direction: column;">
					<img style="border-radius: 30px; width: 80%;"
						src="/resources/images/ad3.gif" />
				</div>

			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</footer>
	

	<%-- <div id="myPageMenuWrap">
		<div id="myPageMenu">
			<div class="mypagemenu_wrap">
				<div class="table_row_div">
					<!-- 내 정보 -->
					<a href="./settings.do">계정</a>
					<!-- 이력서 관리 -->
					<a href="./reviews.do"> 내 프로필</a>

					<!-- 내 활동내역 -->
					<a href="./reviews.do">활동내역</a>
					<!-- //내 활동내역 -->

					<!-- 팔로잉 -->
					<a href="./company_follows">관심정보</a>
				</div>
			</div>
		</div>
	</div>

	<div>
		<div>
			<div>
				<nav>
					<h2>활동내역</h2>
					<ul>
						<li><a href="./reviews.do"> <span>리뷰</span> <span>(${reviewCnt})</span>
						</a></li>
						<li><a href="./drafts.do"> <span>입사지원한 기업</span> <span>(0)</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>

	</div>

	<div>
		<h2>내 기업리뷰</h2>
		<h3>
			<span>0</span>개의 리뷰를 작성하셨습니다.
		</h3>
		<table border=1>
			<caption>내 기업리뷰</caption>
			<thead>
				<tr>
					<th>기업명</th>
					<th>고용형태</th>
					<th>작성일</th>
					<th>수정/삭제</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="reviewVO">
				<tbody>
					<tr>
						<td><a href="getReview.do?rev_no=${reviewVO.rev_no}">${reviewVO.rev_name}</a></td>
						<td>${reviewVO.rev_emp}</td>
						<td>${reviewVO.rev_date}</td>
						<td><a href="./updateReviewView.do?rev_no=${reviewVO.rev_no}">수정</a>/<a
							href="./deleteReview.do?rev_no=${reviewVO.rev_no}">삭제</a></td>
					</tr>
				</tbody>
			</c:forEach>
		</table>

		<div>
			<button onclick="insertReview();">기업리뷰 작성</button>
		</div>
		<div>
			<span class="text">작성한 기업리뷰가 없습니다.</span>
		</div>
	</div> --%>


	<script type="text/javaScript">
		function insertReview() {
			location.href = "/insertReviewForm.do";
		}
	</script>



</body>
</html>