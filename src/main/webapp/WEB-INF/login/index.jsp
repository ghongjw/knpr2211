<%@page import="com.reservation.knpr2211.service.MountainCodeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    	tab2 : "N",
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
                    $('#tab1').find('[data-template-id="camp-btn-area"]').css('display', '');

                    
                  
    
                }else if(tabId == 'tab2'){
                    
                }else if(tabId == 'tab3'){
                   

                }else  if(tabId == 'tab4'){
                    
                }
                //한번 클릭했으면 값 Y로 변경 ( 다음 클릭 시 조회 하지 않기 위해 )
                isSelect[tabId] = 'Y';
            });
        }
    }
  z
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
                        <li class="is-active" data-tabid="tab1"><a href="#tab1">야영장</a></li>
                        <li data-tabid="tab2"><a href="#tab2">대피소</a></li>
                        <li data-tabid="tab3"><a href="#tab3">생태탐방원</a></li>
                        <li data-tabid="tab4"><a href="#tab4">민박촌</a></li>
                    </ul>
                    <div class="tab-content">
                    
                    
                        <div class="tab-pane is-active" id="tab1">
                            <!-- 야영장 -->

<script src="assets/js/lib/handlebars.min.js"></script>
<script src="assets/js/lib/netfunnel.js"></script>

