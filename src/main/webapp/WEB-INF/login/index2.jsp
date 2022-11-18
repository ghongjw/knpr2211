<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<meta name="viewport" content="width=device-width">

<body>
    <div id="wrap" class="main scroll-x">
	<div id="wrap" class="sub">
<%@ include file="../common/header.jsp" %>
			<div id="container">
		<script>

    //이전에 클릭한 적이 있는지 체크. (데이터 중복조회 방지용)
    let isSelect = {
        tab3 : "N",
        tab4 : "N"
    }

    $(function(){
        init.loadEvent();
    })


    let init = {
        //클릭이벤트 load
        loadEvent : function(){
            $('.nav-tabs > li').click(function(){
                event.preventDefault();
                $(".nav-tabs > li").removeClass('is-active');
                $(this).addClass('is-active');
                $('.tab-content > div').removeClass('is-active');
                $("#"+$(this).data("tabid")).addClass('is-active');

                let tabId = $(this).data("tabid");

                /**************************
                 * tab3 : 생태탐방원, tab4:민박촌
                 *생태탐방원 민박촌은 여기서 데이터 조회
                 * 나머지 간편예약은 각 include 된 페이지에서 조회
                 */
                if(tabId == 'tab1'){
                    $('[data-reservation-area="step"]').removeClass('step2').addClass('step1');
                    $('[data-reservation-area="stepText"]').html('STEP.1');
                    $('#tab1').find('[data-reservation-step="2"]').hide();
                    $('#tab1').find('[data-reservation-step="1"]').css('display', '');
                    $('#tab1').find('[data-template-id="camp-btn-area"]').css('display', 'none');
                }else if(tabId == 'tab2'){
                    $('[data-reservation-area="step"]').removeClass('step2').addClass('step1');
                    $('[data-reservation-area="stepText"]').html('STEP.1');
                    $('#tab2').find('[data-reservation-step="2"]').hide();
                    $('#tab2').find('[data-reservation-step="1"]').css('display', '');
                }else if(tabId == 'tab3'){
                    if(isSelect[tabId] == 'N'){
                        ajaxCall({
                            url :  '/eco/searchEcoSmplReservation.do;jsessionid=B10F1063E24840FADF4994E69491FEB4.U2007',
                            dataType : 'html',
                            success : function(dat) {
                                $("#tab3").append(dat);
                            },
                            error : function(){
                                toastrMsg("조회 중 오류가 발생하였습니다.");
                            },
                            complete : function(){
                                hideLoading();
                                ecoChangeStep('1');
                            }
                        });
                    }else{
                        ecoChangeStep('1');
                    }

                }else  if(tabId == 'tab4'){
                    if(isSelect[tabId] == 'N'){
                        ajaxCall({
                            url :  '/reservation/simpleSearchSimpleResidenceReservation.do;jsessionid=B10F1063E24840FADF4994E69491FEB4.U2007',
                            dataType : 'html',
                            success : function(dat) {
                                $("#tab4").append(dat);
                            },
                            error : function(){
                                toastrMsg("조회 중 오류가 발생하였습니다.");
                            },
                            complete : function(){
                                hideLoading();
                                rsdnChangeStep('1');
                            }
                        });
                    }else{
                        rsdnChangeStep('1');
                    }

                }
                //한번 클릭했으면 값 Y로 변경 ( 다음 클릭 시 조회 하지 않기 위해 )
                isSelect[tabId] = 'Y';
            });
        }
    }
    function closePop(id){
        $("#"+id).css('display','none');
    }
    /*참관인 나중에재활용
    function fn_observerModal(){
        closePop('layer_popup2');
        openPopup('opserverModal');
    }*/
    function fn_golottery() {
        closePop('layer_popup');
        location.href = "reservation/selectCampLottery.html";
    }
    function fn_goTrail() {
        closePop('layer_popup3');
        //window.open("https://www.knps.or.kr/front/portal/open/pnewsDtl.do?menuNo=8000517&pnewsId=PNEWSM022141&searchParkId=120400&pnewsGrpCd=PNE01")
    }
    function fn_goCamping(){
        closePop('layer_popup');
        window.open("https://www.knps.or.kr/front/portal/open/pnewsList.do?pnewsGrpCd=BBS01&amp;menuNo=7020013");
    }
    function fn_observerRegistProc(){
        let reg_name = /^[가-힣]{2,10}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; // "|"를 사용

        //신청자명
        if($('#apctNm').val() == null || $('#apctNm').val() == '') {
            toastrMsg('신청자명을 입력해주세요.');
            return false;
        }

        if(!reg_name.test($('#apctNm').val())) {
            toastrMsg('신청자명이 정확하지 않습니다.');
            return false;
        }

        /*휴대폰번호체크*/
        if($("#apctPhno").val() == null || $("#apctPhno").val() == ""){
            toastrMsg("휴대폰 번호는 필수 입력사항입니다.")
            return false;
        }

        let regexp = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
        if(regexp.test($("#apctPhno").val()) == false){
            toastrMsg("정확하지 않은 휴대폰 번호를 입력했습니다.");
            return false;
        }

        //개인정보 수집 동의
        if(!$('#agreementY').is(':checked')) {
            toastrMsg('개인정보 수집·이용하는데 동의하셔야 신청이 가능합니다.');
            return false;
        }

        ajaxCall({
            url :  '/reqobs/registObserver.do;jsessionid=B10F1063E24840FADF4994E69491FEB4.U2007',
            data : $("#FrmConfirm").serialize(),
            success: function(dat){
                closePop('opserverModal');
                if(dat.result == 'Y'){
                    alertPopup({
                        title : dat.messageTitle,
                        subTitle : dat.messageTitle,
                        content : dat.messageContent
                    });
                }else{
                    alertPopup({
                        title : dat.messageTitle,
                        subTitle : dat.messageTitle,
                        content : dat.messageContent,
                        type:'error'
                    });
                }
            }
        });

    }
