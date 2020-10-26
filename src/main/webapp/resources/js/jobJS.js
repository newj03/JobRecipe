/* javascript쓰는 곳 */



/* 유진 */

	/* 관리자  */
		function admin_company_search() { //회사 검색

			var name = $("#c_name").val();
			if(name == null || name == "") {
				$("#company_search").hide();
				alert("회사명을 입력해주세요!");
			} else {
				$.ajax({
					type: "post",
					url: "admin/selectCompany.do",
					data: {c_name : name},
					dataType: "html",
					success: function(result) {
						
						$("#company_search").show();
						
						var search_result = $("#company_search").html(result).find(".company_search_table");
						$("#company_search").html(search_result);
					}
				});
			}
		}
		
		function admin_company_add() { //회사 추가
			var name = $("#name").val();
			var loc = $("#loc").val();
			var addr = $("#addr").val();
			
			if(name == null || name == "") {
				alert("회사명을 입력해주세요.");
			} else if(loc == null || loc == "") {
				alert("회사위치를 입력해주세요.");
			} else if(addr == null || addr == "") {
				alert("회사주소를 입력해주세요.");
			} else {
				$.ajax({
					type: "post",
					url: "admin/insertCompany.do",
					data: {
						c_name : name,
						c_loc : loc,
						c_addr : addr
					},
					success: function(result) {
						if(result == "no") {
							alert("이미 존재하는 회사입니다.");
						} else {
							alert("회사가 추가되었습니다.");
						}
						$("#name").val("");
						$("#loc").val("");
						$("#addr").val("");
					}
				});
			}
		}
		
		function admin_company_update() { //회사 수정
			var name = $("#name1").val();
			var loc = $("#loc1").val();
			var addr = $("#addr1").val();
			
			if(loc == null || loc == "") {
				alert("회사위치를 입력해주세요.");
			} else if(addr == null || addr == "") {
				alert("회사주소를 입력해주세요.");
			} else {
				$.ajax({
					type: "post",
					url: "updateCompany.do",
					data: {
						c_name : name,
						c_loc : loc,
						c_addr : addr
					},
					success: function(result) {
						alert("회사 정보가 수정되었습니다.");
					}
				});
			}
		}
		
		function admin_company_del() { //회사 삭제
			var name = $("#name1").val();
			$.ajax({
				type: "post",
				url: "deleteCompany.do",
				data: {c_name : name},
				success: function(result) {
					alert("회사 정보가 삭제되었습니다.");
					$("#c_name").val("");
					$("#company_search").hide();
				}
			});

		}

		
		var adminLienCount = 2;
		var adminDealCount = 2;
		var adminCpCount = 2;
		var adminEctCount = 2;
		
		function admin_job_check() { //직무 선택
			var job = $('input[name="job"]:checked').val();
			$("#checkJob").val(job);
		}
		
		function admin_checkJob() { //직무 직접 치려고 할 때
			alert("찾기 버튼을 눌러주세요.");
		}
		
		function admin_addLien() { //자격요건 행 추가
			$("#lienDiv").append('<input type="text" id="lien'+adminLienCount+'" name="lien'+adminLienCount+'"> <br>');
			$("#lien"+adminLienCount).css("width", "15%");
			$("#lien"+adminLienCount).css("border", "1px solid #ff6900");
			$("#lien"+adminLienCount).css("border-radius", "10px");
			$("#lien"+adminLienCount).css("margin-bottom", "1%");
			adminLienCount++;
			if(adminLienCount==6)
				$("#lienBtn").hide();
		}
		
		function admin_addDeal() { //우대사항 행 추가
			$("#dealDiv").append('<input type="text" id="deal'+adminDealCount+'"name="deal'+adminDealCount+'"> <br>');
			$("#deal"+adminDealCount).css("width", "15%");
			$("#deal"+adminDealCount).css("border", "1px solid #ff6900");
			$("#deal"+adminDealCount).css("border-radius", "10px");
			$("#deal"+adminDealCount).css("margin-bottom", "1%");
			adminDealCount++;
			if(adminDealCount==6)
				$("#dealBtn").hide();
		}
		
		function admin_addCp() { //복리후생 행 추가
			$("#cpDiv").append('<input type="text" id="cp'+adminCpCount+'" name="cp'+adminCpCount+'"> <br>');
			$("#cp"+adminCpCount).css("width", "15%");
			$("#cp"+adminCpCount).css("border", "1px solid #ff6900");
			$("#cp"+adminCpCount).css("border-radius", "10px");
			$("#cp"+adminCpCount).css("margin-bottom", "1%");
			adminCpCount++;
			if(adminCpCount==6)
				$("#cpBtn").hide();
		}
		
		function admin_addEct() { //기타 행 추가
			$("#ectDiv").append('<input type="text" id="ect'+adminEctCount+'" name="ect'+adminEctCount+'"> <br>');
			$("#ect"+adminEctCount).css("width", "15%");
			$("#ect"+adminEctCount).css("border", "1px solid #ff6900");
			$("#ect"+adminEctCount).css("border-radius", "10px");
			$("#ect"+adminEctCount).css("margin-bottom", "1%");
			adminEctCount++;
			if(adminEctCount==6)
				$("#ectBtn").hide();
		}
		
		function admin_addAdvertise() { //경력, 고용형태 체크 요망
			if($('input:checkbox[name="ad_carrBae"]').is(':checked') == false) {
				alert("경력을 체크하세요.");
				return false;
			}
			if($('input:radio[name="ad_emp"]').is(':checked') == false) {
				alert("고용형태를 체크하세요.")
				return false;
			}
			return true;
		}
		
		/* 공고 */
		
		function advertiseOrder() { //평점순으로 이동
			var order = document.getElementById("order");
			var orderValue = order.options[order.selectedIndex].value;
			
			location.href="aAllInfo1.do";
		}
		
		function advertiseOrder1() { //마감순으로 이동
			var order = document.getElementById("order");
			var orderValue = order.options[order.selectedIndex].value;
			
			location.href="aAllInfo.do";
		}

		function searchJob() {
			var search = $("#search").val().trim();
			
			if(search == "" || search == null) {
				alert("찾을 내용을 입력해 주세요.");
				return false;
			}
		}
		
		function searchJob2() {
			var search = $("#search2").val().trim();
			
			if(search == "" || search == null) {
				alert("찾을 내용을 입력해 주세요.");
				return false;
			}
		}
		
		/* 리뷰 */
		
		function review_checkJob() {
			alert("찾기 버튼을 눌러주세요.");
		}

		function review_job_check() {
			var job = $('input[name="job"]:checked').val();
			$("#checkJob").val(job);
		}
		
/* 유진 끝 */
		
/* 준범 */
		function users_changeCkboxVal(id) { //체크박스 체크시 DB로 전달할 값(0 혹은 1) 변경
			var ckboxVal = $("#"+id).val();
			if(ckboxVal == 0) {
				$("#"+id).val("1");
			} else {
				$("#"+id).val("0");
			}
		}
		
		function users_agreeAll() { //전체동의 체크시 DB로 전달할 값(0 혹은 1) 일괄 변경
			var agreeAllVal = $("#agree_all").val();
			var ckboxVals = new Array("tou_service", "tou_privacy", "tou_privacy_optional", "user_subscribe_news");
			if(agreeAllVal == 0) {
				$("#agree_all").val("1");
				for(var i=0; i<ckboxVals.length; i++) {
					$("#"+ckboxVals[i]).val("1");
					//$(ckboxVals[i]).val("1");
				}
			} else {
				$("#agree_all").val("0");
				for(var i=0; i<ckboxVals.length; i++) {
					$("#"+ckboxVals[i]).val("0");
				}
			}
		}
