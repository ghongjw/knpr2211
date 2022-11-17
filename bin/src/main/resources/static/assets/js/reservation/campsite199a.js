var title;			
var date_dow;		//요일
var reser_tp;		//당일예약상태
var next_reser_tp;	//다음날예약상태
var price = 0;		//1박
var next_price = 0;	//2박
var tot_price = 0;	//가격
var start_date;		//입실일자
var end_date;		//퇴실일자
var check_per = "1박 2일"; //체류기간
var check_per_val = 1;	 // 1:1박2일, 2:2박3일	
var dept_id;
var prod_id;
var brfeTerYn;

var paymentTitle;
var optAmtTotal;
var selectedOptions;

$(function(){
	
	$('#authTypeId').val('A');
	
	window.campReservation = 'Y';
	
	var drawPayment = function($option){
		
		optAmtTotal = 0;
		selectedOptions = '';
		
		var inHtml = '';
		inHtml += '<dt>' + paymentTitle + ' : ' + check_per + '</dt>';
		inHtml += '<dd>' + numberWithCommas(commn.toNumber(tot_price)) + '원</dd>';
		
		//if($option){
			
			$.each($('[data-template-id="prd-options-template"]').find('[type="checkbox"][data-opt-id]'), function(){
				
				if($(this).prop('checked')){
					
					var optNm = commn.nvl($(this).data('opt-nm'));
					var optAmt = commn.nvl($(this).val(), '0');
					var optId = commn.nvl($(this).data('opt-id'));
					inHtml += '<dt>옵션 : ' + optNm + '사용 ' + check_per_val + '박</dt>';
	                inHtml += '<dd>' + numberWithCommas(commn.toNumber(optAmt)) + '원</dd>';
	                optAmtTotal += Number(optAmt);
	                if(selectedOptions){
	                	selectedOptions += ',';
	                }
	                selectedOptions += optId;
				}
			});
		//}
        $('#campsitePayment').html(inHtml).closest('.payment').css('display', '');
		$(".payment > dl.total > dd > em").html(numberWithCommas(commn.toNumber(tot_price) + commn.toNumber(optAmtTotal)));
	};
	
	var drawOptions = function(){
		
		var optParam = {};
		optParam.prdId = prod_id;
		optParam.useBgnDtm = start_date;
		optParam.period = check_per_val;
		
		commn.callAjax({
			url: '/reservation/campsite/selectOptionList.do',
			data: optParam,
			dataType: 'json'
		})
		.done(function(res){
			
			if(res){
				
				var $options = $('[data-template-id="prd-options-template"]');
				var source = $('#' + $options.data('template-id')).html(); 
				var template = Handlebars.compile(source); 
				
				var optTemplateParam = {};
				optTemplateParam.options = res.optionList;
				optTemplateParam.check_per_val = check_per_val;
				$options.html(template(optTemplateParam))
				.find('[type="checkbox"][data-opt-id]').on('change', function(){
					
					drawPayment($(this));
				})
				.trigger('change');
				if(!res.optionList || $.isEmptyObject(res.optionList)){
					drawPayment();
				}
			}
		})
		.fail(function(e){
			//$("#loadingImage").hide();
			toastrMsg("일시적으로 장애가 발생하였습니다. 잠시 후 다시 시도하여 주시기 바랍니다.","메세지"); //<br />원활한 서비스를 위해 최선을 다하겠습니다.
		});
	};
	
	// 야영장 일자 선택
	$('[data-reservation-wrap="campsite"]').parent().on("click", '.table-body > tbody > tr > td', function(){
		title = $(this).children("i").data("title");
		start_date = String($(this).children("i").data("use_df"));
		end_date = "";
		date_dow = $(this).children("i").data("ctrt-dow");
		reser_tp = $(this).children("i").data("reser_tp");
		next_reser_tp = $(this).next("td").children("i").data("reser_tp");
		price = $(this).children("i").data("sal-amt");
		next_price = $(this).next("td").children("i").data("sal-amt");
		prod_id = $(this).children("i").data("prod-id");
		brfeTerYn = $(this).children("i").data("brfe-ter-yn");
		
		paymentTitle = $(this).children("i").data("payment-title");
		
		// 예약상태가 없으면 
		if(reser_tp == undefined){
			$("#reserFlag").val("N");
			return;
		}
		
		var stayHtml = "<span class=\"length-stay selected\" data-check_per='1'>1박 2일</span>";
		end_date = getChkOutDate(start_date, 1);
		
		if(reser_tp != 'W'){
			
			if(next_reser_tp == "R"){ //예약 다음날이 예약상태가 'R' 이면 2박3일
				stayHtml += "<span class=\"length-stay\" data-check_per='2'>2박 3일</span>";
			}
		}
		
		if(reser_tp == "R"){ // 예약하기
			$(".btn-register").html("예약하기");
		}else{ // 'W'  대기예약하기
			$(".btn-register").html("대기예약하기");
		}
		$("#reserFlag").val("Y");
		tot_price = price;
		check_per_val = 1;
		check_per = "1박 2일";
		
		$(".table-row > div:eq(0) > span").html(title);
		$(".table-row > div:eq(1) > span").html(start_date.substring(0,4)+"-"+start_date.substring(4,6)+"-"+start_date.substring(6,8)+"["+date_dow+"]");
		$(".table-row > div:eq(2) > span").html(end_date.substring(0,4)+"-"+end_date.substring(4,6)+"-"+end_date.substring(6,8)+"["+getWeekDate(end_date)+"]");
		$(".stay-row").html(stayHtml);

		drawPayment();

		$("#reservDiv").focus();
		$(".btn-register").addClass('is-active');


		$('[data-use_df][data-prod-id]').closest('td').removeClass('start selected end');
		$('[data-use_df="' + start_date + '"][data-prod-id="' + prod_id + '"]').closest('td').addClass('start selected');
		$('[data-use_df="' + getChkOutDate(start_date, 1) + '"][data-prod-id="' + prod_id + '"]').closest('td').addClass('end selected');
		
		drawOptions();
	});
	
	// 1박/2박 선택
	$(document).on("click", ".length-stay", function(){
		for (var i = 0; i < $(".length-stay").length; i++) {
			if($(this).data("check_per") == $(".length-stay").eq(i).data("check_per")){
				$(this).attr("class", "length-stay selected");
			}else{
				$(".length-stay").eq(i).attr("class", "length-stay");
			}
		}
		
		$('[data-use_df][data-prod-id]').closest('td').removeClass('start selected end');
		
		if ($(this).data("check_per") == 1) {
			tot_price = price;
			end_date = getChkOutDate(start_date, 1);
			check_per = "1박 2일";
			check_per_val = 1;
		}else {
			tot_price = price + next_price;
			end_date = getChkOutDate(start_date, 2);
			check_per = "2박 3일";
			check_per_val = 2;
			
			$('[data-use_df="' + getChkOutDate(start_date, 1) + '"][data-prod-id="' + prod_id + '"]').closest('td').addClass('selected');
		}
		$('[data-use_df="' + start_date + '"][data-prod-id="' + prod_id + '"]').closest('td').addClass('start selected');
		$('[data-use_df="' + end_date + '"][data-prod-id="' + prod_id + '"]').closest('td').addClass('end selected');
		
		//$(".payment > dl > dd > em").html(numberWithCommas(tot_price));
		drawOptions();
		$(".table-row > div:eq(2) > span").html(end_date.substring(0,4)+"-"+end_date.substring(4,6)+"-"+end_date.substring(6,8)+"["+getWeekDate(end_date)+"]");
	});
	
	// 팝업닫기
	/*$(".btn-cancel").on("click",function(){
		$(".btn-close:eq(1)").trigger("click");
	});*/
	$("#automatic-character .btn-cancel").on("click",function(){
		$("#automatic-character .btn-close").trigger("click");
	});
	
	// 배치도 팝업닫기
	$(".btn-img-confirm").on("click",function(){
		$(".btn-img-close").trigger("click");
	});
	
});

