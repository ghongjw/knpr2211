<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width">
<link rel="stylesheet"
	href="../assets/style/reservation/ecoReservation.css">
<script src="../assets/js/lib/jquery-1.12.4.min.js"></script>
<script src="../assets/js/reservation/ecoReservation.js"></script>

<body>
	<div id="wrap" class="sub">
		<%@ include file="../common/header.jsp"%>
		<%
		String sessionId = (String) session.getAttribute("id");
		String sessionMember = (String) session.getAttribute("member");
		
		String msg = request.getParameter("msg");
		if(msg != null && msg != ""){
			out.println("<script>");
		    out.println("alert('"+msg+"')");
		    out.println("</script>");
		}
		%>
		<div id="container">
			<div class="page-location">
				<span>홈</span><span>예약하기</span><span>${category1}</span>
			</div>
			<div class="reservation responsive eco">
				<h3 class="title">${category1}예약</h3>
				<div class="tab-content">
					<div class="tab-pane is-active">
						<ul class="nav-tabs type2">
							<li class=""><a href="ecoReservation?category=C08">북한산</a></li>
							<li class=""><a href="ecoReservation?category=C06">지리산</a></li>
							<li class=""><a href="ecoReservation?category=C05">소백산</a></li>
							<li class=""><a href="ecoReservation?category=C04">설악산</a></li>
							<li class=""><a href="ecoReservation?category=C07">한려해상</a></li>
							<li class=""><a href="ecoReservation?category=C03">무등산</a></li>
							<li class=""><a href="ecoReservation?category=C01">가야산</a></li>
							<li class=""><a href="ecoReservation?category=C02">내장산</a></li>
						</ul>
						<form id="reservationForm" method="post">
							<div class="tab-content">
								<div class="tab-pane is-active">
									<div class="title-area">
										<span class="label"><i class="icon-location"></i>${category2}</span>
										<h4 class="title" id="deptTitle">${category2}생태탐방원</h4>
										<div class="btn-area">
