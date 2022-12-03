<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="../assets/style/commonb07b.css?ver1">
<!-- 
<script src="../assets/js/lib/jquery-1.12.4.min.js"></script>
<script src="../assets/js/lib/swiper.js"></script>
<script src="../assets/js/lib/datepicker.min.js"></script>
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
				<span>홈</span> <span>예약하기</span> <span>야영장</span>
			</div>
			<div class="reservation" data-device-mode="pc">
				<h3 class="title">야영장 예약</h3>
				<input type="hidden" id="reserFlag" name="reserFlag" value="N" />

				<div class="collapse-wrap" data-reservation-wrap="campsite">



					<ul class="menu-tabs">

						<li><a href="javascript:void(0);" class="btn collapse">가야산</a>
							<div class="a">
								<ul class="nav-tabs tab-menu">


									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('가야산','삼정','B131001', ''); return false;">삼정
									</a></li>



									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('가야산','치인','B131003', ''); return false;">치인
									</a></li>



									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('가야산','백운동','B131002', ''); return false;">백운동
									</a></li>


								</ul>
							</div></li>


						<li><a href="javascript:void(0);" class="btn collapse">계룡산</a>
							<div class="a">
								<ul class="nav-tabs tab-menu">








									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('계룡산','동학사','B161001', ''); return false;">동학사
									</a></li>














								</ul>
							</div></li>



						<li><a href="javascript:void(0);" class="btn collapse">내장산</a>
							<div class="a">
								<ul class="nav-tabs tab-menu">


									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('내장산','가인','B041001', ''); return false;">가인
									</a></li>



									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('내장산','내장','B042001', ''); return false;">내장
									</a></li>


								</ul>
							</div></li>


						<li><a href="javascript:void(0);" class="btn collapse">다도해해상</a>
							<div class="a">
								<ul class="nav-tabs tab-menu">


									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('다도해해상','팔영산','B091001', ''); return false;">팔영산
									</a></li>



									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('다도해해상','염포','B091003', ''); return false;">염포
									</a></li>



									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('다도해해상','구계등','B091004', ''); return false;">구계등
									</a></li>



								</ul>
							</div></li>

					</ul>



					<ul class="menu-tabs">

						<li><a href="javascript:void(0);" class="btn collapse">덕유산</a>
							<div class="a">
								<ul class="nav-tabs tab-menu">




















									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('덕유산','덕유대 체류형 숙박시설','B051006', ''); return false;">덕유대
											체류형 숙박시설 </a></li>



									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('덕유산','덕유대 야영장','B051002', ''); return false;">덕유대
											야영장 </a></li>




























































								</ul>
							</div></li>



						<li><a href="javascript:void(0);" class="btn collapse">무등산</a>
							<div class="a">
								<ul class="nav-tabs tab-menu">
























									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('무등산','도원','B172002', ''); return false;">도원
									</a></li>


























































								</ul>
							</div></li>



						<li><a href="javascript:void(0);" class="btn collapse">변산반도</a>
							<div class="a">
								<ul class="nav-tabs tab-menu">


























									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('변산반도','고사포','B181002', ''); return false;">고사포
									</a></li>
























































								</ul>
							</div></li>



						<li><a href="javascript:void(0);" class="btn collapse">설악산</a>
							<div class="a">
								<ul class="nav-tabs tab-menu">




























									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('설악산','설악','B031005', ''); return false;">설악
									</a></li>






















































								</ul>
							</div></li>

					</ul>



					<ul class="menu-tabs">

						<li><a href="javascript:void(0);" class="btn collapse">소백산</a>
							<div class="a">
								<ul class="nav-tabs tab-menu">






























									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('소백산','삼가','B121001', ''); return false;">삼가
									</a></li>



									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('소백산','남천','B122001', ''); return false;">남천
									</a></li>


















































								</ul>
							</div></li>



						<li><a href="javascript:void(0);" class="btn collapse">오대산</a>
							<div class="a">
								<ul class="nav-tabs tab-menu">


































									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('오대산','소금강','B061001', ''); return false;">소금강
									</a></li>
















































								</ul>
							</div></li>



						<li><a href="javascript:void(0);" class="btn collapse">월악산</a>
							<div class="a">
								<ul class="nav-tabs tab-menu">




































									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('월악산','닷돈재풀옵션','B111001', ''); return false;">닷돈재풀옵션
									</a></li>



									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('월악산','닷돈재자동차','B111003', ''); return false;">닷돈재자동차
									</a></li>



									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('월악산','덕주','B111007', ''); return false;">덕주
									</a></li>



									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('월악산','송계','B111002', ''); return false;">송계
									</a></li>



									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('월악산','용하','B111004', ''); return false;">용하
									</a></li>



									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('월악산','하선암','B111008', ''); return false;">하선암
									</a></li>




































								</ul>
							</div></li>



						<li><a href="javascript:void(0);" class="btn collapse">월출산</a>
							<div class="a">
								<ul class="nav-tabs tab-menu">
















































									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('월출산','천황','B201001', ''); return false;">천황
									</a></li>


































								</ul>
							</div></li>

					</ul>



					<ul class="menu-tabs">

						<li><a href="javascript:void(0);" class="btn collapse">주왕산</a>
							<div class="a">
								<ul class="nav-tabs tab-menu">


















































									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('주왕산','상의','B071001', ''); return false;">상의
									</a></li>
































								</ul>
							</div></li>



						<li><a href="javascript:void(0);" class="btn collapse">지리산</a>
							<div class="a">
								<ul class="nav-tabs tab-menu">




















































									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('지리산','학천카라반','B012010', ''); return false;">학천카라반
									</a></li>



									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('지리산','덕동','B012003', ''); return false;">덕동
									</a></li>



									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('지리산','달궁힐링','B012005', ''); return false;">달궁힐링
									</a></li>



									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('지리산','달궁자동차','B012002', ''); return false;">달궁자동차
									</a></li>



									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('지리산','뱀사골자동차','B012006', ''); return false;">뱀사골자동차
									</a></li>



									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('지리산','뱀사골힐링','B012004', ''); return false;">뱀사골힐링
									</a></li>



									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('지리산','소막골','B011006', ''); return false;">소막골
									</a></li>



									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('지리산','내원','B011005', ''); return false;">내원
									</a></li>



									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('지리산','백무동','B011007', ''); return false;">백무동
									</a></li>














								</ul>
							</div></li>



						<li><a href="javascript:void(0);" class="btn collapse">치악산</a>
							<div class="a">
								<ul class="nav-tabs tab-menu">






































































									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('치악산','구룡','B101001', ''); return false;">구룡
									</a></li>



									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('치악산','금대','B101002', ''); return false;">금대
									</a></li>










								</ul>
							</div></li>



						<li><a href="javascript:void(0);" class="btn collapse">태백산</a>
							<div class="a">
								<ul class="nav-tabs tab-menu">










































































									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('태백산','소도','B221004', ''); return false;">소도
									</a></li>








								</ul>
							</div></li>

					</ul>



					<ul class="menu-tabs">

						<li><a href="javascript:void(0);" class="btn collapse">태안해안</a>
							<div class="a">
								<ul class="nav-tabs tab-menu">












































































									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('태안해안','몽산포','B081002', ''); return false;">몽산포
									</a></li>



									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('태안해안','학암포','B081001', ''); return false;">학암포
									</a></li>




								</ul>
							</div></li>



						<li><a href="javascript:void(0);" class="btn collapse">한려해상</a>
							<div class="a">
								<ul class="nav-tabs tab-menu">
















































































									<li><a href="javascript:void(0);"
										onclick="javascript:goCampProductDetail('한려해상','학동','B021001', ''); return false;">학동
									</a></li>


								</ul>
							</div></li>

					</ul>


				</div>


				<div class="nodata">
					<i class="icon-alert-circle"></i> <span>선택된 야영장이 없습니다. 야영장을
						선택해주세요.</span>
				</div>

				<!-- 예약안내 레이어팝업 -->
				<div class="modal-popup small" id="automatic-character">
					<div class="popup-wrap">
						<div class="popup-head">
							<strong class="popup-title">자동방지 입력문자</strong>
							<button type="button" class="btn-close" title="닫기">
								<i class="icon-close"></i>
							</button>
						</div>
						<div class="popup-container">
							<table class="table">
								<caption>자동방지 입력문자</caption>
								<colgroup>
									<col style="width: 140px;">
									<col>
								</colgroup>
								<tbody class="tbody" data-area-name="popup-container-tbody">
									<tr>
										<th scope="row">예약상품</th>
										<td></td>
									</tr>
									<tr>
										<th scope="row">사용기간</th>
										<td></td>
									</tr>
									<tr>
										<th scope="row">입실날짜</th>
										<td></td>
									</tr>
									<tr>
										<th scope="row">퇴실날짜</th>
										<td></td>
									</tr>
									<tr>
										<th scope="row">옵션추가</th>
										<td></td>
									</tr>
									<tr>
										<th scope="row">결제(예정)금액</th>
										<td></td>
									</tr>
									<tr data-area-name="brfeTerYn" style="display: none;">
										<th scope="row">자격구분 <span class="text-info">*</span></th>
										<td class="form">
											<ul class="checkbox-1">
												<li><span class="radio-1"> <input type="radio"
														id="brfe-radio1" name="rsvtDvcdDs" value="14"> <label
														for="brfe-radio1">장애인(중증, 1~3급)</label>
												</span></li>
												<li><span class="radio-1"> <input type="radio"
														id="brfe-radio2" name="rsvtDvcdDs" value="11"> <label
														for="brfe-radio2">장애인(경증, 4~6급)</label>
												</span></li>
											</ul>
										</td>
									</tr>
									<tr data-area-name="brfeTerYn" style="display: none;">
										<th scope="row">장애인등록번호(뒤 3자리) <span class="text-info">*</span></th>
										<td class="form">
											<ul>
												<li><label for="dstpRegNo" class="hidden-text">장애인등록번호</label>
													<input type="text" class="input-text" name="dstpRegNo"
													id="dstpRegNo" maxlength="3" title="장애인등록번호"></li>
											</ul>
										</td>
									</tr>
									<tr data-area-name="brfeTerYn" style="display: none;">
										<th scope="row">온라인 자격검증</th>
										<td class="form">
											<p class="copy">※ 온라인 자격검증을 하지 않을 경우 현장에서 장애인등록증으로 확인합니다.
												자격증빙이 없을 경우 입장이 제한될 수 있으니 필히 지참해주세요</p> <span class="btn-input">
												<button class="btn btn-layer" data-popup="exemption-auth">자격검증</button>
												<label for="exemptionAuthText" class="hidden-text">자격검증</label>
												<input type="text" class="input-text"
												placeholder="자격검증 버튼을 눌러주세요." title="자격검증"
												id="exemptionAuthText" readonly>
										</span>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="captcha-area">
								<span class="label">자동예약 방지문자</span> <span class="captcha"></span>
								<label for="captchaInput" class="hidden-text">자동예약 방지문자</label>
								<input type="text" class="input-text" name="captcha"
									id="captchaInput" title="자동예약 방지문자" maxlength="4">
							</div>
							<p class="copy-notice">※ 예약 완료된 상품에 대해서는 마이페이지 나의예약목록 에서 확인 후
								결제 가능합니다.</p>
							<div class="btn-area">
								<button class="btn btn-cancel">취소</button>
								<button class="btn btn-confirm is-active"
									data-button-name="reservation"
									onclick="javacript:reservation();">확인</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<a href="javascript:void(0);" style="display: none"
				class="btn btn-register is-active btn-layer"
				data-popup="automatic-character">예약하기</a>

			<button type="button" style="display: none" class="btn btn-layer"
				data-popup="reservation-information1">예약안내</button>
			<div class="modal-popup small" id="reservation-information1">
				<div class="popup-wrap">
					<div class="popup-head">
						<strong class="popup-title">예약완료안내</strong>
						<button type="button" class="btn-close" title="닫기"
							onclick="javascript:lastPopClose();">
							<i class="icon-close"></i>
						</button>
					</div>
					<div class="popup-container">
						<div class="center" data-area-name="reservation-popup-container">
							<i class="icon-check"></i> <strong class="title-1">예약이
								완료되었습니다.</strong>
							<p class="copy-mid">
								결제 만기일시는 <em data-popup-information-campsite="sttlmMtDtm">
									<!-- 2020년 02월 17일 16:00 -->
								</em> 까지 입니다.<br>미 결제시 자동 취소되니 유의 하시기 바랍니다.
							</p>
							<p class="copy-sm">마이페이지 나의예약목록 에서 확인 후 결제를 계속 진행해주세요.</p>
						</div>

						<div class="center" data-area-name="reservation-popup-container-w">
							<i class="icon-check"></i> <strong class="title-1">대기신청이
								완료되었습니다.</strong>
							<p class="copy-mid">
								대기자에서 예약자로 전환되면 예약 결제 안내 문자가 발송됩니다.<br> 단, 잘못된 연락처 및 통신사 환경
								등에 따라 전송이 실패할 수도 있습니다.<br> 이에 따른 피해에 대해서는 국립공원공단에서 보상하지
								않습니다.<br> 반드시 '나의 예약 목록'에서 예약상태를 확인하여 주시기 바랍니다.
							</p>
							<!-- <p class="copy-sm">마이페이지 나의예약목록 에서 확인 후 결제를 계속 진행해주세요.</p> -->
						</div>

						<div class="btn-area">
							<a href="../mmb/mmbLogin.html" class="btn btn-link">나의 예약목록
								보기</a>
						</div>
					</div>
				</div>
			</div>


			<!-- 배치도 -->
			<button type="button" class="btn btn-layer" data-popup="blockplan"
				style="display: none">배치도</button>
			<div class="modal-popup medium" id="blockplan">
				<div class="popup-wrap">
					<div class="popup-head">
						<strong class="popup-title">배치도</strong>
						<button type="button" class="btn-close btn-img-close" title="닫기">
							<i class="icon-close"></i>
						</button>
					</div>
					<div class="popup-container">
						<div class="zoom-container">
							<div class="zoomable">
								<img src="../assets/img/%40img-deployment.png" alt="배치도" />
							</div>
							<button class="btn-move">이미지 이동</button>
						</div>
						<div class="btn-area">
							<button class="btn btn-confirm is-active btn-img-confirm">확인</button>
						</div>
					</div>
				</div>
			</div>









			<script>
				$(document)
						.ready(
								function() {

									//다음
									$('.selfAuthModal')
											.click(
													function() {

														var policyVal = $(
																'input[name="policy"]:checked')
																.val();
														if (policyVal == '') {
															toastrMsg('개인정보 제공 동의를 해주세요.');
															return false;
														}

														if ($('#usNmId').text() == '') {
															toastrMsg('본인인증을 진행해주세요.');
															return false;
														}

														if ($('#usNm').val() == '') {
															toastrMsg('주민등록번호 뒷자리를 입력해주세요.');
															return false;
														}

														ajaxCall({
															url : "/common/authGpkiForPay.do",
															data : {
																"tgtrNm" : $(
																		'#usNmId')
																		.text(),
																"trtrNum" : $(
																		'#usNumId')
																		.text()
																		+ ""
																		+ $(
																				'#usNm')
																				.val(),
																"authType" : $(
																		'#authTypeId')
																		.val()
															},
															success : function(
																	dat) {
																if ($(
																		'#authTypeId')
																		.val() == 'A') { //장애인여부확인
																	reductionDisabledDc(dat);
																} else {
																	naManMeritDc(dat);
																}
															},
															error : function() {
																toastrMsg('감면 인증 중 오류가 발생하였습니다. <br/>관리자에게 문의하여 주세요.');
															}
														})
													});

									//취소 감면인증정보 확인 모달 제거
									$('.selfAuthModalCancel').click(function() {
										$('#radio1-1').prop('checked', true);
										closePopup('exemption-auth');
									});

								});
				function reductionDisabledDc(dat) {
					var qufyYn = dat.qufyYn;
					var disabledCode = dat.disabledCode;
					let subTitle = '';
					let content = '';
					let type = '';

					if ($('#usNmId').text() == '') {

						if (qufyYn == 'M') {

							subTitle = $('#usNmId').text() + '님은 대상자가 아닙니다.';
							content = '기존 대상자였지만 현재 비대상자로 전환 되었습니다.<br/>확인 후 다시 시도해주세요.';
							type = 'error';
							$('#radio1-1').prop('checked', true);

						} else if (qufyYn == 'Y') {

							if (disabledCode == '00' || disabledCode == '98'
									|| disabledCode == '99') {

								var strMsg = '';
								if (disabledCode == '00') {
									strMsg = '장애 미해당';
								} else if (disabledCode == '98') {
									strMsg = '결정보류';
								} else if (disabledCode == '99') {
									strMsg = '확인불가';
								}

								$('#exemptionAuthText').val('대상자가 아닙니다');
								subTitle = $('#usNmId').text()
										+ '님은 대상자가 아닙니다.';
								content = '현재 ' + strMsg
										+ ' 상태입니다.<br/>확인 후 다시 시도해주세요.';
								type = 'error';
								$('#radio1-1').prop('checked', true);

							} else {

								if ('10' == disabledCode) {
									$('#radio1-2').prop('checked', true);
									$('#certTextId').val('장애인(중증, 1~3급)');
								} else if ('20' == disabledCode) {
									$('#radio1-3').prop('checked', true);
									$('#certTextId').val('장애인(경증, 4~6급)');
								} else {
									$('#radio1-3').prop('checked', true);
									$('#certTextId').val('장애인 대상자');
								}

								subTitle = $('#usNmId').text()
										+ '님은 감면 대상자입니다.';
								content = '';
								type = '';

								//결제금액 재계산
								recalWithExemption();

							}

						} else {

							subTitle = $('#usNmId').text() + '님은 대상자가 아닙니다.';
							content = '확인 후 다시 시도해주세요.';
							type = 'error';
							$('#radio1-1').prop('checked', true);

						}

					} else {

						subTitle = '예약자 본인이 아니므로 <br>자격확인을 할 수 없습니다.';
						content = '현장 방문 시 증빙을 지참하시고 할인 받으시기 바랍니다.';
						type = 'error';
						$('#radio1-1').prop('checked', true);

					}

					alertPopup({
						title : '알림',
						subTitle : subTitle,
						content : content,
						type : type
					});
					self.close();

				}

				function naManMeritDc(dat) {

					let cnt = dat.cnt;
					let dcTargetYn = dat.dcTargetYn;
					let relCd = dat.relCd;
					let authoriPsnYn = dat.authoriPsnYn;
					let wondClassCd = dat.wondClassCd;
					let subjKbnCd = dat.subjKbnCd;
					let inquRsltCd = dat.inquRsltCd;

					let subTitle = '';
					let content = '';
					let type = '';

					if ($('#usNmId').text() == '') {
						//조회결과가 있을때
						if (cnt > 0) {
							//감면대상일때
							if (dcTargetYn == 'Y') {
								if ('00011' == wondClassCd
										|| '00012' == wondClassCd
										|| '00013' == wondClassCd
										|| '00020' == wondClassCd
										|| '00030' == wondClassCd
										|| '00G01' == wondClassCd
										|| '00G02' == wondClassCd
										|| '00G03' == wondClassCd) { //1~3급

									$('#radio1-4').prop('checked', true);
									$('#certTextId').val('국가유공자(1~3급)');
								} else if ('00017' == subjKbnCd
										|| '00018' == subjKbnCd
										|| '00019' == subjKbnCd) { //518 민주화운동자.
									$('#radio1-5').prop('checked', true);
									$('#certTextId').val('5.18 민주운동자');
								} else { //그 외
									$('#radio1-6').prop('checked', true);
									$('#certTextId')
											.val(
													'국가유공자(4~7급), 등급 외(무공·보훈수훈자, 배우자, 유족 등)');
								}

								//할인금액 재계산
								recalWithExemption();

								subTitle = $('#usNmId').text()
										+ '님은 감면 대상자입니다.';
								content = '';
								type = '';
							} else {
								//조회 결과 (S:성공 이 아닐때 )
								if (inquRsltCd != 'S') {
									subTitle = $('#usNmId').text()
											+ '님은 대상자가 아닙니다.';
									content = '조회 결과가 없습니다.<br/>확인 후 다시 시도해주세요.';
									type = 'error';
									$('#radio1-1').prop('checked', true);
								} else {
									//수권자인지 체크
									if (authoriPsnYn != 'Y') {
										subTitle = $('#usNmId').text()
												+ '님은 대상자가 아닙니다.';
										content = '확인 후 다시 시도해주세요.';
										type = 'error';
										$('#radio1-1').prop('checked', true);
									} else {
										//조회결과가 있고, 수권자인데 본인이 아닌경우
										if (relCd != 'A') {
											subTitle = '본인인 경우에만 선할인 가능합니다.';
											content = '수권자 본인만 할인 가능합니다.<br/>가족 및 배우자이신 경우 증빙을 지참하시고 현장할인 받으시기 바랍니다.';
											type = 'error';
											$('#radio1-1')
													.prop('checked', true);
										} else {
											//이경우는 없긴한데 일단 처리
											subTitle = $('#usNmId').text()
													+ '님은 대상자가 아닙니다.';
											content = '확인 후 다시 시도해주세요.';
											type = 'error';
											$('#radio1-1')
													.prop('checked', true);
										}
									}//수권자 END

								}//조회결과 END

							}//감면대상 END
						} else {
							//조회결과가 없을때
							subTitle = $('#usNmId').text() + '님은 대상자가 아닙니다.';
							content = '확인 후 다시 시도해주세요.';
							type = 'error';
							$('#radio1-1').prop('checked', true);
						}//조회결과 0개 END

					} else {

						subTitle = '예약자 본인이 아니므로 <br>자격확인을 할 수 없습니다.';
						content = '현장 방문 시 증빙을 지참하시고 할인 받으시기 바랍니다.';
						type = 'error';
						$('#radio1-1').prop('checked', true);

					}

					alertPopup({
						title : '알림',
						subTitle : subTitle,
						content : content,
						type : type
					});
					self.close();

				}
				//국가유공자 등급확인

				//휴대폰 인증
				function goAuth() {

					$
							.ajax({
								url : "/pay/checkPlusForPay.do",
								type : "POST",
								dataType : "json",
								async : false,
								data : {},
								success : function(dat) {

									//인증요청 암호화 데이터가 없을 경우 오류발생
									if (dat.result.sEncData == '') {
										toastrMsg(dat.result.sRtnMsg);
									} else {
										$("#EncodeData").val(
												dat.result.sEncData);
										window
												.open(
														'',
														'popupChk',
														'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
										document.form_chk.target = "popupChk";
										document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
										document.form_chk.submit();
									}
								},
								error : function(e1, e2, e3) {

								}
							});

				}

				//아이핀 인증
				function goAuthiPin() {

					$
							.ajax({
								url : "/pay/iPinForPay.do",
								type : "POST",
								dataType : "json",
								async : false,
								data : {},
								success : function(dat) {

									//인증요청 암호화 데이터가 없을 경우 오류발생
									if (dat.result.sEncData == '') {
										toastrMsg(dat.result.sRtnMsg);
									} else {
										$("#enc_data").val(dat.result.sEncData);
										window
												.open(
														'',
														'popupIPIN2',
														'width=450, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
										document.form_ipin.target = "popupIPIN2";
										document.form_ipin.action = "https://cert.vno.co.kr/ipin.cb";
										document.form_ipin.submit();
									}
								},
								error : function(e1, e2, e3) {

								}
							});

				}
			</script>

			<div class="modal-popup small" id="exemption-auth">

				<input type="hidden" id="authTypeId" value="" />

				<div class="popup-wrap" style="top: 40px; bottom: 40px;">
					<div class="popup-head">
						<strong class="popup-title">감면자격 인증</strong>
						<button type="button" class="btn-close" title="닫기">
							<i class="icon-close"></i>
						</button>
					</div>
					<div class="popup-container">
						<strong class="title-2">개인정보 제공 동의</strong>
						<div class="box-content" style="height: 300px">
							<p>본 포털은 본인확인 및 공공시설 이용요금 감면서비스 대상여부 확인, 감면자자격 정보 저장 만료일 안내를
								목적으로 개인정보(이름, 주민번호, 휴대전화 번호)를 수집합니다.</p>
							<p>개인정보 수집 이용에 동의를 거부할 권리가 있으며, 거부 시 공공시설 이용요금 가면서비스 대상 여부
								확인이 제한 될 수 있습니다.</p>
							<p>수집된된 정보는 공공시설 이용요금 감면서비스 대상 여부 확인 후 즉시 파기됩니다.</p>
						</div>
						<div class="radio-area">
							<label for="radio2-1">위 내용에 동의하십니까?</label> <span class="radio-1">
								<input type="radio" id="radio1-1" name="policy" checked=""
								value=""> <label for="radio1-1">동의하지 않음</label>
							</span> <span class="radio-1"> <input type="radio" id="radio2-1"
								name="policy" value="T"> <label for="radio2-1">동의함</label>
							</span>
						</div>

						<div class="personal-identification mb-20 mt-20">
							<div class="auth-box phone">
								<strong>휴대폰 인증</strong>
								<p>본인 명의 휴대폰으로 인증 후 감면혜택을 받을 수 있습니다.</p>
								<button class="btn" onclick="goAuth();">휴대폰 인증</button>
							</div>
							<div class="auth-box ipin">
								<strong>아이핀(I-PIN) 인증</strong>
								<p>본인 명의 아이핀 으로 인증 후 감면혜택을 받을 수 있습니다.</p>
								<button class="btn" onclick="goAuthiPin();">아이핀 인증</button>
							</div>
						</div>

						<strong class="title-2">개인정보 입력</strong>
						<table class="table">
							<caption>개인정보 입력</caption>
							<colgroup>
								<col style="width: 140px;">
								<col>
							</colgroup>
							<tbody class="tbody">
								<tr>
									<th scope="row">이름</th>
									<td id="usNmId"></td>
								</tr>
								<tr>
									<th scope="row"><label for="usNm" class="hidden-text">주민번호</label></th>
									<td class="form flex"><span id="usNumId"></span> - <label
										for="usNm" class="hidden-text">주민번호 뒷자리</label> <input
										type="password" class="input-text" id="usNm"
										placeholder="뒷자리를 입력 해주세요." title="주민번호 뒷자리"></td>
								</tr>
							</tbody>
						</table>
						<div class="btn-area">
							<button class="btn btn-cancel selfAuthModalCancel">취소</button>
							<button class="btn btn-confirm is-active selfAuthModal">자격확인</button>
						</div>
					</div>
				</div>
			</div>

		</div>
		<%@ include file="../common/footer.jsp"%>


		<div class="modal-popup small" id="confirmPop">
			<div class="popup-wrap">
				<div class="popup-head">
					<strong class="popup-title" id="confirmTitle"></strong>
					<button type="button" class="btn-close" title="닫기"
						onclick="closePopup('confirmPop');">
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
	<img id="loadingImage" src="../assets/img/preloader.gif" alt="로딩이미지"
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

<!-- Mirrored from reservation.knps.or.kr:443/reservation/searchSimpleCampReservation.do by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 10 Nov 2022 06:59:22 GMT -->
</html>