// 예약안내팝업 닫기
function lastPopClose(){
	showLoading();
	location.reload();	
}

//새로고침
function refresh(){
	for (var i = 0; i < $(".collapse-wrap > ul > li > div > ul > li").length; i++) {
		if($(".collapse-wrap > ul > li > div > ul > li:eq("+i+")").attr("class") != undefined){
			$(".collapse-wrap > ul > li > div > ul > li:eq("+i+") > a").trigger("click");
		}
	}
	$(".btn-register").removeClass('is-active');
}

function getWeekDate(day){
	var week = ['일', '월', '화', '수', '목', '금', '토'];
	var dayOfWeek = week[new Date(day.substring(0,4), Number(day.substring(4,6))-1, day.substring(6,8)).getDay()];
	return dayOfWeek;
}

function getChkOutDate(start_date, nextNum){
    var now = new Date(start_date.substring(0,4), Number(start_date.substring(4,6))-1, start_date.substring(6,8));
    var tomorrow = new Date(now.setDate(now.getDate()+Number(nextNum)));
	var tomorrowyear = tomorrow.getFullYear();
    var tomorrowmonth = tomorrow.getMonth() + 1;    //1월이 0으로 되기때문에 +1을 함.
    var tomorrowdate = tomorrow.getDate();

    tomorrowmonth = tomorrowmonth >=10 ? tomorrowmonth : "0" + tomorrowmonth;
    tomorrowdate  = tomorrowdate  >= 10 ? tomorrowdate : "0" + tomorrowdate;
    var tomorrowDay = tomorrowyear+""+tomorrowmonth+""+tomorrowdate;

    return tomorrowDay; 
}


