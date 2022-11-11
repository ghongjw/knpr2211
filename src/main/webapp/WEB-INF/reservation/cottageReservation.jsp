<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>


<!DOCTYPE html>
<html lang="ko">

<!-- Mirrored from reservation.knps.or.kr:443/reservation/searchSimpleResidenceReservation.do by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 10 Nov 2022 06:59:25 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>국립공원공단 예약시스템</title>

<link rel="stylesheet" href="../assets/style/commonb07b.css?ver1">

<script src="../assets/js/lib/jquery-1.12.4.min.js"></script>
<script src="../assets/js/lib/swiper.js"></script>
<script src="../assets/js/lib/datepicker.min.js"></script>
<script src="../assets/js/lib/jquery.fs.zoomer.min.js"></script>
<script src="../assets/js/lib/jquery.rwdImageMaps.min.js"></script>
<script src="../assets/js/lib/toastr.min.js"></script>
<script src="../assets/js/scripts.js"></script>
<script src="../assets/js/common9b00.js?ver4"></script>
</head>
<body>
	<div id="wrap" class="sub">






		<header id="header">
			<h1>
				<a href="../index.html" class="logo">국립공원 예약시스템</a>
			</h1>
			<nav>
				<ul class="gnb">

					<li><a href="javascript:void(0);" class="depth1">이용안내</a>
						<ul class="depth2">

							<li><a href="../contents/C/serviceGuideIntro.html">야영장</a></li>

							<li><a href="../contents/S/serviceGuideIntro.html">대피소</a></li>

							<li><a href="../contents/E/serviceGuideIntro.html">생태탐방원</a></li>

							<li><a href="../contents/R/serviceGuideIntro.html">민박촌</a></li>

							<li><a href="../contents/T/serviceGuideIntro.html">탐방로예약제</a></li>

							<li><a href="../contents/G/serviceGuideIntro.html">탐방프로그램</a></li>

						</ul></li>

					<li><a href="javascript:void(0);" class="depth1">예약하기</a>
						<ul class="depth2">

							<li><a href="searchSimpleCampReservation.html">야영장</a></li>

							<li><a href="shelter/searchSimpleShelterReservation.html">대피소</a></li>

							<li><a href="../eco/searchEcoReservation.html">생태탐방원</a></li>

							<li><a href="searchSimpleResidenceReservation.html">민박촌</a></li>

							<li><a href="../trail/searchTrailReservation.html">탐방로예약제</a></li>

							<li><a href="../trprogram/searchTrailProgram.html">탐방프로그램</a></li>

							<li><a href="selectCampLottery.html">추첨제</a></li>

						</ul></li>

					<li><a href="javascript:void(0);" class="depth1">알림마당</a>
						<ul class="depth2">

							<li><a href="../community/board/notice/boardList.html">공지사항</a></li>

							<li><a href="../community/board/faq/boardList.html">자주하는
									질문</a></li>

							<li><a href="../community/board/qna/boardList.html">묻고
									답하기</a></li>

							<li><a href="../contents/rsvtRefundPolicy.html">예약·환불정책</a></li>

						</ul></li>

					<li><a href="javascript:void(0);" class="depth1">마이페이지</a>
						<ul class="depth2">

							<li><a href="../mmb/mmbLogin.html">나의 예약목록</a></li>

							<li><a href="../mmb/mmbLogin.html">알림메시지</a></li>

							<li><a href="../mmb/mmbLogin.html">즐겨찾기</a></li>

							<li><a href="../srchrefund/requestRefund.html">미환불금 조회</a></li>

						</ul></li>

					<li><a href="javascript:void(0);" class="depth1">그린포인트</a>
						<ul class="depth2">

							<li><a href="../mmb/mmbLogin603d.html"
								onclick="fn_greenUrlChk();">야영장</a></li>

							<li><a href="../mmb/mmbLogin603d.html?prdDvcd=S">대피소</a></li>

						</ul></li>

				</ul>
			</nav>
			<div class="util-area" data-device-mode="pc">
				<a href="../srchrefund/searchRefund.html" class="btn-refund-inquiry">
					<i class="icon-refund-inquiry"></i> <span>미환불금조회</span>
				</a>

				<!-- 비 로그인 상태 -->
				<a href="../mmb/mmbLogin.html" class="btn-login"> <i
					class="icon-user-check"></i> <span>로그인</span>
				</a> <a
					href="https://www.knps.or.kr/portal/member/join01.do?menuNo=7020113"
					class="btn-join" target="_blank"> <i class="icon-user-plus"></i>
					<span>회원가입</span>
				</a>


				<div class="lang-area">
					<button class="btn btn-toggle" data-popup="layer-language">
						<i class="icon-globe"></i> <span>KR</span>
					</button>
					<div class="layer-language" id="layer-language">
						<button class="btn is-active">KR</button>
						<button class="btn"
							onclick="location.href='../foreigner/main.html'">EN</button>
					</div>
				</div>
			</div>
			<div class="util-area" data-device-mode="mobile">
				<button class="btn-menu" title="전체 메뉴 보기">
					<i class="icon-list"></i>
				</button>
				<div class="all-menu">
					<div class="head">
						<a href="../srchrefund/searchRefund.html"
							class="btn-refund-inquiry"> <i class="icon-refund-inquiry"></i>
							<span>미환불금조회</span>
						</a>

						<!-- 비 로그인 상태 -->
						<a href="../mmb/mmbLogin.html" class="btn-login">로그인이<br>필요합니다.
						</a> <a
							href="https://www.knps.or.kr/portal/member/join01.do?menuNo=7020113"
							class="btn-join" target="_blank"> <i class="icon-user-plus"></i>
							<span>회원가입</span>
						</a>
						<div class="lang-area">
							<button class="btn btn-toggle" data-popup="layer-language">
								<i class="icon-globe"></i> <span>KR</span>
							</button>
							<div class="layer-language" id="layer-language2">
								<button class="btn is-active">KR</button>
								<button class="btn"
									onclick="location.href='../foreigner/main.html'">EN</button>
							</div>
						</div>


						<button class="btn-close" title="전체 메뉴 닫기">
							<i class="icon-close"></i>
						</button>
					</div>
					<ul class="gnb">

						<li><a href="javascript:void(0);" class="depth1">이용안내</a>
							<ul class="depth2">

								<li><a href="../contents/C/serviceGuideIntro.html">야영장</a></li>

								<li><a href="../contents/S/serviceGuideIntro.html">대피소</a></li>

								<li><a href="../contents/E/serviceGuideIntro.html">생태탐방원</a></li>

								<li><a href="../contents/R/serviceGuideIntro.html">민박촌</a></li>

								<li><a href="../contents/T/serviceGuideIntro.html">탐방로예약제</a></li>

								<li><a href="../contents/G/serviceGuideIntro.html">탐방프로그램</a></li>

							</ul></li>

						<li><a href="javascript:void(0);" class="depth1">예약하기</a>
							<ul class="depth2">

								<li><a href="searchSimpleCampReservation.html">야영장</a></li>

								<li><a href="shelter/searchSimpleShelterReservation.html">대피소</a></li>

								<li><a href="../eco/searchEcoReservation.html">생태탐방원</a></li>

								<li><a href="searchSimpleResidenceReservation.html">민박촌</a></li>

								<li><a href="../trail/searchTrailReservation.html">탐방로예약제</a></li>

								<li><a href="../trprogram/searchTrailProgram.html">탐방프로그램</a></li>

								<li><a href="selectCampLottery.html" style="display: none;">추첨제</a></li>

							</ul></li>

						<li><a href="javascript:void(0);" class="depth1">알림마당</a>
							<ul class="depth2">

								<li><a href="../community/board/notice/boardList.html">공지사항</a></li>

								<li><a href="../community/board/faq/boardList.html">자주하는
										질문</a></li>

								<li><a href="../community/board/qna/boardList.html">묻고
										답하기</a></li>

								<li><a href="../contents/rsvtRefundPolicy.html">예약·환불정책</a></li>

							</ul></li>

						<li><a href="javascript:void(0);" class="depth1">마이페이지</a>
							<ul class="depth2">

								<li><a href="../mmb/mmbLogin.html">나의
										예약목록</a></li>

								<li><a href="../mmb/mmbLogin.html">알림메시지</a></li>

								<li><a href="../mmb/mmbLogin.html">즐겨찾기</a></li>

								<li><a href="../srchrefund/requestRefund.html">미환불금
										조회</a></li>

							</ul></li>

						<li><a href="javascript:void(0);" class="depth1">그린포인트</a>
							<ul class="depth2">

								<li><a href="../mmb/mmbLogin603d.html"
									onclick="fn_greenUrlChk();">야영장</a></li>

								<li><a href="../mmb/mmbLogin603d.html?prdDvcd=S">대피소</a></li>

							</ul></li>

					</ul>
				</div>
			</div>
		</header>
		<div id="container">





			<script src="../assets/js/lib/netfunnel.js"></script>
			<script>

    let selectStartDate = null;        //선택된시작날짜
    let selectStartDayWeek = null;     //선택된시작요일

    let selectEndDate = null;          //선택된종료날짜
    let selectEndDayWeek = null;       //선택된종료요일

    let selectCurDate = null;          //현재 선택된 날짜

    let globalAmt = null;			   //선택한 상품가격
    let globalPrdNm = null;			   //선택한 상품명

    var addOptionPrice = 0;

    //var prdCtgIdArr = [];

    $(function(){
        init.event();
    })

    let init = {
        event : function(){

            //민박촌 타입 기본 선택
            $('input[name="minbakChk"]:eq(0)').prop('checked', true);

            //추가인원 설정 -,+ 버튼 클릭
            $('.add').on('click', function(){

                //체류기간 값(박수)
                var baksu = '';
                $('.length-stay').each(function(){
                    if($(this).hasClass('selected')) {
                        baksu = $(this).data('val');
                    }
                });

                //민박촌 잔여현황 라디오 선택 안되어 있을 시 선택 못하게
                var checkFlag = false;
                var selectBtnLen = $('input[name="selectBtn"]:checked').length;

                if(selectBtnLen == 0) {
                    checkFlag = false;
                }else {
                    checkFlag = true;
                }

                //체크된 것이 없으면
                if(!checkFlag) {
                    toastrMsg("민박촌 타입을 선택해주세요.");
                    return false;
                }else {

                    //처음 input 값
                    var inputVal = $('.addPeopleNum').val();

                    if($(this).hasClass('plus')) {	//플러스 버튼일 때
                        if(inputVal < 2) {
                            //if(inputVal < 4)
                            inputVal++;
                        }
                    } else if($(this).hasClass('minus')) {	//마이너스 버튼일 때
                        if(inputVal > 0) {
                            inputVal--;
                        } else if(inputVal <= 0) {
                            inputVal = 0;
                        }
                    }

                    //인원 추가시 금액 계산
                    var addPrice = inputVal * addOptionPrice * baksu;
                    var bakPerPrice = globalAmt != 0 ? globalAmt.replace(/,/g, '') : globalAmt;
                    var totPrice = (Number(bakPerPrice) + (Number(inputVal*addOptionPrice)* Number(baksu))) ;

                    //추가인원 설정 input
                    $('.addPeopleNum').val(inputVal);

                    //총 이용금액 추가인원
                    $('div.payment dl:eq(1)').find('dt:eq(0)').html('추가인원 : '+inputVal+'명');
                    $('div.payment dl:eq(1)').find('dd:eq(0)').html(numberWithCommas(addPrice)+'원');

                    $('.total').find('dd').html('<em>'+numberWithCommas(totPrice)+'</em>' +'원');
                }
            });

            //start 달력 클릭 이벤트
            $(".calendar-cell").click(function(){

                //숨김
                funcArray.eleHide();

                selectCurDate = $(this).data('date');

                //선택된 날짜가 없을때 (최초선택)
                if(selectStartDate == null && selectEndDate == null){

                    //달력 및 선택값 초기화
                    funcArray.calendarClear();

                    //마지막달 1일을 입실로 선택시
                    if($(this).data('date') =='2023'+'-'+numPad('1',2)+'-'+'01'){
                        toastrMsg("해당 일은 퇴실만 가능합니다.");
                        return false;
                    }
                    //입실 선택
                    $(this).addClass('start').addClass('selected');

                    //data-속성 값 가져오기
                    selectStartDate = selectCurDate;
                    selectStartDayWeek = $(this).data('dayweek');
                    selectEndDate = selectCurDate;
                    selectEndDayWeek = $(this).data('dayweek');

                    //입실일 퇴실일 html 변경
                    $("#startDt").html(selectStartDate+" ["+funcArray.getDayWeekNm(selectStartDayWeek)+"]");
                    $("#endDt").html(selectStartDate+" ["+funcArray.getDayWeekNm(selectStartDayWeek)+"]");
                    $(".length-stay").removeClass('selected');

                    //퇴실 선택만 가능
                    funcArray.selectPreventEvent(selectStartDate.replace(/-/g, ''));

                }else if(selectStartDate != selectEndDate){ //새로운 입실일을 선택했을때

                    //달력 및 선택값 초기화
                    funcArray.calendarClear();

                    //마지막달 1일을 입실로 선택시
                    if($(this).data('date') =='2023'+'-'+numPad('1',2)+'-'+'01'){
                        toastrMsg("해당 일은 퇴실만 가능합니다.");
                        return false;
                    }

                    //입실 선택
                    $(this).addClass('start').addClass('selected');

                    //선택된값 갱신
                    selectStartDate = selectCurDate;
                    selectStartDayWeek = $(this).data('dayweek');
                    selectEndDate = selectCurDate;
                    selectEndDayWeek = $(this).data('dayweek');

                    //입실일 퇴실일 html 변경
                    $("#startDt").html(selectCurDate+" ["+funcArray.getDayWeekNm(selectStartDayWeek)+"]");
                    $("#endDt").html(selectCurDate+" ["+funcArray.getDayWeekNm(selectStartDayWeek)+"]");
                    $(".length-stay").removeClass('selected');

                    //퇴실 선택만 가능
                    funcArray.selectPreventEvent(selectStartDate.replace(/-/g, ''));

                }else if(selectStartDate == selectCurDate){ //당일에서 당일을 한번 더 클릭했을때

                    //달력 및 선택값 초기화
                    funcArray.calendarClear();

                    //입실 선택
                    $(this).addClass('start').addClass('selected');

                    //선택된값 갱신
                    selectStartDate = selectCurDate;
                    selectStartDayWeek = $(this).data('dayweek');
                    selectEndDate = selectCurDate;
                    selectEndDayWeek = $(this).data('dayweek');

                    //입실일 퇴실일 html 변경
                    $("#startDt").html(selectStartDate+" ["+funcArray.getDayWeekNm(selectStartDayWeek)+"]");
                    $("#endDt").html(selectStartDate+" ["+funcArray.getDayWeekNm(selectStartDayWeek)+"]");
                    $(".length-stay").removeClass('selected');

                }else{  //그외 나머지 경우는 퇴실일 선택

                    let nightDays = (new Date(selectCurDate) - new Date(selectStartDate))/1000/60/60/24;    //날짜계산

                    //퇴실일 날짜계산
                    if(selectStartDate > selectCurDate){

                        toastrMsg("퇴실일은 입실일보다 커야합니다.");
                        //달력 및 선택값 초기화
                        funcArray.calendarClear();
                        return false;

                    }else if(nightDays > 3) {

                        toastrMsg("최대 3박 4일까지 예약 가능합니다.");
                        //달력 및 선택값 초기화
                        funcArray.calendarClear();
                        return false;

                    }else{//퇴실 선택

                        $(this).addClass('end').addClass('selected');

                        //선택된값 갱신
                        selectEndDate = selectCurDate;
                        selectEndDayWeek = $(this).data('dayweek');
                        $("#endDt").html(selectEndDate+" ["+funcArray.getDayWeekNm(selectEndDayWeek)+"]");
                        $(".length-stay").removeClass('selected');
                        $("#nightDays"+nightDays).addClass('selected');     //체류기간 선택

                        $('#lengthTxt').html('<em class="text-success">'+$("#nightDays"+nightDays).text()+'</em>을 선택하셨습니다.');	//사용기간 텍스트

                        //사이값 선택된걸로 표시하기.
                        let date = new Date(selectStartDate);
                        for(let i=1; i<nightDays; i++){
                            date.setDate(date.getDate()+1);
                            $("."+date.getFullYear()+"-"+numPad(date.getMonth()+1,2)+"-"+numPad(date.getDate(),2)).addClass('selected');
                        }

                    }
                }

            });	//end 달력 클릭 이벤트

            //새로고침 버튼
            $('button.btn-refresh').on('click', function(){
                location.href = 'searchSimpleResidenceReservation.html';
            });

            //예약하기 버튼 유효성(민박촌을 선택해주세요)
            $(document).on('click', '.btn-register', function(e){

                e.stopImmediatePropagation();

                if($(this).attr('onclick') == '') {
                    e.preventDefault();
                    toastrMsg("예약 옵션을 선택해주세요.");
                    return false;
                }
            });

            //캡챠 input 숫자만 입력 가능
            $(document).on('keyup','#captInput', function () {

                let check = /^[0-9]+$/;

                if (!check.test($(this).val())) {
                    $(this).val('');
                    $('#btnSubmit').removeClass('is-active');

                } else {
                    if($(this).val().length == 4) {
                        $('#btnSubmit').addClass('is-active');
                    }
                }
            });

            //자동방지 입력문자 팝업 확인 버튼
            $(document).on('click','#btnSubmit', function(e){
                e.stopImmediatePropagation();
                showLoading();

                setTimeout(function() {
                    funcArray.reserStart($('#txtShelterNm').text());
                    //hideLoading();
                },100);

            });
        }
    }

    let funcArray = {
        //요일 한글명으로 return
        getDayWeekNm : function(dayWeek){
            switch (dayWeek) {
                case 1: return "월";
                case 2: return "화";
                case 3: return "수";
                case 4: return "목";
                case 5: return "금";
                case 6: return "토";
                case 7: return "일";
            }
        },

        //숨김
        eleHide : function() {
            $('.remainDiv').hide();
            $('.residenceProgram').hide();
            $('.addHum').hide();
            $('.totTitle').hide();
            $('div.payment').hide();
            $('.btn-register').closest('div').parent('div').hide();
            $('div.reserv').html('<a href="javascript:void(0);" onclick="" class="btn btn-register is-active">예약하기</a>');
        },

        //보기
        eleShow : function() {
            $('.remainDiv').show();
            $('.residenceProgram').show();
            $('.addHum').show();
            $('.totTitle').show();
            $('div.payment').show();
            $('.btn-register').closest('div').parent('div').show();
        },

        //'퇴실' 클릭 순서인 경우만 세번째 달의 1일 선택 가능(입실 선택할 때 아예 못하게 하기)
        selectPreventEvent : function(val) {
            
            if('20230101' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230102' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230103' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230104' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230105' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230106' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230107' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230108' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230109' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230110' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230111' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230112' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230113' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230114' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230115' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230116' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230117' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230118' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230119' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230120' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230121' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230122' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230123' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230124' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230125' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230126' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230127' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230128' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230129' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230130' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230131' == val) {
                funcArray.calendarClear();
                return false;
            }
            
        },
        //달력 및 선택값 초기화
        calendarClear : function(){
            //clear
            $('.start').removeClass('start');
            $('.end').removeClass('end');
            $('.selected').removeClass('selected');

            $("#startDt").html('-');
            $("#endDt").html('-');
            $('#lengthTxt').html('-');
            $(".length-stay").removeClass('selected');
            selectStartDate = null;
            selectEndDate = null;
        },
        //재조회 시 초기화
        clearSelectVal : function() {
            $('.addPeopleNum').val(0);	//추가인원
            $('div.payment dl:eq(0)').find('dt').text('-');
            $('div.payment dl:eq(0)').find('dd').text('0원');
            $('div.payment dl:eq(1)').find('dt:eq(0)').text('-');	//상품명
            $('div.payment dl:eq(1)').find('dd:eq(0)').text('0원');
            $('div.payment dl:eq(1)').find('dt:eq(1)').text('추가인원 : 0명');
            $('div.payment dl:eq(1)').find('dd:eq(1)').text('0원');
            $('.total').find('dd').html('<em>0</em>원');
        },
        //자동방지 입력문자 팝업 취소 시
        removeReserLayer : function(){
            $("#automatic-character").hide();
            $("#pnlRsrImg").html("");
            $('#automatic-character').empty();
            maskBackgroundOff();
        },
        //예약완료 팝업 닫기
        removeSucReservPop : function() {
            $('#reservation-information1').empty();
            closePopup('reservation-information1');
            //location.reload();
        },
        closeSucReservPop : function() {
            location.reload();
        },
        //F5 새로고침 막기
        noRefreshEvent : function() {
            if (event.keyCode == 116) {
                event.keyCode= 2;
                return false;
            }
            else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82))
            {
                return false;
            }
        },
        //라디오 선택 시
        checked : function(obj) {

            var id = $(obj).attr('id');
            var value = $(obj).val();
            var prdNm = $(obj).data('prdnm');
            var prdSalAmt = $(obj).data('amt');
            var remainCnt = $(obj).data('cnt');

            //전역 변수에 세팅.
            globalAmt = prdSalAmt;

            $('input[name="selectBtn"]').each(function(){
                if($(this).attr('id') == id) {
                    $('#' + id).attr('checked', true);
                }else {
                    $(this).attr('checked', false);
                }
            });

            //체류기간 값(박수)
            var baksu = '';
            $('.length-stay').each(function(){
                if($(this).hasClass('selected')) {
                    baksu = $(this).data('val');
                }
            });

            //선택 시 금액 세팅
            var bakPerPrice = prdSalAmt != 0 ? prdSalAmt.replace(/,/g, '') : prdSalAmt;
            var totProdPrice = Number(bakPerPrice);
            var totPrice = (Number(bakPerPrice) + (Number($('.addPeopleNum').val()*addOptionPrice)* Number(baksu))) ;

            //상품명과 상품가격 세팅
            $('div.payment dl:eq(0)').find('dt:eq(0)').html(prdNm);
            $('div.payment dl:eq(0)').find('dd:eq(0)').html(numberWithCommas(totProdPrice)+'원');

            //총 이용금액 결제 (예정) 금액
            $('.total').find('dd').html('<em>'+numberWithCommas(totPrice)+'</em>' +'원');

            //모든 옵션을 다 선택했을 시 예약하기 버튼으로(버튼 비활성처리 확인해봐야할듯..)
            if(selectStartDate != null && selectStartDate != '' && selectEndDate != null && selectEndDate != '') {
                if(selectStartDate != selectEndDate) {
                    $('div.reserv').html("<a href='javascript:void(0);' onclick=\"funcArray.goReserv('"+prdNm+"','"+value+"')"+"\" class='btn btn-register is-active'>예약하기</a>");
                }
            }
        },
        //프로그램 그리기
        drawProgram : function(){

            //값들 초기화
            funcArray.clearSelectVal();

            //예약 날짜 선택 유효성 체크
            if(selectStartDate == null || selectStartDate == '' || selectEndDate == null || selectEndDate == '' || selectStartDate == selectEndDate) {
                toastrMsg("예약날짜를 선택해주세요.");
                return false;
            }

            var minbakChkFlag = false;
            var selectedPrdCtgId = '';

            $.each($('input[name="minbakChk"]'), function(){

                if($(this).is(':checked')) {
                    minbakChkFlag = true;
                    selectedPrdCtgId = $(this).val();
                }
            });

            //민박촌 타입 선택 체크
            if(!minbakChkFlag) {
                toastrMsg("민박촌 타입을 선택해주세요.");
                return false;
            }

            //체크한 날짜 사용일 배열 구해서 같이 보냄.
            var checkDateArr = new Array();

            $.each($('.calendar-cell'), function(){

                if($(this).hasClass('selected') && !$(this).hasClass('end')) {

                    var val = $(this).attr('id');

                    checkDateArr.push(val);
                }
            });
            NetFunnel_Action({action_id:'reservation4'},function(ev, ret){
                ajaxCall({
                    url :  '/reservation/getResidenceInsttGoodsInfo.do',
                    data : { 'deptId' 		: 'B221001'
                        , 'orgnztGbn' 	: '08'
                        , 'useBgnDt' 	: selectStartDate.replace(/-/g, '')
                        , 'useEndDt' 	: selectEndDate.replace(/-/g, '')
                        , 'selectedPrdCtgId' : selectedPrdCtgId
                        , 'checkDateArr' : checkDateArr
                    },
                    success: function(dat){

                        var reservList = dat.insttGoodsInfo;
                        var optionPrice = dat.optMap.OPT_SAL_AMT;
                        var tblHtml = '';

                        $(".residenceProgram .tbody").empty();

                        //민박촌 예약현황 그리기
                        if(reservList != null && reservList != '' && reservList.length > 0) {

                            //보이기
                            funcArray.eleShow();

                            $.each(reservList, function(i, item){
                                tblHtml +='<tr>';
                                tblHtml +='    <td><input type="radio" name="selectBtn" value="'+item.prdId+'" data-prdnm="'+item.prdNmTot+'" data-amt="'+numberWithCommas(item.prdSalAmt)+'" data-cnt="'+item.totcnt+'" onclick="funcArray.checked(this);"/></td>';
                                tblHtml +='    <td>'+item.prdNmTot+'</td>';
                                tblHtml +='    <td class="form">';
                                tblHtml +='			<span>'+item.resiRoomInfo+'</span>';
                                tblHtml +='    </td>';
                                tblHtml +='    <td>'+numberWithCommas(item.prdSalAmt)+'원</td>';
                                tblHtml +='</tr>';
                            });

                            //옵션금액 세팅
                            if(optionPrice != null && optionPrice != '' && typeof optionPrice != 'undefined') {

                                if(optionPrice == 0) {
                                    optionPrice = 5000;
                                    addOptionPrice = optionPrice;
                                }else {
                                    addOptionPrice = optionPrice;
                                }
                            }

                            $("#drawImageButton").css("display","block");

                        } else {

                            //보이기
                            funcArray.eleShow();

                            tblHtml +='<tr>';
                            tblHtml +='		<td colspan="4">';
                            tblHtml +='			<div class="nodata">';
                            tblHtml +='				<span>예약가능한 객실이 없습니다. 다른 조건으로 조회해주세요.</span>';
                            tblHtml +='			</div>';
                            tblHtml +='		</td>';
                            tblHtml +='</tr>';
                            $("#drawImageButton").css("display","none");

                        }

                        $(".residenceProgram .tbody").append(tblHtml);
                    },
                    complete : function(){
                        NetFunnel_Complete();
                        hideLoading();
                    }
                });
            });

        },//end 프로그램 그리기

        //자동방지 입력문자 팝업 세팅
        drawAutoPreventPop : function() {

            var autoHtml = '';

            autoHtml += '     <div class="popup-wrap" style="top: 65px; bottom: 150px;">';
            autoHtml += '         <div class="popup-head">';
            autoHtml += '             <strong class="popup-title">예약가능</strong>';
            autoHtml += '             <button type="button" class="btn-close" onclick="funcArray.removeReserLayer();" title="닫기">';
            autoHtml += '                 <i class="icon-close"></i>';
            autoHtml += '             </button>';
            autoHtml += '         </div>';
            autoHtml += '         <div class="popup-container">';
            autoHtml += '             <table class="table">';
            autoHtml += '                 <caption>자동방지 입력문자</caption>';
            autoHtml += '                 <colgroup>';
            autoHtml += '                     <col style="width: 140px;">';
            autoHtml += '                     <col>';
            autoHtml += '                 </colgroup>';
            autoHtml += '                 <tbody class="tbody">';
            autoHtml += '                     <tr>';
            autoHtml += '                         <th scope="row">예약상품</th>';
            autoHtml += '                         <td id="txtShelterNm"></td>';
            autoHtml += '                     </tr>';
            autoHtml += '                     <tr>';
            autoHtml += '                         <th scope="row">사용기간</th>';
            autoHtml += '						  <td id="selRsrvtQntt"></td>';
            autoHtml += '                     </tr>';
            autoHtml += '                     <tr>';
            autoHtml += '                         <th scope="row">입실날짜</th>';
            autoHtml += '                         <td id="txtUseBgnDate"></td>';
            autoHtml += '                     </tr>';
            autoHtml += '                     <tr>';
            autoHtml += '                         <th scope="row">퇴실날짜</th>';
            autoHtml += '                         <td id="txtUseEndDate"></td>';
            autoHtml += '                     </tr>';
            autoHtml += '                     <tr>';
            autoHtml += '                         <th scope="row">추가인원</th>';
            autoHtml += '                         <td id="addInwon"></td>';
            autoHtml += '                     </tr>';
            autoHtml += '                     <tr>';
            autoHtml += '                         <th scope="row">결제(예정)금액</th>';
            autoHtml += '                         <td id="selPrice"></td>';
            autoHtml += '                     </tr>';
            autoHtml += '                 </tbody>';
            autoHtml += '             </table>';
            autoHtml += '             <div class="captcha-area">';
            autoHtml += '                 <span class="label">자동예약 방지문자</span>';
            autoHtml += '                 <span class="captcha" id="pnlRsrImg">캡챠영역</span>';
            autoHtml += '                 <label for="captInput" class="hidden-text">자동예약 방지문자</label><input type="text" class="input-text" id="captInput" title="자동예약 방지문자" maxlength="4">';
            autoHtml += '             </div>';
            autoHtml += '             <p class="copy-notice">※ 예약 완료된 상품에 대해서는 마이페이지 나의예약목록 에서 확인 후 결제 가능합니다.</p>';
            autoHtml += '             <div class="btn-area">';
            autoHtml += '                 <button class="btn btn-cancel" id="btnClose" onclick="funcArray.removeReserLayer();">취소</button>';
            autoHtml += '                 <button class="btn btn-confirm is-active" id="btnSubmit">확인</button>';
            autoHtml += '             </div>';
            autoHtml += '         </div>';
            autoHtml += '     </div>';

            $('#automatic-character').append(autoHtml);

        },

        //예약완료 팝업
        drawSucReservPop : function(prdNm, expiDtm) {

            var popHtml = '';

            popHtml += '<div class="popup-wrap">';
            popHtml += '	<div class="popup-head">';
            popHtml += '		<strong class="popup-title">예약완료안내</strong>';
            popHtml += '		<button type="button" class="btn-close" onclick="funcArray.closeSucReservPop();" title="닫기">';
            popHtml += '			<i class="icon-close"></i>';
            popHtml += '		</button>';
            popHtml += '	</div>';
            popHtml += '	<div class="popup-container">';
            popHtml += '		<div class="center">';
            popHtml += '			<i class="icon-check"></i>';
            popHtml += '			<strong class="title-1">예약이 완료되었습니다.</strong>';
            popHtml += '			<p class="copy-mid">'+prdNm+'의 <br>결제 만기일시는 <em>'+expiDtm+'</em> 까지 입니다.<br>미 결제시 자동 취소되니 유의 하시기 바랍니다.</p>';
            popHtml += '			<p class="copy-sm">마이페이지 나의예약목록 에서 확인 후 결제를 계속 진행해주세요.</p>';
            popHtml += '		</div>';
            popHtml += '		<div class="btn-area">';
            popHtml += '			<a href="/mypage/dashBoard.do" class="btn btn-link">나의 예약목록 보기</a>';
            popHtml += '		</div>';
            popHtml += '	</div>';
            popHtml += '</div>';

            $('#reservation-information1').append(popHtml);
            openPopup('reservation-information1');

        },

        //예약하기 전 자동방지문자 팝업 세팅
        beforeReser : function(prdNm, prdId) {

            var parkNm = '태백산'; 	//국립공원
            var txtShelterNm = '';	//민박촌명
            var txtUseBgnDate = '';	//시작일
            var txtUseEndDate = '';	//종료일
            var selRsrvtQntt = '';	//박수
            var selPrice = '';		//가격

            //자동방지 입력문자 팝업 세팅
            funcArray.drawAutoPreventPop();

            //체류기간 값(박수)
            var checkPer = '';
            $('.length-stay').each(function(){
                if($(this).hasClass('selected')) {
                    checkPer = $(this).data('val');
                    selRsrvtQntt = $(this).text();
                }
            });

            //선택한 민박촌 명
            txtShelterNm = prdNm;
            //시작일
            txtUseBgnDate = $('#startDt').text();
            //종료일
            txtUseEndDate = $('#endDt').text();
            //가격
            selPrice = $('.total').find('dd em').text();

            //팝업에 세팅
            $('#txtShelterNm').html(txtShelterNm);		//민박촌
            $('#txtUseBgnDate').text(txtUseBgnDate);	//시작일
            $('#txtUseEndDate').text(txtUseEndDate);	//종료일
            $('#selRsrvtQntt').text(selRsrvtQntt);		//박수
            $('#selPrice').text(selPrice+'원 (부가세 포함)');			//가격
            $("#period").val(checkPer);					//체류기간 값 hidden
            $('#addInwon').text($('.addPeopleNum').val() == 0 ? '없음' : $('.addPeopleNum').val()+'명');

            //자동예약 방지문자
            $("#pnlRsrImg").html("");
            $("#pnlRsrImg").append("<img alt='자동예약 방지문자'/>").find("img:last").attr("src", "/reserCaptcha.do?dummy=" + (new Date()).getTime());
            $('.input-text').val("");
            $('.input-text').attr('placeholder', '위 문자를 입력해주세요.');
            $('.input-text').attr('name', 'captcha').addClass('txt-captcha');

            //자동방지 입력문자 팝업 노출
            $('#automatic-character').show();
            $('.txt-captcha').focus();

            //기본 hidden 세팅
            $("#fRsrvtQntt").val(1);
            $("#fUseBgnDtm").val(selectStartDate.replace(/-/g, ''));	//사용시작일
            $('#fUseEndDtm').val(selectEndDate.replace(/-/g, ''));		//사용종료일
            $("#fFcltId").val(prdId);	//상품ID
            $("#fRsrvtType").val("R");

            //예약상세에 넣을 값 다시 히든 계산(상품금액 / 박수)
            var totPrice = Number($('div.payment dl:eq(0)').find('dd:eq(0)').text().replace(/,/g, '').replace(/원/g, '')) / Number(checkPer);

            $('#detailPrice').val(totPrice);
        },

        //예약하기 버튼 클릭
        goReserv : function(prdNm, prdId){

            //로그인 체크
            ajaxCall({
                url :  '/common/ajax/checkResidencePolicy.do',
                data : {},
                success: function(dat){
                    //예약하기 전 로그인이 안 되어 있을 때
                    if(dat.result == 'NLOGIN'){
                        loginPopup("funcArray.goReserv('"+prdNm+"','"+prdId+"');");
                    } else {
                        //예약하기 전 자동방지문자 팝업 세팅
                        funcArray.beforeReser(prdNm, prdId);
                    }

                }
            });

        },

        //예약하기
        reserStart : function(prdNm) {

            var txtCaptcha = $("#captInput");

            if(txtCaptcha.val() == null || txtCaptcha.val().trim() == "") {
                toastrMsg("자동예약방지글을 입력해주세요.","경고 메시지","e");
                txtCaptcha.focus();
                return;
            }

            var prdId = $("input[name='selectBtn']:checked").val();
            var optionPrice = Number($('.addPeopleNum').val() * addOptionPrice);

            ajaxCall({
                url :  '/common/ajax/registerResidenceReser.do',
                data : { 'rsrvtQntt'  	: $("#fRsrvtQntt").val()
                    , 'deptId'	  	: $('#fDprtmId').val()
                    , 'prdId'	  	: prdId
                    , 'optionPrice'	: optionPrice
                    , 'useBgnDtm' 	: $("#fUseBgnDtm").val()
                    , 'useEndDtm' 	: $('#fUseEndDtm').val()
                    , 'rsvtMmbId' 	: 'ss1830'
                    , 'prdDvcd'   	: $("#fRsrvtType").val()
                    , 'rsvtTpcd'  	: '01'
                    , 'rsvtDvcd'  	: '01'
                    , 'rsvtStcd'  	: '20'
                    , 'period'    	: $("#period").val()
                    , 'price'     	: $('#detailPrice').val()
                    , 'pttNopCnt' 	: '1'
                    , 'addPeopleNum': $('.addPeopleNum').val()
                    , 'captcha'   	: $("#captInput").val()
                },
                success: function(dat){

                    //팝업 초기화
                    funcArray.removeReserLayer();
                    funcArray.removeSucReservPop();

                    if(dat.result != null && dat.result != '') {
                        toastrMsg(dat.result);

                        if(dat.returnURL != null && dat.returnURL != '') {
                            location.href = dat.returnURL;
                        }
                        return false;
                    }

                    //정책
                    if(dat.resultCd != null && dat.resultCd != '') {

                        if(dat.resultCd == 'F') {
                            //toastrMsg(dat.resultMsg);
                            alertPopup({
                                title:'예약불가 안내',
                                subTitle:'예약불가 안내',
                                content:dat.resultMsg,
                                type:'error'
                            });
                            //hideLoading();
                            //return false;
                        } else if(dat.resultCd == 'S') {

                            var ymdhm = function(value){

                                if(value){
                                    var year = value.substring(0, 4);
                                    var month = value.substring(4, 6);
                                    var day = value.substring(6, 8);
                                    var hour = value.substring(8, 10);
                                    var minute = value.substring(10, 12);
                                    //var second = value.substring(12, 14);
                                    return year + '년 ' + month + '월 ' + day + '일 ' + hour + ':' + minute;
                                }
                                return '';
                            };

                            //STLM_EXPI_DTM 결제만기일시
                            if(dat.reservationMap != null && dat.reservationMap != '') {
                                //예약완료 팝업
                                funcArray.drawSucReservPop(prdNm, ymdhm(dat.dataMap.sttlmMtDtm2));
                            }
                        }
                    }

                    hideLoading();
                }
            });
        },//reserStart end

        //객실보기
        drawImage : function(){

            var minbakCheckLen = $('input[name="minbakChk"]:checked').length;
			var minbakPrdId = $("input[name='selectBtn']:checked").val();
            if(minbakCheckLen == 0) {
                toastrMsg("민박촌 타입을 선택해주세요.");
                return false;
            }


            if(minbakPrdId == null || minbakPrdId == '') {
                toastrMsg("객실을 선택해주세요.");
                return false;
            }

            ajaxCall({
                url :  '/reservation/getResiInsttImages.do',
                data : { 'deptId' 	   : 'B221001',
                    'prdCtgId' : $('input[name="minbakChk"]:checked').val(),
                    'prdId'	   : minbakPrdId
                },
                dataType : 'html',
                success: function(dat) {
                    $("#resi-view").html('');
                    $("#resi-view").append(dat);
                    openPopup("resi-view");
                },
                error : function(){
                    toastrMsg("조회 중 오류가 발생하였습니다.");
                }
            });
        },//end 이미지 load

    }