</script>
<div>
    <main>
    
    <!-- 슬라이더 시작 -->
        <section>
            <div class="slide-popup">
                <h3 class="title">주요공지</h3>
                



<script>
    $(function(){
        let swiper1 = new Swiper('.slide-popup .swiper', {
            loop: 'true',
            autoplay: {
                delay: 6000,
                disableOnInteraction: false,
            },
            pagination: {
                el: '.swiper-pagination',
                type: "fraction"
            },
            navigation: {
                nextEl: "#popupBtnNext",
                prevEl: "#popupBtnPrev",
            },
        });
        $('.swiper-btn .btn').on('click', function () {
            if ($(this).hasClass("start")) {
                $(this).attr("class", "btn pause");
                $(this).attr("title", "일시정지");
                swiper1.autoplay.start();
            } else {
                $(this).attr("class", "btn start");
                $(this).attr("title", "재생");
                swiper1.autoplay.stop();
            }
            return false;
        });
    })
</script>
<!-- 슬라이더 jsp -->
<div class="swiper">
    <div class="swiper-wrapper">
        
            
                
                <div class="swiper-slide slide0">
                    <a href="#" >
                    <img src="bbs/popup/banner20220731.png" alt="국립공원 예약시스템은 크롬과 엣지에 최적화되어 있습니다." >
                    </a>
                </div>
                
                <div class="swiper-slide slide1">
                    <a href="contents/rsvtRefundPolicy.html" >
                    <img src="bbs/popup/220725_popup.jpg" alt="예약대기 변경 안내 - 앞 예약자 결제 시 대기예약이 자동 취소됨을 안내드립니다." >
                    </a>
                </div>
                
                <div class="swiper-slide slide2">
                    <a href="#" >
                    <img src="bbs/popup/notice3.png" alt="2022년 예약 시작일 안내" >
                    </a>
                </div>
                
                <div class="swiper-slide slide3">
                    <a href="https://www.knps.or.kr/front/portal/open/pnewsDtl.do?menuNo=8000517&amp;pnewsId=PNEWSM022141&amp;searchParkId=120400&amp;pnewsGrpCd=PNE01" target="_blank">
                    <img src="bbs/popup/trailBannerPop.png" alt="설악산 흘림골탐방로 탐방로 예약제 운영 안내" >
                    </a>
                </div>
                
                <div class="swiper-slide slide4">
                    <a href="#" >
                    <img src="bbs/popup/naturehouseBanner.png" alt="자연의집 신규 운영안내" >
                    </a>
                </div>
                
                <div class="swiper-slide slide5">
                    <a href="#" >
                    <img src="bbs/popup/blanket.png" alt="모포대여중단" >
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
                    <span class="progressbar-fill step1" data-reservation-area="step"></span>
                    <span class="text" data-reservation-area="stepText">STEP.1</span>
                </div>
                <div class="content">
                    <ul class="nav-tabs">
                        <li data-tabid="tab1"><a href="#tab1">야영장</a></li>
                        <li class="is-active" data-tabid="tab2"><a href="#tab2">대피소</a></li>
                        <li data-tabid="tab3"><a href="#tab3">생태탐방원</a></li>
                        <li data-tabid="tab4"><a href="#tab4">민박촌</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane" id="tab1">
                            <!-- 야영장 -->
                             





<script src="assets/js/lib/handlebars.min.js"></script>
<script src="assets/js/lib/netfunnel.js"></script>




<div class="grid-row" data-reservation-step="1">
    <div class="grid-cell">
        <h3 class="title">위치</h3>t
        <ul class="check-area" data-template-id="camp-group-template">
	<li>
        <label for="camp-radio1-0" class="radio-check">
            <input type="radio" id="camp-radio1-0" name="camp-mountain" value="가야산">
            <span>가야산</span>
        </label>
    </li>
	</ul>
        <ul class="check-area" data-template-id="camp-dept-template">
	<li style="display:none;">
        <span class="radio-1">
            <input type="radio" id="camp-location1-0" name="camp-location" data-dept-dept-id="B131001" data-dept-park-id="B13" data-dept-dept-nm="삼정" data-dept-dept-parent-nm="가야산" data-dept-dept-parent-id="B131">
            <label for="camp-location1-0">삼정</label>
        </span>
    </li>
</ul>
    </div>
  
			<div class="reservation-info" data-area-name="camp-reservation-info">
            <p class="period" data-area-name="camp-period-selected" style="display:none;"><em data-area-name="camp-period"><!-- 2박 3일 --></em>을 선택하셨습니다.</p>
            <p class="period" data-area-name="camp-period-default"><em>날짜</em>를 선택해주세요.</p>
            <dl>
                <dt>입실날짜</dt>
                <dd data-area-name="camp-bgn-dt"><!-- 2022-02-23 [수] -->-</dd>
            </dl>
            <dl>
                <dt>퇴실날짜</dt>
                <dd data-area-name="camp-end-dt"><!-- 2022-02-25 [금] -->-</dd>
            </dl>
        </div>
    </div>
    <div class="grid-cell">
        <h3 class="title">유형</h3>
        <ul class="check-area" data-template-id="camp-gubun-template">
	
                <span class="radio-1">
                    <input type="radio" id="camp-radio20" name="camp-reservation2" value="N" checked="">
                    <label for="camp-radio20">예약가능 야영장</label>
                </span>
            </li>
            <li>
                <span class="radio-1">
                    <input type="radio" id="camp-radio21" name="camp-reservation2" value="W">
                    <label for="camp-radio21">대기가능 야영장</label>
                </span>
            </li>
        </ul>
        <div class="btn-area">
            <button class="btn btn-refresh" data-button-name="refresh">새로고침</button>
            <button class="btn btn-enquiry" data-button-name="goStep2">다음단계</button>
        </div>
    </div>
</div>