function reservation_before_auth(){
	
	if(window.isGreenpoint == 'Y'){
		
		reservation_before();
	}else{
		
		commn.callAjax({
			'url': '/reservation/auth.do',
			/* 'data': param, */
			'dataType' : 'json'
		})
		.done(reservation_before)
		.fail(function(e){
			
			if(e.status == '401'){
				
				loginPopup('reservation_before();');
			}else{
				
				toastrMsg("일시적으로 장애가 발생하였습니다. 잠시 후 다시 시도하여 주시기 바랍니다.","메세지"); //<br />원활한 서비스를 위해 최선을 다하겠습니다.
			}
		});
	}
}
// 예약하기
function reservation_before(){

	$("input[name=captcha]").val("");
	if($("#reserFlag").val() == "Y"){
	
		var endDate = end_date.substring(0,4)+"-"+end_date.substring(4,6)+"-"+end_date.substring(6,8);
		var week = ['일', '월', '화', '수', '목', '금', '토'];
		var dayOfWeek = week[new Date(endDate).getDay()];
		
		var $selectedOptions = $('[data-template-id="prd-options-template"]').find('[type="checkbox"][data-opt-id]:checked');
		var optionHtml = '';
		$.each($selectedOptions, function(i){
			if(i > 0){
				optionHtml += '<br>';
			}
			optionHtml += $(this).data('opt-nm') + '사용 ' + check_per_val + '박';
		});
		
		/*$(".popup-container").find(".tbody").children("tr").eq(0).children("td").html(title.split("-")[0]);
		$(".popup-container").find(".tbody").children("tr").eq(1).children("td").html(title.split("-")[1]);
		$(".popup-container").find(".tbody").children("tr").eq(2).children("td").html(title.split("-")[2] + " " + title.split("-")[3]);
		$(".popup-container").find(".tbody").children("tr").eq(3).children("td").html(start_date.substring(0,4)+"-"+start_date.substring(4,6)+"-"+start_date.substring(6,8)+"["+date_dow+"]");
		$(".popup-container").find(".tbody").children("tr").eq(4).children("td").html(check_per);
		$(".popup-container").find(".tbody").children("tr").eq(5).children("td").html(numberWithCommas(tot_price) + "원");*/
		
		$('[data-area-name="popup-container-tbody"] tr').eq(0).children("td").html(paymentTitle);
		$('[data-area-name="popup-container-tbody"] tr').eq(1).children("td").html(check_per);
		$('[data-area-name="popup-container-tbody"] tr').eq(2).children("td").html(start_date.substring(0,4)+"-"+start_date.substring(4,6)+"-"+start_date.substring(6,8)+"["+date_dow+"]");
		$('[data-area-name="popup-container-tbody"] tr').eq(3).children("td").html(endDate+"["+dayOfWeek+"]");
		$('[data-area-name="popup-container-tbody"] tr').eq(4).children("td").html(optionHtml);
		
		
		$('[data-area-name="brfeTerYn"]').hide();
		//무장애영지
		var curBrfeTerYn = brfeTerYn;
		if(brfeTerYn == 'Y'){
			
			var brfeTerDt = start_date.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3');
			if(check_per_val == 2){
				
				brfeTerDt = commn.date_add(brfeTerDt, 1);
			}
			brfeTerDt = commn.toNumber(brfeTerDt.replace(/\-/g,''));
			
			if(brfeTerDt < commn.toNumber(commn.date_add('', 3).replace(/\-/g,''))){
				
				curBrfeTerYn = 'N';
			}
		}
		
		if(curBrfeTerYn == 'Y'){
			
			$('[data-area-name="brfeTerYn"] [name="rsvtDvcdDs"]').prop('checked', false);
			$('[data-area-name="brfeTerYn"] [name="dstpRegNo"]').val('');
			$('[data-area-name="brfeTerYn"]').css('display', '');
		}
		
		if(optionHtml){
			$('[data-area-name="popup-container-tbody"] tr').eq(4).css('display', '');
		}else{
			$('[data-area-name="popup-container-tbody"] tr').eq(4).hide();
		}
		$('[data-area-name="popup-container-tbody"] tr').eq(5).children("td").html(numberWithCommas(commn.toNumber(tot_price) + commn.toNumber(optAmtTotal)) + "원");
		
		if(window.isGreenpoint == 'Y'){
			
			//$(".popup-container").find(".tbody").children("tr").eq(6).children("td").html('보유그린포인트');
			$("#select-option").val('');
			$("#carNo").val('');

			if(tot_price + optAmtTotal > commn.toNumber($('[type="hidden"][name="greenpoint"]').val())){
				
				$('[data-popup-greenpoint-text="error"]').css('display', '').siblings('[data-popup-greenpoint-text="success"]').hide();
				$('[data-button-name="reservation"]').removeClass('is-active');
			}else{
				
				$('[data-popup-greenpoint-text="error"]').hide().siblings('[data-popup-greenpoint-text="success"]').css('display', '');
				$('[data-button-name="reservation"]').addClass('is-active');
			}
		}
		
		
		$(".captcha").html("<img alt='자동예약 방지문자'/>/>").find("img:last").attr("src", "/reserCaptcha.do?dummy=" + (new Date()).getTime());
		$.layerPopup();
		
		$('#automatic-character').find(".popup-wrap").css("top", "auto");
		$('[data-popup="automatic-character"]').trigger('click');
		
	}else{
		toastrMsg('예약일정을 선택해주세요.');
	}
}	