</script>
			<div class="page-location">
				<span>홈</span> <span>예약하기</span> <span>민박촌</span>
			</div>
			<div class="reservation responsive">
				<h3 class="title">민박촌 예약하기</h3>
				<div class="title-area">
					<span class="label"><i class="icon-location"></i> 태백산</span>
					<h4 class="title">태백산 민박촌 예약현황</h4>
					<p class="copy">민박촌은 개시기간 기준 아이디 당 4건으로 제한되며, 동일 날짜의 민박촌은 선택불가
						합니다.</p>
				</div>
				<div class="box-guide">
					<div class="monthly-check">
						<strong class="title">민박촌 예약 관련하여 전체 월별 잔여현황을 우측 버튼을 눌러
							확인 가능 합니다.</strong> <a href="searchResidenceMonthReservation.html"
							class="btn btn-monthly">월별 잔여현황 확인</a>
					</div>
					<ul class="dot-list">
						<li>민박촌은 개시기간 기준 아이디 당 4건으로 제한되며, 동일 날짜의 민박촌은 선택 불가 합니다.</li>
						<li>인기 민박촌은 이용자가 많아 선택을 하는 도중 조기 마감될 수 있습니다.</li>
						<li>강원 태백시 코로나19 현황 주소 : <a
							href="https://www.taebaek.go.kr/intro.jsp">https://www.taebaek.go.kr/intro.jsp</a></li>
					</ul>
				</div>
				<!-- 예약일 설정 -->
				<div class="title-area">
					<h4 class="title">예약일 설정</h4>
					<div class="btn-area">
						<button class="btn btn-refresh">
							<i class="icon-refresh"></i> <span>새로고침</span>
						</button>
					</div>
				</div>
				<div class="detail-info">
					<dl class="mb-block">
						<dt>예약일 선택</dt>
						<dd>
							<div class="calendar-container">
								<div class="calendar">
									<!-- 현재월 캘린더 -->
									<div class="calendar-head">
										<div class="calendar-title">
											<span>2022</span>. <span>11</span>
										</div>
									</div>
									<div class="calendar-body">
										<div class="calendar-week">
											<div class="day sun">SUN</div>
											<div class="day">MON</div>
											<div class="day">TUE</div>
											<div class="day">WED</div>
											<div class="day">THE</div>
											<div class="day">FRI</div>
											<div class="day sat">SAT</div>
										</div>
										<div class="calendar-day">

											<!-- disabled -->
											<div class="calendar-cell     disabled  " data-date=""
												data-dayweek=""></div>

											<!-- disabled -->
											<div class="calendar-cell     disabled  " data-date=""
												data-dayweek=""></div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-01     disabled "
												data-date="2022-11-01" data-dayweek="2">1</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-02     disabled "
												data-date="2022-11-02" data-dayweek="3">2</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-03     disabled "
												data-date="2022-11-03" data-dayweek="4">3</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-04     disabled "
												data-date="2022-11-04" data-dayweek="5">4</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-05  sat   disabled "
												data-date="2022-11-05" data-dayweek="6">5</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-06   sun  disabled "
												data-date="2022-11-06" data-dayweek="7">6</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-07     disabled "
												data-date="2022-11-07" data-dayweek="1">7</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-08     disabled "
												data-date="2022-11-08" data-dayweek="2">8</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-09     disabled "
												data-date="2022-11-09" data-dayweek="3">9</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-10 today    disabled "
												data-date="2022-11-10" data-dayweek="4">10</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-11      "
												data-date="2022-11-11" data-dayweek="5">11</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-12  sat    "
												data-date="2022-11-12" data-dayweek="6">12</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-13   sun   "
												data-date="2022-11-13" data-dayweek="7">13</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-14      "
												data-date="2022-11-14" data-dayweek="1">14</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-15      "
												data-date="2022-11-15" data-dayweek="2">15</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-16      "
												data-date="2022-11-16" data-dayweek="3">16</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-17      "
												data-date="2022-11-17" data-dayweek="4">17</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-18      "
												data-date="2022-11-18" data-dayweek="5">18</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-19  sat    "
												data-date="2022-11-19" data-dayweek="6">19</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-20   sun   "
												data-date="2022-11-20" data-dayweek="7">20</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-21      "
												data-date="2022-11-21" data-dayweek="1">21</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-22      "
												data-date="2022-11-22" data-dayweek="2">22</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-23      "
												data-date="2022-11-23" data-dayweek="3">23</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-24      "
												data-date="2022-11-24" data-dayweek="4">24</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-25      "
												data-date="2022-11-25" data-dayweek="5">25</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-26  sat    "
												data-date="2022-11-26" data-dayweek="6">26</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-27   sun   "
												data-date="2022-11-27" data-dayweek="7">27</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-28      "
												data-date="2022-11-28" data-dayweek="1">28</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-29      "
												data-date="2022-11-29" data-dayweek="2">29</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-30      "
												data-date="2022-11-30" data-dayweek="3">30</div>

										</div>
									</div>
								</div>

								<!-- 다음 달 캘린더 -->
								<div class="calendar">
									<div class="calendar-head">
										<div class="calendar-title">
											<span>2022</span>. <span>12</span>
										</div>
									</div>
									<div class="calendar-body">
										<div class="calendar-week">
											<div class="day sun">SUN</div>
											<div class="day">MON</div>
											<div class="day">TUE</div>
											<div class="day">WED</div>
											<div class="day">THE</div>
											<div class="day">FRI</div>
											<div class="day sat">SAT</div>
										</div>
										<div class="calendar-day">

											<div class="calendar-cell     disabled " data-date=""
												data-dayweek=""></div>

											<div class="calendar-cell     disabled " data-date=""
												data-dayweek=""></div>

											<div class="calendar-cell     disabled " data-date=""
												data-dayweek=""></div>

											<div class="calendar-cell     disabled " data-date=""
												data-dayweek=""></div>

											<div class="calendar-cell 2022-12-01     "
												data-date="2022-12-01" data-dayweek="4">1</div>

											<div class="calendar-cell 2022-12-02     "
												data-date="2022-12-02" data-dayweek="5">2</div>

											<div class="calendar-cell 2022-12-03  sat   "
												data-date="2022-12-03" data-dayweek="6">3</div>

											<div class="calendar-cell 2022-12-04   sun  "
												data-date="2022-12-04" data-dayweek="7">4</div>

											<div class="calendar-cell 2022-12-05     "
												data-date="2022-12-05" data-dayweek="1">5</div>

											<div class="calendar-cell 2022-12-06     "
												data-date="2022-12-06" data-dayweek="2">6</div>

											<div class="calendar-cell 2022-12-07     "
												data-date="2022-12-07" data-dayweek="3">7</div>

											<div class="calendar-cell 2022-12-08     "
												data-date="2022-12-08" data-dayweek="4">8</div>

											<div class="calendar-cell 2022-12-09     "
												data-date="2022-12-09" data-dayweek="5">9</div>

											<div class="calendar-cell 2022-12-10  sat   "
												data-date="2022-12-10" data-dayweek="6">10</div>

											<div class="calendar-cell 2022-12-11   sun  "
												data-date="2022-12-11" data-dayweek="7">11</div>

											<div class="calendar-cell 2022-12-12     "
												data-date="2022-12-12" data-dayweek="1">12</div>

											<div class="calendar-cell 2022-12-13     "
												data-date="2022-12-13" data-dayweek="2">13</div>

											<div class="calendar-cell 2022-12-14     "
												data-date="2022-12-14" data-dayweek="3">14</div>

											<div class="calendar-cell 2022-12-15     "
												data-date="2022-12-15" data-dayweek="4">15</div>

											<div class="calendar-cell 2022-12-16     "
												data-date="2022-12-16" data-dayweek="5">16</div>

											<div class="calendar-cell 2022-12-17  sat   "
												data-date="2022-12-17" data-dayweek="6">17</div>

											<div class="calendar-cell 2022-12-18   sun  "
												data-date="2022-12-18" data-dayweek="7">18</div>

											<div class="calendar-cell 2022-12-19     "
												data-date="2022-12-19" data-dayweek="1">19</div>

											<div class="calendar-cell 2022-12-20     "
												data-date="2022-12-20" data-dayweek="2">20</div>

											<div class="calendar-cell 2022-12-21     "
												data-date="2022-12-21" data-dayweek="3">21</div>

											<div class="calendar-cell 2022-12-22     "
												data-date="2022-12-22" data-dayweek="4">22</div>

											<div class="calendar-cell 2022-12-23     "
												data-date="2022-12-23" data-dayweek="5">23</div>

											<div class="calendar-cell 2022-12-24  sat   "
												data-date="2022-12-24" data-dayweek="6">24</div>

											<div class="calendar-cell 2022-12-25   sun  "
												data-date="2022-12-25" data-dayweek="7">25</div>

											<div class="calendar-cell 2022-12-26     "
												data-date="2022-12-26" data-dayweek="1">26</div>

											<div class="calendar-cell 2022-12-27     "
												data-date="2022-12-27" data-dayweek="2">27</div>

											<div class="calendar-cell 2022-12-28     "
												data-date="2022-12-28" data-dayweek="3">28</div>

											<div class="calendar-cell 2022-12-29     "
												data-date="2022-12-29" data-dayweek="4">29</div>

											<div class="calendar-cell 2022-12-30     "
												data-date="2022-12-30" data-dayweek="5">30</div>

											<div class="calendar-cell 2022-12-31  sat   "
												data-date="2022-12-31" data-dayweek="6">31</div>

										</div>
									</div>
								</div>

								<!--마지막 월 비활성화 예정 -->
								<div class="calendar">
									<div class="calendar-head">
										<div class="calendar-title">
											<span>2023</span>. <span>1</span>
										</div>
									</div>
									<div class="calendar-body">
										<div class="calendar-week">
											<div class="day sun">SUN</div>
											<div class="day">MON</div>
											<div class="day">TUE</div>
											<div class="day">WED</div>
											<div class="day">THE</div>
											<div class="day">FRI</div>
											<div class="day sat">SAT</div>
										</div>
										<div class="calendar-day">

											<div class="calendar-cell 2023-01-01   sun  "
												data-date="2023-01-01" data-dayweek="7">1</div>

											<div class="calendar-cell 2023-01-02     disabled"
												data-date="2023-01-02" data-dayweek="1">2</div>

											<div class="calendar-cell 2023-01-03     disabled"
												data-date="2023-01-03" data-dayweek="2">3</div>

											<div class="calendar-cell 2023-01-04     disabled"
												data-date="2023-01-04" data-dayweek="3">4</div>

											<div class="calendar-cell 2023-01-05     disabled"
												data-date="2023-01-05" data-dayweek="4">5</div>

											<div class="calendar-cell 2023-01-06     disabled"
												data-date="2023-01-06" data-dayweek="5">6</div>

											<div class="calendar-cell 2023-01-07  sat   disabled"
												data-date="2023-01-07" data-dayweek="6">7</div>

											<div class="calendar-cell 2023-01-08   sun  disabled"
												data-date="2023-01-08" data-dayweek="7">8</div>

											<div class="calendar-cell 2023-01-09     disabled"
												data-date="2023-01-09" data-dayweek="1">9</div>

											<div class="calendar-cell 2023-01-10     disabled"
												data-date="2023-01-10" data-dayweek="2">10</div>

											<div class="calendar-cell 2023-01-11     disabled"
												data-date="2023-01-11" data-dayweek="3">11</div>

											<div class="calendar-cell 2023-01-12     disabled"
												data-date="2023-01-12" data-dayweek="4">12</div>

											<div class="calendar-cell 2023-01-13     disabled"
												data-date="2023-01-13" data-dayweek="5">13</div>

											<div class="calendar-cell 2023-01-14  sat   disabled"
												data-date="2023-01-14" data-dayweek="6">14</div>

											<div class="calendar-cell 2023-01-15   sun  disabled"
												data-date="2023-01-15" data-dayweek="7">15</div>

											<div class="calendar-cell 2023-01-16     disabled"
												data-date="2023-01-16" data-dayweek="1">16</div>

											<div class="calendar-cell 2023-01-17     disabled"
												data-date="2023-01-17" data-dayweek="2">17</div>

											<div class="calendar-cell 2023-01-18     disabled"
												data-date="2023-01-18" data-dayweek="3">18</div>

											<div class="calendar-cell 2023-01-19     disabled"
												data-date="2023-01-19" data-dayweek="4">19</div>

											<div class="calendar-cell 2023-01-20     disabled"
												data-date="2023-01-20" data-dayweek="5">20</div>

											<div class="calendar-cell 2023-01-21  sat   disabled"
												data-date="2023-01-21" data-dayweek="6">21</div>

											<div class="calendar-cell 2023-01-22   sun  disabled"
												data-date="2023-01-22" data-dayweek="7">22</div>

											<div class="calendar-cell 2023-01-23     disabled"
												data-date="2023-01-23" data-dayweek="1">23</div>

											<div class="calendar-cell 2023-01-24     disabled"
												data-date="2023-01-24" data-dayweek="2">24</div>

											<div class="calendar-cell 2023-01-25     disabled"
												data-date="2023-01-25" data-dayweek="3">25</div>

											<div class="calendar-cell 2023-01-26     disabled"
												data-date="2023-01-26" data-dayweek="4">26</div>

											<div class="calendar-cell 2023-01-27     disabled"
												data-date="2023-01-27" data-dayweek="5">27</div>

											<div class="calendar-cell 2023-01-28  sat   disabled"
												data-date="2023-01-28" data-dayweek="6">28</div>

											<div class="calendar-cell 2023-01-29   sun  disabled"
												data-date="2023-01-29" data-dayweek="7">29</div>

											<div class="calendar-cell 2023-01-30     disabled"
												data-date="2023-01-30" data-dayweek="1">30</div>

											<div class="calendar-cell 2023-01-31     disabled"
												data-date="2023-01-31" data-dayweek="2">31</div>

										</div>
									</div>
								</div>
							</div>
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

								<li><span class="radio-1"> <input type="radio"
										name="minbakChk" id="mbTp0" value="0300202"> <label
										for="mbTp0">개인형 29.7㎡(9평/2명) 침대</label>
								</span></li>

								<li><span class="radio-1"> <input type="radio"
										name="minbakChk" id="mbTp1" value="0300201"> <label
										for="mbTp1">개인형 29.7㎡(9평/2명) 온돌</label>
								</span></li>

								<li><span class="radio-1"> <input type="radio"
										name="minbakChk" id="mbTp2" value="0300101"> <label
										for="mbTp2">가족형 49.5㎡(15평/6명) 복층</label>
								</span></li>

								<li><span class="radio-1"> <input type="radio"
										name="minbakChk" id="mbTp3" value="0300102"> <label
										for="mbTp3">가족형 59.4㎡(18평/6명) 복층</label>
								</span></li>

								<li><span class="radio-1"> <input type="radio"
										name="minbakChk" id="mbTp4" value="0300301"> <label
										for="mbTp4">단체형 105.6㎡(32평/13명) 복층</label>
								</span></li>

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
									4일</span>
							</div>
						</dd>
					</dl>
				</div>

				<button class="btn btn-search" onclick="funcArray.drawProgram();">
					<i class="icon-search"></i> <span>민박촌 잔여현황 조회</span>
				</button>

				<div class="title-area remainDiv" style="display: none;">
					<h4 class="title">민박촌 잔여현황</h4>
					<div class="btn-area">
						<button class="btn btn-view" onclick="funcArray.drawImage();"
							id="drawImageButton" style="display: none">객실 보기</button>
					</div>
				</div>
				<table class="table residenceProgram" style="display: none;">
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
				<div class="border-box mt-10 addHum" style="display: none;">
					<div class="option-wrap">
						<h5>추가인원 설정</h5>
						<ul class="option-list">
							<li><span class="quantity-input">
									<button class="btn minus add" id="minusB">
										<i class="icon-minus"></i>
									</button> <label for="addPeopleNum" class="hidden-text">총참여인원</label> <input
									type="number" class="addPeopleNum" id="addPeopleNum" value="0"
									readonly="" title="총 참여 인원">
									<button class="btn plus add" id="plusB">
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
				<div class="title-area totTitle" style="display: none;">
					<h4 class="title">총 이용금액</h4>
				</div>

				<div class="payment" style="display: none;">
					<dl>
						<dt>-</dt>
						<dd>0원</dd>
					</dl>
					<dl>
						<dt>추가인원 : 0명</dt>
						<dd>0원</dd>
					</dl>
					<dl class="total">
						<dt>결제(예정)금액</dt>
						<dd>
							<em>0</em>원
						</dd>
					</dl>
				</div>

				<div class="board-bottom" style="display: none;">
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

		<footer id="footer">
			<ul class="content">
				<li>
					<address>(국립공원공단) 강원도 원주시 혁신로 22 (우)26466</address>
				</li>
				<li>사업자등록번호: 211-82-06541</li>
				<li>예약안내: <a href="tel:1670-9201">1670-9201</a> (평일 09-18시,
					점심시간 12-13시)
				</li>
				<li>FAX: 033-769-9579</li>
				<li>이메일: csnp@knps.or.kr</li>
			</ul>
			<p class="copyright">Copyright@Korea National Park Service. All
				Rights Reserved.</p>
			<div class="policy-area">
				<a href="../contents/copyrightPolicy.html" class="btn">저작권정책</a> <a
					href="http://www.knps.or.kr/portal/main/contents.do?menuNo=7020135"
					class="btn" target="_blank"
					style="font-weight: bold; color: #0033cc; background: #ffffff;">개인정보처리방침</a>
			</div>
		</footer>


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
	$(function(){
		let responseMessage = "";
		if(responseMessage != ""){
			toastrMsg(responseMessage);
		}
		let retChk = "";
		if(retChk == "Y"){
			alert(responseMessage);
			history.back();
		}
	})
</script>
</body>

<!-- Mirrored from reservation.knps.or.kr:443/reservation/searchSimpleResidenceReservation.do by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 10 Nov 2022 06:59:25 GMT -->
</html>
