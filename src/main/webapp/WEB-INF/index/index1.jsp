<%@page import="com.reservation.knpr2211.service.MountainCodeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="../assets/style/index.css">
<script src="../assets/js/lib/jquery-1.12.4.min.js"></script>
<script src="../assets/js/index.js"></script>

<body>
	<div id="wrap" class="main scroll-x">
		<div id="wrap" class="sub">
			<%@ include file="../common/header.jsp"%>
			<%
			//지금 날짜 구하기
			Calendar now = Calendar.getInstance();

			int year = now.get(Calendar.YEAR);
			int month = now.get(Calendar.MONTH) + 1;
			int day = now.get(Calendar.DATE);
			int START_DAY_OF_WEEK = 0;
			int END_DAY = 0;
			//오늘의 달 첫 날과 끝날 구하기
			Calendar sDay = Calendar.getInstance();
			Calendar eDay = Calendar.getInstance();
			sDay.set(year, month - 1, 1);
			eDay.set(year, month, 1);
			eDay.add(Calendar.DATE, -1);
			START_DAY_OF_WEEK = sDay.get(Calendar.DAY_OF_WEEK);
			// eDay에 지정된 날짜
			END_DAY = eDay.get(Calendar.DATE);
			//다음달 캘린더 구현하기
			Calendar next = Calendar.getInstance();
			next.add(Calendar.MONTH, +1);

			int year2 = next.get(Calendar.YEAR);
			int month2 = next.get(Calendar.MONTH) + 1;
			int day2 = next.get(Calendar.DATE);
			int START_DAY_OF_WEEK2 = 0;
			int END_DAY2 = 0;

			Calendar sDayNext = Calendar.getInstance();
			Calendar eDayNext = Calendar.getInstance();

			sDayNext.set(year, month, 1);

			eDayNext.set(year, month, 1);
			eDayNext.add(Calendar.DATE, -1);

			START_DAY_OF_WEEK2 = sDayNext.get(Calendar.DAY_OF_WEEK);
			// eDay에 지정된 날짜
			END_DAY2 = eDayNext.get(Calendar.DATE);
			%>
			<div id="container">
				<script>
					//이전에 클릭한 적이 있는지 체크. (데이터 중복조회 방지용)
					let isSelect = {
						tab2 : "N",
						tab3 : "N",
						tab4 : "N"
					}

					$(function() {
						init.loadEvent();
					})

					let init = {
						//클릭이벤트 load
						loadEvent : function() {
							$('.nav-tabs > li').click(
									function() {
										event.preventDefault();
										$(".nav-tabs > li").removeClass(
												'is-active');
										$(this).addClass('is-active');
										$('.tab-content > div').removeClass(
												'is-active');
										$("#" + $(this).data("tabid"))
												.addClass('is-active');

										let tabId = $(this).data("tabid");

										/**************************
										 * tab3 : 생태탐방원, tab4:민박촌
										 *생태탐방원 민박촌은 여기서 데이터 조회
										 * 나머지 간편예약은 각 include 된 페이지에서 조회
										 */
										if (tabId == 'tab1') {

										} else if (tabId == 'tab2') {

										} else if (tabId == 'tab3') {

										} else if (tabId == 'tab4') {

										}
										//한번 클릭했으면 값 Y로 변경 ( 다음 클릭 시 조회 하지 않기 위해 )
										isSelect[tabId] = 'Y';
									});
						}
					}
				</script>
				<div>
					<main>

						<!-- 슬라이더 시작 -->
						<section>
							<div class="slide-popup">
								<h3 class="title">주요공지</h3>
								<script>
									$(
											function() {
												let swiper1 = new Swiper(
														'.slide-popup .swiper',
														{
															loop : 'true',
															autoplay : {
																delay : 6000,
																disableOnInteraction : false,
															},
															pagination : {
																el : '.swiper-pagination',
																type : "fraction"
															},
															navigation : {
																nextEl : "#popupBtnNext",
																prevEl : "#popupBtnPrev",
															},
														});
												$('.swiper-btn .btn')
														.on(
																'click',
																function() {
																	if ($(this)
																			.hasClass(
																					"start")) {
																		$(this)
																				.attr(
																						"class",
																						"btn pause");
																		$(this)
																				.attr(
																						"title",
																						"일시정지");
																		swiper1.autoplay
																				.start();
																	} else {
																		$(this)
																				.attr(
																						"class",
																						"btn start");
																		$(this)
																				.attr(
																						"title",
																						"재생");
																		swiper1.autoplay
																				.stop();
																	}
																	return false;
																});
											})
								</script>
								<!-- 슬라이더 jsp -->
								<div class="swiper">
									<div class="swiper-wrapper">



										<div class="swiper-slide slide0">
											<a href="#"> <img src="bbs/popup/banner20220731.png"
												alt="국립공원 예약시스템은 크롬과 엣지에 최적화되어 있습니다.">
											</a>
										</div>

										<div class="swiper-slide slide1">
											<a href="contents/rsvtRefundPolicy.html"> <img
												src="bbs/popup/220725_popup.jpg"
												alt="예약대기 변경 안내 - 앞 예약자 결제 시 대기예약이 자동 취소됨을 안내드립니다.">
											</a>
										</div>

										<div class="swiper-slide slide2">
											<a href="#"> <img src="bbs/popup/notice3.png"
												alt="2022년 예약 시작일 안내">
											</a>
										</div>

										<div class="swiper-slide slide3">
											<a
												href="https://www.knps.or.kr/front/portal/open/pnewsDtl.do?menuNo=8000517&amp;pnewsId=PNEWSM022141&amp;searchParkId=120400&amp;pnewsGrpCd=PNE01"
												target="_blank"> <img src="bbs/popup/trailBannerPop.png"
												alt="설악산 흘림골탐방로 탐방로 예약제 운영 안내">
											</a>
										</div>

										<div class="swiper-slide slide4">
											<a href="#"> <img src="bbs/popup/naturehouseBanner.png"
												alt="자연의집 신규 운영안내">
											</a>
										</div>

										<div class="swiper-slide slide5">
											<a href="#"> <img src="bbs/popup/blanket.png"
												alt="모포대여중단">
											</a>
										</div>


									</div>
								</div>

								<!--예약 서비스 시작 -->
								<div class="swiper-btn">
									<div class="swiper-button-prev" id="popupBtnPrev"></div>
									<div class="swiper-pagination"></div>
									<div class="swiper-button-next" id="popupBtnNext"></div>
									<button class="btn pause" title="일시정지"></button>
								</div>
							</div>
							<div class="reservation-area step1" data-reservation-area="step">
								<div class="progressbar">
									<span class="progressbar-fill step1"
										data-reservation-area="step"></span> <span class="text"
										data-reservation-area="stepText">STEP.1</span>
								</div>
								<div class="content">
									<ul class="nav-tabs">
										<li data-tabid="tab1" class="is-active"><a href="#tab1">야영장</a></li>
										<li class="" data-tabid="tab2"><a href="#tab2">대피소</a></li>
										<li data-tabid="tab3"><a href="#tab3">생태탐방원</a></li>
										<li data-tabid="tab4"><a href="#tab4">민박촌</a></li>
									</ul>
									<div class="tab-content">


										<div class="tab-pane is-active" id="tab1">
											<!-- 야영장 -->

											<div class="grid-row" data-reservation-step="1">
												<div class="grid-cell">
													<h3 class="title">위치</h3>
													<ul class="check-area" id="tab1"
														data-template-id="camp-group-template">
														<li><label for="camp-radio1-0" class="radio-check">
																<input type="radio" id="camp-radio1-0" name="mountain"
																value="A01"> <span>가야산</span>
														</label></li>
														<li><label for="camp-radio1-1" class="radio-check">
																<input type="radio" id="camp-radio1-1" name="mountain"
																value="A02"> <span>계룡산</span>
														</label></li>
														<li><label for="camp-radio1-2" class="radio-check">
																<input type="radio" id="camp-radio1-2" name="mountain"
																value="A03"> <span>내장산</span>
														</label></li>
														<li><label for="camp-radio1-3" class="radio-check">
																<input type="radio" id="camp-radio1-3" name="mountain"
																value="A04"> <span>다도해해상</span>
														</label></li>
														<li><label for="camp-radio1-4" class="radio-check">
																<input type="radio" id="camp-radio1-4" name="mountain"
																value="A05"> <span>덕유산</span>
														</label></li>
														<li><label for="camp-radio1-5" class="radio-check">
																<input type="radio" id="camp-radio1-5" name="mountain"
																value="A06"> <span>무등산</span>
														</label></li>
														<li><label for="camp-radio1-6" class="radio-check">
																<input type="radio" id="camp-radio1-6" name="mountain"
																value="A07"> <span>변산반도</span>
														</label></li>
														<li><label for="camp-radio1-7" class="radio-check">
																<input type="radio" id="camp-radio1-7" name="mountain"
																value="A08"> <span>설악산</span>
														</label></li>
														<li><label for="camp-radio1-8" class="radio-check">
																<input type="radio" id="camp-radio1-8" name="mountain"
																value="A09"> <span>소백산</span>
														</label></li>
														<li><label for="camp-radio1-9" class="radio-check">
																<input type="radio" id="camp-radio1-9" name="mountain"
																value="A10"> <span>오대산</span>
														</label></li>
														<li><label for="camp-radio1-10" class="radio-check">
																<input type="radio" id="camp-radio1-10" name="mountain"
																value="A11"> <span>월악산</span>
														</label></li>
														<li><label for="camp-radio1-11" class="radio-check">
																<input type="radio" id="camp-radio1-11" name="mountain"
																value="A12"> <span>월출산</span>
														</label></li>
														<li><label for="camp-radio1-12" class="radio-check">
																<input type="radio" id="camp-radio1-12" name="mountain"
																value="A13"> <span>주왕산</span>
														</label></li>
														<li><label for="camp-radio1-13" class="radio-check">
																<input type="radio" id="camp-radio1-13" name="mountain"
																value="A14"> <span>지리산</span>
														</label></li>
														<li><label for="camp-radio1-14" class="radio-check">
																<input type="radio" id="camp-radio1-14" name="mountain"
																value="A15"> <span>치악산</span>
														</label></li>
														<li><label for="camp-radio1-15" class="radio-check">
																<input type="radio" id="camp-radio1-15" name="mountain"
																value="A16"> <span>태백산</span>
														</label></li>
														<li><label for="camp-radio1-16" class="radio-check">
																<input type="radio" id="camp-radio1-16" name="mountain"
																value="A17"> <span>태안해안</span>
														</label></li>
														<li><label for="camp-radio1-17" class="radio-check">
																<input type="radio" id="camp-radio1-17" name="mountain"
																value="A18"> <span>한려해상</span>
														</label></li>
													</ul>
													<hr style="border-color: #fff">
													<ul class="check-area" id="locationCam"></ul>
												</div>
												<div class="grid-cell"
													data-template-id="camp-calendar-template">
													<h3 class="title">날짜</h3>
													<!-- 야영장 캘린더 -->
													<div class="calendarBox">
														<table class="operationCalendar">
															<tr>
																<td colspan=7 class="calendarTitle"><%=year%>년 <%=month%>월
																</td>
															</tr>
															<tr>
																<td>MON</td>
																<td>TUE</td>
																<td>WED</td>
																<td>THE</td>
																<td>FRI</td>
																<td style="color: #004ea2;">SAT</td>
																<td style="color: red;">SUN</td>
															</tr>
															<tr class="calendarDay">
																<%
																for (int i = 1; i < START_DAY_OF_WEEK; i++) {
																%><td></td>
																<%
																}
																for (int i = 1, n = START_DAY_OF_WEEK; i <= END_DAY; i++, n++) {
																if (i < day) {
																%>
																<td><a class="calendar-day not-active"
																	href="javascript:void(0);"><%=i%></a></td>
																<%
																} else if (i == day) {
																%>
																<td class="today"><a class="calendar-day"
																	href="javascript:void(0);"><%=i%></a></td>
																<%
																} else {
																%>
																<td><a class="calendar-day"
																	onclick="calendarClick('A','<%=year%>','<%=month%>','<%=i%>')"><%=i%></a></td>
																<%
																}
																if (n % 7 == 0) {
																%>
															</tr>
															<tr>
																<%
																}
																}
																%>
															</tr>
														</table>
														<table class="operationCalendar">
															<tr>
																<td colspan=7 class="calendarTitle"><%=year2%>년 <%=month2%>월</td>
															</tr>
															<tr>
																<td>MON</td>
																<td>TUE</td>
																<td>WED</td>
																<td>THE</td>
																<td>FRI</td>
																<td style="color: #004ea2;">SAT</td>
																<td style="color: red;">SUN</td>
															</tr>
															<tr class="calendarDay">
																<%
																for (int i = 1; i < START_DAY_OF_WEEK2; i++) {
																%><td></td>
																<%
																}
																for (int i = 1, n = START_DAY_OF_WEEK2; i <= END_DAY2; i++, n++) {
																%>
																<td><a class="calendar-day"
																	onclick="calendarClick('A','<%=year2%>','<%=month2%>','<%=i%>')"><%=i%></a></td>
																<%
																if (n % 7 == 0) {
																%>
															</tr>
															<tr>
																<%
																}
																}
																%>
															</tr>
														</table>
													</div>

													<div class="reservation-info"
														data-area-name="camp-reservation-info">
														<p class="period" data-area-name="camp-period-default"
															id="minback_cam">
															<em>날짜</em>를 선택해주세요.
														</p>
														<dl>
															<dt>입실날짜</dt>
															<dd id="startDt_cam">-</dd>
														</dl>
														<dl>
															<dt>퇴실날짜</dt>
															<dd id="endDt_cam">-</dd>
														</dl>
													</div>
												</div>
												<div class="grid-cell">
													<h3 class="title">예약정보</h3>
													<ul class="check-area cam_view cell3_view" id="caminfo"></ul>
													<hr class="cell3_view cam_view cell3_view"
														style="border-color: #333; display: none;">
													<h3 class="title cell3_view cam_view"
														style="display: none;">인원</h3>
													<div class="camSelectPeople cell3_view cam_view"
														style="display: none;">
														<span class="quantity-input">
															<button type="button"
																class="btn minus livingRoom-prsn-minus">
																<i class="icon-minus"></i>
															</button> <label for="livingPrsnCnt" class="hidden-text">총참여인원</label>
															<input type="number" value="1" readonly=""
															title="총 참여 인원" name="livingPrsnCnt" id="camPeopleCnt">
															<button type="button"
																class="btn plus livingRoom-prsn-plus">
																<i class="icon-plus"></i>
															</button>
														</span>
													</div>
													<hr class="cam_view cell3_view"
														style="border-color: #333; display: none;">
													<div class="camTotal cell3_view cam_view"
														style="display: none;">
														<h3 class="cam_Total camSelectPlace">
															선택: <span>-</span>
														</h3>

														<h3 class="cam_Total camPrice">
															결제금액: <span>0</span>원
														</h3>
													</div>
													<script>
													<!-- 객실 선택시 인원선택 -->
														// 객실별 최대 수용 인원 선택x
														$(
																'.camSelectPeople .btn.plus')
																.on(
																		"click",
																		function(
																				e) {
																			if ($(
																					"input:radio[name='uhang']")
																					.is(
																							':checked') == false) {
																				toastrMsg("민박촌 객실유형을 선택해주세요.")
																			}
																			var max = Number($(
																					"#minbakMax")
																					.html());
																			var selectNum = Number($(
																					"#camPeopleCnt")
																					.val());
																			if (selectNum == max) {
																				toastrMsg("선택한 객실의 사용인원은 기본 "
																						+ max
																						+ "명입니다.");
																			} else if (selectNum < max) {
																				selectNum++;
																				$(
																						"#camPeopleCnt")
																						.attr(
																								"value",
																								selectNum);
																			}
																		})
														$(
																'.camSelectPeople .btn.minus')
																.on(
																		"click",
																		function(
																				e) {
																			if ($(
																					"input:radio[name='uhang']")
																					.is(
																							':checked') == false) {
																				toastrMsg("민박촌 객실유형을 선택해주세요.")
																			}
																			var selectNum = Number($(
																					"#camPeopleCnt")
																					.val());
																			if (selectNum > 1) {
																				selectNum--;
																				$(
																						"#camPeopleCnt")
																						.attr(
																								"value",
																								selectNum);
																			}
																		})
													</script>
													<hr class="cell3_view cam_view"
														style="border-color: #333; display: none;">
													<div class="btn-area">
														<button class="btn btn-refresh" data-button-name="refresh">새로고침</button>
														<button class="btn btn-enquiry" data-button-name="goStep2"
															onclick="Res_openPopup('A', 'ResPopup')">다음단계</button>
													</div>
												</div>
											</div>


										</div>


										<div class="tab-pane" id="tab2">

											<!-- 대피소 -->

											<div class="grid-row" data-reservation-step="1">
												<div class="grid-cell">
													<h3 class="title">위치</h3>
													<ul class="check-area" id="tab2">


														<li><label for="shelterMountainRadio1"
															class="radio-check"> <input type="radio"
																id="shelterMountainRadio1" name="mountain" value="B04">
																<span>지리산</span>
														</label></li>
														<li><label for="shelterMountainRadio2"
															class="radio-check"> <input type="radio"
																id="shelterMountainRadio2" name="mountain" value="B02">
																<span>설악산</span>
														</label></li>
														<li><label for="shelterMountainRadio3"
															class="radio-check"> <input type="radio"
																id="shelterMountainRadio3" name="mountain" value="B01">
																<span>덕유산</span>
														</label></li>
														<li><label for="shelterMountainRadio4"
															class="radio-check"> <input type="radio"
																id="shelterMountainRadio4" name="mountain" value="B03">
																<span>소백산</span>
														</label></li>
													</ul>
													<hr style="border-color: #fff">
													<ul class="radio-area row" id="locationShel"></ul>
												</div>
												<div class="grid-cell"
													data-template-id="shelter-calendar-template">
													<h3 class="title">날짜</h3>
													<!-- 대피소 캘린더 -->
													<div class="calendarBox">
														<table class="operationCalendar">
															<tr>
																<td colspan=7 class="calendarTitle"><%=year%>년 <%=month%>월
																</td>
															</tr>
															<tr>
																<td>MON</td>
																<td>TUE</td>
																<td>WED</td>
																<td>THE</td>
																<td>FRI</td>
																<td style="color: #004ea2;">SAT</td>
																<td style="color: red;">SUN</td>
															</tr>
															<tr class="calendarDay">
																<%
																for (int i = 1; i < START_DAY_OF_WEEK; i++) {
																%><td></td>
																<%
																}
																for (int i = 1, n = START_DAY_OF_WEEK; i <= END_DAY; i++, n++) {
																if (i < day) {
																%>
																<td><a class="calendar-day not-active"
																	href="javascript:void(0);"><%=i%></a></td>
																<%
																} else if (i == day) {
																%>
																<td class="today"><a class="calendar-day"
																	href="javascript:void(0);"><%=i%></a></td>
																<%
																} else {
																%>
																<td><a class="calendar-day"
																	onclick="calendarClick('B','<%=year%>','<%=month%>','<%=i%>')"><%=i%></a></td>
																<%
																}
																if (n % 7 == 0) {
																%>
															</tr>
															<tr>
																<%
																}
																}
																%>
															</tr>
														</table>
														<table class="operationCalendar">
															<tr>
																<td colspan=7 class="calendarTitle"><%=year2%>년 <%=month2%>월</td>
															</tr>
															<tr>
																<td>MON</td>
																<td>TUE</td>
																<td>WED</td>
																<td>THE</td>
																<td>FRI</td>
																<td style="color: #004ea2;">SAT</td>
																<td style="color: red;">SUN</td>
															</tr>
															<tr class="calendarDay">
																<%
																for (int i = 1; i < START_DAY_OF_WEEK2; i++) {
																%><td></td>
																<%
																}
																for (int i = 1, n = START_DAY_OF_WEEK2; i <= END_DAY2; i++, n++) {
																%>
																<td><a class="calendar-day"
																	onclick="calendarClick('B','<%=year2%>','<%=month2%>','<%=i%>')"><%=i%></a></td>
																<%
																if (n % 7 == 0) {
																%>
															</tr>
															<tr>
																<%
																}
																}
																%>
															</tr>
														</table>
													</div>
													<div class="reservation-info">
														<dl>
															<dt>선택위치</dt>
															<dd data-area-name="selected-dept-nm" id="location_shel">-</dd>
														</dl>
														<dl>
															<dt>선택날짜</dt>
															<dd id="startDt_shel">
																-
															</dd>
														</dl>
													</div>
												</div>
												<div class="grid-cell">
													<h3 class="title">예약정보</h3>

													<div class="reservation-check scroll-y cell3_view shel_view" style="display: none;">
														<div class="item  cell3_view shel_view" id="shelSelect">
															<strong class="title" data-selected-item="before">선택시설</strong>
															<dl data-added-item="wrap">
																<dt>
																	<em></em><span></span>
																</dt>
															</dl>
														</div>
														<div class="item">
															<strong class="title">인원</strong>
														</div>
													</div>

													<div class="btn-area">
														<button class="btn btn-refresh" data-button-name="refresh">새로고침</button>
														<button class="btn btn-enquiry" data-button-name="goStep2">다음단계</button>
													</div>
												</div>
											</div>


										</div>

										<!--  생태 탐방원  -->
										<div class="tab-pane" id="tab3">

											<div class="grid-row" data-reservation-step="1">
												<div class="grid-cell">
													<h3 class="title">위치</h3>
													<form action="MountainSelect" method="post" id="m3">
														<ul class="check-area" id="tab3">

															<li><label for="deptId0" class="radio-check">
																	<input type="radio" id="deptId0" name="mountain"
																	value="C08"><span>북한산</span>
															</label></li>

															<li><label for="deptId1" class="radio-check">
																	<input type="radio" id="deptId1" name="mountain"
																	value="C06"><span>지리산</span>
															</label></li>

															<li><label for="deptId2" class="radio-check">
																	<input type="radio" id="deptId2" name="mountain"
																	value="C05"><span>소백산</span>
															</label></li>

															<li><label for="deptId3" class="radio-check">
																	<input type="radio" id="deptId3" name="mountain"
																	value="C04"><span>설악산</span>
															</label></li>

															<li><label for="deptId4" class="radio-check">
																	<input type="radio" id="deptId4" name="mountain"
																	value="C07"><span>한려해상</span>
															</label></li>

															<li><label for="deptId5" class="radio-check">
																	<input type="radio" id="deptId5" name="mountain"
																	value="C03"><span>무등산</span>
															</label></li>

															<li><label for="deptId6" class="radio-check">
																	<input type="radio" id="deptId6" name="mountain"
																	value="C01"><span>가야산</span>
															</label></li>

															<li><label for="deptId7" class="radio-check">
																	<input type="radio" id="deptId7" name="mountain"
																	value="C02"><span>내장산</span>
															</label></li>

														</ul>

													</form>
													<hr style="border-color: #fff">
													<ul class="radio-area row" id="locationEco">
													</ul>
												</div>
												<div class="grid-cell"
													data-template-id="shelter-calendar-template">
													<h3 class="title">날짜</h3>
													<!-- 생태탐방원 캘린더 -->
													<div class="calendarBox">
														<table class="operationCalendar">
															<tr>
																<td colspan=7 class="calendarTitle"><%=year%>년 <%=month%>월
																</td>
															</tr>
															<tr>
																<td>MON</td>
																<td>TUE</td>
																<td>WED</td>
																<td>THE</td>
																<td>FRI</td>
																<td style="color: #004ea2;">SAT</td>
																<td style="color: red;">SUN</td>
															</tr>
															<tr class="calendarDay">
																<%
																for (int i = 1; i < START_DAY_OF_WEEK; i++) {
																%><td></td>
																<%
																}
																for (int i = 1, n = START_DAY_OF_WEEK; i <= END_DAY; i++, n++) {
																if (i < day) {
																%>
																<td><a class="calendar-day not-active"
																	href="javascript:void(0);"><%=i%></a></td>
																<%
																} else if (i == day) {
																%>
																<td class="today"><a class="calendar-day"
																	href="javascript:void(0);"><%=i%></a></td>
																<%
																} else {
																%>
																<td><a class="calendar-day"
																	onclick="calendarClick('C','<%=year%>','<%=month%>','<%=i%>')"><%=i%></a></td>
																<%
																}
																if (n % 7 == 0) {
																%>
															</tr>
															<tr>
																<%
																}
																}
																%>
															</tr>
														</table>
														<table class="operationCalendar">
															<tr>
																<td colspan=7 class="calendarTitle"><%=year2%>년 <%=month2%>월</td>
															</tr>
															<tr>
																<td>MON</td>
																<td>TUE</td>
																<td>WED</td>
																<td>THE</td>
																<td>FRI</td>
																<td style="color: #004ea2;">SAT</td>
																<td style="color: red;">SUN</td>
															</tr>
															<tr class="calendarDay">
																<%
																for (int i = 1; i < START_DAY_OF_WEEK2; i++) {
																%><td></td>
																<%
																}
																for (int i = 1, n = START_DAY_OF_WEEK2; i <= END_DAY2; i++, n++) {
																%>
																<td><a class="calendar-day"
																	onclick="calendarClick('C','<%=year2%>','<%=month2%>','<%=i%>')"><%=i%></a></td>
																<%
																if (n % 7 == 0) {
																%>
															</tr>
															<tr>
																<%
																}
																}
																%>
															</tr>
														</table>
													</div>
													<div class="reservation-info"
														data-area-name="eco-reservation-info">
														<p class="period" data-area-name="eco-period-default"
															id="minback_eco">
															<em>날짜</em>를 선택해주세요.
														</p>
														<dl>
															<dt>입실날짜</dt>
															<dd id="startDt_eco">
																<!-- 2022-02-23 [수] -->
																-
															</dd>
														</dl>
														<dl>
															<dt>퇴실날짜</dt>
															<dd id="endDt_eco">
																<!-- 2022-02-25 [금] -->
																-
															</dd>
														</dl>
													</div>
												</div>
												<div class="grid-cell">
													<h3 class="title">예약정보</h3>

													<div class="btn-area">
														<button class="btn btn-refresh" data-button-name="refresh">새로고침</button>
														<button class="btn btn-enquiry" data-button-name="goStep2">다음단계</button>
													</div>
												</div>
											</div>
										</div>

										<!-- 민박촌  -->
										<div class="tab-pane" id="tab4">


											<div class="grid-row" data-reservation-step="1">
												<div class="grid-cell">
													<h3 class="title">위치</h3>

													<form action="MointainSelect" method="post" id="m4">
														<ul class="check-area" id="tab4">
															<li><label for="rsdnMountainRdio"
																class="radio-check"> <input type="radio"
																	id="rsdnMountainRdio" name="mountain" value="D01">
																	<span>태백산</span>
															</label></li>
														</ul>

													</form>
													<hr style="border-color: #fff">
													<ul class="radio-area row" id="locationCot">
													</ul>
												</div>
												<div class="grid-cell"
													data-template-id="shelter-calendar-template">
													<h3 class="title">날짜</h3>
													<!-- 민박촌 캘린더 -->
													<div class="calendarBox">
														<table class="operationCalendar">
															<tr>
																<td colspan=7 class="calendarTitle"><%=year%>년 <%=month%>월
																</td>
															</tr>
															<tr>
																<td>MON</td>
																<td>TUE</td>
																<td>WED</td>
																<td>THE</td>
																<td>FRI</td>
																<td style="color: #004ea2;">SAT</td>
																<td style="color: red;">SUN</td>
															</tr>
															<tr class="calendarDay">
																<%
																for (int i = 1; i < START_DAY_OF_WEEK; i++) {
																%><td></td>
																<%
																}
																for (int i = 1, n = START_DAY_OF_WEEK; i <= END_DAY; i++, n++) {
																if (i < day) {
																%>
																<td><a class="calendar-day not-active"
																	href="javascript:void(0);"><%=i%></a></td>
																<%
																} else if (i == day) {
																%>
																<td class="today"><a class="calendar-day"
																	href="javascript:void(0);"><%=i%></a></td>
																<%
																} else {
																%>
																<td><a class="calendar-day"
																	onclick="calendarClick('D','<%=year%>','<%=month%>','<%=i%>')"><%=i%></a></td>
																<%
																}
																if (n % 7 == 0) {
																%>
															</tr>
															<tr>
																<%
																}
																}
																%>
															</tr>
														</table>
														<table class="operationCalendar">
															<tr>
																<td colspan=7 class="calendarTitle"><%=year2%>년 <%=month2%>월</td>
															</tr>
															<tr>
																<td>MON</td>
																<td>TUE</td>
																<td>WED</td>
																<td>THE</td>
																<td>FRI</td>
																<td style="color: #004ea2;">SAT</td>
																<td style="color: red;">SUN</td>
															</tr>
															<tr class="calendarDay">
																<%
																for (int i = 1; i < START_DAY_OF_WEEK2; i++) {
																%><td></td>
																<%
																}
																for (int i = 1, n = START_DAY_OF_WEEK2; i <= END_DAY2; i++, n++) {
																%>
																<td><a class="calendar-day"
																	onclick="calendarClick('D','<%=year2%>','<%=month2%>','<%=i%>')"><%=i%></a></td>
																<%
																if (n % 7 == 0) {
																%>
															</tr>
															<tr>
																<%
																}
																}
																%>
															</tr>
														</table>
													</div>
													<div class="reservation-info"
														data-area-name="cot-reservation-info">
														<p class="period" data-area-name="cot-period-default"
															id="minback_cot">
															<em>날짜</em>를 선택해주세요.
														</p>
														<dl>
															<dt>입실날짜</dt>
															<dd id="startDt_cot">
																<!-- 2022-02-23 [수] -->
																-
															</dd>
														</dl>
														<dl>
															<dt>퇴실날짜</dt>
															<dd id="endDt_cot">
																<!-- 2022-02-25 [금] -->
																-
															</dd>
														</dl>
													</div>
												</div>
												<div class="grid-cell">
													<h3 class="title">예약정보</h3>

													<div class="btn-area">
														<button class="btn btn-refresh" data-button-name="refresh">새로고침</button>
														<button class="btn btn-enquiry" data-button-name="goStep2">다음단계</button>
													</div>
												</div>
											</div>


										</div>
									</div>
						</section>
						<section>
							<h3 class="hidden-text">빠른 메뉴 이동</h3>


							<div class="quick-menu">
								<a
									href="https://www.knps.or.kr/portal/angelroad/course/course10.do"
									class="btn" target="_blank"><span>탐방 안내도</span></a> <a
									href="https://www.knps.or.kr/portal/main/contents.do?menuNo=8000198"
									class="btn" target="_blank"><span>입산시간 지정제</span></a> <a
									href="https://www.knps.or.kr/front/portal/safe/acsCtrList.do?menuNo=8000340"
									class="btn" target="_blank"><span>탐방통제 정보</span></a> <a
									href="https://www.knps.or.kr/portal/main/contents.do?menuNo=7020071&amp;tabNm=2"
									class="btn" target="_blank"><span>국립공원 날씨</span></a>
							</div>
						</section>
						<section>
							<div class="slide-notice">
								<h3 class="title">공지사항</h3>



								<script>
									$(
											function() {
												// 공지사항 slide
												let swiper2 = new Swiper(
														".slide-notice .swiper",
														{
															loop : 'true',
															autoplay : {
																delay : 3000,
																disableOnInteraction : false,
															},
															direction : "vertical",
															navigation : {
																nextEl : "#noticeBtnNext",
																prevEl : "#noticeBtnPrev",
															},
														});
											})
								</script>
								<div class="swiper">
									<div class="swiper-wrapper">

										<div class="swiper-slide slide0">
											<a
												href="community/board/notice/boardDetail4f70.html?seq=27890">
												<div class="content">
													<span class="title"> 변산반도 [변산반도] 12월 야영장 정비의 날 운영 안내
													</span> <span class="date">2022-11-10</span>
												</div>
											</a>
										</div>

										<div class="swiper-slide slide1">
											<a
												href="community/board/notice/boardDetaild6a8.html?seq=27889">
												<div class="content">
													<span class="title"> 태안해안 [태안해안] 학암포자동차야영장 체류형카라반
														설치공사 관련 재공지 </span> <span class="date">2022-11-03</span>
												</div>
											</a>
										</div>

										<div class="swiper-slide slide2">
											<a
												href="community/board/notice/boardDetail3c55.html?seq=27888">
												<div class="content">
													<span class="title"> 본부 국립공원예약시스템 성능테스트 안내 </span> <span
														class="date">2022-11-02</span>
												</div>
											</a>
										</div>

										<div class="swiper-slide slide3">
											<a
												href="community/board/notice/boardDetailcb27.html?seq=27887">
												<div class="content">
													<span class="title"> 태안해안 [태안해안] 학암포자동차야영장 수도배관 누수에
														따른 H,I 사이트 이용 제한 알림 </span> <span class="date">2022-11-02</span>
												</div>
											</a>
										</div>

										<div class="swiper-slide slide4">
											<a
												href="community/board/notice/boardDetail43e4.html?seq=27886">
												<div class="content">
													<span class="title"> 치악산 [치악산] 야영장 정비의 날(11.9. 수) 운영
														및 이용 제한 알림 </span> <span class="date">2022-11-01</span>
												</div>
											</a>
										</div>

										<div class="swiper-slide slide5">
											<a
												href="community/board/notice/boardDetail4ea7.html?seq=27885">
												<div class="content">
													<span class="title"> 무등산동부 도원야영장, 11월 정비의 날 운영
														알림(일자: 11.9, 이용불가) </span> <span class="date">2022-11-01</span>
												</div>
											</a>
										</div>

										<div class="swiper-slide slide6">
											<a
												href="community/board/notice/boardDetail2e73.html?seq=27884">
												<div class="content">
													<span class="title"> 한려해상동부 [한려해상동부] 학동자동차야영장 체류형카라반
														신규설치공사(A6~A10)에 따른 이용제한기간 연장 안내 </span> <span class="date">2022-10-31</span>
												</div>
											</a>
										</div>

										<div class="swiper-slide slide7">
											<a
												href="community/board/notice/boardDetailca7f.html?seq=27883">
												<div class="content">
													<span class="title"> 설악산 흘림골 탐방로 예약제 구간 동절기 운영시간 변경
														안내 </span> <span class="date">2022-10-30</span>
												</div>
											</a>
										</div>

										<div class="swiper-slide slide8">
											<a
												href="community/board/notice/boardDetail284a.html?seq=27882">
												<div class="content">
													<span class="title"> 설악산 설악산 대피소 이용 주요 안내(주의사항,
														희운각&amp;소청대피소 내부 정비) </span> <span class="date">2022-10-30</span>
												</div>
											</a>
										</div>

										<div class="swiper-slide slide9">
											<a
												href="community/board/notice/boardDetail7e74.html?seq=27881">
												<div class="content">
													<span class="title"> 본부 겨울철 국립공원 야영장 운영 현황 안내 </span> <span
														class="date">2022-10-28</span>
												</div>
											</a>
										</div>

									</div>
								</div>
								<div class="swiper-btn">
									<div class="swiper-button-prev" id="noticeBtnPrev">
										<i class="icon-chevron-up"></i>
									</div>
									<div class="swiper-button-next" id="noticeBtnNext">
										<i class="icon-chevron-down"></i>
									</div>
								</div>
							</div>
						</section>
					</main>
				</div>


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

				<!-- layer popup content -->

				<div class="modal-popup small" id="ResPopup" style="display: none;">
					<div class="popup-wrap" style="top: 65px; bottom: 150px;">
						<div class="popup-head">
							<strong class="popup-title">예약가능</strong>
							<button type="button" class="btn-close"
								onclick="Res_closePopup('ResPopup')" title="닫기">
								<i class="icon-close"></i>
							</button>
						</div>
						<div class="popup-container">
							<form action="mainResProc_cam" method="post">
								<table class="table">
									<caption>자동방지 입력문자</caption>
									<colgroup>
										<col style="width: 140px;">
										<col>
									</colgroup>
									<tbody class="tbody">
										<tr style="display: none;">
											<th scope="row">예약코드</th>
											<td><input type="text" id="txtRoomCode" name="category3"
												value="D0101" readonly="readonly" style="border: none;"></td>
										</tr>
										<tr>
											<th scope="row">예약상품</th>
											<td><input type="text" id="txtRoom" name="nameCategory3"
												value="개인형 29.7㎡(9평/2명) 침대" readonly="readonly"
												style="border: none;"></td>
										</tr>
										<tr>
											<th scope="row">사용기간</th>
											<td><input type="text" id="txtDiff" name="allDay"
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
											<td><input type="text" id="txtInwon" name="people"
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
									<span class="label">자동예약 방지문자</span> <span class="captcha"
										id="pnlRsrImg"><img alt="자동예약 방지문자"
										src="/reserCaptcha.do?dummy=1669370017036"></span> <label
										for="captInput" class="hidden-text">자동예약 방지문자</label><input
										type="text" class="input-text txt-captcha" id="captInput"
										title="자동예약 방지문자" maxlength="4" placeholder="위 문자를 입력해주세요."
										name="captcha">
								</div>
								<p class="copy-notice">※ 예약 완료된 상품에 대해서는 마이페이지 나의예약목록 에서 확인
									후 결제 가능합니다.</p>
								<div class="btn-area">
									<button class="btn" id="btnClose"
										onclick="close_Popup('ResPopup');">취소</button>
									<input type="submit" class="btn" id="btnSubmit" value="확인"
										style="background: #fff">
								</div>
							</form>
						</div>
					</div>
				</div>



			</div>


		</div>

		<%@ include file="../common/footer.jsp"%>
		<script type="text/javascript">
			$('input:radio[name="mountain"]').on("change", function() {
				mountain_ajax();
			});
		</script>

		<div class="modal-popup small" id="confirmPop">
			<div class="popup-wrap">
				<div class="popup-head">
					<strong class="popup-title" id="confirmTitle"></strong>
					<button type="button" class="btn-close" title="닫기"
						onclick="closePopup('ResPopup');">
						<i class="icon-close"></i>
					</button>
				</div>
				<div class="popup-container">
					<div class="center">
						<i class="icon-error"></i> <strong class="title-1"
							id="confirmSubTitle"></strong>
						<p class="copy-mid" id="confirmContent"></p>
						<p class="copy-sm" id="confirmSubContent"></p>
					</div>
					<div class="btn-area">
						<button class="btn btn-cancel forMypageClass"
							onclick="closePopup('confirmPop');">취소</button>
						<button class="btn btn-confirm is-active" id="btn-confirm">확인</button>
					</div>
				</div>
			</div>
		</div>


		<div class="modal-popup small" id="alertPop">
			<div class="popup-wrap">
				<div class="popup-head">
					<strong class="popup-title" id="alertTitle">로그인</strong>
					<button type="button" class="btn-close" title="닫기"
						onclick="closePopup('alertPop');">
						<i class="icon-close"></i>
					</button>
				</div>
				<div class="popup-container">
					<div class="center">
						<i class="icon-error"></i> <strong class="title-1"
							id="alertSubTitle"></strong>
						<p class="copy-mid" id="alertContent"></p>
						<p class="copy-sm" id="alertSubContent"></p>
					</div>
					<div class="btn-area">
						<button class="btn btn-confirm is-active"
							onclick="closePopup('alertPop');">확인</button>
					</div>
				</div>
			</div>
		</div>

		<div class="modal-popup small" id="loginPopup">
			<div class="popup-wrap">
				<div class="popup-head">
					<strong class="popup-title" id="loginTitle">로그인</strong>
					<button type="button" class="btn-close" title="닫기"
						onclick="closePopup('loginPopup');">
						<i class="icon-close"></i>
					</button>
				</div>
				<div class="popup-container" id="loginPopupDiv"></div>
			</div>
		</div>
		<!-- 아이핀 가상주민번호 서비스 팝업 호출 form -->
		<form name="form_ipin" id="form_ipin" method="post">
			<!-- 요청모드 (필수 데이터) -->
			<input type="hidden" name="m" value="pubmain">
			<!-- 인증요청 암호화 데이터 -->
			<input type="hidden" name="enc_data" id="enc_data" value="">
		</form>
		<!-- 본인인증 서비스 팝업을 호출하기 위해서는 다음과 같은 form이 필요합니다. -->
		<form name="form_chk" id="form_chk" method="post">
			<!-- 필수 데이타로, 누락하시면 안됩니다. -->
			<input type="hidden" name="m" value="checkplusService">
			<!-- 인증요청 암호화 데이터 -->
			<input type="hidden" name="EncodeData" id="EncodeData" value="">
		</form>
	</div>
	<img id="loadingImage" src="../../assets/img/preloader.gif" alt="로딩이미지"
		style="position: absolute; left: 924.5px; top: 539.5px; z-index: 100000; display: none;">
	<script>
		$(function() {
			let responseMessage = "";
			if (responseMessage != "") {
				toastrMsg(responseMessage);
			}
			let retChk = "";
			if (retChk == "Y") {
				alert(responseMessage);
				history.back();
			}
		})
	</script>
</body>
</html>
