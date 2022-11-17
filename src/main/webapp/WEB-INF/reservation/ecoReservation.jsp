<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="../assets/style/commonb07b.css?ver1">
<link rel="stylesheet"
	href="../assets/style/reservation/ecoReservation.css">

<script src="../assets/js/lib/jquery-1.12.4.min.js"></script>
<script src="../assets/js/reservation/ecoReservation.js"></script>
<!-- 
사용x 
<script src="../assets/js/lib/datepicker.min.js"></script>

<script src="../assets/js/lib/swiper.js"></script>
<script src="../assets/js/lib/jquery.fs.zoomer.min.js"></script>
<script src="../assets/js/lib/jquery.rwdImageMaps.min.js"></script>
<script src="../assets/js/lib/toastr.min.js"></script>
<script src="../assets/js/scripts.js"></script>
<script src="../assets/js/common9b00.js?ver4"></script>
-->
<body>
	<div id="wrap" class="sub">
		<%@ include file="../common/header.jsp"%>
		<div id="container">
			<div class="page-location">
				<span>홈</span><span>예약하기</span><span>생태탐방원</span>
			</div>
			<div class="reservation responsive eco">
				<h3 class="title">생태탐방원 예약</h3>
				<div class="tab-content">
					<div class="tab-pane is-active">
						<ul class="nav-tabs type2">
							<li class="is-active"><a href="ecoReservation?category=C08">북한산</a></li>
							<li class=""><a href="ecoReservation?category=C06">지리산</a></li>
							<li class=""><a href="ecoReservation?category=C05">소백산</a></li>
							<li class=""><a href="ecoReservation?category=C04">설악산</a></li>
							<li class=""><a href="ecoReservation?category=C07">한려해상</a></li>
							<li class=""><a href="ecoReservation?category=C03">무등산</a></li>
							<li class=""><a href="ecoReservation?category=C01">가야산</a></li>
							<li class=""><a href="ecoReservation?category=C02">내장산</a></li>
						</ul>
						<form id="reservationForm" method="post">
							<input type="hidden" name="useBgnDt" id="useBgnDt" value="">
							<input type="hidden" name="useEndDt" id="useEndDt" value="">
							<input type="hidden" name="deptId" value="B971002"> <input
								type="hidden" name="captcha" id="captcha" value="">
							<div class="tab-content">
								<div class="tab-pane is-active">
									<div class="title-area">
										<span class="label"><i class="icon-location"></i>북한산</span>
										<h4 class="title" id="deptTitle">북한산 생태탐방원</h4>
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
												<!-- 날짜 선택 이벤트-->
												<script>
													var selectStartDay;	// 입실일
													var selectEndDay;	// 퇴실일
													//console.log("ready selectStartDay : "+selectStartDay);
													//console.log("ready selectEndDay : "+selectEndDay);
													
													var calendarClick = document.querySelector('.calendar-container');
													
													calendarClick.addEventListener('click',e=>{
														var str = e.target.className;
														var arr = str.split(" ");
														//console.log("선택한 날짜 class : "+arr);
														//console.log("선택한 날짜 세번째 class : "+arr[2]); 
														
														var todayDate = new Date(today.getFullYear(), today.getMonth(), today.getDate());
														var currDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
														
														// arr[2] 형태 : 2022-01-02
														var selectArr = arr[2].split("-");
														var selectDate = new Date( selectArr[0], selectArr[1]-1, selectArr[2]);
														
														var diff = selectDate - todayDate ;
														var check = parseInt(diff/currDay);
														
														// 날짜선택 이벤트 검증
														if(check <0){// 선택한 날짜가 오늘보다 적으면 안됨.
														}
														else if(selectStartDay == null && selectEndDay == null){// 입실일 : 선택x , 퇴실일 : 선택x
															
															selectStartDay = arr[2];
															$("."+selectStartDay).css("background", "#8BBDFF").css("border-radius", "5px");
															$("#startDt").html(selectStartDay);
															
														}
														else if(selectStartDay != null && selectEndDay == null){// 입실일 : 선택o , 퇴실일 : 선택x
															
															selectEndDay = arr[2];
															$("."+selectEndDay).css("background", "#8BBDFF").css("border-radius", "5px");
															$("#endDt").html(selectEndDay);
															
															// 체류기간(입실일 ~ 퇴실일)
															var startArr = selectStartDay.split("-");
															var startDate = new Date(startArr[0], startArr[1], startArr[2]);
															
															var endArr = selectEndDay.split("-");
															var endDate = new Date(endArr[0], endArr[1], endArr[2]);
															
															diff = endDate - startDate;
															check = parseInt(diff/currDay);
															//console.log("일수 차이 >> "+check);
															
															if(check == 0){
																$('#nightDays0').css("border-color","#004ea2").css("color","#004ea2");
																$('#nightDays1').css("border-color","#ccc").css("color","#ccc");
																$('#nightDays2').css("border-color","#ccc").css("color","#ccc");
																$('#nightDays3').css("border-color","#ccc").css("color","#ccc");
															}else if(check == 1){
																$('#nightDays0').css("border-color","#ccc").css("color","#ccc");
																$('#nightDays1').css("border-color","#004ea2").css("color","#004ea2");
																$('#nightDays2').css("border-color","#ccc").css("color","#ccc");
																$('#nightDays3').css("border-color","#ccc").css("color","#ccc");
															}else if(check == 2){
																$('#nightDays0').css("border-color","#ccc").css("color","#ccc");
																$('#nightDays1').css("border-color","#ccc").css("color","#ccc");
																$('#nightDays2').css("border-color","#004ea2").css("color","#004ea2");
																$('#nightDays3').css("border-color","#ccc").css("color","#ccc");
															}
															else if(check == 3){
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
													
													
												</script>
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
														class="length-stay" id="nightDays3">3박 4일</span>
												</div>
											</dd>
										</dl>
										<dl>
											<dt>객실 구분</dt>
											<dd class="form">
												<button type="button" class="btn btn-view"
													onclick="funcArray.drawImage('06001');">객실 보기</button>
												<button type="button" class="btn btn-charge"
													onclick="openPopup('livingAmtPop');">요금표</button>
												<!-- 객식 구분 체크박스 넣기 -->
												<span class="check-area"> <span class="radio-1">
														<input type="radio" id="txblPblcN" name="txblPblcYn"
														checked="checked" value="N"> <label
														for="txblPblcN">개인</label>
												</span> <span class="radio-1"> <input type="radio"
														id="txblPblcY" name="txblPblcYn" value="Y"> <label
														for="txblPblcY">단체</label>
												</span>
											</dd>
										</dl>
									</div>

									<!-- 총 선택 이용금액 -->
									<div class="title-area">
										<h4 class="title">총 결제 예정 금액</h4>
									</div>
									<div class="payment">
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
												<em>면세 합계*</em>
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
									<div class="board-bottom">
										<div class="center">
											<a href="" class="btn btn-register is-active" onclick="">예약하기</a>
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
				<div class="popup-wrap">
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


			<div class="modal-popup large" id="livingAmtPop">
				<div class="popup-wrap">
					<div class="popup-head">
						<strong class="popup-title">생활관 요금표 보기</strong>
						<button type="button" class="btn-close" title="닫기"
							onclick="closePopup('livingAmtPop');">
							<i class="icon-close"></i>
						</button>
					</div>
					<div class="popup-container">
						<table class="table">
							<caption>생활관 요금표 보기</caption>
							<colgroup>
								<col style="width: 33%">
								<col>
							</colgroup>
							<thead class="thead">
								<tr>
									<th scope="col">생활관</th>
									<th scope="col">이용료<br />(1박기준 / 부가가치세 별도)
									</th>
								</tr>
							</thead>
							<tbody class="tbody">
								<tr>
									<th class="ta-c" scope="row">A타입</th>
									<td class="ta-c">60,000원</td>
								</tr>
								<tr>
									<th class="ta-c" scope="row">B타입</th>
									<td class="ta-c">90,000원</td>
								</tr>
								<tr>
									<th class="ta-c" scope="row">C타입</th>
									<td class="ta-c">120,000원</td>
								</tr>
							</tbody>
						</table>
						<div class="btn-area">
							<button type="button" class="btn btn-confirm is-active"
								onclick="closePopup('livingAmtPop');">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>