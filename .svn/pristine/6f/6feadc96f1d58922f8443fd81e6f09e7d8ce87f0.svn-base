<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>




</head>
<body>


<div>
<h3 class="tit">이메일 수신 설정</h3>
</div>

<form action="newsletter.do" method="post">
<input type="hidden" name="u_email" value="${sessionScope.u_email}">
<div class="jpcont_wrap">
        <div class="section_group">
            <h3 class="tit">이메일 수신 설정</h3>
            <section class="my_newsletter">
                <div class="my_newsletter_section">
                    <span class="tit_agree">맞춤 정보 및 뉴스레터(광고성)</span>
                    <p class="txt">잡플래닛이 찾은 맞춤 채용 및 유용한 정보 알림</p>

                    <label class="btn_check round btn_check_action check_chk">
                     	 수신동의
                      <input type="checkbox" name="newsck" value="1">
                      	동의안함
                      <input type="checkbox" name="newsck" value="0">
                      <input type="submit" value="전송" />
                      <span class="check_icon round"></span>
                      <span class="check_txt"></span>
                    </label>
					
                </div>

                <div class="my_newsletter_section">
                  <span class="tit_agree">콘텐츠 승인여부</span>
                  <p class="txt">작성한 콘텐츠(리뷰, 연봉, 면접 등)의 승인, 수정요청 등에 대한 알림</p>
                  <p class="txt">(수신 설정에 상관 없이 발송되는 승인여부 안내 메일입니다.)</p>
                </div>
            </section>
        </div>
</div>
</form>

<!--     <script type="text/javascript">
      $(document).ready(function () {
        $('#rd2').click(function () {
          // checkbox

          // var check = $('#rd2').is(":checked");
          // alert(check);

          // var check = $('input[id="rd2"]').is(':checked');
          // alert(check);

          var check = $('input:checkbox[id="rd2"]').is(':checked');
          alert(check);
        });
      });
    </script> -->
</body>
</html>