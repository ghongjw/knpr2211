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
		<div id="container">
			<script src="../assets/js/lib/netfunnel.js"></script>
			<div class="page-location">
				<span>홈</span> <span>예약하기</span> <span>${category1}</span>
			</div>
			<div class="reservation responsive">
				<h3 class="title">${category1}예약하기</h3>
				<div class="title-area">
					<span class="label"><i class="icon-location"></i>
						${category2}</span>
					<h4 class="title">${category2}${category1} 예약현황</h4>
					<p class="copy">민박촌은 개시기간 기준 아이디 당 4건으로 제한되며, 동일 날짜의 민박촌은 선택불가
						합니다.</p>
					<div class="btn-area">
						<button class="btn btn-refresh">
							<i class="icon-refresh"></i> <span>새로고침</span>
						</button>
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
										<div class="calendar-title first" style="font-weight: bold">
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
										<div class="calendar-title second" style="font-weight: bold">
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
										<div class="calendar-title third" style="font-weight: bold">
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
						<dt>사용기간</dt>
						<dd id="lengthTxt">-</dd>
					</dl>
					<dl>
						<dt>입실날짜</dt>
						<dd id="startDt">-</dd>
					</dl>
					<dl>
						<dt>퇴실날짜</dt>
						<dd id="endDt">-</dd>
					</dl>
					<dl>
						<dt>민박촌 타입</dt>
						<dd class="form">
							<ul class="radio-list" id="minbakTyps">
								<c:forEach var="list" items="${roomTypeList}">
									<li><span class="radio-1"> <input type="radio"
										name="minbakChk" id="${list.category3}" value="${list.peopleMax}"> <label
										for="mbTp0" onclick="sendCot()">${list.nameCategory3}</label>
									</span></li>
								</c:forEach>

							</ul>

						</dd>
					</dl>
					<dl style="display: none;">
						<dt>체류기간</dt>
						<dd class="form">
							<div class="stay-row">
								<span class="length-stay" id="nightDays1" data-val="1">1박
									2일</span> <span class="length-stay" id="nightDays2" data-val="2">2박
									3일</span> <span class="length-stay" id="nightDays3" data-val="3">3박
									4일</span><span style="display: none" id="nightDays"></span>
							</div>
						</dd>
					</dl>
				</div>

				<button class="btn btn-search" onclick="sendCot();">
					<i class="icon-search"></i> <span>민박촌 잔여현황 조회</span>
				</button>
				<div class="title-area remainDiv sendview" style="display: none;">
					<h4 class="title">민박촌 잔여현황</h4>
					<div class="btn-area">
						<button class="btn btn-view" onclick="funcArray.drawImage();"
							id="drawImageButton" style="display: none">객실 보기</button>
					</div>
				</div>
				<table class="table residenceProgram sendview"
					style="display: none;">
					<caption>민박촌 예약현황</caption>
					<colgroup>
						<col style="width: 8%;">
						<col style="width: 40%">
						<col>
						<col>
					</colgroup>
					<thead class="thead">
						<tr>
							<th scope="col">선택</th>
							<th scope="col">객실</th>
							<th scope="col">객실</th>
							<th scope="col">이용금액</th>
						</tr>
					</thead>
					<tbody class="tbody">
					</tbody>
				</table>

				<!-- 추가인원 설정 부분 -->
				<div class="border-box mt-10 addHum sendview" style="display: none;">
					<div class="option-wrap">
						<h5>추가인원 설정</h5>
						<ul class="option-list">
							<li><span class="quantity-input">
									<button type="button" class="btn minus livingRoom-prsn-minus">
										<i class="icon-minus" onclick="sendEco()"></i>
									</button> <label for="livingPrsnCnt" class="hidden-text">총참여인원</label> <input
									type="number" value="1" readonly="" title="총 참여 인원"
									name="livingPrsnCnt" id="livingPrsnCnt">
									<button type="button" class="btn plus livingRoom-prsn-plus"
										onclick="sendEco()">
										<i class="icon-plus"></i>
									</button>
							</span></li>
						</ul>
						<ul class="mt-10">
							<li>※ 예약할 시설의 수량 선택한 후 이용금액을 확인하고 예약하기 버튼을 누르면 바로 접수가 완료됩니다.</li>
							<li>※ 예약완료 후 곧바로 다른 시설 예약이 가능합니다.</li>
							<li>※ 객실 수용인원 외 인원을 추가할 경우, 1인 1박당 5,000원이 추가됩니다. (최대 2명)</li>
						</ul>
					</div>
				</div>

				<!-- 총 이용금액 부분 -->
				<div class="title-area totTitle sendview" style="display: none;">
					<h4 class="title">총 이용금액</h4>
				</div>

				<div class="payment sendview" style="display: none;">
					<dl>
						<dt>-</dt>
						<dd>0원</dd>
					</dl>
					<dl>
						<dt>추가인원 : <span id="addPeople" style="font-weight:bold;">0<span>명</dt>
						<dd>0원</dd>
					</dl>
					<dl class="total">
						<dt>결제(예정)금액</dt>
						<dd>
							<em>0</em>원
						</dd>
					</dl>
				</div>

				<div class="board-bottom sendview" style="display: none;">
					<div class="center reserv">
						<a href="javascript:void(0);" onclick=""
							class="btn btn-register is-active">예약하기</a>
					</div>
				</div>
			</div>


			<form id="frmReservation" method="post"
				class="frm-select-reservation"
				action="https://reservation.knps.or.kr:443/reservation/selectResidenceReservation.action">
				<input type="hidden" name="rsrvtQntt" id="fRsrvtQntt" value="" /> <input
					type="hidden" name="useStDt" id="fUseBgnDtm" value="" /> <input
					type="hidden" name="useEdDt" id="fUseEndDtm" value="" /> <input
					type="hidden" name="fcltId" id="fFcltId" value="" /> <input
					type="hidden" name="dprtmId" id="fDprtmId" value="B221001" /> <input
					type="hidden" name="rsrvtType" id="fRsrvtType" value="" /> <input
					type="hidden" name="period" id="period" value="" /> <input
					type="hidden" name="detailPrice" id="detailPrice" value="" />
			</form>

			<div class="modal-popup small" id="automatic-character"
				style="display: none;"></div>
			<div class="modal-popup small" id="reservation-information1"></div>
			<div class="modal-popup large" id="resi-view"></div>
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
					$('#lengthTxt').html("당일을 선택하셨습니다.");
					$('#nightDays0').css("border-color","#004ea2").css("color","#004ea2");
					$('#nightDays1').css("border-color","#ccc").css("color","#ccc");
					$('#nightDays2').css("border-color","#ccc").css("color","#ccc");
					$('#nightDays3').css("border-color","#ccc").css("color","#ccc");
				}else if(check == 1){
					$('#nightDays').html("1");
					$('#lengthTxt').html("1박2일을 선택하셨습니다.");
					$('#nightDays0').css("border-color","#ccc").css("color","#ccc");
					$('#nightDays1').css("border-color","#004ea2").css("color","#004ea2");
					$('#nightDays2').css("border-color","#ccc").css("color","#ccc");
					$('#nightDays3').css("border-color","#ccc").css("color","#ccc");
				}else if(check == 2){
					$('#nightDays').html("2");
					$('#lengthTxt').html("2박3일을 선택하셨습니다.");
					$('#nightDays0').css("border-color","#ccc").css("color","#ccc");
					$('#nightDays1').css("border-color","#ccc").css("color","#ccc");
					$('#nightDays2').css("border-color","#004ea2").css("color","#004ea2");
					$('#nightDays3').css("border-color","#ccc").css("color","#ccc");
				}
				else if(check == 3){
					$('#nightDays').html("3");
					$('#lengthTxt').html("3박4일을 선택하셨습니다.");
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
					var max = 2;
					var selectNum = Number($("#livingPrsnCnt").val());
					if(selectNum==2){
						toastrMsg("추가 인원은 최대 2명입니다.");
					}else if(selectNum<max){
						selectNum ++;
						$("#livingPrsnCnt").attr("value",selectNum);
					}
						$("#addPeople").html(selectNum);
					})
					$('.btn.minus').on("click",function(e){
						var selectNum = Number($("#livingPrsnCnt").val());
					if(selectNum!=1 && selectNum>0){
						selectNum --;
						$("#livingPrsnCnt").attr("value",selectNum);
					}
					$("#addPeople").html(selectNum);
				})
			</script>
</body>
</html>