<script>
//<![CDATA[
	
	window.campReservation = 'Y';
	
	var commn = {};
	commn.nvl = function(a, b){
		
		function isNull(value){
			var _chkStr = value + '';
			if(_chkStr == '' || _chkStr == null || _chkStr == 'null' ){
				return true;
			}
			return false;
		}
		
		function isUndefined(value){
			if(typeof(value) == undefined || typeof(value) == 'undefined' || value == 'undefined' || value == undefined){return true;}
			return false;
		}
		
		if(isNull(b) || isUndefined(b)){
			b = '';
		}
		
		if(isNull(a) || isUndefined(a)){
			return b;
		}else{
			return a;
		}
	};
		var selectedPrd = {};
		
		var $campTab = $('#tab1');
		
		var $campTabBtn = $('[href="#tab1"]').closest('li');
		
		var initPage = function(){
			
			bindEvents();
			
			if($campTabBtn.hasClass('is-active')){
				
				$campTabBtn.trigger('click');
			}
		};
		// 상품명 데이터 불러옴 
		var refreshDate = function(){
			
			var $info = $campTab.find('[data-area-name="camp-reservation-info"]');
			$info
			.data('info-period-text', '')
			.data('info-period', '')
			.data('info-start-date-text', '')
			.data('info-end-date-text', '')
			.data('info-use-bgn-dtm', '')
			.data('info-use-end-dtm', '');
			
			//$info.hide();
			$campTab.find('[data-area-name="camp-period-default"]').css('display', '').siblings('[data-area-name="camp-period-selected"]').hide();
			$info.find('[data-area-name="camp-period"]').html('');
			$info.find('[data-area-name="camp-bgn-dt"]').html('-');
			$info.find('[data-area-name="camp-end-dt"]').html('-');
			
			$campTab.find('[data-calendar-cell-yyyy-mm-dd]').removeClass('start end selected');
		};
		

		//예약하기
		function reservation(){
			
			if(selectedPrd.brfeTerYn == 'Y'){
				
				if(!$campTab.find('[name="rsvtDvcdDs"]:checked').val()){
					
					toastrMsg("자격구분을 선택해주세요.","메세=지","e");
					$campTab.find('[name="rsvtDvcdDs"]').eq(0).focus();
					return;
				}
				if(!$.trim($campTab.find('[name="dstpRegNo"]').val())){
					
					toastrMsg("장애인등록번호(뒤 3자리)를 입력해주세요.","메세지","e");
					$campTab.find('[name="dstpRegNo"]').focus();
					return;
				}
			}
			
			if($campTab.find("input[name=captcha]").val() == null || $campTab.find("input[name=captcha]").val().trim() == "") {
				toastrMsg("자동예약방지글을 입력해주세요.","메세지","e");
				$campTab.find("input[name=captcha]").focus();
				return;
			}
			
			
			commn.callAjax({
				url: '/reservation/registerCampReservation.do',
				data: {
					"prdId" : selectedPrd.prdId
					, "deptId" : selectedPrd.deptId
					, "useBgnDtm" : selectedPrd.useBgnDtm.replace(/\-/g,'')
					, "useEndDtm" : selectedPrd.useEndDtm.replace(/\-/g,'')
					, "reserTp" : selectedPrd.reserTp
					, "checkPerVal" : selectedPrd.period
					/* , "price" : price
					, "nextPrice" : next_price */
					, "captcha" : $campTab.find("input[name='captcha']").val()
					/* , "optAmtTotal" : optAmtTotal */
					, "selectedOptions" : selectedPrd.selectedOptions
					, 'rsvtDvcd' : selectedPrd.brfeTerYn == 'Y' ? $campTab.find('[name="rsvtDvcdDs"]:checked').val() : ''
					, 'dstpRegNo' : selectedPrd.brfeTerYn == 'Y' ? $campTab.find('[name="dstpRegNo"]').val() : ''
				},
				dataType: 'json'
			})
			.done(function(result){
				
				//정상 요청, 응답 시 처리 작업
			    if(result.resultCd == "S"){
			    	$(".btn-close:eq(1)").trigger("click");
			    	
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
			    	
			    	if(selectedPrd.reserTp == 'W'){
			    		
			    		$campTab.find('[data-area-name="reservation-popup-container-w"]').css('display', '').siblings('[data-area-name="reservation-popup-container"]').hide();
			    	}else{
			    		
			    		$campTab.find('[data-area-name="reservation-popup-container"]').css('display', '').siblings('[data-area-name="reservation-popup-container-w"]').hide();
				    	$campTab.find('[data-popup-information-camp="sttlmMtDtm"]').html(ymdhm(commn.nvl(result.dataMap).sttlmMtDtm2));//결제만기일시
			    	}
			    	
			    	// 예약안내 레이어팝업
			    	$campTab.find('[data-popup="reservation-information1-camp"]').trigger('click');
			    }else{
			    	toastrMsg(result.resultMsg,"메세지","e");
                    closePopup('automatic-character-camp');
			    }
			})
			.fail(function(e){
				//$("#loadingImage").hide();
				toastrMsg("일시적으로 장애가 발생하였습니다. 잠시 후 다시 시도하여 주시기 바랍니다.","메세지"); //<br />원활한 서비스를 위해 최선을 다하겠습니다.
			});
		}
		//step 1,2 넘어가는 function 
		var updateStep = function(step){
			
			switch(step) {

			  	case '1':

			  		$('[data-reservation-area="step"]').removeClass('step2').addClass('step1');
					$('[data-reservation-area="stepText"]').html('STEP.1');
					$campTab.find('[data-reservation-step="2"]').hide();
                    $campTab.find('[data-reservation-step="1"]').css('display', '');
                    $campTab.find('[data-template-id="camp-btn-area"]').css('display', 'none');
			    	break;

			  	case '2':
			  		$('[data-reservation-area="step"]').removeClass('step1').addClass('step2');
					$('[data-reservation-area="stepText"]').html('STEP.2');
					$campTab.find('[data-reservation-step="1"]').hide();
					$campTab.find('[data-reservation-step="2"]').css('display', '');
                    $campTab.find('[data-template-id="camp-btn-area"]').css('display', '');
			    	break;
			}
		};
		//산 클릭 (가야산, 지리산 등등 )
		
		var campListBindEvents = function(){
			
				
			$campTab.find('[name="camp-mountain"]').on('click', function(){
				
				$campTab.find('input[type="checkbox"][data-gubun-dept-id]').prop('checked', false).closest('li').siblings().hide();//유형 hide
				$campTab.find('[data-dept-dept-parent-nm]').prop('checked', false).closest('li').hide();
				$campTab.find('[data-dept-dept-parent-nm="' + $(this).val() + '"]').closest('li').css('display', '');
				
				refreshDate();
			});
			
				
			$campTab.find('input[type="radio"][data-dept-dept-id]').on('click', function(){
				
				$campTab.find('input[type="checkbox"][data-gubun-dept-id]').prop('checked', false).closest('li').siblings().hide();
				$campTab.find('input[type="checkbox"][data-gubun-dept-id="' + $(this).data('dept-dept-id') + '"]').closest('li').css('display', '');
				
				if(!$campTab.find('input[type="checkbox"][data-gubun-dept-id="' + $(this).data('dept-dept-id') + '"]').length){
					
					toastrMsg("현재 조성중인 시설입니다.","메세지");
					$campTab.find('[data-area-name="empty-gubun-text"]').css('display', '');
				}
				refreshDate();
			});
			
			/* 달력 click */
			$campTab.find('[data-calendar-cell-yyyy-mm-dd]').on('click', function(){
				
				if(!$campTab.find('input[type="radio"][data-dept-dept-id]:checked').length){
					
					toastrMsg("위치를 선택해주세요.","메세지");
					return false;
				}
				var $this = $(this);
				var $start = $campTab.find('[data-calendar-cell-yyyy-mm-dd].start.selected'); //입실날짜
				var $end = $campTab.find('[data-calendar-cell-yyyy-mm-dd].end.selected'); //퇴실날짜
				
				if($start.length && $end.length){
					
					$campTab.find('[data-calendar-cell-yyyy-mm-dd]').removeClass('start selected end');
					$start = $campTab.find('[data-calendar-cell-yyyy-mm-dd].start.selected'); //입실날짜
				}
				
				if($this.data('calendar-cell-is-end-dt') == 'Y' && !$start.length){
					
					toastrMsg("해당 날짜는 퇴실일로만 선택 가능합니다.","메세지");
					return false;
				}
				
				if(!$start.length){
					//입실선택전클릭
					$this.addClass('start selected');
					toastrMsg("이용 기간은 2박 3일 이내로 선택해 주세요.","메세지");
				}else{
					//입실선택후클릭
					var startDate = $start.data('calendar-cell-yyyy-mm-dd');
					var endDate = $this.data('calendar-cell-yyyy-mm-dd');
					
					if(startDate.replace(/\-/g,'') >= endDate.replace(/\-/g,'')){
						//start보다 작거나 같으면 	
						$campTab.find('[data-calendar-cell-yyyy-mm-dd]').removeClass('start selected end');
						toastrMsg("입실일 이후로 선택해 주세요.","메세지");
						return false;
					}
					
					var sdt = new Date(startDate);
					var edt = new Date(endDate);
					var dateDiff = Math.ceil((edt.getTime()-sdt.getTime())/(1000*3600*24));

					
					if(dateDiff > 2){
						//최대 2박3일
						$campTab.find('[data-calendar-cell-yyyy-mm-dd]').removeClass('start selected end');
						toastrMsg("최대 2박 3일까지 예약 가능합니다.","메세지");
						return false;
					}
					
					for(var i = 1; i <= dateDiff; i++){
						//입실일과 퇴실일 사이 class add
						$campTab.find('[data-calendar-cell-yyyy-mm-dd="' + commn.date_add(startDate, i) + '"]').addClass('selected');
					}
					
					//퇴실일  class add
					$this.addClass('end selected');
					
					var $info = $campTab.find('[data-area-name="camp-reservation-info"]');
					var periodText = dateDiff == 1 ? '1박 2일' : '2박 3일';
					var startDateText = startDate + ' [' + commn.getDayWeekNm($start.data('calendar-cell-day-week')) + ']';
					var endDateText = endDate + ' [' + commn.getDayWeekNm($this.data('calendar-cell-day-week')) + ']';
					$info
					.data('info-period-text', periodText)
					.data('info-period', dateDiff)
					.data('info-start-date-text', startDateText)
					.data('info-end-date-text', endDateText)
					.data('info-use-bgn-dtm', startDate)
					.data('info-use-end-dtm', endDate);
					
					//$info.css('display', '');
					$campTab.find('[data-area-name="camp-period-default"]').hide().siblings('[data-area-name="camp-period-selected"]').css('display', '');
					$info.find('[data-area-name="camp-period"]').html(periodText);
					$info.find('[data-area-name="camp-bgn-dt"]').html(startDateText);
					$info.find('[data-area-name="camp-end-dt"]').html(endDateText);
				}
			});
		};
		

	
		window.automaticCharacterCamp = function(){
	
</script>



<div class="grid-row" data-reservation-step="1">
    <div class="grid-cell">
        <h3 class="title">위치</h3>
        <form action="MountainSelect" method="post" id="m">
        <ul class="check-area" data-template-id="camp-group-template">
	<li>
        <label for="camp-radio1-0" class="radio-check">
            <input type="radio" id="camp-radio1-0" name="camp-mountain" value="가야산">
            <span>가야산</span>
        </label>
    </li>

    </c:forEach>
</ul>
</form>
	<li style="display:none;">
        <span class="radio-1">
            <input type="radio" id="camp-location1-0" name="camp-location" data-dept-dept-id="B131001" data-dept-park-id="B13" data-dept-dept-nm="삼정" data-dept-dept-parent-nm="가야산" data-dept-dept-parent-id="B131">
            <label for="camp-location1-0">삼정</label>
        </span>
    </li>
	<li style="display:none;">
        <span class="radio-1">
            <input type="radio" id="camp-location1-1" name="camp-location" data-dept-dept-id="B131003" data-dept-park-id="B13" data-dept-dept-nm="치인" data-dept-dept-parent-nm="가야산" data-dept-dept-parent-id="B131">
            <label for="camp-location1-1">치인</label>
        </span>
    </li>
	<li style="display:none;">
        <span class="radio-1">
            <input type="radio" id="camp-location1-2" name="camp-location" data-dept-dept-id="B131002" data-dept-park-id="B13" data-dept-dept-nm="백운동" data-dept-dept-parent-nm="가야산" data-dept-dept-parent-id="B131">
            <label for="camp-location1-2">백운동</label>
        </span>
    </li>
	<li style="display:none;">
        <span class="radio-1">
            <input type="radio" id="camp-location1-3" name="camp-location" data-dept-dept-id="B161001" data-dept-park-id="B16" data-dept-dept-nm="동학사" data-dept-dept-parent-nm="계룡산" data-dept-dept-parent-id="B161">
            <label for="camp-location1-3">동학사</label>
        </span>
    </li>
	<li style="display:none;">
        <span class="radio-1">
            <input type="radio" id="camp-location1-4" name="camp-location" data-dept-dept-id="B041001" data-dept-park-id="B04" data-dept-dept-nm="가인" data-dept-dept-parent-nm="내장산" data-dept-dept-parent-id="B041">
            <label for="camp-location1-4">가인</label>
        </span>
    </li>
	<li style="display:none;">
        <span class="radio-1">
            <input type="radio" id="camp-location1-5" name="camp-location" data-dept-dept-id="B042001" data-dept-park-id="B04" data-dept-dept-nm="내장" data-dept-dept-parent-nm="내장산" data-dept-dept-parent-id="B042">
            <label for="camp-location1-5">내장</label>
        </span>
    </li>
	<li style="display:none;">
        <span class="radio-1">
            <input type="radio" id="camp-location1-6" name="camp-location" data-dept-dept-id="B091001" data-dept-park-id="B09" data-dept-dept-nm="팔영산" data-dept-dept-parent-nm="다도해해상" data-dept-dept-parent-id="B091">
            <label for="camp-location1-6">팔영산</label>
        </span>
    </li>
	<li style="display:none;">
        <span class="radio-1">
            <input type="radio" id="camp-location1-7" name="camp-location" data-dept-dept-id="B091003" data-dept-park-id="B09" data-dept-dept-nm="염포" data-dept-dept-parent-nm="다도해해상" data-dept-dept-parent-id="B091">
            <label for="camp-location1-7">염포</label>
        </span>
    </li>
	<li style="display:none;">
        <span class="radio-1">
            <input type="radio" id="camp-location1-8" name="camp-location" data-dept-dept-id="B091004" data-dept-park-id="B09" data-dept-dept-nm="구계등" data-dept-dept-parent-nm="다도해해상" data-dept-dept-parent-id="B091">
            <label for="camp-location1-8">구계등</label>
        </span>
    </li>
	<li style="display:none;">
        <span class="radio-1">
            <input type="radio" id="camp-location1-9" name="camp-location" data-dept-dept-id="B051006" data-dept-park-id="B05" data-dept-dept-nm="덕유대 체류형 숙박시설" data-dept-dept-parent-nm="덕유산" data-dept-dept-parent-id="B051">
            <label for="camp-location1-9">덕유대 체류형 숙박시설</label>
        </span>
    </li>
	<li style="display:none;">
        <span class="radio-1">
            <input type="radio" id="camp-location1-10" name="camp-location" data-dept-dept-id="B051002" data-dept-park-id="B05" data-dept-dept-nm="덕유대 야영장" data-dept-dept-parent-nm="덕유산" data-dept-dept-parent-id="B051">
            <label for="camp-location1-10">덕유대 야영장</label>
        </span>
    </li>
	<li style="display:none;">
        <span class="radio-1">
            <input type="radio" id="camp-location1-11" name="camp-location" data-dept-dept-id="B172002" data-dept-park-id="B17" data-dept-dept-nm="도원" data-dept-dept-parent-nm="무등산" data-dept-dept-parent-id="B172">
            <label for="camp-location1-11">도원</label>
        </span>
    </li>
	<li style="display:none;">
        <span class="radio-1">
            <input type="radio" id="camp-location1-12" name="camp-location" data-dept-dept-id="B181002" data-dept-park-id="B18" data-dept-dept-nm="고사포" data-dept-dept-parent-nm="변산반도" data-dept-dept-parent-id="B181">
            <label for="camp-location1-12">고사포</label>
        </span>
    </li>
	<li style="display:none;">
        <span class="radio-1">
            <input type="radio" id="camp-location1-13" name="camp-location" data-dept-dept-id="B031005" data-dept-park-id="B03" data-dept-dept-nm="설악" data-dept-dept-parent-nm="설악산" data-dept-dept-parent-id="B031">
            <label for="camp-location1-13">설악</label>
        </span>
    </li>
	<li style="display:none;">
        <span class="radio-1">
            <input type="radio" id="camp-location1-14" name="camp-location" data-dept-dept-id="B121001" data-dept-park-id="B12" data-dept-dept-nm="삼가" data-dept-dept-parent-nm="소백산" data-dept-dept-parent-id="B121">
            <label for="camp-location1-14">삼가</label>
        </span>
    </li>
	<li style="display:none;">
        <span class="radio-1">
            <input type="radio" id="camp-location1-15" name="camp-location" data-dept-dept-id="B122001" data-dept-park-id="B12" data-dept-dept-nm="남천" data-dept-dept-parent-nm="소백산" data-dept-dept-parent-id="B122">
            <label for="camp-location1-15">남천</label>
        </span>
    </li>
	<li style="display:none;">
        <span class="radio-1">
            <input type="radio" id="camp-location1-16" name="camp-location" data-dept-dept-id="B061001" data-dept-park-id="B06" data-dept-dept-nm="소금강" data-dept-dept-parent-nm="오대산" data-dept-dept-parent-id="B061">
            <label for="camp-location1-16">소금강</label>
        </span>
    </li>
	<li style="display:none;">
        <span class="radio-1">
            <input type="radio" id="camp-location1-17" name="camp-location" data-dept-dept-id="B111001" data-dept-park-id="B11" data-dept-dept-nm="닷돈재풀옵션" data-dept-dept-parent-nm="월악산" data-dept-dept-parent-id="B111">
            <label for="camp-location1-17">닷돈재풀옵션</label>
        </span>
    </li>
	<li style="display:none;">
        <span class="radio-1">
            <input type="radio" id="camp-location1-18" name="camp-location" data-dept-dept-id="B111003" data-dept-park-id="B11" data-dept-dept-nm="닷돈재자동차" data-dept-dept-parent-nm="월악산" data-dept-dept-parent-id="B111">
            <label for="camp-location1-18">닷돈재자동차</label>
        </span>
    </li>
	<li style="display:none;">
        <span class="radio-1">
            <input type="radio" id="camp-location1-19" name="camp-location" data-dept-dept-id="B111007" data-dept-park-id="B11" data-dept-dept-nm="덕주" data-dept-dept-parent-nm="월악산" data-dept-dept-parent-id="B111">
            <label for="camp-location1-19">덕주</label>
        </span>
    </li>
	<li style="display:none;">
        <span class="radio-1">
            <input type="radio" id="camp-location1-20" name="camp-location" data-dept-dept-id="B111002" data-dept-park-id="B11" data-dept-dept-nm="송계" data-dept-dept-parent-nm="월악산" data-dept-dept-parent-id="B111">
            <label for="camp-location1-20">송계</label>
        </span>
    </li>
	<li style="display:none;">
        <span class="radio-1">
            <input type="radio" id="camp-location1-21" name="camp-location" data-dept-dept-id="B111004" data-dept-park-id="B11" data-dept-dept-nm="용하" data-dept-dept-parent-nm="월악산" data-dept-dept-parent-id="B111">
            <label for="camp-location1-21">용하</label>
        </span>
    </li>
	<li style="display:none;">
        <span class="radio-1">
            <input type="radio" id="camp-location1-22" name="camp-location" data-dept-dept-id="B111008" data-dept-park-id="B11" data-dept-dept-nm="하선암" data-dept-dept-parent-nm="월악산" data-dept-dept-parent-id="B111">
            <label for="camp-location1-22">하선암</label>
        </span>
    </li>
	<li style="display:none;">
        <span class="radio-1">
            <input type="radio" id="camp-location1-23" name="camp-location" data-dept-dept-id="B201001" data-dept-park-id="B20" data-dept-dept-nm="천황" data-dept-dept-parent-nm="월출산" data-dept-dept-parent-id="B201">
            <label for="camp-location1-23">천황</label>
        </span>

	<li>
        <label for="camp-radio1-1" class="radio-check">
            <input type="radio" id="camp-radio1-1" name="camp-mountain" value="계룡산">
            <span>계룡산</span>
        </label>

    </li>
	<li>
        <label for="camp-radio1-2" class="radio-check">
            <input type="radio" id="camp-radio1-2" name="camp-mountain" value="내장산">
            <span>내장산</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-3" class="radio-check">
            <input type="radio" id="camp-radio1-3" name="camp-mountain" value="다도해해상">
            <span>다도해해상</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-4" class="radio-check">
            <input type="radio" id="camp-radio1-4" name="camp-mountain" value="덕유산">
            <span>덕유산</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-5" class="radio-check">
            <input type="radio" id="camp-radio1-5" name="camp-mountain" value="무등산">
            <span>무등산</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-6" class="radio-check">
            <input type="radio" id="camp-radio1-6" name="camp-mountain" value="변산반도">
            <span>변산반도</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-7" class="radio-check">
            <input type="radio" id="camp-radio1-7" name="camp-mountain" value="설악산">
            <span>설악산</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-8" class="radio-check">
            <input type="radio" id="camp-radio1-8" name="camp-mountain" value="소백산">
            <span>소백산</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-9" class="radio-check">
            <input type="radio" id="camp-radio1-9" name="camp-mountain" value="오대산">
            <span>오대산</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-10" class="radio-check">
            <input type="radio" id="camp-radio1-10" name="camp-mountain" value="월악산">
            <span>월악산</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-11" class="radio-check">
            <input type="radio" id="camp-radio1-11" name="camp-mountain" value="월출산">
            <span>월출산</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-12" class="radio-check">
            <input type="radio" id="camp-radio1-12" name="camp-mountain" value="주왕산">
            <span>주왕산</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-13" class="radio-check">
            <input type="radio" id="camp-radio1-13" name="camp-mountain" value="지리산">
            <span>지리산</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-14" class="radio-check">
            <input type="radio" id="camp-radio1-14" name="camp-mountain" value="치악산">
            <span>치악산</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-15" class="radio-check">
            <input type="radio" id="camp-radio1-15" name="camp-mountain" value="태백산">
            <span>태백산</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-16" class="radio-check">
            <input type="radio" id="camp-radio1-16" name="camp-mountain" value="태안해안">
            <span>태안해안</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-17" class="radio-check">
            <input type="radio" id="camp-radio1-17" name="camp-mountain" value="한려해상">
            <span>한려해상</span>
        </label>
    </li>
</ul>
 
</form>
       
    </div>
    <div class="grid-cell" data-template-id="camp-calendar-template">
        <h3 class="title">날짜</h3>
        
       
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

        <div class="btn-area">
            <button class="btn btn-refresh" data-button-name="refresh">새로고침</button>
            <button class="btn btn-enquiry" data-button-name="goStep2">다음단계</button>
        </div>
    </div>
</div>


                        </div>
                        
                        
           <div class="tab-pane" id="tab2">
                    
                            <!-- 대피소 -->
                            





<script src="assets/js/lib/handlebars.min.js"></script>

<script>
  


        var $shelterTab = $('#tab1');

        var $shelterTabBtn = $('[href="#tab1"]').closest('li');

        var initPage = function(){

            bindEvents();
        };

        var updateStep = function(step){

            switch(step) {

                case '1':

                    $('[data-reservation-area="step"]').removeClass('step2').addClass('step1');
                    $('[data-reservation-area="stepText"]').html('STEP.1');
                    $shelterTab.find('[data-reservation-step="2"]').hide();
                    $shelterTab.find('[data-reservation-step="1"]').css('display', '');
                    break;

                case '2':
                    $('[data-reservation-area="step"]').removeClass('step1').addClass('step2');
                    $('[data-reservation-area="stepText"]').html('STEP.2');
                    $shelterTab.find('[data-reservation-step="1"]').hide();
                    $shelterTab.find('[data-reservation-step="2"]').css('display', '');
                    break;
            }
        };


    // 첫 페이지 설정 
        initPage();
        $('[href="#tab1"]').closest('li').trigger('click');
    });

    //]]>