<!-- 											<button class="btn btn-refresh"
												onclick="location.reload(true);">
												<i class="icon-refresh"></i> <span>새로고침</span>
											</button> -->
										</div>
									</div>
									<!-- 예약일 설정 -->
									<div class="detail-info">
										<dl class="mb-block">
											<dt>예약일 선택</dt>
											<dd>
												<div class="calendar-container">
													<div class="calendar first">
														<div class="calendar-head">
															<div class="calendar-title first"
																style="font-weight: bold">
																<span>2022</span>. <span>11</span>
															</div>
														</div>
														<div class="calendar-body">
															<div class="calendar-week">
																<div class="day">MON</div>
																<div class="day">TUE</div>
																<div class="day">WED</div>
																<div class="day">THE</div>
																<div class="day">FRI</div>
																<div class="day sat">SAT</div>
																<div class="day sun">SUN</div>
															</div>
															<div class="calendar-day frist"></div>
														</div>
													</div>
													<div class="calendar second">
														<div class="calendar-head">
															<div class="calendar-title second"
																style="font-weight: bold">
																<span>2022</span>. <span>11</span>
															</div>
														</div>
														<div class="calendar-body">
															<div class="calendar-week">
																<div class="day">MON</div>
																<div class="day">TUE</div>
																<div class="day">WED</div>
																<div class="day">THE</div>
																<div class="day">FRI</div>
																<div class="day sat">SAT</div>
																<div class="day sun">SUN</div>
															</div>
															<div class="calendar-day second"></div>
														</div>
													</div>
													<div class="calendar third">
														<div class="calendar-head">
															<div class="calendar-title third"
																style="font-weight: bold">
																<span>2022</span>. <span>11</span>
															</div>
														</div>
														<div class="calendar-body">
															<div class="calendar-week">
																<div class="day">MON</div>
																<div class="day">TUE</div>
																<div class="day">WED</div>
																<div class="day">THE</div>
																<div class="day">FRI</div>
																<div class="day sat">SAT</div>
																<div class="day sun">SUN</div>
															</div>
															<div class="calendar-day third"></div>
														</div>
													</div>
												</div>

												<ul class="dot-list">
													<li>예약할 기간을 달력에서 선택하세요.</li>
													<li>예약이 가능한 마지막 날짜를 선택할 경우는 당일과 1박2일만 가능합니다.</li>
												</ul>
											</dd>
										</dl>
										<dl>
											<dt>입실일</dt>
											<dd id="startDt">-</dd>
										</dl>
										<dl>
											<dt>퇴실일</dt>
											<dd id="endDt">-</dd>
										</dl>
										<dl>
											<dt>체류기간</dt>
											<dd class="form">
												<div class="stay-row">
													<span class="length-stay" id="nightDays0">당일</span> <span
														class="length-stay" id="nightDays1">1박 2일</span> <span
														class="length-stay" id="nightDays2">2박 3일</span> <span
														class="length-stay" id="nightDays3">3박 4일</span> <span
														style="display: none" id="nightDays"></span>
												</div>
											</dd>
										</dl>
										<dl>
											<dt>객실 구분</dt>
											<dd class="form">
												<!-- 
												<button type="button" class="btn btn-view"
													onclick="funcArray.drawImage('06001');">객실 보기</button>
												&nbsp;&nbsp;&nbsp;
												<button type="button" class="btn btn-charge"
													onclick="openPopup('livingAmtPop');">요금표</button>
													 -->
												<!-- 객식 구분 체크박스 넣기 -->
												<span class="check-area"> <c:forEach var="list"
														items="${roomTypeList}">
														<span class="radio-1"> <input type="radio"
															id="${list.category3}" name="txblPblc"
															value="${list.nameCategory3}"
															onClick="selectRoom(${list.peopleMax});">${list.nameCategory3}
															<span style="display: none" id="minbakMax"></span>
														</span>
													</c:forEach>
												</span>
											</dd>
										</dl>
									</div>
									<div class="border-box sendview" style="display: none">
										<dl>
											<dt>사용인원 설정</dt>
											<dd class="form">
												<span class="quantity-input">
													<button type="button"
														class="btn minus livingRoom-prsn-minus">
														<i class="icon-minus"></i>
													</button> <label for="livingPrsnCnt" class="hidden-text">총참여인원</label>
													<input type="number" value="1" readonly="" title="총 참여 인원"
													name="livingPrsnCnt" id="livingPrsnCnt">
													<button type="button" class="btn plus livingRoom-prsn-plus">
														<i class="icon-plus"></i>
													</button>
												</span>
											</dd>
										</dl>
									</div>
									<!-- 총 선택 이용금액 -->
									<div class="title-area sendview" style="display: none">
										<h4 class="title">총 결제 예정 금액</h4>
									</div>
									<div class="payment  sendview" style="display: none">
										<dl>
											<dt>
												<em>생태여행</em>
											</dt>
											<dd></dd>
										</dl>
										<dl class="surtax">
											<dt>
												<em>과세 합계</em>
											</dt>
											<dd>
												<em>0</em>원
											</dd>
											<dt>
												<em>부가세</em>
											</dt>
											<dd>
												<em>0</em>원
											</dd>
										</dl>
										<dl class="total">
											<dt>결제(예정)금액</dt>
											<dd>
												<em>0</em>원
											</dd>
										</dl>
									</div>
									<div class="board-bottom sendview" style="display: none;">
										<div class="board-bottom">
											<div class="center reserv">
												<a href="javascript:void(0);"
													onclick="open_Popup_eco('automatic-character', '<%=sessionId%>', '<%=sessionMember%>')"
													class="btn btn-register is-active">예약하기</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>


			<div class="modal-popup large" id="eco-view"></div>

			<div class="modal-popup small" id="captchaPop">
				<div class="popup-wrap" >
					<div class="popup-head">
						<strong class="popup-title">자동방지 입력문자</strong>
						<button type="button" class="btn-close" title="닫기"
							onclick="closePopup('captchaPop');">
							<i class="icon-close"></i>
						</button>
					</div>
					<div class="popup-container" id="captchaDiv"></div>
				</div>
			</div>

			<div class="modal-popup small" id="automatic-character"
				style="display: none;">
				<div class="popup-wrap" style="top: 65px; bottom: 150px;">
					<div class="popup-head">
						<strong class="popup-title">예약가능</strong>
						<button type="button" class="btn-close"
							onclick="close_Popup('automatic-character' )"
							title="닫기">
							<i class="icon-close"></i>
						</button>
					</div>
					<div class="popup-container">
						<form action="ecoProc" method="post" onsubmit="return checkBot()">
							<table class="table">
								<caption>자동방지 입력문자</caption>
								<colgroup>
									<col style="width: 140px;">
									<col>
								</colgroup>
								<tbody class="tbody">
									<tr style="display: none;">
										<th scope="row">예약코드</th>
										<td><input type="text" id="txtEcoCode" name="category3"
											value="D0101" readonly="readonly" style="border: none;"></td>
									</tr>
									<tr>
										<th scope="row">예약상품</th>
										<td><input type="text" id="txtEcoNm" name="nameCategory3"
											value="개인형 29.7㎡(9평/2명) 침대" readonly="readonly"
											style="border: none;"></td>
									</tr>
									<tr>
										<th scope="row">사용기간</th>
										<td><input type="text" id="selRsrvtQntt" name="allDay"
											value="3박 4일" readonly="readonly" style="border: none;"></td>
									</tr>
									<tr>
										<th scope="row">입실날짜</th>
										<td><input type="text" id="txtUseBgnDate" name="startDt"
											value="2022-12-13 [화]" readonly="readonly"
											style="border: none;"></td>
									</tr>
									<tr>
										<th scope="row">퇴실날짜</th>
										<td><input type="text" id="txtUseEndDate" name="endDt"
											value="2022-12-16 [금]" readonly="readonly"
											style="border: none;"></td>
									</tr>
									<tr>
										<th scope="row">총 인원</th>
										<td><input type="text" id="Inwon" name="people"
											value="2명" readonly="readonly" style="border: none;"></td>
									</tr>
									<tr>
										<th scope="row">결제(예정)금액</th>
										<td><input type="text" id="selPrice" name="price"
											value="120,000원 (부가세 포함)" readonly="readonly"
											style="border: none;"></td>
									</tr>
								</tbody>
							</table>
							<div class="captcha-area">
								<span class="label">자동예약 방지문자</span>
								<div align="right" class="g-recaptcha"
									data-sitekey="6LfhDXAjAAAAAFFHjdQyjtpVUaoehFWEksSN372O"></div>
							</div>
							<p class="copy-notice">※ 예약 완료된 상품에 대해서는 마이페이지 나의예약목록 에서 확인 후
								결제 가능합니다.</p>
							<div class="btn-area">
								<button class="btn" id="btnClose"
									onclick="close_Popup('automatic-character');">취소</button>
								<input type="submit" class="btn" id="btnSubmit" value="확인"
									style="background: #fff">
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
		<%@ include file="../common/footer.jsp"%>
	</div>

	<script>
	<!-- 날짜 선택 이벤트-->
	var selectStartDay;	// 입실일
	var selectEndDay;	// 퇴실일
													
	var calendarClick = document.querySelector('.calendar-container');
													
		calendarClick.addEventListener('click',e=>{
			var str = e.target.className;
			var arr = str.split(" ");
														
			var todayDate = new Date(today.getFullYear(), today.getMonth(), today.getDate());
			var currDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
														
			// arr[2] 형태 : 2022-01-02
			var selectArr = arr[2].split("-");
			var selectDate = new Date( selectArr[0], selectArr[1]-1, selectArr[2]);
			var diff = selectDate - todayDate ;
			var check = parseInt(diff/currDay);
														
			// 날짜선택 이벤트 검증
			if(arr[2] == "disable"){
				event.preventDefault();
			}else if(check <0){// 선택한 날짜가 오늘보다 적으면 안됨.
			}else if(selectStartDay == null && selectEndDay == null){// 입실일 : 선택x , 퇴실일 : 선택x
				selectStartDay = arr[2];
				$("."+selectStartDay).css("background", "#8BBDFF").css("border-radius", "5px");
				$("#startDt").html(selectStartDay);
			}else if(selectStartDay != null && selectEndDay == null){// 입실일 : 선택o , 퇴실일 : 선택x
				selectEndDay = arr[2];
				$("."+selectEndDay).css("background", "#8BBDFF").css("border-radius", "5px");
				$("#endDt").html(selectEndDay);
															
				// 체류기간(입실일 ~ 퇴실일)
				var startArr = selectStartDay.split("-");
				var startDate = new Date(startArr[0], startArr[1]-1, startArr[2]);
															
				var endArr = selectEndDay.split("-");
				var endDate = new Date(endArr[0], endArr[1]-1, endArr[2]);
															
				diff = endDate - startDate;
				check = parseInt(diff/currDay);
				//console.log("일수 차이 >> "+check);
															
				if(check == 0){
					$('#nightDays').html("0");
					$('#nightDays0').css("border-color","#004ea2").css("color","#004ea2");
					$('#nightDays1').css("border-color","#ccc").css("color","#ccc");
					$('#nightDays2').css("border-color","#ccc").css("color","#ccc");
					$('#nightDays3').css("border-color","#ccc").css("color","#ccc");
				}else if(check == 1){
					$('#nightDays').html("1");
					$('#nightDays0').css("border-color","#ccc").css("color","#ccc");
					$('#nightDays1').css("border-color","#004ea2").css("color","#004ea2");
					$('#nightDays2').css("border-color","#ccc").css("color","#ccc");
					$('#nightDays3').css("border-color","#ccc").css("color","#ccc");
				}else if(check == 2){
					$('#nightDays').html("2");
					$('#nightDays0').css("border-color","#ccc").css("color","#ccc");
					$('#nightDays1').css("border-color","#ccc").css("color","#ccc");
					$('#nightDays2').css("border-color","#004ea2").css("color","#004ea2");
					$('#nightDays3').css("border-color","#ccc").css("color","#ccc");
				}
				else if(check == 3){
					$('#nightDays').html("3");
					$('#nightDays0').css("border-color","#ccc").css("color","#ccc");
					$('#nightDays1').css("border-color","#ccc").css("color","#ccc");
					$('#nightDays2').css("border-color","#ccc").css("color","#ccc");
					$('#nightDays3').css("border-color","#004ea2").css("color","#004ea2");
				}else{
					location.reload();
				}
				}else if(selectStartDay != null && selectEndDay != null){// 입실일 : 선택o , 퇴실일 : 선택o
					location.reload();
				}
				})
				
				<!-- 객실 선택시 인원선택 -->
				// 객실별 최대 수용 인원 선택x
				$('.btn.plus').on("click",function(e){
					var max = Number($("#minbakMax").html());
					var selectNum = Number($("#livingPrsnCnt").val());
					if(selectNum<max){
						selectNum ++;
						$("#livingPrsnCnt").attr("value",selectNum);
				
					}
					else if(selectNum == max) {
						toastrMsg("선택한 객실의 사용인원은 기본 "+max+"명입니다.");
						
					}
					})
					$('.btn.minus').on("click",function(e){
						var selectNum = Number($("#livingPrsnCnt").val());
					if(selectNum>1){
						selectNum --;
						$("#livingPrsnCnt").attr("value",selectNum);
					}
					else if(selectNum == 1){
						toastrMsg("사용인원은 최소 1명입니다.");//1204추가
						
					}
				})
			</script>
</body>
</html>