//예약하기
function reservation(){
	const pattern = /\d{2,3}[가-힣]{1}\d{4}/gm;

	if(!isEmpty($("#carNo").val()) && !pattern.test($("#carNo").val().replace(/ /g,""))) {
		toastrMsg("정확한 차량번호를 입력해주세요.");
		return false;
	}

	if(window.isGreenpoint == 'Y'){
		
		if($('[data-popup-greenpoint-text="success"]').css('display') == 'none'){
			
			toastrMsg("그린포인트가 부족하여 결제할 수 없습니다.", "메세지", "e");
			return false;
		}
	}

	var curBrfeTerYn = $('[data-area-name="brfeTerYn"]').css('display') != 'none' ? 'Y' : 'N';
	
	if(curBrfeTerYn == 'Y'){
		
		if(!$('[data-area-name="brfeTerYn"] [name="rsvtDvcdDs"]:checked').val()){
			
			toastrMsg("자격구분을 선택해주세요.","메세지","e");
			$('[data-area-name="brfeTerYn"] [name="rsvtDvcdDs"]').eq(0).focus();
			return;
		}
		if(!$.trim($('[data-area-name="brfeTerYn"] [name="dstpRegNo"]').val())){
			
			toastrMsg("장애인등록번호(뒤 3자리)를 입력해주세요.","메세지","e");
			$('[data-area-name="brfeTerYn"] [name="dstpRegNo"]').focus();
			return;
		}
	}

	if($("input[name=captcha]").val() == null || $("input[name=captcha]").val().trim() == "") {
		toastrMsg("자동예약방지글을 입력해주세요.","메세지","e");
		$("input[name=captcha]").focus();
		return;
	}

	commn.callAjax({
		url: '/reservation/registerCampReservation.do',
		data: {
			"prdId" : prod_id
			, "deptId" : dept_id
			, "useBgnDtm" : start_date
			, "useEndDtm" : end_date
			, "reserTp" : reser_tp
			, "checkPerVal" : check_per_val
			, "price" : price
			, "nextPrice" : next_price
			, "captcha" : $("input[name='captcha']").val()
			, "optAmtTotal" : optAmtTotal
			, "selectedOptions" : selectedOptions
			, 'isGreenpoint' : window.isGreenpoint
			, "pttNopCnt" : window.isGreenpoint == 'Y' ? $("#select-option").val() : ''
			, "carNo" : window.isGreenpoint == 'Y' ? $("#carNo").val() : ''
			, 'rsvtDvcd' : curBrfeTerYn == 'Y' ? $('[data-area-name="brfeTerYn"] [name="rsvtDvcdDs"]:checked').val() : ''
			, 'dstpRegNo' : curBrfeTerYn == 'Y' ? $('[data-area-name="brfeTerYn"] [name="dstpRegNo"]').val() : ''
		},
		dataType: 'json'
	})
	.done(function(result){
		
		//정상 요청, 응답 시 처리 작업
	    if(result.resultCd == "S"){
	    	//$(".btn-close:eq(1)").trigger("click");
	    	$("#automatic-character .btn-close").trigger("click");
	    	
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

	    	if(reser_tp == 'W'){
	    		
	    		$('[data-area-name="reservation-popup-container-w"]').css('display', '').siblings('[data-area-name="reservation-popup-container"]').hide();
	    	}else{
	    		
	    		$('[data-area-name="reservation-popup-container"]').css('display', '').siblings('[data-area-name="reservation-popup-container-w"]').hide();

	    		if(window.isGreenpoint != 'Y'){
	    			$('[data-popup-information-campsite="sttlmMtDtm"]').html(ymdhm(commn.nvl(result.dataMap).sttlmMtDtm2));//결제만기일시
		    	}
	    	}
	    	
	    	// 예약안내 레이어팝업
	    	$('[data-popup="reservation-information1"]').trigger('click');
	    }else{
	    	//toastrMsg(result.resultMsg,"메세지","e");
	    	alertPopup({
                title:'예약불가 안내',
                subTitle:'예약불가 안내',
                content: result.resultMsg,
                type:'error'
            });	
			closePopup('automatic-character');
	    }
	})
	.fail(function(e){
		//$("#loadingImage").hide();
		toastrMsg("일시적으로 장애가 발생하였습니다. 잠시 후 다시 시도하여 주시기 바랍니다.","메세지"); //<br />원활한 서비스를 위해 최선을 다하겠습니다.
		closePopup('automatic-character');
	});
}

