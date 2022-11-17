<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
	<title>국립공원공단 예약시스템</title>

	 <link rel="stylesheet" href="/assets/style/reservation/campsite.css">

<!-- 	<script src="/assets/js/lib/jquery-1.12.4.min.js"></script>
	<script src="/assets/js/lib/swiper.js"></script>
	<script src="/assets/js/lib/datepicker.min.js"></script>
	<script src="/assets/js/lib/jquery.fs.zoomer.min.js"></script>
	<script src="/assets/js/lib/jquery.rwdImageMaps.min.js"></script>
	<script src="/assets/js/lib/toastr.min.js"></script>
	<script src="/assets/js/scripts.js"></script>
	<script src="/assets/js/common.js?ver4"></script> -->
</head>
<body>
	<div id="wrap" class="sub">
			



<%@ include file="../common/header.jsp" %>


			<div id="container">
				





<script src="/assets/js/lib/handlebars.min.js"></script>
<script src="/assets/js/lib/netfunnel.js"></script>

<script>

	var isReserveValidate = "Y";

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


	$(function(){

		Handlebars.registerHelper('numberWithCommas', function(v1) {
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

		function maskBackground(zidx) {
			$("body").append("<div id='BackMask'></div>");
			noclicklayer = $("#BackMask");

			noclicklayer.css("z-index", zidx);
			noclicklayer.css("position", "fixed");
			noclicklayer.css("left", "0");
			noclicklayer.css("top", "0");
			noclicklayer.css("width", "100%");
			noclicklayer.css("height", "100%");
			noclicklayer.css("background-color", "#e9e9e9");

			noclicklayer.fadeTo("fast", 0.8);
		}

		var initPage = function(){

			bindEvents();

		};

		var bindEvents = function(){

			////  F5 새로고침 기능 해제하기 2020.06.11
			function noEvent() {
				if (event.keyCode == 116) {
					//alert("F5 금지 ...");
					event.keyCode= 2;
					return false;
				}
				else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82)) {
					return false;
				}
			}

			document.onkeydown = noEvent;
		};

		initPage();

		// 배치도 팝업닫기
		$(".btn-img-confirm").on("click",function(){
			$(".btn-img-close").trigger("click");
		});
	});

	function imgView(){
		var imgSrc = $(".scroll-head").data('shelter-img');
		$(".zoomer-image").attr("src" , '');
		$(".zoomer-image").attr("src" , imgSrc);
		$('[data-popup="blockplan"]').trigger('click');
	}

</script>
<script src="/assets/js/reservation/shelter.js?ver6"></script>

<div class="reservation" data-device-mode="pc">
	<h3 class="title">대피소 예약</h3>
	<ul class="nav-tabs tab-menu type2">
		<li class="is-active">
			<a href="#tab1-1" data-dept-id="B01" data-dept-nm="지리산" data-psb-cnt="3">지리산</a></li>
		<li >
			<a href="#tab1-1" data-dept-id="B03" data-dept-nm="설악산" data-psb-cnt="2">설악산</a></li>
		<li >
			<a href="#tab1-1" data-dept-id="B05" data-dept-nm="덕유산" data-psb-cnt="2">덕유산</a></li>
		<li >
			<a href="#tab1-1" data-dept-id="B12" data-dept-nm="소백산" data-psb-cnt="2">소백산</a></li>
	</ul>

	<div class="tab-content">
		<div class="tab-pane is-active" id="tab1-1">

			<div class="title-area">
				<span class="label" data-area-name="title-area-label"></span>
				<h4 class="title" data-area-name="title-area-title"></h4>
				<span class="copy">대피소는 개시기간 기준 아이디 당 <span data-area-name="psb-cnt">3</span>건으로 제한되며, 동일 날짜의 대피소는 선택불가 합니다.</span>
			</div>

			<div class="top-guide">
				<ul class="state-list">
					<li>
						<i class="icon-reservation"></i>
						<span>예약가능</span>
					</li>
					<li>
						<i class="icon-waiting"></i>
						<span>대기가능</span>
					</li>
					<li>
						<i class="icon-none-reservation"></i>
						<span>예약만료</span>
					</li>
					<li>
						<i class="icon-end"></i>
						<span>예약불가</span>
					</li>
				</ul>
				<div class="btn-area">
					<button class="btn btn-refresh" data-prd-btn="refresh">
						<i class="icon-refresh"></i>
						<span>새로고침</span>
					</button>
				</div>
			</div>

			<!-- 예약하기 현황표 -->
			<div class="table-reservation">
				<div data-area-name="table-reservation">
				</div>
			</div>

			<div class="title-area" id="reservDiv" tabindex="0">
				<h4 class="title">선택 대피소</h4>
				<div class="btn-area">
					<button class="btn btn-delete" data-prd-btn="delete">삭제</button>
				</div>
			</div>
			<table class="table">
				<caption>선택 대피소</caption>
				<colgroup>
					<col style="width: 5%;">
					<col>
					<col style="width: 20%;">
					<col>
					<col style="width: 40%;">
				</colgroup>
				<thead class="thead">
				<tr>
					<th scope="col" class="form">
			                <span class="checkbox-1">
			                    <input type="checkbox" id="check1-1">
			                    <label for="check1-1"></label>
			                </span>
					</th>
					<th scope="col">사무소</th>
					<th scope="col">대피소</th>
					<th scope="col">선택일자</th>
					<th scope="col">인원수 선택</th>
				</tr>
				</thead>
				<tbody class="tbody" data-template-id="selected-prds-template">
				</tbody>
			</table>
			<!-- 총 결제 예정 금액 -->
			<div class="title-area">
				<h4 class="title">총 이용금액</h4>
			</div>
			<div class="payment" data-template-id="prd-payment-template">
			</div>
			<div class="payment collapse-wrap open">
				<button class="btn collapse is-active">꼭 확인해주세요!</button>
				<div class="a">
					<ul class="dot-list">
						<li>인원을 선택한 후 이용금액을 확인하고 예약하기 버튼을 누르면 바로 접수가 완료됩니다.</li>
						<li>예약완료 후 곧바로 다른 시설 예약이 가능합니다.</li>
						<li>인기 대피소는 이용자가 많아 선택을 하는 도중 조기 마감될 수 있습니다.</li>
						<!-- <li>경남 산청군 코로나19 현황 주소: https://www.sancheong.go.kr/intro_sc.jsp</li> -->
					</ul>
				</div>
			</div>
			<div class="board-bottom">
				<div class="center">
					<a href="javascript:void(0);" class="btn btn-register is-active" data-prd-btn="register"
					   data-login-yn="">예약하기</a>
				</div>
			</div>
		</div>
	</div>
