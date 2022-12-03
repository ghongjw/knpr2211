$(function(){
});

function showLoading() {

	maskBackground("90000");

	$("body").css("overflow-y", "visible");
	var leftPosition = $(window).width() / 2 - 27;
	var topPosition = $(window).height() / 2 - 27 + $(window).scrollTop();

	$("#loadingImage").css("position", "absolute");
	$("#loadingImage").css("left", leftPosition + "px");
	$("#loadingImage").css("top", topPosition + "px");
	$("#loadingImage").css("z-index", "100000");
	$("#loadingImage").show();
}

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

function maskBackgroundOff() {
	noclicklayer = $("#BackMask");
	noclicklayer.remove();
	$("#loadingImage").hide();
}

function getToday(){
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth() + 1;    //1월이 0으로 되기때문에 +1을 함.
    var date = now.getDate();

    month = month >=10 ? month : "0" + month;
    date  = date  >= 10 ? date : "0" + date;
    return today = ""+year + month + date; 
}
let ajaxCall = function(param){

    let defaults = {
        url:''
        , data:{}
        , async: true
        , type: "POST"
        , dataType: "json"
		, cash : "false"
        , beforeSend : function(xmlHttpRequest){
            xmlHttpRequest.setRequestHeader("AJAX","true");
        }
        , success: function(dat){
            console.log(dat);
        }
        , error: function(request,status,error){
            console.log('request.status : '+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
        }
        , complete: function() {
            hideLoading();
        }
    };

    showLoading();

    let prop = $.extend(defaults, param);
    if('' == prop.url){
        toastrMsg('서버 통신중 오류가 발생하였습니다. 관리자에게 문의하여주세요.');
    } else {
        $.ajax(prop);
    }//if url

}//simpleAjax

var toastrMsg = function (cn) {

    toastr.options = {
        escapeHtml: false,
        closeButton: true,
        newestOnTop: false,
        progressBar: true,
        timeOut: 3000,
        positionClass: "toast-top-center"
    }
    
    toastr.info(cn);

}

let numPad = function(n, width) {
    n = n + '';
    return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
}

let numberWithCommas = function(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

let hideLoading = function(){
    maskBackgroundOff();
}

let confirmPopup = function(param){
    let defaults = {
        title : '' , subTitle : '' , content : '' , subContent : '' , retUrl : '/' , type : '' , send_type : '', urlFun : ''
    };
    let pop = $.extend(defaults, param);
    $('#confirmTitle').html(pop.title);
    $('#confirmSubTitle').html(pop.subTitle);
    $('#confirmContent').html(pop.content);
    $('#confirmSubContent').html(pop.subContent);
    if(pop.type=='error'){
        $('#confirmPop .center > i').attr('class','icon-error');
    }else{
        $('#confirmPop .center > i').attr('class','icon-check');
    }
    document.getElementById('btn-confirm').onclick = function(){
    	
    	if('' != pop.send_type && 'POST' == pop.send_type ){
    		eval(pop.urlFun);
    	}else{
    		location.href=pop.retUrl;
    	}
        
    }
    openPopup('confirmPop');
}

let alertPopup = function(param){
    let defaults = {
        title : '' , subTitle : '' , content : '' , subContent : '', type : ''
    };
    let pop = $.extend(defaults, param);
    $('#alertTitle').html(pop.title);
    $('#alertSubTitle').html(pop.subTitle);
    $('#alertContent').html(pop.content);
    $('#alertSubContent').html(pop.subContent);
    if(pop.type=='error'){
        $('#alertPop .center > i').attr('class','icon-error');
    }else{
        $('#alertPop .center > i').attr('class','icon-check');
    }
    openPopup('alertPop');
}

//계좌인증
let chkAccVal = function(){

	 var bank_code = $('#selBank').val(); //은행코드 select영역
	 var bank_accnm = $('#inpAccNm').val(); //계좌주 성명
	 var bank_account = $('#inpAccNo').val(); //계좌번호
	  
	 if(bank_code == '' || bank_code == null || bank_code == undefined){
		 toastrMsg('은행을 선택해주세요.');
		 return false;
	 }

	 if(bank_accnm == '' || bank_accnm == null || bank_accnm == undefined){
		 toastrMsg('계좌주를 입력해주세요.');
		 return false;
	 }
	 	
	 if(bank_account == '' || bank_account == null || bank_account == undefined){
		 toastrMsg('계좌번호를 입력해주세요');
		 return false;
	 }

		
	if ($("#rfndmCheck").val() == "Y") {
		toastrMsg('계좌인증을 진행중이거나 이미 진행한 계좌입니다.');
	} else {

		var url = "/common/accNumChk.do";

		ajaxCall({
			url :  url,
			data : {
				"inBankCode"	:	bank_code
				, "inAccount"	:	bank_account
				, "name" 		:	bank_accnm
			},
			success: function(dat){
				if(dat.result == '01'){
					toastrMsg(dat.resultMsg);
				}else{

					var data = JSON.parse(dat.returnData);
					var name = data.receiverName;			// 계좌주 성명 결과값
					var result = data.respCode;				// 결과코드 - 00:성공, 01:계좌주없음, 99:허용되지 않는 요청
					var errMsg = data.errMsg; 				// 오류 메시지

					if (result == "0000") {

						if(name == bank_accnm){

							// 계좌번호 저장
							ajaxCall({
								url: "/common/processRefundInfo.do",
								data: {
									"accountNumber":bank_account,
									"accountName":escape(encodeURIComponent(name)),
									"bankCode" : bank_code
								},
								success: function (dat) {
									if (dat.result != "OK") {
										toastrMsg("오류 :" + dat);
									} else {
										$("#rfndmCheck").val("Y");
										toastrMsg('계좌인증에 성공했습니다.');
									}
								}, error : function(){
									toastrMsg('계좌인증 중 오류가 발생하였습니다. 잠시 후 시도해주세요.');
								}
							});

						}else{
							toastrMsg('계좌주 성명이 일치하지 않습니다.');

						}
					} else {
						toastrMsg('계좌인증에 실패했습니다. 다시 시도해 주세요.' + errMsg);
					}
				}

			}, error : function(){
				toastrMsg('계좌인증에 실패했습니다. 다시 시도해 주세요.' + errMsg);
			}
		});

	}
}



//감면자격 인증
let goCert = function(){

	// 행공센 작업 공지.... 2022.07.28 22:00:00ㄴ~ 2022.07.29 04:00:00
	var startDate = new Date('2022/07/28 22:00:00');
	var endDate = new Date('2022/07/29 04:00:00');

	var today = Date.now();
	
	if (today >= startDate && today <= endDate) {
		toastrMsg('행정안전부 행정공동이용시스템 DB 점검으로 선할인 이용이 불가합니다.</br> "선택안함" 선택 후 현장에서 서류를 제출 부탁드립니다.</br>(점검시간: 7.28 22:00~7.29 04:00)');
		return false;
	}
	
	
	if($('#payPrdDvcdId').val()== 'C'){
		
		if($('#personCnt').val() == ''){
			toastrMsg('감면을 받기위해 예상입장인원수를 선택해주세요.');
			$('#personCnt').focus();
			return false;
		}
		
	}
	

	//감면등급코드
	var radioVal = $('input[name="reduction"]:checked').val();
	
	
	
	if(radioVal == '01' || radioVal == '03'){
		$('#authTypeId').val('A'); //장애인등급 확인 
	}else{ 
		$('#authTypeId').val('B'); //국가유공자 여부 확인
	}
	
	openPopup('exemption-auth');
	
}



//감면자격 인증_추첨제사용
let goCertForLotty = function(){
	

	//감면등급코드
	var radioVal = $('input[name="reduction"]:checked').val();
	
	if(radioVal == '01' || radioVal == '03'){
		$('#authTypeId').val('A'); //장애인등급 확인 
	}else{ 
		$('#authTypeId').val('B'); //국가유공자 여부 확인
	}

	openPopup('exemption-auth');

}

// 로그인 팝업
var fn_loginProc;  		//로그인 후 실행할 함수 저장용 변수
function loginPopup(funcName){
	fn_loginProc = new Function(funcName);
	ajaxCall({
		url :  '/mmb/mmbLoginPopup.do',
		dataType : 'html',
		data : {},
		success: function(dat){
			$("#loginPopupDiv").html('');
			$("#loginPopupDiv").append(dat);
			openPopup('loginPopup');
		}
	});
}

//본인인증 후처리 REFUND(환불금조회) 본인인증 들어가서 공통으로 같이사용
function nonMemberLoginProc(name, di, birthday, gender, ci, loginType, mobileNo){
	if(loginType == 'REFUND'){
		$("#checkPlusName").val(name);
		$("#checkPlusMobileNo").val(mobileNo);
		ajaxCall({
			url :  '/srchrefund/confirmRefund.do',
			data : {
				'name' : name,
				'di' : di,
				'ci' : ci,
				'birthday' : birthday,
				'gender' : gender,
				'inpAccNm' : $("#inpAccNm").val(),
				'txtMobile' :  $("#txtMobile").val(),
				'mobileNo' : mobileNo
			},
			success: function(dat) {
				if(dat.resultCode == '404'){
					toastrMsg(dat.resultMsg);
				}else if(dat.resultCode == '02'){
					$('#refundStep1').css('display','none');
					$('#refundStep2').css('display','none');
					$('#refundStep3').css('display','');
					let trHtml = [];
					for(let i=0; i<dat.result.length; i++){
					trHtml.push("<tr>");
					trHtml.push("<td className='contents'>",dat.result[i].rfndAccBkcdNm,"</td>");
					trHtml.push("<td className='contents'>",dat.result[i].rfndAccMmbNm,"</td>");
					trHtml.push("<td className='contents'>",dat.result[i].rfndAcnoEncp,"</td>");
					trHtml.push("<td className='contents'><em className='category'>",dat.result[i].prcsStcdNm,"</em></td>");
					trHtml.push("</tr>");
					}

					$("#refundTbody").html('');
					$("#refundTbody").append(trHtml.join(''));
				}else if(dat.resultCode == '03'){
					$("#refundAmtP").html(name+'님의 환급금은 '+dat.result.totalAmt+'원 입니다. 계좌번호 인증 후 환급금을 신청하세요.');
					$("#inpAccNm").val(name);
					$('#refundStep1').css('display','none');
					$('#refundStep2').css('display','');
					$('#refundStep3').css('display','none');
				}
			}
		});
	}else if(loginType == 'POPUP'){
		ajaxCall({
			url :  '/mmb/mmbLoginProc.do',
			data : {
				'popupYn' : 'Y',
				'loginType' : 'nonMember',
				'name' : name,
				'di' : di,
				'ci' : ci,
				'birthday' : birthday,
				'gender' : gender,
				'txtMail' : document.getElementById("txtMail").value,
				'txtMobile' : document.getElementById("txtMobile").value,
				'mobileNo' : mobileNo
			},
			success: function(dat) {
				closePopup('loginPopup');
				fn_loginProc();
			}
		});
	}else if(loginType == 'SNS'){
		$("#name").val(name);
		$("#di").val(di);
		$("#ci").val(ci);
		$("#birthday").val(birthday);
		$("#gender").val(gender);
		$("#mobileNo").val(mobileNo);
		$("#snsCheckPlus").submit();
	}else{
		$("#nonLoginType").val("nonMember");
		$("#name").val(name);
		$("#di").val(di);
		$("#ci").val(ci);
		$("#birthday").val(birthday);
		$("#gender").val(gender);
		$("#mobileNo").val(mobileNo);
		$("#nonLoginForm").submit();
	}
}

var loginData = {};
function popupUserLogin(){
	let frm = document.getElementById('loginForm');
	if(frm.mmbId.value == ""){
		toastrMsg("아이디를 입력해 주세요.");
		frm.mmbId.focus();
		return false;
	}

	if(frm.passWd.value == ""){
		toastrMsg("비밀번호를 입력해 주세요.");
		frm.passWd.focus();
		return false;
	}

	ajaxCall({
		url :  '/mmb/mmbLoginProc.do',
		data : {
			'mmbId' : frm.mmbId.value,
			'loginType' : 'Member',
			'passWd' : frm.passWd.value,
			'popupYn' : 'Y'
		},
		success: function(dat) {
			if(!isEmpty(dat.message)){
				toastrMsg(dat.message);
			}else{
				fn_loginProc();
				loginData = dat;
				closePopup('loginPopup');
			}
		}
	});
}

function loginKeyPress(e){
	if(e.keyCode == 13){
		popupUserLogin()
	}
}

function isEmpty(str){
	if(typeof str == "undefined" || str == null || str == "")
		return true;
	else
		return false;
}

function printReceipt(tid) {
	var status = "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,width =420,height=540";
	//var url = "https://pg.nicepay.co.kr/issue/IssueLoader.jsp?TID="+tid+"&type=0"; 	//구주소    
	var url = "https://npg.nicepay.co.kr/issue/IssueLoader.do?TID="+tid+"&type=0";     //2019-07-03 : 신주소
	window.open(url,"popupIssue",status);
}
function fn_goMemberModify(){
	window.open('https://www.knps.or.kr/portal/member/myPage01.do?menuNo=7020142');
}

function fn_greenUrlChk(){
	var now = new Date();

	var year = now.getFullYear();     // 연도
	var month = now.getMonth()+1;     // 월
	var day = now.getDate();          // 일
	var hours = now.getHours();       // 현재 시간
	var minutes = now.getMinutes();   // 현재 분

	var sttDt = "2022-11-01".split("-");
	var sttYear = sttDt[0];
	var sttMonth = sttDt[1];
	var sttDay = sttDt[2];
	var sttHours = '09';
	var sttMinutes = '00';

	var sttDt2 = "2022-11-01".split("-");
	var sttYear2 = sttDt2[0];
	var sttMonth2 = sttDt2[1];
	var sttDay2 = sttDt2[2];
	var sttHours2 = '19';
	var sttMinutes2 = '00';

	var date1 = new Date(year, month, day, hours, minutes);                    // 현재
	var date2 = new Date(sttYear, sttMonth, sttDay, sttHours, sttMinutes);     // 파라미터
	var date3 = new Date(sttYear2, sttMonth2, sttDay2, sttHours2, sttMinutes2);     // 파라미터

	if(date1 > date2 && date1 < date3){
		event.preventDefault();
		toastrMsg("그린포인트 예약은 19:00이후 이용 가능합니다.");
	}

}

function snsCheckPlusPop(state, message, smplLgiPrDtgk, smplLgiSvcd){

	var form = document.createElement("form");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post");  //Post 방식
	form.setAttribute("action", "/mmb/snsCheckPlus.do"); //요청 보낼 주소

	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "state");
	hiddenField.setAttribute("value", state);
	form.appendChild(hiddenField);

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "message");
	hiddenField.setAttribute("value", message);
	form.appendChild(hiddenField);

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "smplLgiPrDtgk");
	hiddenField.setAttribute("value", smplLgiPrDtgk);
	form.appendChild(hiddenField);

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "smplLgiSvcd");
	hiddenField.setAttribute("value", smplLgiSvcd);
	form.appendChild(hiddenField);

	document.body.appendChild(form);
	form.submit();

}

function snsCheckError(messageTitle, messageContent, returnURL){
	var form = document.createElement("form");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post");  //Post 방식
	form.setAttribute("action", "/mmb/snsCheckError.do"); //요청 보낼 주소

	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "messageTitle");
	hiddenField.setAttribute("value", messageTitle);
	form.appendChild(hiddenField);

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "messageContent");
	hiddenField.setAttribute("value", messageContent);
	form.appendChild(hiddenField);

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "returnURL");
	hiddenField.setAttribute("value", returnURL);
	form.appendChild(hiddenField);

	document.body.appendChild(form);
	form.submit();
}