</script>

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
                        <!--  생태 탐방원  -->
                        <div class="tab-pane" id="tab3">
                           
                         <script src="assets/js/lib/handlebars.min.js"></script>

<script>
  


        var $shelterTab = $('#tab1');

        var $shelterTabBtn = $('[href="#tab1"]').closest('li');

        var initPage = function(){

            bindEvents();
        };

        var updateStep = function(step){

            switch(step) {

                case '1':

                    $('[data-reservation-area="step"]').removeClass('step2').addClass('step1');
                    $('[data-reservation-area="stepText"]').html('STEP.1');
                    $shelterTab.find('[data-reservation-step="2"]').hide();
                    $shelterTab.find('[data-reservation-step="1"]').css('display', '');
                    break;

                case '2':
                    $('[data-reservation-area="step"]').removeClass('step1').addClass('step2');
                    $('[data-reservation-area="stepText"]').html('STEP.2');
                    $shelterTab.find('[data-reservation-step="1"]').hide();
                    $shelterTab.find('[data-reservation-step="2"]').css('display', '');
                    break;
            }
        };


    // 첫 페이지 설정 
        initPage();
        $('[href="#tab1"]').closest('li').trigger('click');
    });

    //]]>
</script>

<div class="grid-row" data-reservation-step="1">
    <div class="grid-cell">
        <h3 class="title">위치</h3>
        <ul class="check-area">
                    
                        <li>
                            <label for="deptId0" class="radio-check">
                                <input type="radio" id="deptId0" name="deptId" value="B971002"><span>북한산</span>
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
      
        <div class="btn-area">
            <button class="btn btn-refresh" data-button-name="refresh">새로고침</button>
            <button class="btn btn-enquiry" data-button-name="goStep2">다음단계</button>
        </div>
    </div>
