<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>잡레시피</title>
<link type="text/css" href="<c:url value="/resources/css/jobCSS.css" />" rel="stylesheet">
<script type="text/javascript" src="<c:url value="/resources/js/jobJS.js"/>"></script>
</head>
<body>
	<header>
		<jsp:include page="../include/header.jsp"></jsp:include>
		<a href="../profile/hire/Search_Job.do">검색</a>
	</header>
	<section>
		<div id="myPageInfo">
			<span class="img_profile"></span> <!-- 프로필 이미지 -->
			<div class="my_info">
				<h1>${u_email}</h1>
			</div>
		</div>
		<div id="myPageMenu">
			<div class="mypagemenu_wrap">
				<div class="table_row_div">
					<a href="settings.do">계정</a>
					<a href="resumes.do">내 프로필</a>
					<a href="#">활동내역</a>
					<a href="#">관심정보</a>
				</div>
			</div>
		</div>
		<div id="rsm_contents_wrap">
			<form action="insertResume.do" method="post">
				<div id="rsm_contents">
					<!-- 기본 정보 섹션 -->
					<div class="section_wrap"> <!-- 각 입력 내용 섹션 분류용 래퍼 -->
						<h2>기본정보 (필수)</h2>
						<div class="gender_radio rsm_half_cell"> <!-- rsm_half_cell : 가로 기준 섹션 셀의 반을 차지 -->
							<div class="gender_header">
								<h3>성별</h3>
							</div>
							<label class="btn_radio" for="gender_man">
								<input type="radio" name="pro_gender" id="gender_man" value="1" ${profileVO.pro_gender eq 1 ? "checked" : ""}>
								<span class="radio_txt">남자</span>
							</label>
							<label class="btn_radio" for="gender_woman">
								<input type="radio" name="pro_gender" id="gender_woman" value="2"${profileVO.pro_gender eq 2 ? "checked" : ""}>
								<span class="radio_txt">여자</span>
							</label>
						</div>
						<div class="birth_wrap rsm_half_cell">
							<div class="birth_header">
								<h3>출생연도</h3>
							</div>
							<div class="birthYear_select">
								<select id="birth_year" name="pro_birthYear">
									<option value="none">선택해주세요.</option>
									<option value="2006" ${profileVO.pro_birthYear eq 2006 ? "selected" : ""}>2006년</option>
									<option value="2005" ${profileVO.pro_birthYear eq 2005 ? "selected" : ""}${profileVO.pro_gender eq 2006 ? "selected" : ""}>2005년</option>
									<option value="2004" ${profileVO.pro_birthYear eq 2004 ? "selected" : ""}>2004년</option>
									<option value="2003" ${profileVO.pro_birthYear eq 2003 ? "selected" : ""}>2003년</option>
									<option value="2002" ${profileVO.pro_birthYear eq 2002 ? "selected" : ""}>2002년</option>
									<option value="2001" ${profileVO.pro_birthYear eq 2001 ? "selected" : ""}>2001년</option>
									<option value="2000" ${profileVO.pro_birthYear eq 2000 ? "selected" : ""}>2000년</option>
									<option value="1999" ${profileVO.pro_birthYear eq 1999 ? "selected" : ""}>1999년</option>
									<option value="1998" ${profileVO.pro_birthYear eq 1998 ? "selected" : ""}>1998년</option>
									<option value="1997" ${profileVO.pro_birthYear eq 1997 ? "selected" : ""}>1997년</option>
									<option value="1996" ${profileVO.pro_birthYear eq 1996 ? "selected" : ""}>1996년</option>
									<option value="1995" ${profileVO.pro_birthYear eq 1995 ? "selected" : ""}>1995년</option>
									<option value="1994" ${profileVO.pro_birthYear eq 1994 ? "selected" : ""}>1994년</option>
									<option value="1993" ${profileVO.pro_birthYear eq 1993 ? "selected" : ""}>1993년</option>
									<option value="1992" ${profileVO.pro_birthYear eq 1992 ? "selected" : ""}>1992년</option>
									<option value="1991" ${profileVO.pro_birthYear eq 1991 ? "selected" : ""}>1991년</option>
									<option value="1990" ${profileVO.pro_birthYear eq 1990 ? "selected" : ""}>1990년</option>
								</select>
							</div>
						</div>
						<div class="occu_wrap"> <!-- 관심 직종 -->
							<div class="occu_header">
								<h3>현재(관심)직종</h3>
							</div>
							<div class="occu_select">
								<select id="occu_content" name="pro_occu">
									<option value="none">선택해주세요.</option>
									<option value="IT/인터넷">IT/인터넷</option>
								</select>
							</div>
							<div class="subOccu_select">
								<select id="subOccu_content" name="pro_suboccu">
									<option value="none">선택해주세요.</option>
									<option value="JAVA">JAVA</option>
									<option value="데이터베이스">데이터베이스</option>
									<option value="네트워크">네트워크</option>
									<option value="보안">보안</option>
								</select>
							</div>
						</div>
						<div class="career_wrap">
							<div class="career_header">
								<h3>총 경력</h3>
							</div>
							<div class="career_select">
								<select id="career" name="pro_career">
									<option value="none">선택해주세요.</option>
									<option value="0" ${profileVO.pro_career eq 0 ? "selected" : ""}>0</option>
									<option value="1" ${profileVO.pro_career eq 1 ? "selected" : ""}>1</option>
									<option value="2" ${profileVO.pro_career eq 2 ? "selected" : ""}>2</option>
									<option value="3" ${profileVO.pro_career eq 3 ? "selected" : ""}>3</option>
									<option value="4" ${profileVO.pro_career eq 4 ? "selected" : ""}>4</option>
									<option value="5" ${profileVO.pro_career eq 5 ? "selected" : ""}>5</option>
									<option value="6" ${profileVO.pro_career eq 6 ? "selected" : ""}>6</option>
									<option value="7" ${profileVO.pro_career eq 7 ? "selected" : ""}>7</option>
									<option value="8" ${profileVO.pro_career eq 8 ? "selected" : ""}>8</option>
									<option value="9" ${profileVO.pro_career eq 9 ? "selected" : ""}>9</option>
									<option value="10" ${profileVO.pro_career eq 10 ? "selected" : ""}>10</option>
								</select>
							</div>
						</div>
						<div class="skill_wrap">
							<div class="skill_header">
								<h3>업무 및 스킬</h3>
							</div>
							<div class="skill_content">
								<input type="text" name="pro_skill" placeholder="(예시) java, python, 서버 구축 (업무와 관련된 자격증 및 기술명  포함)">
							</div>
						</div>
						<div class="profile_wrap">
							<div class="profile1_header">
								<h3>이름, 연락처(필수)</h3>
							</div>
							<div class="proflie1_content">
								<div class="profile_input">
									<div class="set1"> <!-- set1 옆에 프로필 이미지가 라벨 형식으로 붙음 -->
										<input type="text" class="input_name" name="pro_name" placeholder="이름">
									</div>
									<div class="set2">
										<input type="text" class="input_email" name="pro_email" placeholder="이메일">
									</div>
									<div class="set2">
										<input type="text" class="input_tel" name="pro_tel" placeholder="전화번호">
									</div>
								</div>
								<label class="resume_addPhoto" for="resume_addPhoto_id">
									<input type="file" id="resumse_addPhoto_id" name="pro_imgPath">
									<span class="resume_addPhoto_txt">사진 등록</span>
									<span class="resume_addPhoto_img">
										<img src="#"> <!-- 등록 안 했을시 기본 이미지 path -->
									</span>>
								</label>
							</div>
							<div class="profile2_header">
								<h3>자기소개</h3>
							</div>
							<div class="profile2_content">
								<div class="flexible_textarea">
									<!-- class 통해서 텍스트에어리어 크기 조절 필요 -->
									<textarea class="#" placeholder="경력, 경험 위주의 자기소개를 작성해주세요. 관심분야, 앞으로의 목표등의 내용도 좋습니다."></textarea>
								</div>
							</div>
						</div>
					</div>
	
					<!-- 학력, 경력, 활동 수상 내역, 포트폴리오 등등 입력 섹션 -->					
					<div class="section_wrap">
						<!-- 학력사항 -->
						<div class="education_header">
							<h3>학력사항</h3>
						</div>
						<c:choose>
							<c:when test="${eduVOList.size() eq 0}">
							<div class="flexible_resume">
								<div class="left_resume_flexible">
									<div class="group_date">
										<!-- <div class="month_picker"> -->
											<input type="text" name="e_edate" placeholder="년/월">
										<!-- </div> -->
										<span class="resume_etc">~</span>
										<!-- <div class="month_picker"> -->
											<input type="text" name="e_gdate" placeholder="년/월">
										<!-- </div> -->
									</div>
									<div class="group_check">
										<label class="btn_check">
											<!-- 체크박스 클릭시 value 변경해주는 javascript 로직 필요 / 아래도 동일 -->
											<input name="e_attendcheck" type="checkbox" onclick="" value="0">
											<!-- <span class="check_icon"></span> -->
											<span class="check_txt">재학중</span>
										</label>
									</div>
								</div>
								<div class="right_resume_flexible">
									<div class="sname">
										<input placeholder="학교명" type="text" name="e_sname">
									</div>
									<div class="majordegree">
										<input placeholder="전공 및 학위" type="text" name="e_majordegree">
									</div>
									<div class="flexible_textarea">
										<!-- class 통해서 텍스트에어리어 크기 조절 필요 -->
										<textarea class="#" name="e_description" placeholder="학력사항에 추가로 기재할 특별한 사항이 있을 경우 입력하세요. 추가로 기재할 사항이 없을 경우 입력하지 않으셔도 괜찮습니다."></textarea>
									</div>
								</div>
							</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="educationVO" items="${eduVOList}">
								<div class="flexible_resume">
									<div class="left_resume_flexible">
										<div class="group_date">
											<!-- <div class="month_picker"> -->
												<input type="text" name="e_edate" placeholder="년/월" value="${educationVO.e_edate}">
											<!-- </div> -->
											<span class="resume_etc">~</span>
											<!-- <div class="month_picker"> -->
												<input type="text" name="e_gdate" placeholder="년/월" value="${educationVO.e_gdate}">
											<!-- </div> -->
										</div>
										<div class="group_check">
											<label class="btn_check">
												<!-- 체크박스 클릭시 value 변경해주는 javascript 로직 필요 / 아래도 동일 -->
												<input name="e_attendcheck" type="checkbox" onclick="" ${educationVO.e_attendcheck eq 1 ? "checked" : ""}>
												<!-- <span class="check_icon"></span> -->
												<span class="check_txt">재학중</span>
											</label>
										</div>
									</div>
									<div class="right_resume_flexible">
										<div class="sname">
											<input placeholder="학교명" type="text" name="e_sname" value="${educationVO.e_sname}">
										</div>
										<div class="majordegree">
											<input placeholder="전공 및 학위" type="text" name="e_majordegree" value="${educationVO.e_majordegree}">
										</div>
										<div class="flexible_textarea">
											<!-- class 통해서 텍스트에어리어 크기 조절 필요 -->
											<textarea class="#" name="e_description" placeholder="학력사항에 추가로 기재할 특별한 사항이 있을 경우 입력하세요. 추가로 기재할 사항이 없을 경우 입력하지 않으셔도 괜찮습니다.">${educationVO.e_description}</textarea>
										</div>
									</div>
								</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<div class="education_bottom">
							<!-- button 클릭시 양식 추가 되는 javascript 로직 필요 -->
							<button class="btn_plus">+ 학력 추가</button>
						</div>
						
						<!-- 경력사항 -->
						<div class="career_header">
							<h3>경력사항</h3>
						</div>
						<c:choose>
							<c:when test="${carVOList.size() eq 0}">
								<div class="flexible_resume">
									<div class="left_resume_flexible">
										<div class="group_date">
											<!-- <div class="month_picker"> -->
												<input type="text" name="car_edate" placeholder="년/월">
											<!-- </div> -->
											<span class="resume_etc">~</span>
											<!-- <div class="month_picker"> -->
												<input type="text" name="car_rdate" placeholder="년/월">
											<!-- </div> -->
										</div>
										<div class="group_check">
											<label class="btn_check">
												<input name="car_inoffice" type="checkbox" onclick="" value="0">
												<!-- <span class="check_icon"></span> -->
												<span class="check_txt">재직중</span>
											</label>
										</div>
									</div>
									<div class="right_resume_flexible">
										<div class="sname">
											<input placeholder="기업명" type="text" name="car_cname">
										</div>
										<div class="depart_post">
											<input placeholder="부서" type="text" name="car_department">
											<span class="rsm_dash">/</span>
											<input placeholder="직책" type="text" name="car_position">
										</div>
										<div class="duty">
											<input placeholder="직무" type="text" name="car_duty">
										</div>
										<div class="flexible_textarea">
											<!-- class 통해서 텍스트에어리어 크기 조절 필요 -->
											<textarea class="#" name="car_workexp" placeholder="업무경험을 입력하세요. 추상적인 내용보다는 수치가 들어간 간결하고 객관적인 내용을 입력하는 것이 좋습니다. 예) 미디어 사업부(연간 매출 약 10억, 회원 50만 증가)의 사업전략 수립, 신규 사업 도입으로 3년간 내년 매출 약 2배 상승 기여"></textarea>
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="careerVO" items="${carVOList}">
									<div class="flexible_resume">
										<div class="left_resume_flexible">
											<div class="group_date">
												<!-- <div class="month_picker"> -->
													<input type="text" name="car_edate" placeholder="년/월" value="${careerVO.car_edate}">
												<!-- </div> -->
												<span class="resume_etc">~</span>
												<!-- <div class="month_picker"> -->
													<input type="text" name="car_rdate" placeholder="년/월" value="${careerVO.car_rdate}">
												<!-- </div> -->
											</div>
											<div class="group_check">
												<label class="btn_check">
													<input name="car_inoffice" type="checkbox" onclick="" ${careerVO.car_inoffice eq 1 ? "checked" : ""}>
													<!-- <span class="check_icon"></span> -->
													<span class="check_txt">재직중</span>
												</label>
											</div>
										</div>
										<div class="right_resume_flexible">
											<div class="sname">
												<input placeholder="기업명" type="text" name="car_cname" value="${careerVO.car_cname}">
											</div>
											<div class="depart_post">
												<input placeholder="부서" type="text" name="car_department" value="${careerVO.car_department}">
												<span class="rsm_dash">/</span>
												<input placeholder="직책" type="text" name="car_position" value="${careerVO.car_position}">
											</div>
											<div class="duty">
												<input placeholder="직무" type="text" name="car_duty" value="${careerVO.car_duty}">
											</div>
											<div class="flexible_textarea">
												<!-- class 통해서 텍스트에어리어 크기 조절 필요 -->
												<textarea class="#" name="car_workexp" placeholder="업무경험을 입력하세요. 추상적인 내용보다는 수치가 들어간 간결하고 객관적인 내용을 입력하는 것이 좋습니다. 예) 미디어 사업부(연간 매출 약 10억, 회원 50만 증가)의 사업전략 수립, 신규 사업 도입으로 3년간 내년 매출 약 2배 상승 기여">${careerVO.car_workexp}</textarea>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<div class="career_bottom">
							<!-- button 클릭시 양식 추가 되는 javascript 로직 필요 -->
							<button class="btn_plus">+ 경력 추가</button>
						</div>
						
						<!-- 활동 및 수상내역 -->
						<div class="actAwards_header">
							<h3>활동 및 수상내역</h3>
						</div>
						<c:choose>
							<c:when test="${actAwardVOList.size() eq 0}">
								<div class="flexible_resume">
									<div class="left_resume_flexible">
										<div class="group_date">
											<!-- <div class="month_picker"> -->
												<input type="text" name="act_sdate" placeholder="년/월">
											<!-- </div> -->
											<span class="resume_etc">~</span>
											<!-- <div class="month_picker"> -->
												<input type="text" name="act_edate" placeholder="년/월">
											<!-- </div> -->
										</div>
										<div class="group_check">
											<label class="btn_check">
												<!-- 체크박스 클릭시 value 변경해주는 javascript 로직 필요 / 아래도 동일 -->
												<input name="act_awardCheck" type="checkbox" onclick="" value="0">
												<!-- <span class="check_icon"></span> -->
												<span class="check_txt">수상</span>
											</label>
										</div>
									</div>
									<div class="right_resume_flexible">
										<div class="actAwardname">
											<input placeholder="활동 및 수상명을 작성합니다." type="text" name="act_actawardName">
										</div>
										<div class="flexible_textarea">
											<!-- class 통해서 텍스트에어리어 크기 조절 필요 -->
											<textarea class="medit" name="act_description" placeholder="활동 및 수상과 관련한 상세한 정보가 필요한 경우 입력하세요. 추가로 기재할 사항이 없을 경우 입력하지 않으셔도 괜찮습니다."></textarea>
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="actAwardVO" items="${actAwardVOList}">
								<div class="flexible_resume">
									<div class="left_resume_flexible">
										<div class="group_date">
											<!-- <div class="month_picker"> -->
												<input type="text" name="act_sdate" placeholder="년/월" value="${actAwardVO.act_sdate}">
											<!-- </div> -->
											<span class="resume_etc">~</span>
											<!-- <div class="month_picker"> -->
												<input type="text" name="act_edate" placeholder="년/월" value="${actAwardVO.act_edate}">
											<!-- </div> -->
										</div>
										<div class="group_check">
											<label class="btn_check">
												<!-- 체크박스 클릭시 value 변경해주는 javascript 로직 필요 / 아래도 동일 -->
												<input name="act_awardCheck" type="checkbox" onclick="" ${actAwardVO.act_awardcheck eq 1 ? "checked" : ""}>
												<!-- <span class="check_icon"></span> -->
												<span class="check_txt">수상</span>
											</label>
										</div>
									</div>
									<div class="right_resume_flexible">
										<div class="actAwardname">
											<input placeholder="활동 및 수상명을 작성합니다." type="text" name="act_actawardName"  value="${actAwardVO.act_actawardname}">
										</div>
										<div class="flexible_textarea">
											<!-- class 통해서 텍스트에어리어 크기 조절 필요 -->
											<textarea class="medit" name="act_description" placeholder="활동 및 수상과 관련한 상세한 정보가 필요한 경우 입력하세요. 추가로 기재할 사항이 없을 경우 입력하지 않으셔도 괜찮습니다.">${actAwardVO.act_description}</textarea>
										</div>
									</div>
								</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<div class="actAwards_bottom">
							<!-- button 클릭시 양식 추가 되는 javascript 로직 필요 -->
							<button class="btn_plus">+ 활동 및 수상내역 추가</button>
						</div>
						
						<!-- 자격증 및 기타 -->
						<div class="certiOthers_header">
							<h3>자격증 및 기타</h3>
						</div>
						<c:choose>
							<c:when test="${certiOtherVOList.size() eq 0}">
								<div class="certiOthers_body">
									<div class="certiOhtersName">
										<input placeholder="항목(자격증, 언어, 스킬 등 자유롭게 기재)" type="text" name="cer_item">
									</div>
									<div class="flexible_textarea">
										<!-- class 통해서 텍스트에어리어 크기 조절 필요 -->
										<textarea class="#" name="cer_description" placeholder="항목에 해당하는 상세 내용을 입력하세요. 예) 토익/780점"></textarea>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="certiOtherVO" items="${certiOtherVCList}">
									<div class="certiOthers_body">
										<div class="certiOhtersName">
											<input placeholder="항목(자격증, 언어, 스킬 등 자유롭게 기재)" type="text" name="cer_item" value="${certiOtherVO.cer_item}">
										</div>
										<div class="flexible_textarea">
											<!-- class 통해서 텍스트에어리어 크기 조절 필요 -->
											<textarea class="#" name="cer_description" placeholder="항목에 해당하는 상세 내용을 입력하세요. 예) 토익/780점">${certiOtherVO.cer_description}</textarea>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<div class="certiOthers_bottom">
							<!-- button 클릭시 양식 추가 되는 javascript 로직 필요 -->
							<button class="btn_plus">+ 자격증 및 기타 추가</button>
						</div>
						
						<!-- 포트폴리오 파일 첨부 -->
						<div class="portfolios_header">
							<h3>포트폴리오 파일 첨부</h3>
						</div>
						<c:choose>
							<c:when test="${portVOList.size() eq 0}">
								<div class="portfolio_body">
									<label class="label_upload_resume">
										<input type="file" class="input_upload_resume" name="por_filepath">
										<span class="btn_upload_resume">파일선택</span>
									</label>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="portfolioVO" items="${portVOList}">
									<div class="portfolio_body">
										<label class="label_upload_resume">
											<input type="file" class="input_upload_resume" name="por_filepath" value="${portfolioVO.por_filepath}">
											<span class="btn_upload_resume">파일선택</span>
										</label>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<div class="portfolio_bottom">
							<!-- button 클릭시 양식 추가 되는 javascript 로직 필요 -->
						<button class="btn_plus">+ 파일추가</button>
						</div>
					</div> <!-- section_wrap-end -->
				</div>
				<div class="resume_btn_complete">
					<button type="submit">작성완료</button>
				</div>
			</form>
		</div>
		
	</section>
	<footer>
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</footer>
</body>
</html>