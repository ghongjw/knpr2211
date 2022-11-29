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