<h3 class="title" data-reservation-step="2" style="display:none;">
	예약 가능한 야영장 목록입니다.
    <span class="total">(총 <span data-area-name="step2TotalCnt"><!-- 42 --></span>개의 상품 검색)</span>
    <span class="stay-period">
    	<span data-area-name="step2PeriodText"><!-- 1박2일 --></span> <span data-area-name="step2StartEndText"><!-- 2022-04-06 [수] ~ 2022-04-07 [목] --></span>
    </span>
</h3>

<div class="grid-row" data-reservation-step="2" style="display:none;" data-template-id="camp-step2-template">
</div>
<div class="btn-area" style="display:none;" data-template-id="camp-btn-area">
    <button class="btn btn-back" data-button-name="cancel">이전</button>
</div>

<button style="display:none;" type="button" class="btn btn-layer" data-popup="automatic-character-camp">자동방지 입력문자</button>
<div class="modal-popup small" id="automatic-character-camp">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title"><!-- 자동방지 입력문자 -->예약가능</strong>
            <button type="button" class="btn-close" title="닫기">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container">
        	<table class="table">
		        <caption>예약내용</caption>
		        <colgroup>
		            <col style="width: 140px;">
		            <col>
		        </colgroup>
		        <tbody class="tbody" data-template-id="camp-popup-container-template">
                    <tr>
                        <th scope="row">1</th>
                        <td>1</td>
                    </tr>
		        </tbody>
		    </table>

		    <div class="captcha-area">
		        <span class="label">자동예약 방지문자</span>
		        <span class="captcha" id="pnlRsrImgCamp">캡챠영역</span>
                <label for="captchaInput1" class="hidden-text">자동예약 방지문자</label>
                <input type="text" class="input-text" title="자동예약 방지문자" name="captcha" id="captchaInput1">
		    </div>
		    <p class="copy-notice">※ 예약 완료된 상품에 대해서는 마이페이지 나의예약목록 에서 확인 후 결제 가능합니다.</p>
		    <div class="btn-area">
		        <button class="btn btn-cancel" data-popup-btn="cancel">취소</button>
		        <button class="btn btn-confirm is-active" data-popup-btn="confirm">확인</button>
		    </div>
        </div>
    </div>
</div>

<!-- 예약안내 -->
<button type="button" class="btn btn-layer" data-popup="reservation-information1-camp" style="display:none;">예약안내</button>
<div class="modal-popup small" id="reservation-information1-camp">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title">예약완료안내</strong>
            <button type="button" class="btn-close" title="닫기">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container">
            <div class="center" data-area-name="reservation-popup-container">
                <i class="icon-check"></i>
                <strong class="title-1">예약이 완료되었습니다.</strong>
                <p class="copy-mid">결제 만기일시는 <em data-popup-information-camp="sttlmMtDtm"><!-- 2020년 02월 17일 16:00 --></em> 까지 입니다.<br>미 결제시 자동 취소되니 유의 하시기 바랍니다.</p>
                <p class="copy-sm">마이페이지 나의예약목록 에서 확인 후 결제를 계속 진행해주세요.</p>
            </div>
            <div class="center" data-area-name="reservation-popup-container-w">
                <i class="icon-check"></i>
                <strong class="title-1">대기신청이 완료되었습니다.</strong>
                <p class="copy-mid">
                	대기자에서 예약자로 전환되면 예약 결제 안내 문자가 발송됩니다.<br>
					단, 잘못된 연락처 및 통신사 환경 등에 따라 전송이 실패할 수도 있습니다.<br>
					이에 따른 피해에 대해서는 국립공원공단에서 보상하지 않습니다.<br>
					반드시 '나의 예약 목록'에서 예약상태를 확인하여 주시기 바랍니다.
				</p>
                <!-- <p class="copy-sm">마이페이지 나의예약목록 에서 확인 후 결제를 계속 진행해주세요.</p> -->
            </div>
            <div class="btn-area">
                <a href="mmb/mmbLogin.html" class="btn btn-link">나의 예약목록 보기</a>
            </div>
        </div>
    </div>
</div>

<button type="button" class="btn btn-layer" data-popup="application-reservation-camp-option" style="display:none;">옵션 선택</button>
<div class="modal-popup medium" id="application-reservation-camp-option">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title">옵션 선택</strong>
            <button type="button" class="btn-close" title="닫기">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container">
            <strong class="title-2">옵션 추가선택</strong>
            <table class="table">
                <caption>옵션 추가선택</caption>
                <colgroup>
                    <col style="width: 30%;">
                    <col>
                </colgroup>
                <tbody class="tbody">
                    <tr>
                        <th scope="row">옵션</th>
                        <td class="form">
                            <ul class="check-list" data-template-id="camp-options-template">
                            </ul>
                        </td>
                    </tr>
                </tbody>
            </table>
            <ul class="dot-list">
                <li>옵션은 예약완료 후 마이페이지에서 추가하거나 변경, 부분취소할 수 있습니다.</li>
                <li>옵션이 없을 경우 바로 신청하기를 눌러주세요.</li>
            </ul>
            <div class="btn-area">
                <button class="btn btn-cancel" data-popup-btn="cancel">취소</button>
		        <button class="btn btn-confirm is-active" data-popup-btn="confirm">확인</button>
            </div>
        </div>
    </div>
</div>

<button class="btn btn-layer" data-popup="exemption-auth" style="display:none;">자격검증</button>










<div class="modal-popup small" id="exemption-auth">
	
		<input type="hidden" id="authTypeId" value=""/>
		
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
                    <p>본 포털은 본인확인 및 공공시설 이용요금 감면서비스 대상여부 확인, 감면자자격 정보 저장 만료일 안내를 목적으로 개인정보(이름, 주민번호, 휴대전화 번호)를 수집합니다.</p>
                    <p>개인정보 수집 이용에 동의를 거부할 권리가 있으며, 거부 시 공공시설 이용요금 가면서비스 대상 여부 확인이 제한 될 수 있습니다.</p>
                    <p>수집된된 정보는 공공시설 이용요금 감면서비스 대상 여부 확인 후 즉시 파기됩니다.</p>
                </div>
                <div class="radio-area">
                    <label for="radio2-1">위 내용에 동의하십니까?</label>
                    <span class="radio-1">
                        <input type="radio" id="radio1-1" name="policy" checked="" value="">
                        <label for="radio1-1">동의하지 않음</label>
                    </span>
                    <span class="radio-1">
                        <input type="radio" id="radio2-1" name="policy"  value="T">
                        <label for="radio2-1">동의함</label>
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
                            <td class="form flex">
                                <span id="usNumId"></span> -
                                <label for="usNm" class="hidden-text">주민번호 뒷자리</label>
                                <input type="password" class="input-text" id="usNm" placeholder="뒷자리를 입력 해주세요." title="주민번호 뒷자리">
                            </td>
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