</div>

<button style="display:none;" type="button" class="btn btn-layer" data-popup="automatic-character-shelter">자동방지 입력문자</button>
<div class="modal-popup small" id="automatic-character-shelter">
	<div class="popup-wrap">
		<div class="popup-head">
			<strong class="popup-title">예약가능</strong>
			<button type="button" class="btn-close" title="닫기">
				<i class="icon-close"></i>
			</button>
		</div>
		<div class="popup-container" data-template-id="popup-container-template">
		</div>
	</div>
</div>

<!-- 예약안내 -->
<button type="button" class="btn btn-layer" data-popup="reservation-information1-shelter" style="display:none;">예약안내</button>
<div class="modal-popup small" id="reservation-information1-shelter">
	<div class="popup-wrap">
		<div class="popup-head">
			<strong class="popup-title">예약완료안내</strong>
			<button type="button" class="btn-close" title="닫기" onclick="javascript:lastPopClose();">
				<i class="icon-close"></i>
			</button>
		</div>
		<div class="popup-container">
			<div class="center" data-area-name="reservation-popup-container">
				<i class="icon-check"></i>
				<strong class="title-1">예약이 완료되었습니다.</strong>
				<p class="copy-mid" data-popup-information-shelter="sttlmMtDtm">결제 만기일시는 <em></em> 까지 입니다.<br>미 결제시 자동 취소되니 유의 하시기 바랍니다.</p>

				<p class="copy-mid" data-area-name="reservation-popup-copy-mid-w"><br/>
					대기자에서 예약자로 전환되면 예약 결제 안내 문자가 발송됩니다.<br>
					단, 잘못된 연락처 및 통신사 환경 등에 따라 전송이 실패할 수도 있습니다.<br>
					이에 따른 피해에 대해서는 국립공원공단에서 보상하지 않습니다.<br>
					반드시 '나의 예약 목록'에서 예약상태를 확인하여 주시기 바랍니다.
				</p>

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
			</div>

			<div class="btn-area">
				<a href="/mypage/dashBoard.do" class="btn btn-link">나의 예약목록 보기</a>
			</div>
		</div>
	</div>
</div>

<!-- 배치도 -->
<button type="button" class="btn btn-layer" data-popup="blockplan" style="display:none">배치도</button>
<div class="modal-popup medium" id="blockplan">
	<div class="popup-wrap">
		<div class="popup-head">
			<strong class="popup-title">배치도</strong>
			<button type="button" class="btn-close btn-img-close" title="닫기" >
				<i class="icon-close"></i>
			</button>
		</div>
		<div class="popup-container">
			<div class="zoom-container">
				<div class="zoomable">
					<img src="../../assets/img/@img-deployment.png" alt="배치도" />
				</div>
				<button class="btn-move">이미지 이동</button>
			</div>
			<div class="btn-area">
				<button class="btn btn-confirm is-active btn-img-confirm">확인</button>
			</div>
		</div>
	</div>
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
	<img id="loadingImage" src="/assets/img/preloader.gif" alt="로딩이미지" style="position: absolute; left: 924.5px; top: 539.5px; z-index: 100000; display: none;">
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
