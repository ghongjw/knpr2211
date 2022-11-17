<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<meta name="viewport" content="width=device-width">
	

	<link rel="stylesheet" href="assets/style/commonb07b.css?ver1">

	<script src="assets/js/lib/jquery-1.12.4.min.js"></script>
	<script src="assets/js/lib/swiper.js"></script>
	<script src="assets/js/lib/datepicker.min.js"></script>
	<script src="assets/js/lib/jquery.fs.zoomer.min.js"></script>
	<script src="assets/js/lib/jquery.rwdImageMaps.min.js"></script>
	<script src="assets/js/lib/toastr.min.js"></script>
	<script src="assets/js/scripts.js"></script>
	<script src="assets/js/common9b00.js?ver4"></script>

<body>
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

                }else if(tabId == 'tab5'){
                    $(".slide-popup").next().find(".progressbar > span:eq(1)").html("STEP.1");
                    $(".slide-popup").next().attr("class", "reservation-area step1");
                    $('#tab5').find(".grid-row").show();
                    $('#tab5').find(".grid-column").hide();
                }else if(tabId == 'tab6'){
                    $(".slide-popup").next().find(".progressbar > span:eq(1)").html("STEP.1");
                    $(".slide-popup").next().attr("class", "reservation-area step1");
                    $('#tab6').find(".grid-row").show();
                    $('#tab6').find(".grid-column").hide();
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
                        <li data-tabid="tab5"><a href="#tab5">탐방로 예약제</a></li>
                        <li data-tabid="tab6"><a href="#tab6">탐방프로그램</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane" id="tab1">
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
	
	commn.callAjax = function(props){
		
		var settings = {};
		props.isShowLoading = props.isShowLoading || 'Y';
		settings.dataType = 'json';
		settings.method = 'post';
		settings.url = props.url;
		settings.data = props.data;

		if(props.headers){
			settings.headers = props.headers;
		}
		if(props.isShowLoading == 'Y'){
			settings.beforeSend = showLoading;
			settings.complete = maskBackgroundOff;
		}
		if(props.method){
			settings.method = props.method;
		}
		if(props.dataType){
			settings.dataType = props.dataType;
		}
		
		return $.ajax(settings);
	};
	
	commn.getDayWeekNm = function(dayWeek){
        switch (dayWeek) {
            case 1: 
            case '1': return "월";
            case 2: 
            case '2': return "화";
            case 3:
            case '3': return "수";
            case 4: 
            case '4': return "목";
            case 5: 
            case '5': return "금";
            case 6: 
            case '6': return "토";
            case 7: 
            case '7': return "일";
        }
    };
    
	commn.date_add = function(sDate, nDays) {
		
		if(!sDate){
			
			function getToday(){
			    var date = new Date();
			    var year = date.getFullYear();
			    var month = ("0" + (1 + date.getMonth())).slice(-2);
			    var day = ("0" + date.getDate()).slice(-2);
	
			    return year + "-" + month + "-" + day;
			}
			sDate = getToday();
		}
	    var yy = parseInt(sDate.substr(0, 4), 10);
	    var mm = parseInt(sDate.substr(5, 2), 10);
	    var dd = parseInt(sDate.substr(8), 10);
	 
	    d = new Date(yy, mm - 1, dd + nDays);
	 
	    yy = d.getFullYear();
	    mm = d.getMonth() + 1; mm = (mm < 10) ? '0' + mm : mm;
	    dd = d.getDate(); dd = (dd < 10) ? '0' + dd : dd;
	 
	    return '' + yy + '-' +  mm  + '-' + dd;
	};
	
	commn.toNumber = function(str){
		
		return Number(commn.nvl(str, '0'));
	};
	
	
	$(function(){
		
		Handlebars.registerHelper('numberWithCommas', function(v1) {
			if(!v1){
				v1 = '0';
			}
			if(v1 != null && v1 != '') {
			  return numberWithCommas(v1);
			}
			return '';
		});
		Handlebars.registerHelper('ifCond', function(v1, v2, options) {
			if(v1 === v2) {
			  return options.fn(this);
			}
			return options.inverse(this);
		});
		
		Handlebars.registerHelper('formatDate', function(v1, v2, v3, v4) {
			
			if(v1 && v2 && v3 && v4){
				
				var lpad = function(n, width) {
				    n = n + '';
				    return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
				};
				
				return  v1 + v4 + lpad(v2, 2) + v4 + lpad(v3, 2);
			}else{
				return '';
			}
		});
		
		var selectedPrd = {};
		
		var $campTab = $('#tab1');
		
		var $campTabBtn = $('[href="#tab1"]').closest('li');
		
		var initPage = function(){
			
			bindEvents();
			
			if($campTabBtn.hasClass('is-active')){
				
				$campTabBtn.trigger('click');
			}
		};
		
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
					
					toastrMsg("자격구분을 선택해주세요.","메세지","e");
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
			
			//drawOptions
			var optParam = {};
			optParam.prdId = selectedPrd.prdId;
			optParam.useBgnDtm = selectedPrd.useBgnDtm.replace(/\-/g,'');
			optParam.period = selectedPrd.period;
			
			commn.callAjax({
				url: '/reservation/campsite/selectOptionList.do',
				data: optParam,
				dataType: 'json'
			})
			.done(function(res){
				
				if(!res.optionList || $.isEmptyObject(res.optionList)){
					
					$('#application-reservation-camp-option [data-popup-btn="confirm"]').trigger('click')
				}else{
					
					var $options = $campTab.find('[data-template-id="camp-options-template"]');
					var optionsTemplate = Handlebars.compile($('#' + $options.data('template-id')).html()); 
					
					var optTemplateParam = {};
					optTemplateParam.options = res.optionList;
					optTemplateParam.period = selectedPrd.period;
					$options.html(optionsTemplate(optTemplateParam));
					
					$campTab.find('[data-popup="application-reservation-camp-option"]').trigger('click');
				}
			})
			.fail(function(e){
				//$("#loadingImage").hide();
				toastrMsg("일시적으로 장애가 발생하였습니다. 잠시 후 다시 시도하여 주시기 바랍니다.","메세지"); //<br />원활한 서비스를 위해 최선을 다하겠습니다.
			});
		};
		
		var bindEvents = function(){
			
			$campTab.find('#automatic-character-camp [data-popup-btn="confirm"]').on('click', reservation);
			
			$campTab.find('#automatic-character-camp [data-popup-btn="cancel"]').on('click', function(){$('#automatic-character-camp .btn-close').trigger('click');});

			$campTab.find('#application-reservation-camp-option [data-popup-btn="cancel"]').on('click', function(){$('#application-reservation-camp-option .btn-close').trigger('click');});
			
			$campTab.find('[data-reservation-step="2"]').on('click', '[data-button-name="reservation"]', function(){
				
				selectedPrd = {};
				selectedPrd.useBgnDtm = $(this).data('step2-use-bgn-dtm');
				selectedPrd.useEndDtm = $(this).data('step2-use-end-dtm');
				selectedPrd.periodText = $(this).data('step2-period-text');
				selectedPrd.period = $(this).data('step2-period');
				selectedPrd.startDateText = $(this).data('step2-start-date-text');
				selectedPrd.endDateText = $(this).data('step2-end-date-text');
				selectedPrd.prdNm = $(this).data('step2-prd-nm');
				selectedPrd.prdId = $(this).data('step2-prd-id');
				selectedPrd.deptId = $(this).data('step2-dept-id');
				selectedPrd.codeNm2 = $(this).data('step2-code-nm2');
				selectedPrd.salAmtSum = commn.nvl($(this).data('step2-sal-amt-sum'), '0');
				selectedPrd.salAmtSumCommas = numberWithCommas(selectedPrd.salAmtSum);

				selectedPrd.reserTp = $(this).data('step2-reser-tp');
				
				selectedPrd.brfeTerYn = $(this).data('step2-brfe-ter-yn');
				
				commn.callAjax({
					'url': '/reservation/auth.do',
					/* 'data': param, */
					'dataType' : 'json'
				})
				.done(window.automaticCharacterCamp)
				.fail(function(e){
					
					if(e.status == '401'){
						
						loginPopup('window.automaticCharacterCamp();');
					}else{
						
						toastrMsg("일시적으로 장애가 발생하였습니다. 잠시 후 다시 시도하여 주시기 바랍니다.","메세지"); //<br />원활한 서비스를 위해 최선을 다하겠습니다.
					}
				});
			});
			
			$('#application-reservation-camp-option [data-popup-btn="confirm"]').on('click', function(){
				
				
				var $popup = $campTab.find('#automatic-character-camp');
				var $popupContainer = $campTab.find('[data-template-id="camp-popup-container-template"]');
				
				var source = $('#' + $popupContainer.data('template-id')).html(); 
				var template = Handlebars.compile(source); 
				
				//옵션
				var $selectedOptions = $('[data-template-id="camp-options-template"]').find('[type="checkbox"][data-opt-id]:checked');
				var optionHtml = '';
				var optAmtTotal = 0;
				var optIds = '';
				
				$.each($selectedOptions, function(i){
					
					if(i > 0){
						optionHtml += '<br>';
					}
					
					if(optIds){
						optIds += ',';
					}
					
					optAmtTotal += Number($(this).val());
					
					optionHtml += $(this).data('opt-nm') + '사용 ' + selectedPrd.period + '박';
					
					optIds += $(this).data('opt-id');
				});
				
				selectedPrd.selectedOptions = optIds;
				selectedPrd.optionHtml = optionHtml;
				selectedPrd.totalAmt = commn.toNumber(selectedPrd.salAmtSum) + optAmtTotal;
				selectedPrd.totalAmtCommas = numberWithCommas(selectedPrd.totalAmt);
				
				//무장애영지
				if(selectedPrd.brfeTerYn == 'Y'){
					
					var brfeTerDt = selectedPrd.useBgnDtm;
					if(selectedPrd.period == 2){
						
						brfeTerDt = commn.date_add(brfeTerDt, 1);
					}
					brfeTerDt = commn.toNumber(brfeTerDt.replace(/\-/g,''));
					
					if(brfeTerDt < commn.toNumber(commn.date_add('', 3).replace(/\-/g,''))){
						
						selectedPrd.brfeTerYn = 'N';
					}
				}
	
				$popupContainer.html(template(selectedPrd));
				
				$campTab.find("input[name=captcha]").val('');
				
				$("#pnlRsrImgCamp").html("");
				$("#pnlRsrImgCamp").append("<img alt='자동예약 방지문자'/>").find("img:last").attr("src", "/reserCaptcha.do?dummy=" + (new Date()).getTime());
				
				$popup.find(".popup-wrap").css("top", "auto");
					
				$campTab.find('[data-popup="' + $popup.attr('id') + '"]').trigger('click');
				
				$(this).siblings('[data-popup-btn="cancel"]').trigger('click');
				
				$popup.find('.captcha-area input[name="captcha"]').focus();
			});
			
			$campTab.find('[data-template-id="camp-popup-container-template"]').on('click', '[data-button-name="exemption-auth"]', function(){
				
				$('[data-popup="exemption-auth"]').trigger('click');
			});
			
			$campTab.find('[data-button-name="cancel"]').on('click', function(){
				
				updateStep('1');
			});
			
			
			/* $('input[type="radio"][name="shelterMountain"]').on('click', function(){
				
				$('input[type="radio"][data-dept-id]').closest('li').hide();
				$('input[type="radio"][data-dept-id^="' + $(this).val() + '"]').closest('li').css('display', '');
			}); */
			
			/* step1 다음단계 click */
			$campTab.find('[data-button-name="refresh"]').on('click', function(){
				
				//$campTabBtn.data('active-flag', '').trigger('click');
				$campTab.find('[name="camp-reservation2"][value="N"]').prop('checked', true);
				$campTab.find('input[type="checkbox"][data-gubun-dept-id]').prop('checked', false).closest('li').siblings().hide();
				$campTab.find('[data-dept-dept-parent-nm]').prop('checked', false).closest('li').hide();
				$('[name="camp-mountain"]').prop('checked', false);
				
				refreshDate();
			});
			/* step1 다음단계 click */
			$campTab.find('[data-button-name="goStep2"]').on('click', function(){
				
				if(!$campTab.find('[data-calendar-cell-yyyy-mm-dd].start.selected').length
						|| !$campTab.find('[data-calendar-cell-yyyy-mm-dd].end.selected').length){
					toastrMsg("날짜를 선택해주세요.","메세지");
					return false;
				}
				if(!$campTab.find('[data-gubun-prd-ctg-id]:checked').length){
					toastrMsg("유형을 선택해주세요.","메세지");
					return false;
				}
				
				var $info = $campTab.find('[data-area-name="camp-reservation-info"]');
				
				var campsitesParam = {};
				campsitesParam.prdSalStcd = $campTab.find('[name="camp-reservation2"]:checked').val();
				campsitesParam.period = $info.data('info-period');
				campsitesParam.bgnDate = $campTab.find('[data-calendar-cell-yyyy-mm-dd].start.selected').data('calendar-cell-yyyy-mm-dd').replace(/\-/g,'');
				campsitesParam.endDate = $campTab.find('[data-calendar-cell-yyyy-mm-dd].end.selected').data('calendar-cell-yyyy-mm-dd').replace(/\-/g,'');
				campsitesParam.deptId = $campTab.find('input[type="radio"][data-dept-dept-id]:checked').data('dept-dept-id');
				campsitesParam.prdCtgIds = $("[data-gubun-prd-ctg-id]:checked").map(function(){
					return $(this).data('gubun-prd-ctg-id');
				}).get().join(',');
				
				commn.callAjax({
					'url': '/reservation/campsite/campsites.do',
					'data': campsitesParam,
					'dataType' : 'json'
				})
				.done(function(res){
					
					if(!res.avails || $.isEmptyObject(res.avails)){
						if(res.prdSalStcd == 'W'){
							toastrMsg("선택하신 날짜에 대기가능한 야영장이 없습니다.","메세지");
						}else{
							toastrMsg("선택하신 날짜에 예약가능한 야영장이 없습니다.","메세지");
						}
						return false;
					}
					
					updateStep('2');
					var $prds = $campTab.find('[data-template-id="camp-step2-template"]');
					var prdsSource = $('#' + $prds.data('template-id')).html(); 
					var prdsTemplate = Handlebars.compile(prdsSource);
					var prdsTemplateParam = {};
					var $selectedDept = $campTab.find('[data-dept-dept-nm]:checked');
					
					prdsTemplateParam.avails = res.avails;
					prdsTemplateParam.deptParentNm = $selectedDept.data('dept-dept-parent-nm');
					prdsTemplateParam.deptNm = $selectedDept.data('dept-dept-nm');
					prdsTemplateParam.deptId = $selectedDept.data('dept-dept-id');
					//$campTab.find('[data-area-name="camp-reservation-info"]')
					prdsTemplateParam.periodText = $info.data('info-period-text');
					prdsTemplateParam.period = $info.data('info-period');
					prdsTemplateParam.startDateText = $info.data('info-start-date-text');
					prdsTemplateParam.endDateText = $info.data('info-end-date-text');
					prdsTemplateParam.useBgnDtm = $info.data('info-use-bgn-dtm');
					prdsTemplateParam.useEndDtm = $info.data('info-use-end-dtm');
					
					prdsTemplateParam.reserTp = $campTab.find('[name="camp-reservation2"]:checked').val() == 'W' ? 'W' : 'R'; 
					
					$prds.html(prdsTemplate(prdsTemplateParam));
					
					$campTab.find('[data-area-name="step2TotalCnt"]').html(commn.nvl(res.avails).length);
					$campTab.find('[data-area-name="step2PeriodText"]').html($info.data('info-period-text'));
					$campTab.find('[data-area-name="step2StartEndText"]').html($info.data('info-start-date-text') + ' ~ ' + $info.data('info-end-date-text'));
					
					//res.avails.length
				})
				.fail(function(){
					
					//$("#loadingImage").hide();
					toastrMsg("일시적으로 장애가 발생하였습니다. 잠시 후 다시 시도하여 주시기 바랍니다.","메세지"); //<br />원활한 서비스를 위해 최선을 다하겠습니다.
				});
				
			});
			
			$campTabBtn.on('click', function(){
				
				var $this = $(this);
				var param = {};
				
				if($campTab.find('[data-reservation-step="2"]').css('display') == 'none'){
					updateStep('1');
				}else{
					updateStep('2');
				}
				
				if($this.data('active-flag') == 'Y'){
					return false;
				}
				/* param.deptId = $('input[type="radio"][name="shelterMountain"]:checked').val();
				param.prdId = $this.val(); */
				commn.callAjax({
					'url': '/reservation/campsite/campList.do',
					'data': param,
					'dataType' : 'json'
				})
				.done(function(res){

					$this.data('active-flag', 'Y');
					
					var calendars = commn.nvl(res).calendars;
					var campGroupList = commn.nvl(res).campGroupList;
					var campGubunList = commn.nvl(res).campGubunList;
					var campList = commn.nvl(res).campList;
					
					var $group = $('[data-template-id="camp-group-template"]');
					var $dept = $('[data-template-id="camp-dept-template"]');
					var $gubun = $('[data-template-id="camp-gubun-template"]');
					var $calendars = $('[data-template-id="camp-calendar-template"]');
					
					$group.empty();
					if(campGroupList){
						
						var groupTemplate = Handlebars.compile($('#' + $group.data('template-id')).html());
						
						$group.html(groupTemplate(campGroupList));
					}
					
					$dept.empty();
					if(campList){
						
						var deptTemplate = Handlebars.compile($('#' + $dept.data('template-id')).html());
						
						$dept.html(deptTemplate(campList));
					}
					
					$gubun.empty();
					if(campGubunList){
						
						var gubunTemplate = Handlebars.compile($('#' + $gubun.data('template-id')).html());
						
						$gubun.html(gubunTemplate(campGubunList));
					}
					
					$calendars.find('[data-area-name="camp-calendar"]').remove();
					if(calendars){
						
						var source = $('#' + $calendars.data('template-id')).html(); 
						var template = Handlebars.compile(source); 
						
						$.each(calendars, function(i, item){

							$calendars.find('[data-area-name="camp-reservation-info"]').before(template(item))
							.find('[data-calendar-cell-yyyy-mm-dd]').on('click', function(){
							});
							
						});
					}
					
					campListBindEvents();
				})
				.fail(function(){
					
					//$("#loadingImage").hide();
					toastrMsg("일시적으로 장애가 발생하였습니다. 잠시 후 다시 시도하여 주시기 바랍니다.","메세지"); //<br />원활한 서비스를 위해 최선을 다하겠습니다.
				});
			});
		};
		
		initPage();
	});