</div>


            </div>  
                        
                        
                        <!-- 민박촌  -->
                        <div class="tab-pane" id="tab4">
  
                         <script src="assets/js/lib/handlebars.min.js"></script>

<script>
  


        var $shelterTab = $('#tab1');

        var $shelterTabBtn = $('[href="#tab1"]').closest('li');

        var initPage = function(){

            bindEvents();
        };

        var updateStep = function(step){

            switch(step) {

                case '1':

                    $('[data-reservation-area="step"]').removeClass('step2').addClass('step1');
                    $('[data-reservation-area="stepText"]').html('STEP.1');
                    $shelterTab.find('[data-reservation-step="2"]').hide();
                    $shelterTab.find('[data-reservation-step="1"]').css('display', '');
                    break;

                case '2':
                    $('[data-reservation-area="step"]').removeClass('step1').addClass('step2');
                    $('[data-reservation-area="stepText"]').html('STEP.2');
                    $shelterTab.find('[data-reservation-step="1"]').hide();
                    $shelterTab.find('[data-reservation-step="2"]').css('display', '');
                    break;
            }
        };


    // 첫 페이지 설정 
        initPage();
        $('[href="#tab1"]').closest('li').trigger('click');
    });

    //]]>
</script>

<div class="grid-row" data-reservation-step="1">
    <div class="grid-cell">
        <h3 class="title">위치</h3>
       <ul class="check-area">
            <li>
                <label for="rsdnMountainRdio" class="radio-check">
                    <input type="radio" id="rsdnMountainRdio" name="rsdnMountain1" checked="">
                    <span>태백산</span>
                </label>
            </li>
        </ul>
        <ul class="radio-area row" data-template-id="shelter-shelters-template">
        </ul>
    </div>
    <div class="grid-cell" data-template-id="shelter-calendar-template">
        <h3 class="title">날짜</h3>

    </div>
    <div class="grid-cell">
        <h3 class="title">예약정보</h3>
      
        <div class="btn-area">
            <button class="btn btn-refresh" data-button-name="refresh">새로고침</button>
            <button class="btn btn-enquiry" data-button-name="goStep2">다음단계</button>
        </div>
    </div>
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