<script id="camp-calendar-template" type="text/x-handlebars-template">
    <div class="calendar" data-area-name="camp-calendar">
        <div class="calendar-head">
            <div class="calendar-title">
                <span>{{year}}</span>. <span>{{month}}</span>
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
    			{{#each list}}
    			{{#if date}}
    			<div class="calendar-cell {{#ifCond today 'Y'}}today{{/ifCond}} {{disabled}} {{#ifCond sat 'Y'}}sat{{/ifCond}}{{#ifCond sun 'Y'}}sun{{/ifCond}}"
    				data-calendar-cell-year="{{date.year}}" data-calendar-cell-month="{{date.monthValue}}" data-calendar-cell-day="{{day}}" data-calendar-cell-is-end-dt="{{endDt}}"
    				data-calendar-cell-yyyy-mm-dd="{{formatDate date.year date.monthValue day '-'}}" data-calendar-cell-day-week="{{dayWeek}}">{{day}}</div>
    			{{else}}
    			<div class="calendar-cell"></div>
    			{{/if}}
    			{{/each}}
            </div>
        </div>
    </div>
</script>

<script id="camp-popup-container-template" type="text/x-handlebars-template">
	<tr>
	    <th scope="row">예약상품</th>
	    <td>{{codeNm2}} {{prdNm}}</td>
	</tr>
	<tr>
	    <th scope="row">사용기간</th>
	    <td>{{periodText}}</td>
	</tr>
	<tr>
	    <th scope="row">입실날짜</th>
	    <td>{{startDateText}}</td>
	</tr>
	<tr>
	    <th scope="row">퇴실날짜</th>
	    <td>{{endDateText}}</td>
	</tr>
	{{#if optionHtml}}
	<tr>
	    <th scope="row">옵션추가</th>
	    <td>{{optionHtml}}</td>
	</tr>
	{{/if}}
	<tr>
	    <th scope="row">결제(예정)금액 (부가세 포함)</th>
	    <td>{{totalAmtCommas}}</td>
	</tr>
	{{#ifCond brfeTerYn 'Y'}}
	<tr data-area-name="brfeTerYn">
    	<th scope="row">자격구분 <span class="text-info">*</span></th>
        <td class="form">
            <ul class="checkbox-1">
                <li>
                    <span class="radio-1">
                        <input type="radio" id="brfe-radio1" name="rsvtDvcdDs" value="14">
                        <label for="brfe-radio1">장애인(중증, 1~3급)</label>
                    </span>
                </li>
                <li>
                    <span class="radio-1">
                        <input type="radio" id="brfe-radio2" name="rsvtDvcdDs" value="11">
                        <label for="brfe-radio2">장애인(경증, 4~6급)</label>
                    </span>
                </li>
            </ul>
        </td>
    </tr>
    <tr data-area-name="brfeTerYn">
        <th scope="row">장애인등록번호(뒤 3자리) <span class="text-info">*</span></th>
        <td class="form">
            <ul>
                <li>
                    <label for="dstpRegNo" class="hidden-text">장애인등록번호</label>
                    <input type="text" class="input-text" name="dstpRegNo" id="dstpRegNo" maxlength="3" title="장애인등록번호">
                </li>
            </ul>
        </td>
    </tr>

	<tr data-area-name="brfeTerYn">
	    <th scope="row">온라인 자격검증</th>
	    <td class="form">
	        <p class="copy">※ 온라인 자격검증을 하지 않을 경우 현장에서 장애인등록증으로 확인합니다. 자격증빙이 없을 경우 입장이 제한될 수 있으니 필히 지참해주세요</p>
	        <span class="btn-input">
	            <button class="btn btn-layer" data-button-name="exemption-auth">자격검증</button>
                <label for="exemptionAuthText" class="hidden-text">자격검증</label>
	            <input type="text" class="input-text" placeholder="자격검증 버튼을 눌러주세요." title="자격검증" id="exemptionAuthText" readonly>
	        </span>
	    </td>
	</tr>
	{{/ifCond}}
</script>


<script id="camp-group-template" type="text/x-handlebars-template">
	{{#each this}}
	<li>
        <label for="camp-radio1-{{@index}}" class="radio-check">
            <input type="radio" id="camp-radio1-{{@index}}" name="camp-mountain" value="{{this}}">
            <span>{{this}}</span>
        </label>
    </li>
	{{/each}}
</script>

<script id="camp-dept-template" type="text/x-handlebars-template">
	{{#each this}}
	<li style="display:none;">
        <span class="radio-1">
            <input type="radio" id="camp-location1-{{@index}}" name="camp-location"
            	data-dept-dept-id="{{orgnzt_id}}" data-dept-park-id="{{PARK_ID}}" data-dept-dept-nm="{{orgnzt_nm}}"
            	data-dept-dept-parent-nm="{{orgnzt_parent_nm}}" data-dept-dept-parent-id="{{orgnzt_parent_id}}">
            <label for="camp-location1-{{@index}}">{{orgnzt_nm}}</label>
        </span>
    </li>
	{{/each}}
</script>

<script id="camp-gubun-template" type="text/x-handlebars-template">
	{{#each this}}
	<li style="display:none;">
        <span class="checkbox-1">
            <input type="checkbox" id="camp-check10-{{@index}}" data-gubun-dept-nm="{{DEPT_NM}}" data-gubun-hrk-prd-ctg-id="{{HRK_PRD_CTG_ID}}" data-gubun-hrk-prd-ctg-nm="{{HRK_PRD_CTG_NM}}"
				data-gubun-prd-ctg-id="{{HRK_PRD_CTG_ID}}" data-gubun-prd-ctg-nm="{{PRD_CTG_NM}}" data-gubun-dept-id="{{DEPT_ID}}">
            <label for="camp-check10-{{@index}}">{{HRK_PRD_CTG_NM}}</label>
        </span>
    </li>
	{{/each}}
	<li style="display:none; color:#fff;" data-area-name="empty-gubun-text">현재 조성중인 시설입니다.</li>
</script>

<script id="camp-step2-template" type="text/x-handlebars-template">
	{{#each avails}}
	<div class="grid-cell" data-button-name="reservation" data-step2-use-bgn-dtm="{{../useBgnDtm}}" data-step2-use-end-dtm="{{../useEndDtm}}"
			data-step2-period-text="{{../periodText}}" data-step2-period="{{../period}}" data-step2-start-date-text="{{../startDateText}}" data-step2-brfe-ter-yn="{{BRFE_TER_YN}}"
			data-step2-end-date-text="{{../endDateText}}" data-step2-prd-nm="{{PRD_NM}}" data-step2-prd-id="{{PRD_ID}}" data-step2-reser-tp="{{../reserTp}}"
			data-step2-code-nm2="{{CODE_NM2}}" data-step2-sal-amt-sum="{{SAL_AMT_SUM}}" data-step2-dept-id="{{../deptId}}">
        <dl class="info">
            <dt>[{{../deptParentNm}}({{../deptNm}})]</dt>
            <dd>{{CODE_NM2}} - {{PRD_NM}}</dd>
        </dl>
        <button class="btn btn-reservation">예약</button>
    </div>
	{{/each}}
</script>

<script id="camp-options-template" type="text/x-handlebars-template">
	{{#each options}}
    <li>
        <span class="checkbox-1">
            <input type="checkbox" id="camp-check1-{{@index}}" name="camp-check1-{{@index}}" 
            	data-opt-id="{{OPT_ID}}" data-opt-nm="{{OPT_NM}}" value="{{SAL_AMT}}">
            <label for="camp-check1-{{@index}}">{{OPT_NM}} ({{../period}}박 {{SAL_AMT}}원)</label>
        </span>
    </li>
	{{else}}
	<li>
        <span class="">선택가능한 옵션이 없습니다.</span>
    </li>
    {{/each}}
</script>

                        </div>
                        
                        
           <div class="tab-pane is-active" id="tab2">
                    
                            <!-- 대피소 -->
                            





<script src="assets/js/lib/handlebars.min.js"></script>


<div class="grid-row" data-reservation-step="1">
    <div class="grid-cell">
        <h3 class="title">위치</h3>
        <ul class="check-area">
            

            <li>
                <label for="shelterMountainRadio1" class="radio-check">
                    <input type="radio" id="shelterMountainRadio1" name="shelterMountain" value="B01">
                    <span>지리산</span>
                </label>
            </li>
            <li>
                <label for="shelterMountainRadio2" class="radio-check">
                    <input type="radio" id="shelterMountainRadio2" name="shelterMountain" value="B03">
                    <span>설악산</span>
                </label>
            </li>
            <li>
                <label for="shelterMountainRadio3" class="radio-check">
                    <input type="radio" id="shelterMountainRadio3" name="shelterMountain" value="B05">
                    <span>덕유산</span>
                </label>
            </li>
            <li>
                <label for="shelterMountainRadio4" class="radio-check">
                    <input type="radio" id="shelterMountainRadio4" name="shelterMountain" value="B12">
                    <span>소백산</span>
                </label>
            </li>
        </ul>
        <ul class="radio-area row" data-template-id="shelter-shelters-template">
        </ul>
    </div>
    <div class="grid-cell" data-template-id="shelter-calendar-template">
        <h3 class="title">날짜</h3>

        <!-- <div class="reservation-info">
            <dl>
                <dt>선택위치</dt>
                <dd>백령소대피소</dd>
            </dl>
            <dl>
                <dt>선택날짜</dt>
                <dd>2022-02-23 [수]</dd>
            </dl>
            <button class="btn btn-add">추가</button>
        </div> -->
    </div>
    <div class="grid-cell">
        <h3 class="title">예약정보</h3>
        <div class="reservation-check scroll-y">
            <div class="item">
                <strong class="title" data-selected-item="before">선택시설</strong>
            </div>
            <div class="item">
                <strong class="title">검색조건</strong>
                <ul class="radio-area column">
                    <li>
                        <span class="radio-1">
                            <input type="radio" id="shelter-radio20" name="reservation2" value="RSRVT" checked>
                            <label for="shelter-radio20">예약가능 대피소</label>
                        </span>
                    </li>
                    <li>
                        <span class="radio-1">
                            <input type="radio" id="shelter-radio21" name="reservation2" value="WTNG">
                            <label for="shelter-radio21">대기가능 대피소</label>
                        </span>
                    </li>
                </ul>
            </div>
        </div>
        <div class="btn-area">
            <button class="btn btn-refresh" data-button-name="refresh">새로고침</button>
            <button class="btn btn-enquiry" data-button-name="goStep2">다음단계</button>
        </div>
    </div>
</div>

<div class="grid-column" data-reservation-step="2" style="display:none;">
    <h3 class="title"><span data-area-name="title-mountain"></span> 예약(대기)가능 대피소를 확인하고 인원을 선택해주세요.</h3>
    <button class="btn btn-delete" data-button-name="step2Delete">선택삭제</button>
    <div class="scroll-y">
        <table class="table">
            <caption>선택 대피소</caption>
            <colgroup>
                <col style="width: 10%;">
                <col style="width: 20%;">
                <col style="width: 20%;">
                <col style="width: 20%;">
                <col>
            </colgroup>
            <thead class="thead">
            <tr>
                <th scope="col" class="form">
                        <span class="checkbox-1">
                            <input type="checkbox" id="shelter-check1">
                            <label for="shelter-check1"></label>
                        </span>
                </th>
                <th scope="col">사무소</th>
                <th scope="col">대피소</th>
                <th scope="col">선택일자</th>
                <th scope="col">인원수 선택</th>
            </tr>
            </thead>
            <tbody class="tbody" data-template-id="shelter-step2-template">
            <!-- <tr>
                <td class="form">
                    <span class="checkbox-1">
                        <input type="checkbox" id="check1-1">
                        <label for="check1-1"></label>
                    </span>
                </td>
                <td>지리산전북</td>
                <td>연하천대피소</td>
                <td>2022-02-23[수]</td>
                <td class="form">
                    <span class="select">
                        <label for="select-vaccine1">인원수 선택</label>
                        <select id="select-vaccine1">
                            <option selected="" value="1명">1명</option>
                            <option value="2명">2명</option>
                            <option value="3명">3명</option>
                            <option value="4명">4명</option>
                            <option value="5명">5명</option>
                        </select>
                    </span>
                    <span>[잔여수 : 2개]</span>
                </td>
            </tr> -->
            </tbody>
        </table>
        <p class="txt">※ 목록에 보이는 대피소를 각각의 예약으로 등록합니다. 예약하지 않을 대피소는 삭제하세요.</p>
        <div class="payment" data-template-id="shelter-step2-payment-template">
            <dl>
                <dt><em>대피소</em></dt>
                <dd></dd>
            </dl>
            <dl>
                <dt><em>2020-02-23[수]</em> 지리산경남-치밭목대피소 1명</dt>
                <dd>19,000원</dd>
            </dl>
            <dl>
                <dt><em>2020-02-23[수]</em> 지리산경남-치밭목대피소 1명</dt>
                <dd>19,000원</dd>
            </dl>
            <dl class="total">
                <dt>결제(예정)금액</dt>
                <dd><em>360,000</em>원</dd>
            </dl>
        </div>
    </div>
    <div class="btn-area">
        <button class="btn btn-back" data-button-name="cancel">취소</button>
        <button class="btn btn-register is-active" data-button-name="reservation">예약하기</button>
    </div>
</div>

<button style="display:none;" type="button" class="btn btn-layer" data-popup="automatic-character-shelter">자동방지 입력문자</button>
<div class="modal-popup small" id="automatic-character-shelter">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title"><!-- 자동방지 입력문자 -->예약가능</strong>
            <button type="button" class="btn-close" title="닫기">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container" data-template-id="shelter-popup-container-template">
        </div>
    </div>
</div>

<!-- 예약안내 -->
<button type="button" class="btn btn-layer" data-popup="reservation-information1-shelter" style="display:none;">예약안내</button>
<div class="modal-popup small" id="reservation-information1-shelter">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title">예약완료안내</strong>
            <button type="button" class="btn-close" title="닫기">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container">
            <div class="center" data-area-name="reservation-popup-container">
                <i class="icon-check"></i>
                <strong class="title-1">예약이 완료되었습니다.</strong>
                <p class="copy-mid" data-popup-information-shelter="sttlmMtDtm">결제 만기일시는 <em><!-- 2020년 02월 17일 16:00 --></em> 까지 입니다.<br>미 결제시 자동 취소되니 유의 하시기 바랍니다.</p>
                <p class="copy-sm">마이페이지 나의예약목록 에서 확인 후 결제를 계속 진행해주세요.</p>
            </div>

            <div class="center" data-area-name="reservation-popup-container-w">
                <i class="icon-check"></i>
                <strong class="title-1">대기신청이 완료되었습니다.</strong>
                <p class="copy-mid">
                    대기자에서 예약자로 전환되면 예약 결제 안내 문자가 발송됩니다.<br>
                    단, 잘못된 연락처 및 통신사 환경 등에 따라 전송이 실패할 수도 있습니다.<br>
                    이에 따른 피해에 대해서는 국립공원공단에서 보상하지 않습니다.<br>
                    반드시 '나의 예약 목록'에서 예약상태를 확인하여 주시기 바랍니다.
                </p>
                <!-- <p class="copy-sm">마이페이지 나의예약목록 에서 확인 후 결제를 계속 진행해주세요.</p> -->
            </div>

            <div class="btn-area">
                <a href="mmb/mmbLogin.html" class="btn btn-link">나의 예약목록 보기</a>
            </div>
        </div>
    </div>
</div>

<script id="shelter-shelters-template" type="text/x-handlebars-template">
    {{#each this}}
    <li style="display:none;">
        <span class="radio-1">
            <input type="radio" id="radio5-{{@index}}" name="refuge" value="{{PRD_ID}}" data-dept-id="{{DEPT_ID}}"
                   data-upd-nm="{{UPD_NM}}" data-park-nm="{{PARK_NM}}" data-prd-nm="{{PRD_NM}}">
            <label for="radio5-{{@index}}">{{PRD_NM}}</label>
        </span>
    </li>
    {{/each}}
</script>
<script id="shelter-calendar-template" type="text/x-handlebars-template">
    <div class="calendar">
        <div class="calendar-head">
            <div class="calendar-title">
                <span>{{year}}</span>. <span>{{month}}</span>
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
                {{#each list}}
                {{#if date}}
                <div class="calendar-cell {{#ifCond today 'Y'}}today{{/ifCond}} {{disabled}} {{#ifCond sat 'Y'}}sat{{/ifCond}}{{#ifCond sun 'Y'}}sun{{/ifCond}}"
                     data-calendar-cell-year="{{date.year}}" data-calendar-cell-month="{{date.monthValue}}" data-calendar-cell-day="{{day}}" data-calendar-cell-is-end-dt="{{endDt}}"
                     data-calendar-cell-yyyy-mm-dd="{{formatDate date.year date.monthValue day '-'}}" data-calendar-cell-day-week="{{dayWeek}}">{{day}}</div>
                {{else}}
                <div class="calendar-cell"></div>
                {{/if}}
                {{/each}}
            </div>
        </div>
    </div>
</script>
<script id="shelter-step2-template" type="text/x-handlebars-template">
    {{#each prds}}
    <tr>
        <td class="form">
            <span class="checkbox-1">
                <input type="checkbox" id="shelter-check1-{{@index}}">
                <label for="shelter-check1-{{@index}}"></label>
            </span>
        </td>
        <td>{{updNm}}</td>
        <td>{{prdNm}}</td>
        <td>{{useBgnDtm}}[{{dayWeekNm}}]</td>
        <td class="form">
            <span class="select">
                <label for="rsrvtQntt-{{@index}}">인원수 선택</label>
                <select id="rsrvtQntt-{{@index}}" data-step2-use-bgn-dtm="{{useBgnDtm}}" data-step2-prd-id="{{prdId}}"
                        data-step2-dept-id="{{deptId}}" data-step2-day-week-nm="{{dayWeekNm}}" data-step2-sal-amt="{{salAmt}}"
                        data-step2-upd-nm="{{updNm}}" data-step2-prd-nm="{{prdNm}}" data-step2-reser-tp="{{reserTp}}">
                    <option selected="" value="1">1명</option>
                    <option value="2">2명</option>
                    <option value="3">3명</option>
                    <option value="4">4명</option>
                    <option value="5">5명</option>
                </select>
            </span>
            <span>[잔여수 : {{psbCnt}}명]</span>
        </td>
    </tr>
    {{/each}}
</script>
<script id="shelter-step2-payment-template" type="text/x-handlebars-template">
    <dl>
        <dt><em>대피소</em></dt>
        <dd></dd>
    </dl>
    {{#each prds}}
    <dl>
        <dt><em>{{useBgnDtm}}[{{dayWeekNm}}]</em> {{updNm}}-{{prdNm}} {{rsrvtQntt}}명</dt>
        <dd>{{numberWithCommas price}}원</dd>
    </dl>
    {{/each}}
    <dl class="total">
        <dt>결제(예정)금액</dt>
        <dd><em>{{numberWithCommas priceSum}}</em>원</dd>
    </dl>
</script>

<script id="shelter-popup-container-template" type="text/x-handlebars-template">
    <strong class="title-2">예약내용</strong>
    {{#each prds}}
    <table class="table">
        <caption>예약내용</caption>
        <colgroup>
            <col style="width: 140px;">
            <col>
        </colgroup>
        <tbody class="tbody">
        <tr>
            <th scope="row">예약상품</th>
            <td>{{updNm}} - {{prdNm}}</td>
        </tr>
        <tr>
            <th scope="row">입실날짜</th>
            <td>{{ymdUseDt}}[{{crtrDow}}]</td> 
        </tr>
        <tr>
            <th scope="row">사용인원</th>
            <td>{{rsrvtQntt}}명</td>
        </tr>
        <tr>
            <th scope="row">결제(예정)금액 (부가세 포함)</th>
            <td>{{price}}원</td>
        </tr>
        </tbody>
    </table>
    {{/each}}
    
    <div class="captcha-area">
        <span class="label">자동예약 방지문자</span>
        <span class="captcha" id="pnlRsrImgShelter">캡챠영역</span>
        <label for="captchaInput2" class="hidden-text">자동예약 방지문자</label>
        <input type="text" class="input-text" title="자동예약 방지문자" name="captcha" id="captchaInput2" maxlength="4">
    </div>
    <p class="copy-notice">※ 예약 완료된 상품에 대해서는 마이페이지 나의예약목록 에서 확인 후 결제 가능합니다.</p>
    <div class="btn-area">
        <button class="btn btn-cancel" data-popup-btn="cancel">취소</button>
        <button class="btn btn-confirm is-active" data-popup-btn="confirm">확인</button>
    </div>
</script>

                        </div>
                        
                        
                        <div class="tab-pane" id="tab3">
                            <!-- 생태탐방원은 ajax로 호출.. -->
                        </div>
                        <div class="tab-pane" id="tab4">
                            <!-- 민박촌  ajax로 호출..-->
                        </div>

                    </div>
                </div>
            </div>
        </section>
        <section>
        	<h3 class="hidden-text">빠른 메뉴 이동</h3>
            

<div class="quick-menu">
    <a href="https://www.knps.or.kr/portal/angelroad/course/course10.do" class="btn" target="_blank"><span>탐방 안내도</span></a>
    <a href="https://www.knps.or.kr/portal/main/contents.do?menuNo=8000198" class="btn" target="_blank"><span>입산시간 지정제</span></a>
    <a href="https://www.knps.or.kr/front/portal/safe/acsCtrList.do?menuNo=8000340" class="btn" target="_blank"><span>탐방통제 정보</span></a>
    <a href="https://www.knps.or.kr/portal/main/contents.do?menuNo=7020071&amp;tabNm=2" class="btn" target="_blank"><span>국립공원 날씨</span></a>
</div>
        </section>
        <section>
            <div class="slide-notice">
                <h3 class="title">공지사항</h3>
                


<script>
    $(function(){
        // 공지사항 slide
        let swiper2 = new Swiper(".slide-notice .swiper", {
            loop: 'true',
            autoplay: {
                delay: 3000,
                disableOnInteraction: false,
            },
            direction: "vertical",
            navigation: {
                nextEl: "#noticeBtnNext",
                prevEl: "#noticeBtnPrev",
            },
        });
    })
</script>
<div class="swiper">
    <div class="swiper-wrapper">
        
            <div class="swiper-slide slide0">
                <a href="community/board/notice/boardDetail4f70.html?seq=27890">
                <div class="content">
                                <span class="title">
                                    
                                        
                                        
                                            변산반도
                                        
                                    
                                    [변산반도] 12월 야영장 정비의 날 운영 안내
                                </span>
                    <span class="date">2022-11-10</span>
                </div>
                </a>
            </div>
        
            <div class="swiper-slide slide1">
                <a href="community/board/notice/boardDetaild6a8.html?seq=27889">
                <div class="content">
                                <span class="title">
                                    
                                        
                                        
                                            태안해안
                                        
                                    
                                    [태안해안] 학암포자동차야영장 체류형카라반 설치공사 관련 재공지
                                </span>
                    <span class="date">2022-11-03</span>
                </div>
                </a>
            </div>
        
            <div class="swiper-slide slide2">
                <a href="community/board/notice/boardDetail3c55.html?seq=27888">
                <div class="content">
                                <span class="title">
                                    
                                        
                                        
                                            본부
                                        
                                    
                                    국립공원예약시스템 성능테스트 안내
                                </span>
                    <span class="date">2022-11-02</span>
                </div>
                </a>
            </div>
        
            <div class="swiper-slide slide3">
                <a href="community/board/notice/boardDetailcb27.html?seq=27887">
                <div class="content">
                                <span class="title">
                                    
                                        
                                        
                                            태안해안
                                        
                                    
                                    [태안해안] 학암포자동차야영장 수도배관 누수에 따른 H,I 사이트 이용 제한 알림
                                </span>
                    <span class="date">2022-11-02</span>
                </div>
                </a>
            </div>
        
            <div class="swiper-slide slide4">
                <a href="community/board/notice/boardDetail43e4.html?seq=27886">
                <div class="content">
                                <span class="title">
                                    
                                        
                                        
                                            치악산
                                        
                                    
                                    [치악산] 야영장 정비의 날(11.9. 수) 운영 및 이용 제한 알림
                                </span>
                    <span class="date">2022-11-01</span>
                </div>
                </a>
            </div>
        
            <div class="swiper-slide slide5">
                <a href="community/board/notice/boardDetail4ea7.html?seq=27885">
                <div class="content">
                                <span class="title">
                                    
                                        
                                        
                                            무등산동부
                                        
                                    
                                    도원야영장, 11월 정비의 날 운영 알림(일자: 11.9, 이용불가)
                                </span>
                    <span class="date">2022-11-01</span>
                </div>
                </a>
            </div>
        
            <div class="swiper-slide slide6">
                <a href="community/board/notice/boardDetail2e73.html?seq=27884">
                <div class="content">
                                <span class="title">
                                    
                                        
                                        
                                            한려해상동부
                                        
                                    
                                    [한려해상동부] 학동자동차야영장 체류형카라반 신규설치공사(A6~A10)에 따른 이용제한기간 연장 안내
                                </span>
                    <span class="date">2022-10-31</span>
                </div>
                </a>
            </div>
        
            <div class="swiper-slide slide7">
                <a href="community/board/notice/boardDetailca7f.html?seq=27883">
                <div class="content">
                                <span class="title">
                                    
                                        
                                        
                                            설악산
                                        
                                    
                                    흘림골 탐방로 예약제 구간 동절기 운영시간 변경 안내
                                </span>
                    <span class="date">2022-10-30</span>
                </div>
                </a>
            </div>
        
            <div class="swiper-slide slide8">
                <a href="community/board/notice/boardDetail284a.html?seq=27882">
                <div class="content">
                                <span class="title">
                                    
                                        
                                        
                                            설악산
                                        
                                    
                                    설악산 대피소 이용 주요 안내(주의사항, 희운각&amp;소청대피소 내부 정비)
                                </span>
                    <span class="date">2022-10-30</span>
                </div>
                </a>
            </div>
        
            <div class="swiper-slide slide9">
                <a href="community/board/notice/boardDetail7e74.html?seq=27881">
                <div class="content">
                                <span class="title">
                                    
                                        
                                        
                                            본부
                                        
                                    
                                    겨울철 국립공원 야영장 운영 현황 안내
                                </span>
                    <span class="date">2022-10-28</span>
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
            <button type="button" class="btn-close" title="닫기"  onclick="closePopup('captchaPop');">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container" id="captchaDiv">
        </div>
    </div>
</div>

<!-- layer popup content -->





        </div>
				

</div>
			
<%@ include file="../common/footer.jsp" %>


<div class="modal-popup small" id="confirmPop">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title" id="confirmTitle"></strong>
            <button type="button" class="btn-close" title="닫기" onclick="closePopup('confirmPop');">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container">
            <div class="center">
                <i class="icon-error"></i>
                <strong class="title-1" id="confirmSubTitle"></strong>
                <p class="copy-mid" id="confirmContent"></p>
                <p class="copy-sm" id="confirmSubContent"></p>
            </div>
            <div class="btn-area">
                <button class="btn btn-cancel forMypageClass" onclick="closePopup('confirmPop');">취소</button>
                <button class="btn btn-confirm is-active" id="btn-confirm">확인</button>
            </div>
        </div>
    </div>
</div>


<div class="modal-popup small" id="alertPop">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title" id="alertTitle">로그인</strong>
            <button type="button" class="btn-close" title="닫기" onclick="closePopup('alertPop');">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container">
            <div class="center">
                <i class="icon-error"></i>
                <strong class="title-1" id="alertSubTitle"></strong>
                <p class="copy-mid" id="alertContent"></p>
                <p class="copy-sm" id="alertSubContent"></p>
            </div>
            <div class="btn-area">
                <button class="btn btn-confirm is-active" onclick="closePopup('alertPop');">확인</button>
            </div>
        </div>
    </div>
</div>

<div class="modal-popup small" id="loginPopup">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title" id="loginTitle">로그인</strong>
            <button type="button" class="btn-close" title="닫기" onclick="closePopup('loginPopup');">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container" id="loginPopupDiv">
        </div>
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
	<img id="loadingImage" src="../../assets/img/preloader.gif" alt="로딩이미지" style="position: absolute; left: 924.5px; top: 539.5px; z-index: 100000; display: none;">
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
</html>