//]]>
</script>

<div class="grid-row" data-reservation-step="1">
    <div class="grid-cell">
        <h3 class="title">위치</h3>
        <ul class="check-area" data-template-id="camp-group-template">
        	
        </ul>
        <ul class="check-area" data-template-id="camp-dept-template">
        	
        </ul>
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
        <ul class="check-area" data-template-id="camp-gubun-template">
            <!-- <li>
                <span class="checkbox-1">
                    <input type="checkbox" id="check10">
                    <label for="check10">자동차 야영장</label>
                </span>
            </li> -->
        </ul>
        <ul class="radio-area column">
            <li>
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








<script>
$(document).ready(function(){

		//다음
		$('.selfAuthModal').click(function(){
		
			var policyVal = $('input[name="policy"]:checked').val();
			if(policyVal  == ''){
				toastrMsg('개인정보 제공 동의를 해주세요.');
				return false;
			}
			
			if($('#usNmId').text() == ''){
				toastrMsg('본인인증을 진행해주세요.');
				return false;
			}

			if($('#usNm').val() == ''){
				toastrMsg('주민등록번호 뒷자리를 입력해주세요.');
				return false;
			}
			
            ajaxCall({
                url : "/common/authGpkiForPay.do",
                data : {
                    "tgtrNm" : $('#usNmId').text(),
                    "trtrNum" : $('#usNumId').text()+""+$('#usNm').val(),
                    "authType" : $('#authTypeId').val()
                },
                success : function(dat){
                    if( $('#authTypeId').val() == 'A'){ //장애인여부확인
                        reductionDisabledDc(dat);
                    }else{
                        naManMeritDc(dat);
                    }
                },
                error : function(){
                    toastrMsg('감면 인증 중 오류가 발생하였습니다. <br/>관리자에게 문의하여 주세요.');
                }
            })
		});

		//취소 감면인증정보 확인 모달 제거
		$('.selfAuthModalCancel').click(function(){
            $('#radio1-1').prop('checked',true);
            closePopup('exemption-auth');
		});
		
});
function reductionDisabledDc(dat){
    var qufyYn = dat.qufyYn;
    var disabledCode = dat.disabledCode;
    let subTitle = '';
    let content = '';
    let type = '';

    if ($('#usNmId').text() == '') {

        if(qufyYn == 'M'){

            subTitle = $('#usNmId').text() + '님은 대상자가 아닙니다.';
            content = '기존 대상자였지만 현재 비대상자로 전환 되었습니다.<br/>확인 후 다시 시도해주세요.';
            type = 'error';
            $('#radio1-1').prop('checked', true);

        }else if(qufyYn == 'Y') {

            if (disabledCode == '00' || disabledCode == '98' || disabledCode == '99') {

                var strMsg = '';
                if (disabledCode == '00') {
                    strMsg = '장애 미해당';
                } else if (disabledCode == '98') {
                    strMsg = '결정보류';
                } else if (disabledCode == '99') {
                    strMsg = '확인불가';
                }

                $('#exemptionAuthText').val('대상자가 아닙니다');
                subTitle = $('#usNmId').text() + '님은 대상자가 아닙니다.';
                content = '현재 '+strMsg+' 상태입니다.<br/>확인 후 다시 시도해주세요.';
                type = 'error';
                $('#radio1-1').prop('checked', true);

            } else {

                if ('10' == disabledCode) {
                    $('#radio1-2').prop('checked', true);
                    $('#certTextId').val('장애인(중증, 1~3급)');
                } else if ('20' == disabledCode) {
                    $('#radio1-3').prop('checked', true);
                    $('#certTextId').val('장애인(경증, 4~6급)');
                }else{
                    $('#radio1-3').prop('checked', true);
                    $('#certTextId').val('장애인 대상자');
                }

                subTitle = $('#usNmId').text() + '님은 감면 대상자입니다.';
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
        title: '알림',
        subTitle: subTitle,
        content: content,
        type: type
    });
    self.close();

}

function naManMeritDc(dat){

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
            if(dcTargetYn == 'Y') {
                if ('00011' == wondClassCd || '00012' == wondClassCd
                    || '00013' == wondClassCd || '00020' == wondClassCd
                    || '00030' == wondClassCd || '00G01' == wondClassCd
                    || '00G02' == wondClassCd || '00G03' == wondClassCd) { //1~3급

                    $('#radio1-4').prop('checked', true);
                    $('#certTextId').val('국가유공자(1~3급)');
                } else if ('00017' == subjKbnCd || '00018' == subjKbnCd || '00019' == subjKbnCd) { //518 민주화운동자.
                    $('#radio1-5').prop('checked', true);
                    $('#certTextId').val('5.18 민주운동자');
                } else { //그 외
                    $('#radio1-6').prop('checked', true);
                    $('#certTextId').val('국가유공자(4~7급), 등급 외(무공·보훈수훈자, 배우자, 유족 등)');
                }

                //할인금액 재계산
                recalWithExemption();

                subTitle = $('#usNmId').text() + '님은 감면 대상자입니다.';
                content = '';
                type = '';
            } else {
                //조회 결과 (S:성공 이 아닐때 )
                if(inquRsltCd != 'S') {
                    subTitle = $('#usNmId').text() + '님은 대상자가 아닙니다.';
                    content = '조회 결과가 없습니다.<br/>확인 후 다시 시도해주세요.';
                    type = 'error';
                    $('#radio1-1').prop('checked', true);
                } else {
                    //수권자인지 체크
                    if(authoriPsnYn != 'Y') {
                        subTitle = $('#usNmId').text() + '님은 대상자가 아닙니다.';
                        content = '확인 후 다시 시도해주세요.';
                        type = 'error';
                        $('#radio1-1').prop('checked', true);
                    } else {
                        //조회결과가 있고, 수권자인데 본인이 아닌경우
                        if(relCd != 'A') {
                            subTitle = '본인인 경우에만 선할인 가능합니다.';
                            content = '수권자 본인만 할인 가능합니다.<br/>가족 및 배우자이신 경우 증빙을 지참하시고 현장할인 받으시기 바랍니다.';
                            type = 'error';
                            $('#radio1-1').prop('checked', true);
                        } else {
                            //이경우는 없긴한데 일단 처리
                            subTitle = $('#usNmId').text() + '님은 대상자가 아닙니다.';
                            content = '확인 후 다시 시도해주세요.';
                            type = 'error';
                            $('#radio1-1').prop('checked', true);
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
        title: '알림',
        subTitle: subTitle,
        content: content,
        type: type
    });
    self.close();

}
//국가유공자 등급확인

//휴대폰 인증
function goAuth(){
	
	$.ajax({
		url:"/pay/checkPlusForPay.do",  
		type: "POST", 
		dataType: "json",
		async : false ,
		data: {},
		success: function(dat) {
			
			//인증요청 암호화 데이터가 없을 경우 오류발생
            if(dat.result.sEncData == ''){
                toastrMsg(dat.result.sRtnMsg);
            }else{
                $("#EncodeData").val(dat.result.sEncData);
                window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
                document.form_chk.target = "popupChk";
                document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
                document.form_chk.submit();
            }
		},
		error: function(e1,e2,e3) {
			
		}
	});
	
}


//아이핀 인증
function goAuthiPin(){
	
	
	$.ajax({
		url:"/pay/iPinForPay.do",  
		type: "POST", 
		dataType: "json",
		async : false ,
		data: {},
		success: function(dat) {
			
			//인증요청 암호화 데이터가 없을 경우 오류발생
            if(dat.result.sEncData == ''){
                toastrMsg(dat.result.sRtnMsg);
            }else{
           	      $("#enc_data").val(dat.result.sEncData);
                  window.open('', 'popupIPIN2', 'width=450, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
                  document.form_ipin.target = "popupIPIN2";
                  document.form_ipin.action = "https://cert.vno.co.kr/ipin.cb";
                  document.form_ipin.submit();
            }
		},
		error: function(e1,e2,e3) {
			
		}
	});
	
}

</script>

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

<script>
    //<![CDATA[

    var shelter = {};
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

    commn.callAjax = function(props){

        var settings = {};
        props.isShowLoading = props.isShowLoading || 'Y';
        settings.dataType = 'json';
        settings.method = 'post';
        settings.url = props.url;
        settings.data = props.data;

        if(props.headers){
            settings.headers = props.headers;
        }
        if(props.isShowLoading == 'Y'){
            settings.beforeSend = showLoading;
            settings.complete = maskBackgroundOff;
        }
        if(props.method){
            settings.method = props.method;
        }
        if(props.dataType){
            settings.dataType = props.dataType;
        }

        return $.ajax(settings);
    };

    commn.getDayWeekNm = function(dayWeek){
        switch (dayWeek) {
            case 1:
            case '1': return "월";
            case 2:
            case '2': return "화";
            case 3:
            case '3': return "수";
            case 4:
            case '4': return "목";
            case 5:
            case '5': return "금";
            case 6:
            case '6': return "토";
            case 7:
            case '7': return "일";
        }
    };

    commn.date_add = function(sDate, nDays) {

        if(!sDate){

            function getToday(){
                var date = new Date();
                var year = date.getFullYear();
                var month = ("0" + (1 + date.getMonth())).slice(-2);
                var day = ("0" + date.getDate()).slice(-2);

                return year + "-" + month + "-" + day;
            }
            sDate = getToday();
        }
        var yy = parseInt(sDate.substr(0, 4), 10);
        var mm = parseInt(sDate.substr(5, 2), 10);
        var dd = parseInt(sDate.substr(8), 10);

        d = new Date(yy, mm - 1, dd + nDays);

        yy = d.getFullYear();
        mm = d.getMonth() + 1; mm = (mm < 10) ? '0' + mm : mm;
        dd = d.getDate(); dd = (dd < 10) ? '0' + dd : dd;

        return '' + yy + '-' +  mm  + '-' + dd;
    };

    commn.toNumber = function(str){

        return Number(commn.nvl(str, '0'));
    };


    $(function(){

        Handlebars.registerHelper('numberWithCommas', function(v1) {
            if(!v1){
                v1 = '0';
            }
            if(v1 != null && v1 != '') {
                return numberWithCommas(v1);
            }
            return '';
        });
        Handlebars.registerHelper('ifCond', function(v1, v2, options) {
            if(v1 === v2) {
                return options.fn(this);
            }
            return options.inverse(this);
        });

        Handlebars.registerHelper('formatDate', function(v1, v2, v3, v4) {

            if(v1 && v2 && v3 && v4){

                var lpad = function(n, width) {
                    n = n + '';
                    return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
                };

                return  v1 + v4 + lpad(v2, 2) + v4 + lpad(v3, 2);
            }else{
                return '';
            }
        });

        var $shelterTab = $('#tab2');

        var $shelterTabBtn = $('[href="#tab2"]').closest('li');

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

        window.shelterChangeStep = function(){

            closePopup('confirmPop');
            updateStep('1');
            $shelterTab.find('[data-button-name="refresh"]').trigger('click');
        };

        var drawPayment = function(){

            var $prds = $shelterTab.find('[data-template-id="shelter-step2-template"]');

            var $payment = $shelterTab.find('[data-template-id="shelter-step2-payment-template"]');
            var paymentSource = $('#' + $payment.data('template-id')).html();
            var paymentTemplate = Handlebars.compile(paymentSource);
            var paymentTemplateParam = {};
            var priceSum = 0;
            paymentTemplateParam.prds = [];
            $.each($prds.find('select[data-step2-prd-id]'), function(){

                var step2Prd = {};
                step2Prd.useBgnDtm = $(this).data('step2-use-bgn-dtm');
                step2Prd.dayWeekNm = $(this).data('step2-day-week-nm');
                step2Prd.updNm = $(this).data('step2-upd-nm');
                step2Prd.prdNm = $(this).data('step2-prd-nm');
                step2Prd.salAmt = $(this).data('step2-sal-amt');
                step2Prd.rsrvtQntt = $(this).val();
                step2Prd.price = commn.toNumber(step2Prd.salAmt) * commn.toNumber(step2Prd.rsrvtQntt);
                priceSum += step2Prd.price;
                paymentTemplateParam.prds.push(step2Prd);
            });
            paymentTemplateParam.priceSum = priceSum;

            $payment.html(paymentTemplate(paymentTemplateParam));
        };

        var selectedPrds = function(){

            var prds = [];
            $.each($shelterTab.find('select[data-step2-prd-id]'), function(){

                var prd = {};
                var $prd = $(this);

                var price = commn.nvl($prd.data('step2-sal-amt'));
                var pricePer = 0;
                var rsrvtQntt = $prd.val(); //인원수
                price = Number(price);
                rsrvtQntt = Number(rsrvtQntt);
                pricePer = price * rsrvtQntt;

                prd.prdId = commn.nvl($prd.data("step2-prd-id"));
                prd.deptId = commn.nvl($prd.data("step2-dept-id"));
                //prd.useDt = $prd.data("use_dt") || '';
                prd.ymdUseDt = commn.nvl($prd.data("step2-use-bgn-dtm"));
                prd.useBgnDtm = commn.nvl($prd.data("step2-use-bgn-dtm")).replace(/\-/g,'');
                prd.crtrDow = commn.nvl($prd.data('step2-day-week-nm'));
                //prd.park_nm = $prd.data("park_nm") || '';
                prd.updNm = commn.nvl($prd.data("step2-upd-nm"));
                prd.prdNm = commn.nvl($prd.data("step2-prd-nm"));
                //prd.areaCode = prd.prdId.substr(1, 4);
                prd.salAmt = pricePer;
                prd.rsrvtQntt = commn.nvl(rsrvtQntt); //reg
                prd.price = numberWithCommas(pricePer);
                prd.reserTp = commn.nvl($prd.data("step2-reser-tp"));
                /* prd.ymdUseDt = String(prd.useDt).replace(/\s/gi, "")
                                .replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3'); */

                prds.push(prd);
            });

            return prds;
        };

        
        function reserStart_20221031() {
            if($shelterTab.find("input[name='captcha']").val() == null || $shelterTab.find("input[name='captcha']").val().trim() == "") {
                toastrMsg("자동예약방지글을 입력해주세요.","메세지","e");
                $shelterTab.find("input[name='captcha']").focus();
                return;
            }

            //showLoading();

            var action = "/reservation/shelter/registerShelterReser.do";
            //var form_data = $("#frmReservation").serialize();
            var prdParam = {};
            prdParam.prds = selectedPrds();
            //{'captcha' : $('.captcha-area input[name="captcha"]').val()}

            if(!prdParam.prds || $.isEmptyObject(prdParam.prds)){
                toastrMsg("예약건을선택해주세요", "메세지", "e");
                return false;
            }

            var reserTp = prdParam.prds[0].reserTp;

            prdParam.captcha = $shelterTab.find('.captcha-area input[name="captcha"]').val();
            prdParam.wtngCancel = '';
            prdParam.rsrvtType = 'RSRVT'; ////////WTNG

            commn.callAjax({
                'url': action,
                'data': JSON.stringify(prdParam),
                'dataType' : 'json',
                'headers' : {'Content-Type' : "application/json; charset=utf-8"}
            })
                .done(function(res){
                    var resMsg = commn.nvl(res).message;
                    if(resMsg){
                        alertPopup({
                            title:'안내',
                            subTitle:'안내',
                            content: resMsg,
                            type:'error'
                        });
                        $shelterTab.find('[data-template-id="shelter-popup-container-template"]').find('[data-popup-btn="cancel"]').on('click', function(){
                        $shelterTab.find('#automatic-character-shelter').find('.btn-close').trigger('click');});
                        $shelterTab.find('[data-template-id="shelter-popup-container-template"]').find('[data-popup-btn="cancel"]').click();
                    }else{
                        if(reserTp == 'W'){
                            $('#reservation-information1-shelter [data-area-name="reservation-popup-container-w"]').css('display', '').siblings('#reservation-information1-shelter [data-area-name="reservation-popup-container"]').hide();
                        }else{
                            $('#reservation-information1-shelter [data-area-name="reservation-popup-container"]').css('display', '').siblings('#reservation-information1-shelter [data-area-name="reservation-popup-container-w"]').hide();
                            if(window.isGreenpoint != 'Y'){
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

                                $('[data-popup-information-shelter="sttlmMtDtm"]').empty();
                                $.each(res.sttlmMtDtms, function(i, item){
                                    $('[data-popup-information-shelter="sttlmMtDtm"]').append('<em>' + item.prdNm + '</em>의 결제 만기일시는 <em>' + ymdhm(item.sttlmMtDtm2) + '</em> 까지 입니다.<br>');
                                });
                                $('[data-popup-information-shelter="sttlmMtDtm"]').append('미 결제시 자동 취소되니 유의 하시기 바랍니다.');
                            }
                        }
                        $shelterTab.find('[data-popup="reservation-information1-shelter"]').trigger('click');
                    }
                })
                .fail(function(e){
                    var resMsg = commn.nvl(e).message;
                    if(resMsg){
                    	var msg = resMsg;
                        alertPopup({
                            title:'예약불가 안내',
                            subTitle:'예약불가 안내',
                            content: msg,
                            type:'error'
                        });	
                        $shelterTab.find('[data-template-id="shelter-popup-container-template"]').find('[data-popup-btn="cancel"]').on('click', function(){
                        $shelterTab.find('#automatic-character-shelter').find('.btn-close').trigger('click');});
                        $shelterTab.find('[data-template-id="shelter-popup-container-template"]').find('[data-popup-btn="cancel"]').click();
                    }else{
                        toastrMsg("일시적으로 장애가 발생하였습니다. 잠시 후 다시 시도하여 주시기 바랍니다.","메세지"); //<br />원활한 서비스를 위해 최선을 다하겠습니다.
                    }
                });
        };
        
        function reserStart() {

            // 백신접종여부항목 체크
//	 		if(!checkVaccine()) {
//	 			return;
//	 		}

            if($shelterTab.find("input[name='captcha']").val() == null || $shelterTab.find("input[name='captcha']").val().trim() == "") {
                toastrMsg("자동예약방지글을 입력해주세요.","메세지","e");
                $shelterTab.find("input[name='captcha']").focus();
                return;
            }

            //showLoading();

            var prdParam = {};
            prdParam.prds = selectedPrds();
            if(!prdParam.prds || $.isEmptyObject(prdParam.prds)){
                toastrMsg("예약건을선택해주세요", "메세지", "e");
                return false;
            }

            var reserTp = prdParam.prds[0].reserTp;
            prdParam.captcha = $shelterTab.find('.captcha-area input[name="captcha"]').val();
            prdParam.wtngCancel = '';
            prdParam.rsrvtType = 'RSRVT'; ////////WTNG

            ajaxCall({
                url :  '/common/shelter/createReservation.do',
                data : JSON.stringify(prdParam),
                dataType : 'json',
                contentType: 'application/json',
                header : {'Content-Type' : "application/json; charset=utf-8"},
                success : function(dat){

                    if(dat.result=='Y'){

                        if(reserTp == 'W'){
                            $('#reservation-information1-shelter [data-area-name="reservation-popup-container-w"]').css('display', '').siblings('#reservation-information1-shelter [data-area-name="reservation-popup-container"]').hide();
                        }else{
                            $('#reservation-information1-shelter [data-area-name="reservation-popup-container"]').css('display', '').siblings('#reservation-information1-shelter [data-area-name="reservation-popup-container-w"]').hide();
                            if(window.isGreenpoint != 'Y'){

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

                                $('[data-popup-information-shelter="sttlmMtDtm"]').empty();
                                $.each(dat.sttlmMtDtms, function(i, item){
                                    $('[data-popup-information-shelter="sttlmMtDtm"]').append('<em>' + item.prdNm + '</em>의 결제 만기일시는 <em>' + ymdhm(item.sttlmMtDtm2) + '</em> 까지 입니다.<br>');
                                });
                                $('[data-popup-information-shelter="sttlmMtDtm"]').append('미 결제시 자동 취소되니 유의 하시기 바랍니다.');
                            }
                        }
                        $shelterTab.find('[data-popup="reservation-information1-shelter"]').trigger('click');

                    } else {
                        alertPopup({
                            title:'안내',
                            subTitle:'안내',
                            content: dat.resultMsg,
                            type:'error'
                        });
                        $shelterTab.find('[data-template-id="shelter-popup-container-template"]').find('[data-popup-btn="cancel"]').on('click', function(){
                            $shelterTab.find('#automatic-character-shelter').find('.btn-close').trigger('click');});
                        $shelterTab.find('[data-template-id="shelter-popup-container-template"]').find('[data-popup-btn="cancel"]').click();
                    }
                },
                error : function(){
                    toastrMsg("일시적으로 장애가 발생하였습니다. 잠시 후 다시 시도하여 주시기 바랍니다.","메세지"); //<br />원활한 서비스를 위해 최선을 다하겠습니다.
                }
            });

        };

        var shelterListBindEvents = function(){

            var $calendars = $shelterTab.find('[data-template-id="shelter-calendar-template"]');

            $shelterTab.find('[type="radio"][data-dept-id]').on('click', function(){

                $('[data-area-name="selected-dept-nm"]').html($(this).data('prd-nm'));
            });

            $calendars.find('[data-calendar-cell-yyyy-mm-dd]').on('click', function(){
                //달력 click
                var $checkedPrd = $shelterTab.find('input[type="radio"][name="refuge"]:checked');

                if(!$checkedPrd.length){
                    toastrMsg('대피소를 선택해주세요');
                    return false;
                }

                $calendars.find('[data-calendar-cell-yyyy-mm-dd]').removeClass('selected choose');
                $(this).addClass('selected choose')
                $shelterTab.find('[data-button-name="addItem"]').siblings().remove();
                $shelterTab.find('[data-button-name="addItem"]')
                    .before('<dl><dt>선택위치</dt><dd data-area-name="selected-dept-nm">'
                        + $checkedPrd.data('prd-nm') + '</dd></dl><dl><dt>선택날짜</dt><dd>'
                        + $(this).data('calendar-cell-yyyy-mm-dd') + ' [' + commn.getDayWeekNm($(this).data('calendar-cell-day-week')) + ']</dd></dl>');
            });

            $calendars.find('[data-button-name="addItem"]').on('click', function(){
                //예약정보 추가 click
                var $selected = $calendars.find('[data-calendar-cell-yyyy-mm-dd].selected.choose');
                var $checkedPrd = $shelterTab.find('input[type="radio"][name="refuge"]:checked');

                var $added = $shelterTab.find('[data-added-prd-id]');

                var prdId = $checkedPrd.val();
                var deptId = $checkedPrd.data('dept-id');
                var updNm = $checkedPrd.data('upd-nm');

                //예약정보 추가 전 검증
                //동일날짜의 모든 대피소는 추가되지 않음
                //동일시설은 연박으로 추가되지 않음
                //지리산 종주시에만 3건, 나머지 국립공원은 2건
                var beforeAdd = function(){

                    if(!prdId){
                        toastrMsg("대피소를 선택해주세요.","메세지");
                        return false;
                    }

                    if(!$selected.length){
                        toastrMsg("날짜를 선택해주세요.","메세지");
                        return false;
                    }


                    var flag = true;

                    var $dupDeptNotB01 = $.grep($added, function(n, i){
                        return commn.nvl($(n).data('added-dept-id')).substring(0, 3) != 'B01';
                    });


                    var maxLen = $dupDeptNotB01.length ? 2 : 3; //최대 선택가능 지리산만 3

                    if(commn.nvl(deptId).substring(0, 3) != 'B01'){
                        //추가할대피소가 지리산이아니면
                        maxLen = 2;
                    }

                    if($added.length >= maxLen){

                        //한번에 최대 2개까지 추가할 수 있습니다.
                        if(maxLen==2){
                            toastrMsg("한번에 최대 " + maxLen + "건까지 추가할 수 있습니다.<br>지리산 종주는 3건까지 가능합니다.", "메세지", "e");
                        }else{
                            toastrMsg("한번에 최대 " + maxLen + "건까지 추가할 수 있습니다.", "메세지", "e");
                        }
                        flag = false;
                        return flag;
                    }

                    $.each($added, function(){

                        if($(this).data('added-yyyy-mm-dd') == $selected.data('calendar-cell-yyyy-mm-dd')){
                            toastrMsg("동일날짜의 시설은 선택할 수 없습니다.", "메세지", "e");
                            flag = false;
                            return false;
                        }

                        /*
                        연박체크 제거(2022-09-01 / KHYoo)
                        if($(this).data('added-prd-id') == prdId){

                            if(commn.date_add($(this).data('added-yyyy-mm-dd'), 1) == $selected.data('calendar-cell-yyyy-mm-dd')
                                || commn.date_add($(this).data('added-yyyy-mm-dd'), -1) == $selected.data('calendar-cell-yyyy-mm-dd')){
                                toastrMsg("동일시설은 연박으로 선택할 수 없습니다.", "메세지", "e");
                                flag = false;
                                return false;
                            }
                        }
                        */
                    });

                    return flag;
                };

                if(!beforeAdd()){

                    return false;
                }


                /* $selectedPrd.html(
                        $selectedPrd.find('tr[data-use-dt]').sort(function(a, b){
                            return $(a).data('use-dt') - $(b).data('use-dt');
                        })
                    ); */

                //$('[data-selected-item="before"]').siblings().remove();
                $shelterTab.find('[data-selected-item="before"]').after(
                    '<dl data-added-item="wrap" data-added-prd-id="' + prdId + '" data-added-dept-id="' + deptId + '" data-added-upd-nm="' + updNm + '"'
                    + ' data-added-yyyy-mm-dd="' + $selected.data('calendar-cell-yyyy-mm-dd') + '" data-added-day-week="' + $selected.data('calendar-cell-day-week') + '"'
                    + ' data-added-prd-nm="' + $checkedPrd.data('prd-nm') + '">'
                    + '<dt><em>'
                    + $checkedPrd.data('prd-nm')
                    + '</em><span class="date">'
                    + $selected.data('calendar-cell-yyyy-mm-dd')
                    + ' [' + commn.getDayWeekNm($selected.data('calendar-cell-day-week')) + ']'
                    + '</span></dt><dd class="form"><button class="btn btn-delete" data-button-name="delete">삭제</button></dd></dl>')
                    .parent().find('[data-button-name="delete"]').on('click', function(){
                    //추가된 예약정보 삭제버튼
                    $(this).closest('[data-added-item="wrap"]').remove();
                });


            });
        };

        window.automaticCharacterShelter = function(){

            var templateParam = {};

            templateParam.prds = selectedPrds();

            if(!templateParam.prds || $.isEmptyObject(templateParam.prds)){
                toastrMsg("예약건을선택해주세요", "메세지", "e");
                return false;
            }

            var $popup = $shelterTab.find('#automatic-character-shelter');
            var $popupContainer = $shelterTab.find('[data-template-id="shelter-popup-container-template"]');

            var source = $('#' + $popupContainer.data('template-id')).html();
            var template = Handlebars.compile(source);

            $popupContainer.html(template(templateParam));

            $("#pnlRsrImgShelter").html("");
            $("#pnlRsrImgShelter").append("<img alt='자동예약 방지문자'/>").find("img:last").attr("src", "/reserCaptcha.do?dummy=" + (new Date()).getTime());

            $popup.find(".popup-wrap").css("top", "auto");

            $shelterTab.find('[data-popup="' + $popup.attr('id') + '"]').trigger('click');

            $shelterTab.find('.captcha-area input[name="captcha"]').focus();

            $popupContainer.find('[data-popup-btn="confirm"]').on('click', reserStart);
            $popupContainer.find('[data-popup-btn="cancel"]').on('click', function(){$popup.find('.btn-close').trigger('click');});
        };

        var bindEvents = function(){

            $shelterTab.find('[data-button-name="reservation"]').on('click', function(){

                commn.callAjax({
                    'url': '/reservation/auth.do',
                    /* 'data': param, */
                    'dataType' : 'json'
                })
                    .done(window.automaticCharacterShelter)
                    .fail(function(e){

                        if(e.status == '401'){

                            loginPopup('window.automaticCharacterShelter();');
                        }else{

                            toastrMsg("일시적으로 장애가 발생하였습니다. 잠시 후 다시 시도하여 주시기 바랍니다.","메세지"); //<br />원활한 서비스를 위해 최선을 다하겠습니다.
                        }
                    });
            });

            /* 전체체크박스 */
            $('#shelter-check1').on('change', function(){

                if($(this).prop('checked')){

                    $('[id^="shelter-check1-"]').prop('checked', true);
                }else{

                    $('[id^="shelter-check1-"]').prop('checked', false);
                }
            });

            /* 선택건 체크박스 */
            $('body').off('change', '[id^="shelter-check1-"]').on('change', '[id^="shelter-check1-"]', function(){

                var checked = true;

                $.each($('[id^="shelter-check1-"]'), function(){

                    if(!$(this).prop('checked')){

                        checked = false;
                    }
                });
                $('#shelter-check1').prop('checked', checked);
            });

            /* step2 선택건 삭제버튼 */
            $shelterTab.find('[data-button-name="step2Delete"]').on('click', function(){

                var $checked = $shelterTab.find('[data-template-id="shelter-step2-template"] input[type="checkbox"]:checked');
                if(!$checked.length){

                    toastrMsg("대피소를 선택해주세요.","메세지");
                    return false;
                }
                $checked.closest('tr').remove();

                //모두삭제시 전체체크박스 false
                if(!$shelterTab.find('[data-template-id="shelter-step2-template"] input[type="checkbox"]:checked').length){

                    $('#shelter-check1').prop('checked', false);
                }
                drawPayment();
            });

            $shelterTab.find('[data-button-name="cancel"]').on('click', function(){

                confirmPopup({
                    title:'예약 취소',
                    subTitle:'예약 취소',
                    content:'취소한 설정값은 복구되지 않습니다.<br/>처음부터 다시 진행하시겠습니까?',
                    type:'error',
                    send_type : 'POST',
                    urlFun:'window.shelterChangeStep()'
                });
            });

            $shelterTab.find('[data-button-name="refresh"]').on('click', function(){

                //$shelterTabBtn.data('active-flag', '').trigger('click');
                $shelterTab.find('[name="reservation2"][value="RSRVT"]').prop('checked', true); //검색조건
                $shelterTab.find('[data-selected-item="before"]').siblings().remove(); //선택시설
                $shelterTab.find('[data-button-name="addItem"]').siblings().remove(); //선택위치, 선택날짜
                $shelterTab.find('[data-calendar-cell-yyyy-mm-dd]').removeClass('selected choose');

                $shelterTab.find('[type="radio"][data-dept-id]').prop('checked', false).closest('li').hide();
                $shelterTab.find('[name="shelterMountain"]').prop('checked', false);
            });

            //step1 다음단계 click
            $shelterTab.find('[data-button-name="goStep2"]').on('click', function(){

                if($shelterTab.find('[data-added-prd-id]').length){

                    commn.callAjax({
                        'url': '/reservation/shelter/avails.do',
                        'data': {},
                        'dataType' : 'json'
                    })
                        .done(function(res){

                            shelter.avails = res.avails;

                            var availPrds = [];
                            $.each($shelterTab.find('[data-added-prd-id]'), function(i, item){

                                var prdId = $(item).data('added-prd-id');
                                var useBgnDtm = $(item).data('added-yyyy-mm-dd');

                                var availGrep = $.grep(shelter.avails, function(n){return n.FORMAT_PRD_SAL_YMD == useBgnDtm && n.PRD_ID == prdId});

                                if(availGrep.length){

                                    var avail = availGrep[0];
                                    var getDefaultSet = function($this){
                                        return {
                                            updNm : $this.data('added-upd-nm'),
                                            prdNm : $this.data('added-prd-nm'),
                                            prdId : $this.data('added-prd-id'),
                                            deptId : $this.data('added-dept-id'),
                                            useBgnDtm : $this.data('added-yyyy-mm-dd'),
                                            dayWeekNm : commn.getDayWeekNm($this.data('added-day-week'))
                                        };
                                    };

                                    var rsrvtType = $shelterTab.find('input[type="radio"][name="reservation2"]:checked').val();
                                    //예약가능선택
                                    if(rsrvtType == 'RSRVT'){

                                        /* AND RSR.REMN_RSRVT_CNT >= #rsrvt_qntt#
                                        AND RSR.MXMM_WTNG_CNT = RSR.REMN_WTNG_CNT
                                        AND RSR.FCLT_RSRVT_STCD = 'N' */

                                        /* AND RSR.PSB_RSVT_CNT >= #rsrvt_qntt#
                                        AND RSR.MAX_RSVT_WTN_CNT(최대예약대기수) = RSR.RSVT_PSB_WTN_CNT(예약가능대기수)
                                        AND RSR.PRD_SAL_STCD = 'N' */
                                        if(commn.toNumber(avail.PSB_RSVT_CNT) >= 1
                                            && commn.toNumber(avail.MAX_RSVT_WTN_CNT) == commn.toNumber(avail.RSVT_PSB_WTN_CNT)
                                            && avail.PRD_SAL_STCD == 'N'){

                                            var availPrd = getDefaultSet($(item));
                                            availPrd.psbCnt = avail.PSB_RSVT_CNT;
                                            availPrd.salAmt = avail.SAL_AMT;
                                            availPrd.reserTp = 'R';

                                            availPrds.push(availPrd);
                                        }
                                    }

                                    //대기가능선택
                                    if(rsrvtType == 'WTNG'){

                                        /* AND REMN_WTNG_CNT &gt;= #rsrvt_qntt#
                                        AND (MXMM_WTNG_CNT - REMN_WTNG_CNT &gt; 0 OR REMN_RSRVT_CNT = 0)
                                        AND RSR.FCLT_RSRVT_STCD = 'N'
                                        AND TO_DATE(USE_DT, 'YYYYMMDD') &gt; TRUNC(SYSDATE) + 1 */

                                        /* AND RSVT_PSB_WTN_CNT &gt;= #rsrvt_qntt#
                                        AND (MAX_RSVT_WTN_CNT(최대예약대기수) - RSVT_PSB_WTN_CNT(예약가능대기수) &gt; 0 OR PSB_RSVT_CNT(가능예약수) = 0)
                                        AND RSR.PRD_SAL_STCD = 'N'
                                        AND TO_DATE(PRD_SAL_YMD(상품판매일자), 'YYYYMMDD') > TRUNC(SYSDATE) + 1 */

                                        //.replace(/\-/g,'');

                                        if(commn.toNumber(avail.RSVT_PSB_WTN_CNT) >= 1
                                            && (commn.toNumber(avail.MAX_RSVT_WTN_CNT) - commn.toNumber(avail.RSVT_PSB_WTN_CNT) > 0 || commn.toNumber(avail.PSB_RSVT_CNT) == 0)
                                            && avail.PRD_SAL_STCD == 'N'
                                            && avail.PRD_SAL_YMD > commn.date_add('', 1).replace(/\-/g,'')){

                                            var availPrd = getDefaultSet($(item));
                                            availPrd.psbCnt = avail.RSVT_PSB_WTN_CNT;
                                            availPrd.salAmt = avail.SAL_AMT;
                                            availPrd.reserTp = 'W';

                                            availPrds.push(availPrd);
                                        }
                                    }
                                }
                            });

                            if(!availPrds || $.isEmptyObject(availPrds)){
                            	var type = $shelterTab.find('input[type="radio"][name="reservation2"]:checked').val();
                            	if(type == 'WTNG'){
	                                toastrMsg("선택하신 날짜에 대기가능한 대피소가 없습니다.","메세지");                            		
                            	}else{
	                                toastrMsg("선택하신 날짜에 예약가능한 대피소가 없습니다.","메세지");
                            	}
                                return false;
                            }

                            updateStep('2');

                            $('[data-area-name="title-mountain"]').html($shelterTab.find('input[type="radio"][name="refuge"]:checked').data('park-nm')); //upd-nm

                            var $prds = $shelterTab.find('[data-template-id="shelter-step2-template"]');
                            var source = $('#' + $prds.data('template-id')).html();
                            var template = Handlebars.compile(source);
                            var templateParam = {};
                            templateParam.prds = availPrds;

                            $prds.html(template(templateParam))
                                .find('select[data-step2-prd-id]').on('change', drawPayment)
                                .find('select[data-step2-prd-id] option:not([value="1"])').attr('disabled', window.isGreenpoint); //그린포인트 1명 제외 disabled

                            drawPayment();
                        })
                        .fail(function(){

                            //$("#loadingImage").hide();
                            toastrMsg("일시적으로 장애가 발생하였습니다. 잠시 후 다시 시도하여 주시기 바랍니다.","메세지"); //<br />원활한 서비스를 위해 최선을 다하겠습니다.
                        });

                }else{
                    toastrMsg("대피소를 최소 하나 이상 추가해 주시기 바랍니다.");
                }
            });

            $shelterTab.find('input[type="radio"][name="shelterMountain"]').on('click', function(){

                $shelterTab.find('input[type="radio"][data-dept-id]').closest('li').hide();
                $shelterTab.find('input[type="radio"][data-dept-id^="' + $(this).val() + '"]').closest('li').css('display', '');

                $shelterTab.find('[data-button-name="addItem"]').siblings().remove(); //선택위치, 선택날짜
                $shelterTab.find('[data-calendar-cell-yyyy-mm-dd]').removeClass('selected choose');
            });

            $shelterTabBtn.on('click', function(){

                var $this = $(this);
                var param = {};

                if($shelterTab.find('[data-reservation-step="2"]').css('display') == 'none'){
                    updateStep('1');
                }else{
                    updateStep('2');
                }

                if($this.data('active-flag') == 'Y'){
                    return false;
                }
                /* param.deptId = $('input[type="radio"][name="shelterMountain"]:checked').val();
                param.prdId = $this.val(); */
                commn.callAjax({
                    'url': '/reservation/shelter/shelterList.do',
                    'data': param,
                    'dataType' : 'json'
                })
                    .done(function(res){

                        var shelters = commn.nvl(res).shelters;

                        var calendars = commn.nvl(res).calendars;

                        shelter.avails = commn.nvl(res).avails;

                        $this.data('active-flag', 'Y');

                        if(shelters){

                            var $shelters = $shelterTab.find('[data-template-id="shelter-shelters-template"]');
                            var sheltersTemplate = Handlebars.compile($('#' + $shelters.data('template-id')).html());
                            $shelters.html(sheltersTemplate(shelters));
                        }

                        if(calendars){

                            var $calendars = $shelterTab.find('[data-template-id="shelter-calendar-template"]');
                            var source = $('#' + $calendars.data('template-id')).html();
                            var template = Handlebars.compile(source);

                            $calendars.empty()
                                .append('<h3 class="title">날짜</h3>');

                            $.each(calendars, function(i, item){

                                /* item.prdId = $this.val();
                                item.prdNm = $this.data('prd-nm'); */

                                $calendars.append(template(item));

                                if(i == calendars.length - 1){

                                    $calendars.append('<div class="reservation-info"><button class="btn btn-add" data-button-name="addItem">추가</button></div>');
                                }
                            });

                            shelterListBindEvents();
                        }

                    })
                    .fail(function(){

                        //$("#loadingImage").hide();
                        toastrMsg("일시적으로 장애가 발생하였습니다. 잠시 후 다시 시도하여 주시기 바랍니다.","메세지"); //<br />원활한 서비스를 위해 최선을 다하겠습니다.
                    });
            });
        };

        initPage();
        $('[href="#tab2"]').closest('li').trigger('click');
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
                        <div class="tab-pane" id="tab5">
                            <!-- 탐방로예약제 -->
                            

    
  

<script>
var $trailTab = $('#tab5');
var $trailTabBtn = $('[href="#tab5"]').closest('li');
var trail = {};
var plusFlag = true;
$(function(){
	
	$trailTabBtn.on("click",  function(event){
		// 스텝1 호출
		if(trail.cource == undefined){
			currentStep(1);
			showLoading();
			
			$.ajax({
				type:'post',
				async:'true',
				url:'/trail/searchSimpleTrailEasyReservationList.do',
				dataType: 'html',
				success:function(result) {
				    //정상 요청, 응답 시 처리 작업
				    $("#tab5").html("");
					$("#tab5").prepend(result);
					trailEasyInit(1);
				},
				error : function(xhr,status,error) {
				    //오류 발생 시 처리
					maskBackgroundOff();
				},
				complete:function(data,textStatus) {
				    //작업 완료 후 처리
					maskBackgroundOff();
				}
			});
		}else{
			$('.trBtnRefresh').trigger('click');
		}
	});
	
	//	위치 show/hidden
	$(document).on("change", "input[name='trailmountain']", function(event){
		//event.preventDefault();
		var parentNm = $(this).parent().parent().data("group-name");
		var itemLen = $('#tab5').find(".column > li").length;

		for (var i = 0; i < itemLen; i++) {
			if(parentNm == $('#tab5').find(".column > li").eq(i).data("parent-name")){
				$('#tab5').find(".column > li").eq(i).show();
			}else{
				$("#tab5").find(".column > li").eq(i).hide();
				$("#tab5").find(".column > li").eq(i).find("input:radio").attr('checked', false);
			}
		}
        for (var i = 0; i < $("#noticeContent").find("div").length; i++) {
            $("#noticeContent").find("div").eq(i).data("parknm");
            if(parentNm == $('#tab5').find(".column > li").eq(i).data("parent-name")){
                $('#tab5').find(".column > li").eq(i).show();
            }else{
                $("#tab5").find(".column > li").eq(i).hide();
                $("#tab5").find(".column > li").eq(i).find("input:radio").attr('checked', false);
            }
        }
		trailEasyInit(trail.cource);
		
	});
	
	// 예약정보 > 탐방코스 show/hidden
	$(document).on("change", "input[name='refuge-trail']", function(event){
		trailEasyInit(trail.cource);
		
		var parentNm = $(this).parent().parent().data("name");

		trail.prdNm = parentNm;
		trail.prdId = $(this).parent().parent().data("prod-id");
		trail.operSchDesc = $("input[name='"+parentNm+"']").val();
		
		var checkBoxLen = $('#tab5').find(".reservation-check").find(".check-area > li").length;
		for (var i = 0; i < checkBoxLen; i++) {
			if(parentNm == $('#tab5').find(".reservation-check").find(".check-area > li").eq(i).data("prd-name")){
				trail.courceFlag = true;
				$('#tab5').find(".reservation-check").children().show();
				$('#tab5').find(".reservation-check").find(".check-area > li").eq(0).show();
				$('#tab5').find(".reservation-check").find(".check-area > li").eq(i).show();
				
			}else{
				$('#tab5').find(".reservation-check").find(".check-area > li").eq(i).hide();
				$('#tab5').find(".reservation-check").find(".check-area > li").eq(i).find("input:radio").attr('checked', false);
			}
			
			
		}
		
		$('#tab5').find(".reservation-check").find(".check-area > li").eq(0).find("input").trigger("click");
	});
	
	// 전체선택
	$(document).on("click", "input[name='prdCtgId']", function(event){
		trail.prdCtgId = '';
		var listVar = $(this).val();
		var checked = $(this).is(":checked");
		if(listVar == "all" && checked){
			$("input[name='prdCtgId']").prop('checked', true); 
		}else if(listVar == "all" && !checked){
			$("input[name='prdCtgId']").prop('checked', false);
			
		}else if(listVar != "all" && !checked){
			$("input[name='prdCtgId']").eq(0).prop('checked', false);
		}
		
	});
	
	// 새로고침
	$(document).on("click", ".trBtnRefresh", function(){
		trail = {};
		$trailTabBtn.trigger("click");
	});
	
	// 스텝2 > 인원 마이너스
	$(document).on("click", ".trail_totcnt .minus", function(){
		plusFlag = true;
		var ptt_nop_cnt = Number($("input[name='ptt_nop_cnt']").val());
		if(ptt_nop_cnt > 1){
			ptt_nop_cnt = ptt_nop_cnt - 1;	
		}
		$("input[name='ptt_nop_cnt']").val(ptt_nop_cnt);
		
		if(ptt_nop_cnt == 1 && trail.prdId == "TB011XXX02"){
			$('#tab5').find(".detail-info").find("dl:eq(2)").html("<dt>동행인</dt><dd>동행인 없음</dd>");
		}else if(trail.prdId == "TB011XXX02"){
			$('#tab5').find(".detail-info").find("dl:eq(2)").find("li:eq("+(ptt_nop_cnt-1)+")").remove();
		}
	});
	
	// 스텝2 > 인원 플러스
	$(document).on("click", ".trail_totcnt .plus", function(e){
		e.preventDefault();
		var ptt_nop_cnt = Number($("input[name='ptt_nop_cnt']").val());
		if(ptt_nop_cnt < 10){
			ptt_nop_cnt = ptt_nop_cnt + 1;	
		}
		$("input[name='ptt_nop_cnt']").val(ptt_nop_cnt);
		
		if(ptt_nop_cnt > 10){
			return;
		}
		
		var personHtml = "";
		if(plusFlag){
			if(ptt_nop_cnt == 2 && trail.prdId == "TB011XXX02"){
				personHtml += "<dt>동행인</dt>";
				personHtml += "<dd class=\"form\">";
				personHtml += "	<ul class=\"row-list three\">";
				personHtml += $("#personTemplate").html().replace(/{{idx}}/gi, 2);
				personHtml += "</ul>";
				personHtml += "</dd>";
				$('#tab5').find(".detail-info").find("dl:eq(2)").html(personHtml);
			}else if(ptt_nop_cnt == 10 && trail.prdId == "TB011XXX02"){
				plusFlag = false;
				personHtml += $("#personTemplate").html().replace(/{{idx}}/gi, $('#tab5').find(".detail-info").find("dl:eq(2)").find("li").length+2);
				$('#tab5').find(".detail-info").find("dl:eq(2)").find("li:last").after(personHtml);
			}else if(ptt_nop_cnt > 2 && trail.prdId == "TB011XXX02"){
				personHtml += $("#personTemplate").html().replace(/{{idx}}/gi, $('#tab5').find(".detail-info").find("dl:eq(2)").find("li").length+2);
				$('#tab5').find(".detail-info").find("dl:eq(2)").find("li:last").after(personHtml);
			}
		}
	});
	
	
	// 스텝2 > 성별
	$(document).on("change", "select[name='sexCodes']", function(){
		// 지리산 칠석계곡이 아닐시에만
		if(trail.prdId != 'TB011XXX02'){
			trail.sex_cnt = 0;
			var selected_val = $(this).val();
			var man_cnt = Number($($("select[name='sexCodes']")[0]).val());
			var girl_cnt = Number($($("select[name='sexCodes']")[1]).val());
			
			trail.sex_cnt = man_cnt + girl_cnt;
			
			// 인원 6명 초과 시 초기화
			if(trail.sex_cnt > Number($("input[name='ptt_nop_cnt']").val())){
				trail.sex_cnt = 0;
				toastrMsg('전체인원 수를 초과할수 없습니다.');
				$($("select[name='sexCodes']")[0]).val("0");
				$($("select[name='sexCodes']")[1]).val("0");
				return;
			}			
		}
	});
	
	
	// 스텝2 > 연령
	$(document).on("change", "select[name='ageCodes']", function(){
		trail.age_cnt = 0;
		var selected_val = $(this).val();
		var baby_cnt = Number($($("select[name='ageCodes']")[0]).val());
		var boy_cnt = Number($($("select[name='ageCodes']")[1]).val());
		var mid_cnt = Number($($("select[name='ageCodes']")[2]).val());
		var high_cnt = Number($($("select[name='ageCodes']")[3]).val());
		
		var age_20_cnt = Number($($("select[name='ageCodes']")[4]).val());
		var age_30_cnt = Number($($("select[name='ageCodes']")[5]).val());
		var age_40_cnt = Number($($("select[name='ageCodes']")[6]).val());
		var age_50_cnt = Number($($("select[name='ageCodes']")[7]).val());
		var age_60_cnt = Number($($("select[name='ageCodes']")[8]).val());
		
		trail.age_cnt = baby_cnt + boy_cnt + mid_cnt + high_cnt + age_20_cnt + age_30_cnt + age_40_cnt + age_50_cnt + age_60_cnt;
		
		// 인원 10명 초과 시 초기화
		if(trail.age_cnt > Number($("input[name='ptt_nop_cnt']").val())){
			trail.age_cnt = 0;
			toastrMsg("성별인원 최대 "+Number($("input[name='ptt_nop_cnt']").val())+"명까지 예약 가능.");
			$($("select[name='ageCodes']")[0]).val("0");
			$($("select[name='ageCodes']")[1]).val("0");
			$($("select[name='ageCodes']")[2]).val("0");
			$($("select[name='ageCodes']")[3]).val("0");
			
			$($("select[name='ageCodes']")[4]).val("0");
			$($("select[name='ageCodes']")[5]).val("0");
			$($("select[name='ageCodes']")[6]).val("0");
			$($("select[name='ageCodes']")[7]).val("0");
			$($("select[name='ageCodes']")[8]).val("0");
			return;
		}
	});
	
});

// 탐방로 간편결제 초기화
function trailEasyInit(courceIdx){
	
	//$('#tab5').find(".reservation-info").hide();
	$('#tab5').find(".reservation-check").children().hide();
	
	$("input[name='prdCtgId']").prop('checked', false); 
	
	var checkBoxLen = $('#tab5').find(".reservation-check").find(".check-area > li").length;
	for (var i = 0; i < checkBoxLen; i++) {
		$('#tab5').find(".reservation-check").find(".check-area > li").eq(i).hide();
	}
	
	$('#tab5').find('div').removeClass("selected choose");
	
	$('#tab5').find(".reservation-info > dl:eq(0) > dd").html("");
	$('#tab5').find(".reservation-info > dl:eq(1) > dd").html("");
	
	trail = {};
	trail.cource = courceIdx;
}

// 날짜 선택
function courceDate(year, month, day, bgn_day, end_day){
	
	var diff_day = year+""+month+""+day;
	
	if(month.length == 1){
		month = "0" + month;
	}
	if(day.length == 1){
		day = "0" + day;
	}
	
	var selected_day = year+""+month+""+day;

	$('#tab5').find('div').removeClass("selected choose");
	for (var i = 0; i < $('#tab5').find('.calendar').find('.calendar-day').find('div').length; i++) {
		if($('#tab5').find('.calendar').find('.calendar-day').find('div').eq(i).data("calendar-day") == diff_day){
			$('#tab5').find('.calendar').find('.calendar-day').find('div').eq(i).addClass("selected choose");
		}
	}
	
	// 탐방일자 
	courceDateWrite(selected_day);	
}

function courceDateWrite(selected_day){
	selected_avail_date = selected_day.substring(0,4) + "-" + selected_day.substring(4,6) + "-" + selected_day.substring(6,8) + "[" +getWeekDate(selected_day)+ "]";

	$('#tab5').find(".reservation-info > dl:eq(0) > dd").html(selected_avail_date);
	$('#tab5').find(".reservation-info > dl:eq(1) > dd").html(trail.operSchDesc);
	
	calendar_flag = true;
	trail.availDate = selected_day;
	trail.selectedAvailDate = selected_avail_date;
	
	$('#tab5').find(".reservation-info").show();
}

function getWeekDate(day){
	var week = ['일', '월', '화', '수', '목', '금', '토'];
	var dayOfWeek = week[new Date(day.substring(0,4), Number(day.substring(4,6))-1, day.substring(6,8)).getDay()];
	return dayOfWeek;
}

function currentStep(idx){

    //step3 추가 주의사항 끼워넣기
	if(idx == 3){
        if(!$("input[name='refuge-trail']").is(':checked')){
            toastrMsg('위치를 선택해주세요.');
            $("input[name='refuge-trail']").eq(0).focus();
            return;
        }
        if(trail.availDate == '' || trail.availDate == undefined){
            toastrMsg('날짜를 선택해주세요.');
            return;
        }
        if(trail.courceFlag && !$("input:checkbox[name='prdCtgId']").is(':checked')){
            toastrMsg('탐방코스를 선택해주세요.');
            $("input:checkbox[name='prdCtgId']").eq(0).focus();
            return;
        }

        ajaxCall({
            url: '/reservation/selectTrailNoticeCn.do;jsessionid=B10F1063E24840FADF4994E69491FEB4.U2007',
            data: { 'prdId' : trail.prdId },
            success: function (dat) {
                if(dat.result == 'Y'){
                    $("#noticeContent").html('');
                    if(dat.noticeCn.prdNtcCn != ''){
                        $("#noticeContent").append(dat.noticeCn.prdNtcCn);
                        openPopup('trailNoticePopup');
                    }else{
                        currentStep('2');
                    }
                }else{
                    currentStep('2');
                }
            }
        });

    }else{
        closePopup('trailNoticePopup');

        trail.cource = idx;
        if(idx == 2){

            // 데이터 초기화
            trail.prd_id = '';
            trail.max_rsvt_nop_cnt = 0;
            trail.avail_rsvt_nop_cnt = 0;
            trail.prd_ctg_id = '';
            trail.dept_id = '';
            trail.oper_schd_sn = 1;
            trail.age_cnt = 0;
            trail.reser_cnt = 0;
            trail.sex_cnt = 0;
            trail.listCnt = 0;

            $("input[name='ptt_nop_cnt']").val(1);
            $($("select[name='sexCodes']")[0]).val("0");
            $($("select[name='sexCodes']")[1]).val("0");
            for (var i = 0; i < 9; i++) {
                $($("select[name='ageCodes']")[i]).val("0");
            }

            if(!$("input[name='refuge-trail']").is(':checked')){
                toastrMsg('위치를 선택해주세요.');
                $("input[name='refuge-trail']").eq(0).focus();
                return;
            }
            if(trail.availDate == '' || trail.availDate == undefined){
                toastrMsg('날짜를 선택해주세요.');
                return;
            }
            if(trail.courceFlag && !$("input:checkbox[name='prdCtgId']").is(':checked')){
                toastrMsg('탐방코스를 선택해주세요.');
                $("input:checkbox[name='prdCtgId']").eq(0).focus();
                return;
            }

            var checkBoxLen = $('#tab5').find(".reservation-check").find(".check-area > li").length;
            var checkBoxCnt = 1;
            // 탐방코스 데이터가 있을때
            if(trail.courceFlag){
                trail.prdCtgId = '';
                for (var i = 1; i < checkBoxLen; i++) {
                    if(trail.prdNm == $('#tab5').find(".reservation-check").find(".check-area > li").eq(i).data("prd-name")){
                        if(checkBoxCnt > 1){
                            trail.prdCtgId += ",";
                        }
                        if($("input:checkbox[name='prdCtgId']").eq(i).is(':checked')){
                            trail.prdCtgId += $("input:checkbox[name='prdCtgId']").eq(i).val();
                            checkBoxCnt++;
                        }
                    }
                }

                //전체검색일때 코스 조회조건 제거
                if($("input:checkbox[name='prdCtgId']").eq(0).is(':checked')){
                    trail.prdCtgId = "";
                }
            }
            if(trail.prdId == "TB011XXX02"){
                var personHtml = "";
                personHtml += "<dt>예약자</dt>";
                personHtml += "<dd class=\"form\">";
                personHtml += "	<ul class=\"row-list three\">";
                personHtml += $("#personTemplate").html().replace(/{{idx}}/gi, 1);
                personHtml += "</ul>";
                personHtml += "</dd>";
                $('#tab5').find(".detail-info").find("dl:eq(1)").html(personHtml);
                $('#tab5').find(".detail-info").find("dl:eq(2)").html("<dt>동행인</dt><dd>동행인 없음</dd>");

                if('' != ''){
                    $('#tab5').find(".detail-info").find("dl:eq(1)").find("input").val("");
                    $('#tab5').find(".detail-info").find("dl:eq(1)").find("select:eq(0)").val("");
                    var memberBirthYY = "".substring(0,4);
                    var memAge = Number(getToday().substring(0,4)) - Number(memberBirthYY);
                    var memAgeCd = "";
                    if(memAge.toString().length > 1 && Number(memAge.toString().substring(0,1)) >= 6){
                        memAgeCd = "06";
                    }else if(memAge.toString().length > 1 && Number(memAge.toString().substring(0,1)) == 5){
                        memAgeCd = "05";
                    }else if(memAge.toString().length > 1 && Number(memAge.toString().substring(0,1)) == 4){
                        memAgeCd = "04";
                    }else if(memAge.toString().length > 1 && Number(memAge.toString().substring(0,1)) == 3){
                        memAgeCd = "03";
                    }else if(memAge.toString().length > 1 && Number(memAge.toString().substring(0,1)) == 2){
                        memAgeCd = "02";
                    }else if(memAge > 17 && memAge < 19){
                        memAgeCd = "14";
                    }else if(memAge > 14 && memAge < 16){
                        memAgeCd = "13";
                    }else if(memAge > 8 && memAge < 13){
                        memAgeCd = "12";
                    }else{
                        memAgeCd = "11";
                    }
                    $('#tab5').find(".detail-info").find("dl:eq(1)").find("select:eq(1)").val(memAgeCd);
                }else{
                    getTrailLoginData();
                }
            }

            showLoading();

            var resultListHtml = "";
            ajaxCall({
                url:'/reservation/simpleTrailProdList.do',
                data:{
                    "prd_id" : trail.prdId
                    , "avail_date" : trail.availDate
                    , "selected_avail_date" : trail.selectedAvailDate
                    , "prd_ctg_id" : trail.prdCtgId
                },
                success:function(result) {

                    if(result.result=='N'){
                        toastrMsg(result.resultMsg);
                        currentStep(1);
                        return false;
                    }

                    //정상 요청, 응답 시 처리 작업
                    trail.listCnt = result.prodList.length;
                    var h3Html = trail.prdNm+" 탐방코스를 선택하고, 탐방인원 정보를 입력해주세요.";
                    h3Html += "<span class=\"stay-period\"><span>"+trail.selectedAvailDate+"</span>";
                    h3Html += "<span class=\"total-result\">(총 <em>"+result.prodList.length+"개</em>의 예약가능 상품이 있습니다.)</span></span>";
                    $('#tab5').find(".grid-column").find(".title").html(h3Html);

                    for (var i = 0; i < result.prodList.length; i++) {
                        resultListHtml += "<tr>";
                        resultListHtml += "<td class=\"form\">";
                        resultListHtml += "<span class=\"radio-1\">";
                        if((Number(result.prodList[i].MAX_RSVT_NOP_CNT) - Number(result.prodList[i].AVAIL_RSVT_NOP_CNT)) <= 0){
                            resultListHtml += '<input disabled type="radio" id="radio'+i+'" name="prd_id" value='+result.prodList[i].PRD_ID+' onchange="javascript:getTrailInfo('+"'"+''+result.prodList[i].PRD_ID+"'"+','+"'"+''+result.prodList[i].MAX_RSVT_NOP_CNT+"'"+','+"'"+''+result.prodList[i].AVAIL_RSVT_NOP_CNT+"'"+','+"'"+''+result.prodList[i].PRD_CTG_ID+"'"+','+"'"+''+result.prodList[i].DEPT_ID+"'"+','+"'"+''+result.prodList[i].OPER_SCHD_SN+"'"+')">';
                        }else{
                            resultListHtml += '<input type="radio" id="radio'+i+'" name="prd_id" value='+result.prodList[i].PRD_ID+' onchange="javascript:getTrailInfo('+"'"+''+result.prodList[i].PRD_ID+"'"+','+"'"+''+result.prodList[i].MAX_RSVT_NOP_CNT+"'"+','+"'"+''+result.prodList[i].AVAIL_RSVT_NOP_CNT+"'"+','+"'"+''+result.prodList[i].PRD_CTG_ID+"'"+','+"'"+''+result.prodList[i].DEPT_ID+"'"+','+"'"+''+result.prodList[i].OPER_SCHD_SN+"'"+')">';
                        }
                        resultListHtml += '<label for="radio'+i+'"></label>';
                        resultListHtml += "</span>";
                        resultListHtml += "</td>";
                        if(Number(result.prodList[i].MAX_RSVT_NOP_CNT) - Number(result.prodList[i].AVAIL_RSVT_NOP_CNT)<=0){
                            resultListHtml += "<td>["+result.prodList[i].PRD_NM+"] "+result.prodList[i].PRD_CTG_NM+" [잔여: 0명]</td>";
                        }else{
                            resultListHtml += "<td>["+result.prodList[i].PRD_NM+"] "+result.prodList[i].PRD_CTG_NM+" [잔여: "+(Number(result.prodList[i].MAX_RSVT_NOP_CNT) - Number(result.prodList[i].AVAIL_RSVT_NOP_CNT))+"명]</td>";
                        }
                        resultListHtml += "<td>"+result.prodList[i].OPER_SCHD_DESC+"</td>";
                        resultListHtml += "</tr>";
                    }

                    if(result.prodList.length == 0){
                        toastrMsg("검색결과가 없습니다. 다른조건으로 검색해주세요.","메세지");
                        currentStep(1);
                        return;
                    }

                    $('#tab5').find(".trail-list").html(resultListHtml);
                }
            })

            $(".slide-popup").next().find(".progressbar > span:eq(1)").html("STEP.2");
            $(".slide-popup").next().attr("class", "reservation-area step2");
            $('#tab5').find(".grid-row").hide();
            $('#tab5').find(".grid-column").show();

        }else{
            $(".slide-popup").next().find(".progressbar > span:eq(1)").html("STEP.1");
            $(".slide-popup").next().attr("class", "reservation-area step1");
            $('#tab5').find(".grid-row").show();
            $('#tab5').find(".grid-column").hide();
        }
    }
}

function getTrailInfo(prd_id, max_rsvt_nop_cnt, avail_rsvt_nop_cnt, prd_ctg_id, dept_id, oper_schd_sn){
	trail.prd_id = prd_id;
	trail.max_rsvt_nop_cnt = Number(max_rsvt_nop_cnt);
	trail.avail_rsvt_nop_cnt = Number(avail_rsvt_nop_cnt);
	trail.prd_ctg_id = prd_ctg_id;
	trail.dept_id = dept_id;
	trail.oper_schd_sn = Number(oper_schd_sn);
}

function reservationAuth(){
	
	$.ajax({
		'url': '/reservation/auth.do',
		/* 'data': param, */
		'dataType' : 'json'
	})
	.done(reservation)
	.fail(function(e){
		if(e.status == '401'){
			loginPopup("getTrailLoginData();");
		}else{
			toastrMsg("일시적으로 장애가 발생하였습니다. 잠시 후 다시 시도하여 주시기 바랍니다.","메세지"); //<br />원활한 서비스를 위해 최선을 다하겠습니다.
		}
	});
}
function getTrailLoginData(){
	if(loginData.mmbBrdt !== undefined && trail.prdId == "TB011XXX02"){
		$('#tab5').find(".detail-info").find("dl:eq(1)").find("input").val(loginData.mmbNm);
		$('#tab5').find(".detail-info").find("dl:eq(1)").find("select:eq(0)").val(loginData.sexDvcd);
		var memberBirthYY = loginData.mmbBrdt.substring(0,4);
		var memAge = Number(getToday().substring(0,4)) - Number(memberBirthYY);
		var memAgeCd = "";
		
		if(memAge.toString().length > 1 && Number(memAge.toString().substring(0,1)) >= 6){
				memAgeCd = "06";
		}else if(memAge.toString().length > 1 && Number(memAge.toString().substring(0,1)) == 5){
				memAgeCd = "05";
		}else if(memAge.toString().length > 1 && Number(memAge.toString().substring(0,1)) == 4){
				memAgeCd = "04";
		}else if(memAge.toString().length > 1 && Number(memAge.toString().substring(0,1)) == 3){
				memAgeCd = "03";
		}else if(memAge.toString().length > 1 && Number(memAge.toString().substring(0,1)) == 2){
				memAgeCd = "02";
		}else if(memAge > 17 && memAge < 19){
				memAgeCd = "14";
		}else if(memAge > 14 && memAge < 16){
				memAgeCd = "13";
		}else if(memAge > 8 && memAge < 13){
				memAgeCd = "12";
		}else{
			memAgeCd = "11";
		}
		$('#tab5').find(".detail-info").find("dl:eq(1)").find("select:eq(1)").val(memAgeCd);
	}
}
// 예약하기
function reservation(){
	
	var dt = new Date();
	var todayYear = dt.getFullYear();
    var todayMonth = dt.getMonth() + 1;    //1월이 0으로 되기때문에 +1을 함.
    var todayDay = dt.getDate();

    todayMonth = todayMonth >=10 ? todayMonth : "0" + todayMonth;
    todayDay  = todayDay  >= 10 ? todayDay : "0" + todayDay;
    var toDay = todayYear+""+todayMonth+""+todayDay;
    
	var tomorrow = new Date(dt.setDate(dt.getDate()+1));
	var tomorrowyear = tomorrow.getFullYear();
    var tomorrowmonth = tomorrow.getMonth() + 1;    //1월이 0으로 되기때문에 +1을 함.
    var tomorrowdate = tomorrow.getDate();
    tomorrowmonth = tomorrowmonth >=10 ? tomorrowmonth : "0" + tomorrowmonth;
    tomorrowdate  = tomorrowdate  >= 10 ? tomorrowdate : "0" + tomorrowdate;
    var tomorrowDay = tomorrowyear+""+tomorrowmonth+""+tomorrowdate;
    
	if(trail.prdNm.indexOf("노고단") < 0 && trail.prdNm.indexOf("우이령") < 0){
		if(toDay == trail.availDate || (tomorrowDay == trail.availDate && dt.getHours() >= 17)){
			toastrMsg('예약기간이 아닙니다.');
			return;
		} 
	}else{
		if(toDay == trail.availDate && dt.getHours() >= 16){
			toastrMsg('예약기간이 아닙니다.');
			return;
		} 
	}
	
	if(toDay > trail.availDate){
		toastrMsg('예약기간이 아닙니다.');
		return;
	}
	
	var max_cnt = Number(trail.max_rsvt_nop_cnt);		//최대정원
	var avail_cnt = Number(trail.avail_rsvt_nop_cnt);	//예약건수
	
	// 예약 총 인원
	trail.reser_cnt = Number($("input[name='ptt_nop_cnt']").val());

	if(trail.listCnt == 0 || trail.listCnt == undefined){
		toastrMsg("조회 결과가 없습니다.");
		return;
	}
	
	if(trail.prd_id == '' || trail.prd_id == undefined){
		toastrMsg("탐방코스를 선택해주세요.");
		return;
	} 
	
	// 지리산 칠선계곡 예외처리
	if(trail.prdId == 'TB011XXX02'){
		for (var i = 0; i < trail.reser_cnt; i++) {
			if($("#trailPersonNm_"+(i+1)).val() == ""){
				toastrMsg("이름을 입력해주세요.");
				$("#trailPersonNm_"+(i+1)).focus();
				return false;
			} 
			if($("#select-sexCodes-"+(i+1)).val() == ""){
				toastrMsg("성별을 선택해주세요.");
				$("#select-sexCodes-"+(i+1)).focus();
				return false;
			} 
			if($("#select-ageCodes-"+(i+1)).val() == ""){
				toastrMsg("연령을 선택해주세요.");
				$("#select-ageCodes-"+(i+1)).focus();
				return false;
			} 
		}
	}else{
		if(trail.reser_cnt != trail.sex_cnt || trail.sex_cnt < trail.age_cnt || trail.sex_cnt == 0 || trail.sex_cnt == undefined){
			toastrMsg("성별 인원 선택해주세요.");
			return
		}		
		
		if(trail.reser_cnt != trail.age_cnt || trail.age_cnt < trail.sex_cnt || trail.age_cnt == undefined){
			toastrMsg("연령 인원 선택해주세요.");
			return;
		}
		
		if(trail.reser_cnt > max_cnt || (trail.max_cnt - avail_cnt) < trail.reser_cnt){
			toastrMsg("최대예약 가능건수를 초과하여 예약할 수 없습니다.");
			return;
		}
	}
	
	$("input[name='prd_id']").val(trail.prd_id);
	$("input[name='max_rsvt_nop_cnt']").val(trail.max_rsvt_nop_cnt);
	$("input[name='prd_ctg_id']").val(trail.prd_ctg_id);
	$("input[name='dept_id']").val(trail.dept_id);
	$("input[name='oper_schd_sn']").val(trail.oper_schd_sn);
	$("input[name='avail_date']").val(trail.availDate);
	$("input[name='selected_avail_date']").val(trail.selectedAvailDate);
	
	showLoading();
	
	 $.ajax({
		type:'post',
		async:true,
		url:'/trail/registTrailReservation.do',
		data:$("#frmTrailReservation").serialize(),
		dataType: 'json',
		success:function(result) {
			//정상 요청, 응답 시 처리 작업
		    if(result.resultCd == "S"){
//		    	toastrMsg("예약 성공.");
		    	// 예약안내 레이어팝업
		    	var sexHtml = "";
		    	var ageHtml = "";
		    	var sexCnt = 0;
				var ageCnt = 0;
				
		    	// 지리산 칠선계곡 예외처리
		    	if(trail.prdId == 'TB011XXX02'){
		    		var manCnt = 0;
					var girlCnt = 0;
		    		for(var i=0;i<$("select[name='sexCodes'] option:selected").length;i++){
						if($("select[name='sexCodes']:eq("+i+") option:selected").val() == "01"){	//남
							manCnt++;
						}else if($("select[name='sexCodes']:eq("+i+") option:selected").val() == "02"){ //여
							girlCnt++;
						}
					}
		    		if(manCnt > 0 && girlCnt > 0){
		    			sexHtml += "남 "+manCnt+"명  / 여 "+girlCnt+"명";
		    		}else if(manCnt > 0){
		    			sexHtml += "남 "+manCnt+"명";
		    		}else{
		    			sexHtml += "여 "+girlCnt+"명";
		    		}
		    		
		    		var baby_cnt = 0;
		    		var boy_cnt = 0;
		    		var mid_cnt = 0;
		    		var high_cnt = 0;
		    		
		    		var age_20_cnt = 0;
		    		var age_30_cnt = 0;
		    		var age_40_cnt = 0;
		    		var age_50_cnt = 0;
		    		var age_60_cnt = 0;
					for(var i=0;i<$("select[name='ageCodes'] option:selected").length;i++){
						if($("select[name='ageCodes']:eq("+i+") option:selected").val() == "11"){
							baby_cnt++;
						}else if($("select[name='ageCodes']:eq("+i+") option:selected").val() == "12"){
							boy_cnt++;
						}else if($("select[name='ageCodes']:eq("+i+") option:selected").val() == "13"){
							mid_cnt++;
						}else if($("select[name='ageCodes']:eq("+i+") option:selected").val() == "14"){
							high_cnt++;
						}else if($("select[name='ageCodes']:eq("+i+") option:selected").val() == "02"){
							age_20_cnt++;
						}else if($("select[name='ageCodes']:eq("+i+") option:selected").val() == "03"){
							age_30_cnt++;
						}else if($("select[name='ageCodes']:eq("+i+") option:selected").val() == "04"){
							age_40_cnt++;
						}else if($("select[name='ageCodes']:eq("+i+") option:selected").val() == "05"){
							age_50_cnt++;
						}else if($("select[name='ageCodes']:eq("+i+") option:selected").val() == "06"){
							age_60_cnt++;
						}
					}
					
					var prefixCnt = 0;
					if(baby_cnt > 0){
						ageHtml += "유아 "+baby_cnt+"명";
						prefixCnt++;
		    		}
					if(boy_cnt > 0){
						if(prefixCnt > 0){
							ageHtml += " / ";	
						}
		    			ageHtml += "초등학생 "+boy_cnt+"명";
		    			prefixCnt++;
		    		}
					if(mid_cnt > 0){
						if(prefixCnt > 0){
							ageHtml += " / ";	
						}
		    			ageHtml += "중학생 "+mid_cnt+"명";
		    			prefixCnt++;
		    		}
					if(high_cnt > 0){
						if(prefixCnt > 0){
							ageHtml += " / ";	
						}
		    			ageHtml += "고등학생 "+high_cnt+"명";
		    			prefixCnt++;
		    		}
					if(age_20_cnt > 0){
						if(prefixCnt > 0){
							ageHtml += " / ";	
						}
		    			ageHtml += "20대 "+age_20_cnt+"명";
		    			prefixCnt++;
		    		}
					if(age_30_cnt > 0){
						if(prefixCnt > 0){
							ageHtml += " / ";	
						}
		    			ageHtml += "30대 "+age_30_cnt+"명";
		    			prefixCnt++;
		    		}
					if(age_40_cnt > 0){
						if(prefixCnt > 0){
							ageHtml += " / ";	
						}
		    			ageHtml += "40대 "+age_40_cnt+"명";
		    			prefixCnt++;
		    		}
					if(age_50_cnt > 0){
						if(prefixCnt > 0){
							ageHtml += " / ";	
						}
		    			ageHtml += "50대 "+age_50_cnt+"명";
		    			prefixCnt++;
		    		}
					if(age_60_cnt > 0){
						if(prefixCnt > 0){
							ageHtml += " / ";	
						}
		    			ageHtml += "60대 "+age_60_cnt+"명";
		    			prefixCnt++;
		    		}
		    	}else{
		    		for(var i=0;i<$("select[name='sexCodes'] option:selected").length;i++){
						if($("select[name='sexCodes']:eq("+i+") option:selected").text() != "선택안함"){
							if(sexCnt > 0){
								sexHtml += " / ";	
							}
							sexHtml += $("select[name='sexCodes']:eq("+i+") option:selected").parent().parent().parent().find(".label").text() + " " + $("select[name='sexCodes']:eq("+i+") option:selected").text();
							sexCnt++;
						}
						
					}
					for(var i=0;i<$("select[name='ageCodes'] option:selected").length;i++){
						if($("select[name='ageCodes']:eq("+i+") option:selected").text() != "선택안함"){
							if(ageCnt > 0){
								ageHtml += " / ";	
							}
							ageHtml += $("select[name='ageCodes']:eq("+i+") option:selected").parent().parent().parent().find(".label").text() + " " +$("select[name='ageCodes']:eq("+i+") option:selected").text();
							ageCnt++;
						}
						
					}
		    	}
				
				var today = result.dataMap.today;
				if(today != undefined){
					today = today.substring(0,4) + "-" + today.substring(4,6) + "-" + today.substring(6,8) + "[" +getWeekDate(today)+ "]";	
				} 
				$("#reservation-information1-trail").find(".popup-container").find("tbody").children("tr").eq(0).find("td").html(result.dataMap.rsvt_id);
				$("#reservation-information1-trail").find(".popup-container").find("tbody").children("tr").eq(1).find("td").html(result.dataMap.mmbNm);
				$("#reservation-information1-trail").find(".popup-container").find("tbody").children("tr").eq(2).find("td").html(today);
				$("#reservation-information1-trail").find(".popup-container").find("tbody").children("tr").eq(3).find("td").html("["+result.trailProductInfo.PRD_NM+"] "+result.trailProductInfo.PRD_CTG_NM );  //탐방로
				$("#reservation-information1-trail").find(".popup-container").find("tbody").children("tr").eq(4).find("td").html(trail.selectedAvailDate);  //탐방날짜
				
				if(result.trailProductInfo.DEPT_ID == 'B013'){
					if(result.trailProductInfo.PRD_NM.indexOf("칠선계곡") > -1){
						$("#reservation-information1-trail").find(".popup-container").find("tbody").children("tr").eq(5).find("th").html("집결시간");
					}else if(result.trailProductInfo.PRD_NM.indexOf("칠선계곡") < 0){
						$("#reservation-information1-trail").find(".popup-container").find("tbody").children("tr").eq(5).find("th").html("입장시간");
					}
					
					if(result.trailProductInfo.PRD_ASSM_PLC_NM != "" && result.trailProductInfo.PRD_ASSM_PLC_NM != undefined){
						$("#reservation-information1-trail").find(".popup-container").find("tbody").children("tr").eq(5).find("td").html(result.trailProductInfo.OPER_SCHD_DESC + ", " + result.trailProductInfo.PRD_ASSM_PLC_NM);  //집결장소	
					}else{
						$("#reservation-information1-trail").find(".popup-container").find("tbody").children("tr").eq(5).find("td").html(result.trailProductInfo.OPER_SCHD_DESC);  //집결장소
					}
					
				}else{
					if(result.trailProductInfo.DEPT_ID == 'B101' ){
						$("#reservation-information1-trail").find(".popup-container").find("tbody").children("tr").eq(5).find("th").html("입장시간");
					}else if(result.trailProductInfo.PRD_NM.indexOf("칠선계곡") < 0){
						$("#reservation-information1-trail").find(".popup-container").find("tbody").children("tr").eq(5).find("th").html("탐방시간");
					}
					
					if(result.trailProductInfo.PRD_ASSM_PLC_NM != "" && result.trailProductInfo.PRD_ASSM_PLC_NM != undefined){
						$("#reservation-information1-trail").find(".popup-container").find("tbody").children("tr").eq(5).find("td").html(result.trailProductInfo.OPER_SCHD_DESC + ", " + result.trailProductInfo.PRD_ASSM_PLC_NM);  //집결장소	
					}else{
						$("#reservation-information1-trail").find(".popup-container").find("tbody").children("tr").eq(5).find("td").html(result.trailProductInfo.OPER_SCHD_DESC);  //집결장소
					}
				}
				$("#reservation-information1-trail").find(".popup-container").find("tbody").children("tr").eq(6).find("td").html(sexHtml + "</br>" +ageHtml);
		    	$.layerPopup();
		    	$('[data-popup="reservation-information1-trail"]').trigger('click');
		    }else{
		    	toastrMsg(result.resultMsg,"메세지","e");
		    }
		},
		error : function(xhr,status,error) {
		    //오류 발생 시 처리
			maskBackgroundOff();
		},
		complete:function(data,textStatus) {
		    //작업 완료 후 처리
			maskBackgroundOff();
		}
	});  
}

window.cancelTrailRegister = function(){

	confirmPopup({
        title:'예약 취소',
        subTitle:'예약 취소',
        content:'취소한 설정값은 복구되지 않습니다.<br/>처음부터 다시 진행하시겠습니까?',
        type:'error',
        send_type : 'POST',
        urlFun:'window.trailChangeStep()'
    });
};

window.trailChangeStep = function(){
	
	closePopup('confirmPop');
	currentStep('1')
	$('.trBtnRefresh').trigger('click');
};

$.layerPopup();
function trailPrint(){
	var _body = document.body.innerHTML; 
	
	var printCopyDom = "";
	printCopyDom += "<div class=\"confirmation-document\">";
	printCopyDom += "<strong class=\"title-2\">예약내역</strong>";
	printCopyDom += "<table class=\"table\">";
	printCopyDom += "<caption>예약자정보</caption>";
	printCopyDom += "<colgroup>";
	printCopyDom += "<col style=\"width: 200px;\">";
	printCopyDom += "<col>";
	printCopyDom += "</colgroup>";
	printCopyDom += "<tbody class=\"tbody\">";
	printCopyDom += "<tr>";
	printCopyDom += "	<th scope=\"row\">예약번호</th>";
	printCopyDom += "	<td>"+$("#reservation-information1-trail").find(".popup-container").find("tbody").children("tr").eq(0).find("td").text()+"</td>";
	printCopyDom += "</tr>";
	printCopyDom += "<tr>";
	printCopyDom += "	<th scope=\"row\">예약자</th>";
	printCopyDom += "	<td>"+$("#reservation-information1-trail").find(".popup-container").find("tbody").children("tr").eq(1).find("td").text()+"</td>";
	printCopyDom += "</tr>";
	printCopyDom += "<tr>";
	printCopyDom += "	<th scope=\"row\">예약날짜</th>";
	printCopyDom += "	<td>"+$("#reservation-information1-trail").find(".popup-container").find("tbody").children("tr").eq(2).find("td").text()+"</td>";
	printCopyDom += "</tr>";
	printCopyDom += "<tr>";
	printCopyDom += "	<th scope=\"row\">탐방로</th>";
	printCopyDom += "	<td>"+$("#reservation-information1-trail").find(".popup-container").find("tbody").children("tr").eq(3).find("td").text()+"</td>";
	printCopyDom += "</tr>";
	printCopyDom += "<tr>";
	printCopyDom += "	<th scope=\"row\">탐방날짜</th>";
	printCopyDom += "	<td>"+$("#reservation-information1-trail").find(".popup-container").find("tbody").children("tr").eq(4).find("td").text()+"</td>";
	printCopyDom += "</tr>";
	printCopyDom += "<tr>";
	printCopyDom += "	<th scope=\"row\">탐방시간</th>";
	printCopyDom += "	<td>"+$("#reservation-information1-trail").find(".popup-container").find("tbody").children("tr").eq(5).find("td").text()+"</td>";
	printCopyDom += "</tr>";
	printCopyDom += "<tr>";
	printCopyDom += "	<th scope=\"row\">예약인원</th>";
	printCopyDom += "	<td>"+$("#reservation-information1-trail").find(".popup-container").find("tbody").children("tr").eq(6).find("td").text()+"</td>";
	printCopyDom += "</tr>";
	printCopyDom += "        </tbody>";
	printCopyDom += "</table>";
	printCopyDom += "</div>";
	
	window.onbeforeprint = function () { 
		document.body.innerHTML = printCopyDom; 
	} 
	window.onafterprint = function () { 
		document.body.innerHTML = _body; 
	} 
	window.print();
	location.href = "index.html";
}

</script> 

                        </div>
                        <div class="tab-pane" id="tab6">
                            <!-- 탐방로프로그램 -->
                            

    
  

<script>

var $trailPrTabBtn = $('[href="#tab6"]').closest('li');
var trailPr = {};
$(function(){
	$.layerPopup();
	
	$trailPrTabBtn.on("click",  function(event){
		// 스텝1 호출
		if(trailPr.cource == undefined){
			currentTrailProgramStep(1);
			showLoading();
			
			$.ajax({
				type:'post',
				async:'true',
				url:'/trprogram/searchSimpleTrailProgramList.do',
				dataType: 'html',
				success:function(result) {
				    //정상 요청, 응답 시 처리 작업
				    $("#tab6").html("");
					$("#tab6").html(result);
					trailProgramEasyInit(1);
				},
				error : function(xhr,status,error) {
				    //오류 발생 시 처리
					maskBackgroundOff();
				},
				complete:function(data,textStatus) {
				    //작업 완료 후 처리
					maskBackgroundOff();
				}
			});
		}else{
			currentTrailProgramStep(1);
			//currentTrailProgramStep(trailPr.cource);
		}
	});
	
	$(document).on("change", "input[name='trPrgTime']", function(event){
		$("input[name='trPrgTotCnt']").val("0");
		var trPrgTime = $("input[name='trPrgTime']:checked").val().split("_");
		
		trailPr.avaliCnt = Number(trPrgTime[3]) - Number(trPrgTime[2]);

	});
	//	위치 선택 (탐방프로그램 show/hidden)
	$(document).on("change", "input[name='trailPrMountain']", function(event){
		var parentNm = $(this).parent().parent().data("group-name");
		var parentId = $(this).parent().parent().data("group-id");
		var itemLen = $('#tab6').find("#select-tr-program > option").length;

		//탐방프로그램 show/hidden
		$('#tab6').find("#select-tr-program").eq(0).val("");
		
		for (var i = 1; i < itemLen; i++) {
			if(parentId == $('#tab6').find("#select-tr-program > option").eq(i).val().split("_")[1]){
				$('#tab6').find("#select-tr-program > option").eq(i).show();
			}else{
				$('#tab6').find("#select-tr-program > option").eq(i).hide();
			}
		}
		trailProgramEasyInit(trailPr.cource);
		trailPr.parentNm = parentNm;
		trailPr.parentId = parentId;
		
	});
	
	// 예약정보 > 탐방프로그램 선택 (집합장소 show/hidden)
	$(document).on("change", "#select-tr-program", function(event){
		trailProgramEasyInit(trailPr.cource);
		
		var selectOptVal = $(this).val().split("_")[0];
		trailPr.prdId = selectOptVal;
		trailPr.deptId = $(this).val().split("_")[1];
		trailPr.prdInqTlno = $(this).val().split("_")[2];
		
		var selectBoxLen = $('#tab6').find("#select-tr-place > option").length;
		for (var i = 1; i < selectBoxLen; i++) {
			if(selectOptVal == $('#tab6').find("#select-tr-place > option").eq(i).val().split("_")[0]){
				$('#tab6').find("#select-tr-place > option").eq(i).show();
			}else{
				$('#tab6').find("#select-tr-place > option").eq(i).hide();
			}
		}
	});
	
	// 예약정보 > 집합장소 선택 
	$(document).on("change", "#select-tr-place", function(event){
		//회차정보
		trailPr.operSchdSn = $(this).val().split("_")[1]
		// 소요시간
		getTrailProgramTime();
	});
	
	// 예약구분 (당일형,숙박형)
	$(document).on("click", "input[name='trPrgGubun']", function(event){
		getTrailProgramTime($(this).val());
	});
	
	// 새로고침
	$(document).on("click", ".trailPrgBtnRefresh", function(){
		trailPr = {};
		$trailPrTabBtn.trigger("click");
	});
	
	// 스텝2 > 인원 마이너스
	$(document).on("click", ".trailPrg_totcnt .minus", function(){
		var trPrgTotCnt = Number($("input[name='trPrgTotCnt']").val());
		if(trPrgTotCnt > 0){
			trPrgTotCnt = trPrgTotCnt - 1;	
		}
		$("input[name='trPrgTotCnt']").val(trPrgTotCnt);
	});
	
	// 스텝2 > 인원 플러스
	$(document).on("click", ".trailPrg_totcnt .plus", function(){
		var trPrgTotCnt = Number($("input[name='trPrgTotCnt']").val());
		if(trPrgTotCnt < Number(trailPr.avaliCnt)){
			trPrgTotCnt = trPrgTotCnt + 1;	
		}
		$("input[name='trPrgTotCnt']").val(trPrgTotCnt);
	});
	
	
	// 스텝2 > 성별
	$(document).on("change", "select[name='tr_sexCodes']", function(){
		trailPr.sex_cnt = 0;
		var selected_val = $(this).val();
		var man_cnt = Number($($("select[name='tr_sexCodes']")[0]).val());
		var girl_cnt = Number($($("select[name='tr_sexCodes']")[1]).val());
		
		trailPr.sex_cnt = man_cnt + girl_cnt;
		
		// 인원 6명 초과 시 초기화
		if(trailPr.sex_cnt > Number(trailPr.trPrgTotCnt)){
			trailPr.sex_cnt = 0;
			toastrMsg('전체인원 수를 초과할수 없습니다.');
			$($("select[name='tr_sexCodes']")[0]).val("0");
			$($("select[name='tr_sexCodes']")[1]).val("0");
			return;
		}
	});
	
	
	// 스텝2 > 연령
	$(document).on("change", "select[name='tr_ageCodes']", function(){
		trailPr.age_cnt = 0;
		var selected_val = $(this).val();
		var baby_cnt = Number($($("select[name='tr_ageCodes']")[0]).val());
		var boy_cnt = Number($($("select[name='tr_ageCodes']")[1]).val());
		var mid_cnt = Number($($("select[name='tr_ageCodes']")[2]).val());
		var high_cnt = Number($($("select[name='tr_ageCodes']")[3]).val());
		
		var age_20_cnt = Number($($("select[name='tr_ageCodes']")[4]).val());
		var age_30_cnt = Number($($("select[name='tr_ageCodes']")[5]).val());
		var age_40_cnt = Number($($("select[name='tr_ageCodes']")[6]).val());
		var age_50_cnt = Number($($("select[name='tr_ageCodes']")[7]).val());
		var age_60_cnt = Number($($("select[name='tr_ageCodes']")[8]).val());
		
		trailPr.age_cnt = baby_cnt + boy_cnt + mid_cnt + high_cnt + age_20_cnt + age_30_cnt + age_40_cnt + age_50_cnt + age_60_cnt;
		
		// 인원 6명 초과 시 초기화
		if(trailPr.age_cnt > trailPr.trPrgTotCnt){
			trailPr.age_cnt = 0;
			toastrMsg("성별인원 최대 "+Number(trailPr.trPrgTotCnt)+"명까지 예약 가능.");
			$($("select[name='tr_ageCodes']")[0]).val("0");
			$($("select[name='tr_ageCodes']")[1]).val("0");
			$($("select[name='tr_ageCodes']")[2]).val("0");
			$($("select[name='tr_ageCodes']")[3]).val("0");
			
			$($("select[name='tr_ageCodes']")[4]).val("0");
			$($("select[name='tr_ageCodes']")[5]).val("0");
			$($("select[name='tr_ageCodes']")[6]).val("0");
			$($("select[name='tr_ageCodes']")[7]).val("0");
			$($("select[name='tr_ageCodes']")[8]).val("0");
			return;
		}
	});
	
});

//탐방프로그램 소요시간 GET
function getTrailProgramTime(reserType){
	$("input[name='trPrgTotCnt']").val("0");
	trailPr.avaliCnt = 0;

	if((trailPr.operSchdSn == "" || trailPr.operSchdSn == undefined) || (trailPr.availDate == "" || trailPr.availDate == undefined) || (trailPr.prdId == "" || trailPr.prdId == undefined)){
		return;
	}
	var reserTp = $("input[name='trPrgGubun']:checked").val();
	
	//예약구분, 소요시간 초기화
	$(".radio-trPrgTime-desc").html("");
	$(".trPrgReserType").html(""); 
	
	showLoading();
	
	$.ajax({
		type:'post',
		async:true,
		url:'/trprogram/getTrailProgramTimeList.do',
		data:{
			"use_dtm" : trailPr.availDate
			, "prd_id" : trailPr.prdId
			, "prod_dvcd" : "G"
		},
		dataType: 'json',
		success:function(result) {
			//정상 요청, 응답 시 처리 작업

		    if(result != null){
		    	
		    	// 예약구분
				var periodTypeHtml = "";
				if(result.todayYn !== undefined && result.todayYn == "Y"){	//당일형 데이터가 존재
					periodTypeHtml += "<li>";
					periodTypeHtml += "<span class=\"radio-1\">";
					if(reserType == "1" || reserType === undefined){
						periodTypeHtml += "    <input type=\"radio\" id=\"radio_tr_program_gb_1\" value=\"1\" name=\"trPrgGubun\" checked>";	
					}else{
						periodTypeHtml += "    <input type=\"radio\" id=\"radio_tr_program_gb_1\" value=\"1\" name=\"trPrgGubun\" >";
					}
					periodTypeHtml += "    <label for=\"radio_tr_program_gb_1\">당일형</label>";
					periodTypeHtml += "</span>";
					periodTypeHtml += "</li>";
				}
				if(result.periodYn !== undefined && result.periodYn == "Y"){	//숙박형 데이터가 존재
					periodTypeHtml += "<li>";
					periodTypeHtml += "<span class=\"radio-1\">";
					if(reserType == "2" || (result.todayYn == "N" && reserType === undefined)){
						periodTypeHtml += "    <input type=\"radio\" id=\"radio_tr_program_gb_2\" value=\"2\" name=\"trPrgGubun\" checked>";	
					}else{
						periodTypeHtml += "    <input type=\"radio\" id=\"radio_tr_program_gb_2\" value=\"2\" name=\"trPrgGubun\" >";
					}
					
					periodTypeHtml += "    <label for=\"radio_tr_program_gb_2\">숙박형</label>";
					periodTypeHtml += "</span>";
					periodTypeHtml += "</li>";
				}
				$(".trPrgReserType").html(periodTypeHtml);
				
				if(reserTp == undefined){
					reserTp = $("input:radio[name='trPrgGubun']:checked").val();
				}
				
		    	var addHtml = "";
		    	var timeCnt = 0;
		    	var periodCnt = 0;
				for (var i = 0; i < result.times.length; i++) {
					if(Number(result.times[i].AVAIL_RSVT_NOP_CNT) < Number(result.times[i].MAX_RSVT_NOP_CNT)){

						if(reserTp == "1" && result.times[i].OPER_RSVT_DVCD == "00" ){
							addHtml += "<li>";
							addHtml += "<span class=\"radio-1\">";
							addHtml += "<input type=\"radio\" id=\"radio_tr_program_time_"+timeCnt+"\" name=\"trPrgTime\" value="+result.times[i].OPER_RSVT_DVCD+"_"+result.times[i].OPER_SCHD_SN+"_"+result.times[i].AVAIL_RSVT_NOP_CNT+"_"+result.times[i].MAX_RSVT_NOP_CNT+"_"+result.times[i].CTT_YN+">";								
							addHtml += "<label for=\"radio_tr_program_time_"+timeCnt+"\">"+result.times[i].PRD_USE_BGN_TD + " ~ " + result.times[i].PRD_USE_END_TD + " (" + result.times[i].AVAIL_RSVT_NOP_CNT + "명/" + result.times[i].MAX_RSVT_NOP_CNT + "명)</label>";
							addHtml += "</span>";
							addHtml += "</li>";
						    timeCnt++;
						}else if(reserTp == "2" && result.times[i].OPER_RSVT_DVCD != "00" ){
							addHtml += "<li>";
							addHtml += "<span class=\"radio-1\">";
							addHtml += "<input type=\"radio\" id=\"radio_tr_program_time_"+periodCnt+"\" name=\"trPrgTime\" value="+result.times[i].OPER_RSVT_DVCD+"_"+result.times[i].OPER_SCHD_SN+"_"+result.times[i].AVAIL_RSVT_NOP_CNT+"_"+result.times[i].MAX_RSVT_NOP_CNT+"_"+result.times[i].CTT_YN+">";
							addHtml += "<label for=\"radio_tr_program_time_"+periodCnt+"\">"+result.times[i].DTL_CD_NM + " (" + result.times[i].AVAIL_RSVT_NOP_CNT + "명/" + result.times[i].MAX_RSVT_NOP_CNT + "명)</label>";
							addHtml += "</span>";
						    addHtml += "</li>";
							periodCnt++;
						}
					}
				}
				
				if(periodCnt == 0 && timeCnt == 0){
					addHtml += "<li><span>등록된 시간이 없습니다.</span></li>";
					trailPr.courceFlag = false;
					$(".radio-trPrgTime").hide();
					toastrMsg("검색결과가 없습니다. 다른조건으로 검색해주세요.","메세지");
				}else{
					trailPr.courceFlag = true;
					$(".radio-trPrgTime").show();
				}
				$(".radio-trPrgTime-desc").html(addHtml);
				
		    }else{
		    	trailPr.courceFlag = false;
		    	toastrMsg(result.resultMsg,"메세지","e");
		    }
		},
		error : function(xhr,status,error) {
		    //오류 발생 시 처리
			maskBackgroundOff();
			trailPr.courceFlag = false;
		},
		complete:function(data,textStatus) {
			
		    //작업 완료 후 처리
			maskBackgroundOff();
		}
	}); 
}

// 탐방로 간편결제 초기화
function trailProgramEasyInit(courceIdx){
	
	//집합장소
	$("#tab6").find("#select-tr-place").eq(0).val("");
	$('#tab6').find("#select-tr-place > option").hide();
	//소요시간
	$(".radio-trPrgTime").hide();

	//날짜
	//$('#tab6').find(".reservation-info").hide();
	$('#tab6').find('div').removeClass("selected choose");
	$('#tab6').find(".reservation-info > dl:eq(0) > dd").html("");
	
	trailPr = {};
	trailPr.cource = courceIdx;
}

// 날짜 선택
function courceDateTrailPrg(year, month, day, bgn_day, end_day){
	
	var diff_day = year+""+month+""+day;
	
	if(month.length == 1){
		month = "0" + month;
	}
	if(day.length == 1){
		day = "0" + day;
	}
	
	var selected_day = year+""+month+""+day;

	$('#tab6').find('div').removeClass("selected choose");
	for (var i = 0; i < $('#tab6').find('.calendar').find('.calendar-day').find('div').length; i++) {
		if($('#tab6').find('.calendar').find('.calendar-day').find('div').eq(i).data("calendar-day") == diff_day){
			$('#tab6').find('.calendar').find('.calendar-day').find('div').eq(i).addClass("selected choose");
		}
	}
	
	// 탐방일자 
	courceDateTrailPrgWrite(selected_day);	
}

function courceDateTrailPrgWrite(selected_day){
	var selected_avail_date = selected_day.substring(0,4) + "-" + selected_day.substring(4,6) + "-" + selected_day.substring(6,8) + "[" +getWeekDate(selected_day)+ "]";

	$('#tab6').find(".reservation-info > dl:eq(0) > dd").html(selected_avail_date);
	$('#tab6').find(".reservation-info > dl:eq(1) > dd").html(trailPr.operSchDesc);
	
	calendar_flag = true;
	trailPr.availDate = selected_day;
	trailPr.selectedAvailDate = selected_avail_date;
	
	$('#tab6').find(".reservation-info").show();
	
	//소요시간
	getTrailProgramTime();
}

function getWeekDate(day){
	var week = ['일', '월', '화', '수', '목', '금', '토'];
	var dayOfWeek = week[new Date(day.substring(0,4), Number(day.substring(4,6))-1, day.substring(6,8)).getDay()];
	return dayOfWeek;
}

function currentTrailProgramStep(idx){
	
	trailPr.cource = idx;
	if(idx == 2){

		// 데이터 초기화
		trailPr.max_rsvt_nop_cnt = 0;
		trailPr.avail_rsvt_nop_cnt = 0;
		trailPr.age_cnt = 0;
		trailPr.reser_cnt = 0;
		trailPr.sex_cnt = 0;
		trailPr.listCnt = 0;
		$($("select[name='tr_ageCodes']")[0]).val("0");
		$($("select[name='tr_sexCodes']")[1]).val("0");
		for (var i = 0; i < 9; i++) {
			$($("select[name='tr_ageCodes']")[i]).val("0");
		}
		
		if(!$("input[name='trailPrMountain']").is(':checked')){
			toastrMsg('위치를 선택해주세요.');
			$("input[name='trailPrMountain']").eq(0).focus();
			return;
		}
		
		if($("#select-tr-program").val() == ''){
			toastrMsg('프로그램을 선택해주세요.');
			$("#select-tr-program > option").eq(0).focus();
			return;
		}
		
		if($("#select-tr-place").val() == ''){
			toastrMsg('집합장소를 선택해주세요.');
			$("#select-tr-place > option").eq(0).focus();
			return;
		}
		
		if(trailPr.availDate == '' || trailPr.availDate == undefined){
			toastrMsg('날짜를 선택해주세요.');
			return;
		}
		
		if(!trailPr.courceFlag || trailPr.courceFlag == undefined){
			toastrMsg('소요시간을 선택해주세요.');
			return;
		}
		
		if($("input[name='trPrgTime']:checked").val() == '' || $("input[name='trPrgTime']:checked").val() == undefined){
			toastrMsg('예약가능한 날짜가 아니거나, 소요 시간을 선택하여 주세요.');
			return;
		}
		
		if(Number($("input[name='trPrgTotCnt']").val()) == 0){
			toastrMsg('전체인원 선택하여 주세요.');
			return;
		}
		
		var trPrgTime = $("input[name='trPrgTime']:checked").val().split("_");
		var availCnt = Number(trPrgTime[2]) + Number($("input[name='trPrgTotCnt']").val());
		
		trailPr.operSchdSn = Number(trPrgTime[1]);
		trailPr.avaliCnt = Number(trPrgTime[3]) - Number(trPrgTime[2]);
		trailPr.max_rsvt_nop_cnt = Number(trPrgTime[3]);
		trailPr.cttYn = trPrgTime[4];
		
		if(availCnt > Number(trPrgTime[3])){
			toastrMsg('정원을 초과하여 예약할수 없습니다.');
			$("input[name='trPrgTotCnt']").focus();
			return;
		}
		trailPr.trPrgTotCnt = Number($("input[name='trPrgTotCnt']").val());

	 	var h3Html = $("input[name='trailPrMountain']:checked").val()+" 해설·생태관광 프로그램 탐방인원 정보를 입력해주세요.";
	    h3Html += "<span class=\"stay-period\"><span>"+trailPr.selectedAvailDate+"</span>";
	    $('#tab6').find(".grid-column").find(".title").html(h3Html);
		
		var trPrgTimeTxt = $("input[name='trPrgTime']:checked").next().text();
		trPrgTimeTxt = trPrgTimeTxt.substring(0, trPrgTimeTxt.indexOf("("));

		$(".trProgramInfo > dl").eq(0).children("dd").html($("#select-tr-program option:selected").text());
		$(".trProgramInfo > dl").eq(1).children("dd").html($("#select-tr-place option:selected").text());
		$(".trProgramInfo > dl").eq(2).children("dd").html(trPrgTimeTxt);
		$(".trProgramInfo > dl").eq(3).children("dd").html($("input[name='trPrgTotCnt']").val()+"명");
		
		var optionHtml = "<option selected=\"selected\" value=\"0\">선택안함</option>";
		for (var i = 1; i <= Number($("input[name='trPrgTotCnt']").val()); i++) {
			optionHtml += "<option value="+i+">"+i+"명</option>";
		}
		
		$("#tr_sexCodes1").html(optionHtml);
		$("#tr_sexCodes2").html(optionHtml);
		$("#tr_ageCodes1").html(optionHtml);
		$("#tr_ageCodes2").html(optionHtml);
		$("#tr_ageCodes3").html(optionHtml);
		$("#tr_ageCodes4").html(optionHtml);
		$("#tr_ageList1").html(optionHtml);
		$("#tr_ageList2").html(optionHtml);
		$("#tr_ageList3").html(optionHtml);
		$("#tr_ageList4").html(optionHtml);
		$("#tr_ageList5").html(optionHtml);
		
		$(".slide-popup").next().find(".progressbar > span:eq(1)").html("STEP.2");
		$(".slide-popup").next().attr("class", "reservation-area step2");
		$('#tab6').find(".grid-row").hide();
		$('#tab6').find(".grid-column").show();
		
	}else{
		$(".trProgramInfo > dl").eq(0).children("dd").html("");
		$(".trProgramInfo > dl").eq(1).children("dd").html("");
		$(".trProgramInfo > dl").eq(2).children("dd").html("");
		$(".trProgramInfo > dl").eq(3).children("dd").html("");
		$(".slide-popup").next().find(".progressbar > span:eq(1)").html("STEP.1");
		$(".slide-popup").next().attr("class", "reservation-area step1");
		$('#tab6').find(".grid-row").show();
		$('#tab6').find(".grid-column").hide();
	}
}

function reservationTrailProgramAuth(){
	
	$.ajax({
		'url': '/reservation/auth.do',
		/* 'data': param, */
		'dataType' : 'json'
	})
	.done(reservationTrailProgram)
	.fail(function(e){
		
		if(e.status == '401'){
			
			loginPopup('reservationTrailProgram();');
		}else{
			
			toastrMsg("일시적으로 장애가 발생하였습니다. 잠시 후 다시 시도하여 주시기 바랍니다.","메세지"); //<br />원활한 서비스를 위해 최선을 다하겠습니다.
		}
	});
}
// 예약하기
function reservationTrailProgram(){
	
	var max_cnt = Number(trailPr.max_rsvt_nop_cnt);		//최대정원
	var avail_cnt = Number(trailPr.avail_rsvt_nop_cnt);	//예약건수
	
	// 예약 총 인원
	trailPr.reser_cnt = Number($("input[name='trPrgTotCnt']").val());

	if(trailPr.prdId == '' || trailPr.prdId == undefined){
		toastrMsg("탐방코스를 선택해주세요.");
		return;
	}
	
	if(trailPr.trPrgTotCnt != trailPr.sex_cnt){
		toastrMsg("성별 인원 선택해주세요.");
		return;
	}
	
	if(trailPr.trPrgTotCnt != trailPr.age_cnt){
		toastrMsg("연령 인원 선택해주세요.");
		return;
	}
	
	if(trailPr.trPrgTotCnt > max_cnt || (trailPr.max_cnt - avail_cnt) < trailPr.trPrgTotCnt){
		toastrMsg("최대예약 가능건수를 초과하여 예약할 수 없습니다.");
		return;
	}
	$("input[name='prd_id']").val(trailPr.prdId);
	$("input[name='max_rsvt_nop_cnt']").val(trailPr.max_rsvt_nop_cnt);
	$("input[name='cttYn']").val(trailPr.cttYn);
	$("input[name='dept_id']").val(trailPr.deptId);
	$("input[name='oper_schd_sn']").val(trailPr.operSchdSn);
	$("input[name='avail_date']").val(trailPr.availDate);
	$("input[name='selected_avail_date']").val(trailPr.selectedAvailDate);
	$("input[name='useBgnDtm']").val(trailPr.availDate);
	$("input[name='useDtm']").val(trailPr.availDate);
	$("input[name='res-time']").val("00_"+trailPr.operSchdSn);
	
	
	showLoading();
	
	 $.ajax({
		type:'post',
		async:true,
		url:'/trprogram/registTrailProgram.do',
		data:$("#frmReservation1").serialize(),
		dataType: 'json',
		success:function(result) {
			//정상 요청, 응답 시 처리 작업
		    if(result.resultCd == "S"){
		    	var sexHtml = "";
		    	var sexCnt = 0;
				for(var i=0;i<$("select[name='tr_sexCodes'] option:selected").length;i++){
					if($("select[name='tr_sexCodes']:eq("+i+") option:selected").text() != "선택안함"){
						if(sexCnt > 0){
							sexHtml += " / ";	
						}
						sexHtml += $("select[name='tr_sexCodes']:eq("+i+") option:selected").parent().parent().parent().find(".label").text() + " " + $("select[name='tr_sexCodes']:eq("+i+") option:selected").text();
						sexCnt++;
					}
					
				}
				var ageHtml = "";
				var ageCnt = 0;
				for(var i=0;i<$("select[name='tr_ageCodes'] option:selected").length;i++){
					if($("select[name='tr_ageCodes']:eq("+i+") option:selected").text() != "선택안함"){
						if(ageCnt > 0){
							ageHtml += " / ";	
						}
						ageHtml += $("select[name='tr_ageCodes']:eq("+i+") option:selected").parent().parent().parent().find(".label").text() + " " +$("select[name='tr_ageCodes']:eq("+i+") option:selected").text();
						ageCnt++;
					}
					
				}
				
				$("#reservation-information-trprogram").find(".popup-container").find("tbody").children("tr").eq(0).find("td").html(result.dataMap.rsvt_id);
				$("#reservation-information-trprogram").find(".popup-container").find("tbody").children("tr").eq(1).find("td").html($('.trProgramInfo').find("dl:eq(0)").find('dd').text());
				$("#reservation-information-trprogram").find(".popup-container").find("tbody").children("tr").eq(2).find("td").html(trailPr.selectedAvailDate);	//예약날짜
				$("#reservation-information-trprogram").find(".popup-container").find("tbody").children("tr").eq(3).find("td").html($('.trProgramInfo').find("dl:eq(2)").find('dd').text());  //예약시간
				$("#reservation-information-trprogram").find(".popup-container").find("tbody").children("tr").eq(4).find("td").html($('.trProgramInfo').find("dl:eq(1)").find('dd').text());  //집결장소	
				$("#reservation-information-trprogram").find(".popup-container").find("tbody").children("tr").eq(5).find("td").html(trailPr.prdInqTlno);  //문의전화
				$("#reservation-information-trprogram").find(".popup-container").find("tbody").children("tr").eq(6).find("td").html(sexHtml + "</br>" +ageHtml);
		    	$.layerPopup();
		    	$('[data-popup="reservation-information-trprogram"]').trigger('click');
		    }else{
		    	toastrMsg(result.resultMsg,"메세지","e");
		    }
		},
		error : function(xhr,status,error) {
		    //오류 발생 시 처리
			maskBackgroundOff();
		},
		complete:function(data,textStatus) {
		    //작업 완료 후 처리
			maskBackgroundOff();
		}
	});
	 
}

function trailProgramPrint(){
	var _body = document.body.innerHTML; 
	
	var printCopyDom = "";
	printCopyDom += "<div class=\"confirmation-document\">";
	printCopyDom += "<strong class=\"title-2\">예약내역</strong>";
	printCopyDom += "<table class=\"table\">";
	printCopyDom += "<caption>예약자정보</caption>";
	printCopyDom += "<colgroup>";
	printCopyDom += "<col style=\"width: 200px;\">";
	printCopyDom += "<col>";
	printCopyDom += "</colgroup>";
	printCopyDom += "<tbody class=\"tbody\">";
	printCopyDom += "<tr>";
	printCopyDom += "	<th scope=\"row\">예약번호</th>";
	printCopyDom += "	<td>"+$("#reservation-information-trprogram").find(".popup-container").find("tbody").children("tr").eq(0).find("td").text()+"</td>";
	printCopyDom += "</tr>";
	printCopyDom += "<tr>";
	printCopyDom += "	<th scope=\"row\">프로그램명</th>";
	printCopyDom += "	<td>"+$("#reservation-information-trprogram").find(".popup-container").find("tbody").children("tr").eq(1).find("td").text()+"</td>";
	printCopyDom += "</tr>";
	printCopyDom += "<tr>";
	printCopyDom += "	<th scope=\"row\">예약날짜</th>";
	printCopyDom += "	<td>"+$("#reservation-information-trprogram").find(".popup-container").find("tbody").children("tr").eq(2).find("td").text()+"</td>";
	printCopyDom += "</tr>";
	printCopyDom += "<tr>";
	printCopyDom += "	<th scope=\"row\">예약시간</th>";
	printCopyDom += "	<td>"+$("#reservation-information-trprogram").find(".popup-container").find("tbody").children("tr").eq(3).find("td").text()+"</td>";
	printCopyDom += "</tr>";
	printCopyDom += "<tr>";
	printCopyDom += "	<th scope=\"row\">집결장소</th>";
	printCopyDom += "	<td>"+$("#reservation-information-trprogram").find(".popup-container").find("tbody").children("tr").eq(4).find("td").text()+"</td>";
	printCopyDom += "</tr>";
	printCopyDom += "<tr>";
	printCopyDom += "	<th scope=\"row\">문의전화</th>";
	printCopyDom += "	<td>"+$("#reservation-information-trprogram").find(".popup-container").find("tbody").children("tr").eq(5).find("td").text()+"</td>";
	printCopyDom += "</tr>";
	printCopyDom += "<tr>";
	printCopyDom += "	<th scope=\"row\">예약인원</th>";
	printCopyDom += "	<td>"+$("#reservation-information-trprogram").find(".popup-container").find("tbody").children("tr").eq(6).find("td").text()+"</td>";
	printCopyDom += "</tr>";
	printCopyDom += "        </tbody>";
	printCopyDom += "</table>";
	printCopyDom += "</div>";
	
	window.onbeforeprint = function () { 
		document.body.innerHTML = printCopyDom; 
	} 
	window.onafterprint = function () { 
		document.body.innerHTML = _body; 
	} 
	window.print();
	location.href = "index.html";
}

window.cancelTrailProgramRegister = function(){

	confirmPopup({
        title:'예약 취소',
        subTitle:'예약 취소',
        content:'취소한 설정값은 복구되지 않습니다.<br/>처음부터 다시 진행하시겠습니까?',
        type:'error',
        send_type : 'POST',
        urlFun:'window.trailProgramChangeStep()'
    });
};

window.trailProgramChangeStep = function(){
	
	closePopup('confirmPop');
	currentTrailProgramStep('1')
	$('.trailPrgBtnRefresh').trigger('click');
};
</script>


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