// 상세조회
function goCampProductDetail(pname, name, id, prodId){

	var drawStrLink = function(dprtmId){
		
		var strLink = "";
 		var caravanStr = "";
		if(dprtmId.startsWith("B01")){	//지리산
			caravanStr = "다음은 카라반 전용 영지입니다.<br/>- 지리산 내원 C 캠핑카 전용 영지<br/>- 지리산 달궁자동차 C캠핑카 겸용 영지<br/>- 지리산 학천 카라반";
		}else if(dprtmId.startsWith("B05")) {	//덕유산
			caravanStr = "다음은 카라반 전용 영지입니다.<br/>- 덕유산 카라반전용";
		}else if(dprtmId.startsWith("B11")) {	//월악산
			caravanStr = "다음은 카라반 전용 영지입니다.<br/>- 월악산 하선암, 송계 야영장";
		}else if(dprtmId.startsWith("B03")) {	//설악산
			caravanStr = "다음은 카라반 전용 영지입니다.<br/>- 설악산 카라반 전용 영지 D";
		}else if(dprtmId.startsWith("B06")) {	//오대산
			caravanStr = "다음은 카라반 전용 영지입니다.<br/>- 오대산 카라반 전용 영지 C";
		}else if(dprtmId.startsWith("B02")) {	//한려해상
			caravanStr = "다음은 카라반 전용 영지입니다.<br/>- 한려해상 학동 카라반 겸용 영지";
		}else if(dprtmId == 'B091003' || dprtmId == 'B091001' ){	//염포,팔영산
			caravanStr = "캠핑카,카라반,트레일러,루프탑을 이용한 야영을 금지합니다.";
		}


		if(dprtmId == 'B131002'){ //백운동
			strLink = "경북 성주군 코로나19 현황 주소: <a href='https://sj.go.kr/main.jsp' target='_blank'>https://sj.go.kr/main.jsp</a>";
		}
		else if(dprtmId == 'B131001' || dprtmId == 'B131003' ){ //삼정,치인
			strLink = "경남 합천군 코로나19 현황 주소: <a href='https://www.hc.go.kr/07370/08804.web' target='_blank'>https://www.hc.go.kr/07370/08804.web</a>";
		}
		else if(dprtmId == 'B161001'){ //동학사
			strLink = "충남 공주시 코로나19 현황 주소: <a href='https://www.gongju.go.kr/corona.jsp' target='_blank'>https://www.gongju.go.kr/corona.jsp</a>";
		}
		else if(dprtmId == 'B042001'){ //내장
			strLink = "전북 정읍시 코로나19 현황 주소: <a href='http://www.jeongeup.go.kr/board/list.jeongeup?boardId=BBS_0000224&menuCd=DOM_000000101001009006&contentsSid=3640&cpath=' target='_blank'>http://www.jeongeup.go.kr/board/list.jeongeup?boardId=BBS_0000224&menuCd=DOM_000000101001009006&contentsSid=3640&cpath=</a>";
		}
		else if(dprtmId == 'B041001'){//가인
			strLink  = "전남 장성군 코로나19 현황 주소: <a href='https://www.jangseong.go.kr/home/apply/info/info_05' target='_blank'>https://www.jangseong.go.kr/home/apply/info/info_05</a>";
			strLink += "<br/>백양사 매표소 입장 시 예약증을 제시하시면 문화재관람료는 무료이며, 주차료는 사찰(백양사)에서 별도 징수합니다.";
			strLink += "<br/>가인야영장은 주차공간과 야영공간이 분리되어 있으며, 차박(캠핑카, 카라반, 루프탑 등)은 금지하고 있습니다.";
		}
		else if(dprtmId == 'B091003' || dprtmId == 'B091001' ){//염포,팔영산
			strLink = "전남 고흥군 코로나19 현황 주소: <a href='https://www.goheung.go.kr/covid/' target='_blank'>https://www.goheung.go.kr/covid/</a>";
		}
		else if(dprtmId == 'B051002' || dprtmId == 'B051006' ){//덕유대,덕유대(체류)
			strLink = "전북 무주군 코로나19 현황 주소: <a href='https://www.muju.go.kr/index.9is?contentUid=ff8080817456bcb00174906ea51c4a70' target='_blank'>https://www.muju.go.kr/index.9is?contentUid=ff8080817456bcb00174906ea51c4a70</a>";
		}
		else if(dprtmId == 'B172002' ){//도원
			strLink = "전남 화순군 코로나19 현황 주소: <a href='https://www.hwasun.go.kr/board.do?S=S01&M=031508000000&b_code=0000000269' target='_blank'>https://www.hwasun.go.kr/board.do?S=S01&M=031508000000&b_code=0000000269</a>";
		}
		else if(dprtmId == 'B181002' ){//고사포
			strLink = "전북 부안군 코로나19 현황 주소: <a href='https://www.buan.go.kr/hospital/board/list.buan?boardId=BBS_0000276&menuCd=DOM_000000902011004000&con' target='_blank'>https://www.buan.go.kr/hospital/board/list.buan?boardId=BBS_0000276&menuCd=DOM_000000902011004000&con</a>";
		}
		else if(dprtmId == 'B031005' ){//설악동
			strLink = "강원 속초시 코로나19 현황 주소: <a href='http://www.sokcho.go.kr/intro.html' target='_blank'>http://www.sokcho.go.kr/intro.html</a>";
		}
		else if(dprtmId == 'B121001' ){//삼가
			strLink  = "경북 영주시 코로나19 현황 주소: <a href='https://yeongju.go.kr/covid/covid.do' target='_blank'>https://yeongju.go.kr/covid/covid.do</a>";
			strLink += "<br/>탄소제로영지 : 신재생에너지(풍력, 태양광)를 통해 영지 내 전기사용이 가능하며, 탄소발생량이 제로(0)인 영지입니다.(전기옵션 선택 불가)";
			strLink += "<br/>풀옵션야영장(산막텐트) C-11 은 테라스가 다른 곳 보다 좁으니 이점 유의하시길 바랍니다.";
		}
		else if(dprtmId == 'B122001'  ){//남천
			strLink = "충북 단양군 코로나19 현황 주소: <a href='https://www.danyang.go.kr/dy21/1449' target='_blank'>https://www.danyang.go.kr/dy21/1449</a>";
		}
		else if(dprtmId == 'B061001' ){//오대산
			strLink = "강원 강릉시 코로나19 현황 주소: <a href='https://www.gn.go.kr/covid19/selectCoronaStatistics.do' target='_blank'>https://www.gn.go.kr/covid19/selectCoronaStatistics.do</a>";
		}
		else if(dprtmId == 'B111003' || dprtmId == 'B111001' || dprtmId == 'B111007' || dprtmId == 'B111002' || dprtmId == 'B111004' || dprtmId == 'B111008' ){ //월악산
			strLink = "충북 제천시 코로나19 현황 주소: <a href='https://www.jecheon.go.kr/intro/corona/corona.html' target='_blank'>https://www.jecheon.go.kr/intro/corona/corona.html</a><br/>";
			if(dprtmId == 'B111003'){
				strLink += "<br/>탄소제로영지 : 신재생에너지(풍력, 태양광)와 야영객이 전기발생자전거를 통해 직접 에너지를 만들어, 필요한 곳에 에너지를 사용하여 탄소발생량이 제로(0)인 영지로 야영장 이용 시 전기 사용이 불가능한 영지입니다. (전기옵션 선택 불가)<br/>";
			}
			if(dprtmId == 'B111008'){
				strLink += "카라반(견인식) 영지는 카라반, 캠핑카 모두 이용가능하며, 캠핑카(자주식) 전용 영지는 캠핑카만 이용 가능합니다.</br/>";
				strLink += "하선암카라반야영장은 일반 자동차 야영장과 달리 일반 텐트 설치는 불가능합니다.<br/>";
			}
		}
		else if(dprtmId == 'B201001' ){//천황
			strLink = "전남 영암군 코로나19 현황 주소: <a href='https://www.yeongam.go.kr/home/www/info_area/life_safety/life_safety_18/yeongam.go' target='_blank'>https://www.yeongam.go.kr/home/www/info_area/life_safety/life_safety_18/yeongam.go</a>";
		}
		else if(dprtmId == 'B071001' ){//상의
			strLink = "경북 청송군 코로나19 현황 주소: <a href='https://www.cs.go.kr/countyOffice/health/00006667.web' target='_blank'>https://www.cs.go.kr/countyOffice/health/00006667.web</a>";
		}
		else if(dprtmId == 'B011005' ){//내원
			strLink = "경남 산청군 코로나19 현황 주소: <a href='https://www.sancheong.go.kr/intro_sc.jsp' target='_blank'>https://www.sancheong.go.kr/intro_sc.jsp</a>";
		}
		else if(dprtmId == 'B011007' ){//백무동
			strLink = "경남 함양군 코로나19 현황 주소: <a href='https://www.hygn.go.kr/03017/04262.web' target='_blank'>https://www.hygn.go.kr/03017/04262.web</a>";
		}
		else if(dprtmId == 'B011006' || dprtmId == 'B011009' ){//소막골,중산리
			strLink = "경남 산청군 코로나19 현황 주소: <a href='https://www.sancheong.go.kr/intro_sc.jsp' target='_blank'>https://www.sancheong.go.kr/intro_sc.jsp</a>";
		}
		else if(dprtmId == 'B012002' || dprtmId == 'B012005' || dprtmId == 'B012003' || dprtmId == 'B012006' || dprtmId == 'B012004' || dprtmId == 'B012010'){//지리산 전북
			strLink = "전북 남원시 코로나19 현황 주소: <a href='https://www.namwon.go.kr/index.do?contentsSid=5649' target='_blank'>https://www.namwon.go.kr/index.do?contentsSid=5649</a>";
		}
		else if(dprtmId == 'B101001' || dprtmId == 'B101002'  ){//치악산
			strLink = "강원도 원주시 코로나19 현황 주소: <a href='http://covid19.wonju.go.kr/Live.jsp' target='_blank'>http://covid19.wonju.go.kr/Live.jsp</a>";
		}
		else if(dprtmId == 'B081002' || dprtmId == 'B081001'  ){//태안해안
			strLink = "충남 태안군 코로나19 현황 주소: <a href='https://www.taean.go.kr/intro_corona.jsp' target='_blank'>https://www.taean.go.kr/intro_corona.jsp</a>";
		}
		else if(dprtmId == 'B021001' ){//학동
			strLink = "경남 거제시 코로나19 현황 주소: <a href='https://www.geoje.go.kr/index.geoje?contentsSid=12198' target='_blank'>https://www.geoje.go.kr/index.geoje?contentsSid=12198</a>";
		}
		//$("#warrning_msg").append("<br/>"+strLink);
		$("#warrning_msg").html(strLink).css('display', strLink ? '' : 'none');
		$("#caravanCamp").html(caravanStr).css('display', caravanStr ? '' : 'none');

	};
	
	$("#reserFlag").val("N");

	dept_id = id;

	NetFunnel_Action({action_id:'reservation2'},function(ev, ret){
		showLoading();
		$.ajax({
			type:'post',
			async:'true',
			url:'/reservation/campsiteList.do',
			data:{"dept_id" : id
				, "dept_name" : name
				, "parent_dept_name" : pname
				, "prd_ctg_id" : prodId
				, 'isGreenpoint' : window.isGreenpoint || 'N'
			},
			dataType: 'html',
			success:function(result) {
				NetFunnel_Complete();
				var $wrap = $('[data-reservation-wrap="campsite"]').parent();
				var reservation = $wrap.children("div")[0];
				$wrap.children("div")[1].remove();
				$(reservation).after(result);
				
				drawStrLink(id);
			},
			error : function(xhr,status,error) {
			},
			complete:function(data,textStatus) {
				maskBackgroundOff();
				$.scrollTable();
			}
		});
	});

}