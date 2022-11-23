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
	
</script>

<script type="text/javascript">

$('document').ready(function(){
	
	$("#tab1").change(function(){
		$("#m1").submit()
	})
	
	});


</script>

<div class="grid-row" data-reservation-step="1">
    <div class="grid-cell">
        <h3 class="title">위치</h3>
        <form action="MountainSelect"  method="post" id="m1">
        <ul class="check-area" id="tab1" data-template-id="camp-group-template">
	<li>
        <label for="camp-radio1-0" class="radio-check">
            <input type="radio" id="camp-radio1-0" name="mountain" value="A01">
            <span>가야산</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-1" class="radio-check">
            <input type="radio" id="camp-radio1-1" name="mountain" value="A02">
            <span>계룡산</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-2" class="radio-check">
            <input type="radio" id="camp-radio1-2" name="mountain" value="A03">
            <span>내장산</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-3" class="radio-check">
            <input type="radio" id="camp-radio1-3" name="mountain" value="A04">
            <span>다도해해상</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-4" class="radio-check">
            <input type="radio" id="camp-radio1-4" name="mountain" value="A05">
            <span>덕유산</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-5" class="radio-check">
            <input type="radio" id="camp-radio1-5" name="mountain" value="A06">
            <span>무등산</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-6" class="radio-check">
            <input type="radio" id="camp-radio1-6" name="mountain" value="A07">
            <span>변산반도</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-7" class="radio-check">
            <input type="radio" id="camp-radio1-7" name="mountain" value="A08">
            <span>설악산</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-8" class="radio-check">
            <input type="radio" id="camp-radio1-8" name="mountain" value="A09">
            <span>소백산</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-9" class="radio-check">
            <input type="radio" id="camp-radio1-9" name="mountain" value="A10">
            <span>오대산</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-10" class="radio-check">
            <input type="radio" id="camp-radio1-10" name="mountain" value="A11">
            <span>월악산</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-11" class="radio-check">
            <input type="radio" id="camp-radio1-11" name="mountain" value="A12">
            <span>월출산</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-12" class="radio-check">
            <input type="radio" id="camp-radio1-12" name="mountain" value="A13">
            <span>주왕산</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-13" class="radio-check">
            <input type="radio" id="camp-radio1-13" name="mountain" value="A14">
            <span>지리산</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-14" class="radio-check">
            <input type="radio" id="camp-radio1-14" name="mountain" value="A15">
            <span>치악산</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-15" class="radio-check">
            <input type="radio" id="camp-radio1-15" name="mountain" value="A16">
            <span>태백산</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-16" class="radio-check">
            <input type="radio" id="camp-radio1-16" name="mountain" value="A17">
            <span>태안해안</span>
        </label>
    </li>
	<li>
        <label for="camp-radio1-17" class="radio-check">
            <input type="radio" id="camp-radio1-17" name="mountain" value="A18">
            <span>한려해상</span>
        </label>
    </li>
</ul>
 
</form>
<script type="text/javascript">

$('document').ready(function(){
	
	$("#location1").change(function(){
		$("#l").submit()
	})
	
	});


</script>



    <ul class="check-area" id="location1" data-template-id="camp-dept-template">
    
    <c:forEach var="a" items="${Locations }" varStatus="status" >
	<li>
	
        <span class="radio-1">
            <input type="radio" id="camp-location1-${a }" name="Location"value="${nameOfLocations[status.index]}" >
            <label for="camp-location1-0">${nameOfLocations[status.index] }</label>
        </span>
    </li>
	</c:forEach>
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
        <h3 class="title">유형121</h3>

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
  

    //]]>
</script>


<script type="text/javascript">

$('document').ready(function(){
	
	$("#tab2").change(function(){
		$("#m2").submit()
	})
	
	});


</script>

<div class="grid-row" data-reservation-step="1">
    <div class="grid-cell">
        <h3 class="title">위치</h3>
        <form action="MountainSelect" method="post" id="m2">
        
        <ul class="check-area" id="tab2">
            

            <li>
                <label for="shelterMountainRadio1" class="radio-check">
                    <input type="radio" id="shelterMountainRadio1" name="mountain" value="B04">
                    <span>지리산</span>
                </label>
            </li>
            <li>
                <label for="shelterMountainRadio2" class="radio-check">
                    <input type="radio" id="shelterMountainRadio2" name="mountain" value="B02">
                    <span>설악산</span>
                </label>
            </li>
            <li>
                <label for="shelterMountainRadio3" class="radio-check">
                    <input type="radio" id="shelterMountainRadio3" name="mountain" value="B01">
                    <span>덕유산</span>
                </label>
            </li>
            <li>
                <label for="shelterMountainRadio4" class="radio-check">
                    <input type="radio" id="shelterMountainRadio4" name="mountain" value="B03">
                    <span>소백산</span>
                </label>
            </li>
        </ul>
      </form>
      
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


    //]]>
</script>

<script type="text/javascript">

$('document').ready(function(){
	
	$("#tab3").change(function(){
		$("#m3").submit()			
	})
	
	});


</script>

<div class="grid-row" data-reservation-step="1">
    <div class="grid-cell">
        <h3 class="title">위치</h3>
        <form action="MountainSelect" method="post" id="m3">
        <ul class="check-area" id="tab3">
                    
                        <li>
                            <label for="deptId0" class="radio-check">
                                <input type="radio" id="deptId0" name="mountain" value="C08"><span>북한산</span>
                            </label>
                        </li>
                    
                        <li>
                            <label for="deptId1" class="radio-check">
                                <input type="radio" id="deptId1" name="mountain" value="C06"><span>지리산</span>
                            </label>
                        </li>
                    
                        <li>
                            <label for="deptId2" class="radio-check">
                                <input type="radio" id="deptId2" name="mountain" value="C05"><span>소백산</span>
                            </label>
                        </li>
                    
                        <li>
                            <label for="deptId3" class="radio-check">
                                <input type="radio" id="deptId3" name="mountain" value="C04"><span>설악산</span>
                            </label>
                        </li>
                    
                        <li>
                            <label for="deptId4" class="radio-check">
                                <input type="radio" id="deptId4" name="mountain" value="C07"><span>한려해상</span>
                            </label>
                        </li>
                    
                        <li>
                            <label for="deptId5" class="radio-check">
                                <input type="radio" id="deptId5" name="mountain" value="C03"><span>무등산</span>
                            </label>
                        </li>
                    
                        <li>
                            <label for="deptId6" class="radio-check">
                                <input type="radio" id="deptId6" name="mountain" value="C01"><span>가야산</span>
                            </label>
                        </li>
                    
                        <li>
                            <label for="deptId7" class="radio-check">
                                <input type="radio" id="deptId7" name="mountain" value="C02"><span>내장산</span>
                            </label>
                        </li>
                    
                </ul>
                
              </form>
              
              
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
 

    //]]>
</script>


<script type="text/javascript">

$('document').ready(function(){
	
	$("#tab4").change(function(){
		$("#m4").submit()
		
	})
	
	});


</script>


<div class="grid-row" data-reservation-step="1">
    <div class="grid-cell">
        <h3 class="title">위치</h3>
        
       <form action="MointainSelect" method="post" id="m4"> 
       <ul class="check-area" id="tab4">
            <li>
                <label for="rsdnMountainRdio" class="radio-check">
                    <input type="radio" id="rsdnMountainRdio" name="rsdnMountain1" value="">
                    <span>태백산</span>
                </label>
            </li>
        </ul>
        
        </form>
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