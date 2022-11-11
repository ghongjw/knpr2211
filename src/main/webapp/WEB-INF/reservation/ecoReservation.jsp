<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="ko">

<!-- Mirrored from reservation.knps.or.kr:443/eco/searchEcoReservation.do by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 10 Nov 2022 06:59:22 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
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
            
                <li>
                    <a href="javascript:void(0);" class="depth1">이용안내</a>
                    <ul class="depth2">
                        
                            <li><a href="../contents/C/serviceGuideIntro.html">야영장</a></li>
                        
                            <li><a href="../contents/S/serviceGuideIntro.html">대피소</a></li>
                        
                            <li><a href="../contents/E/serviceGuideIntro.html">생태탐방원</a></li>
                        
                            <li><a href="../contents/R/serviceGuideIntro.html">민박촌</a></li>
                        
                            <li><a href="../contents/T/serviceGuideIntro.html">탐방로예약제</a></li>
                        
                            <li><a href="../contents/G/serviceGuideIntro.html">탐방프로그램</a></li>
                        
                    </ul>
                </li>
            
                <li>
                    <a href="javascript:void(0);" class="depth1">예약하기</a>
                    <ul class="depth2">
                        
                            <li><a href="../reservation/searchSimpleCampReservation.html">야영장</a></li>
                        
                            <li><a href="../reservation/shelter/searchSimpleShelterReservation.html">대피소</a></li>
                        
                            <li><a href="searchEcoReservation.html">생태탐방원</a></li>
                        
                            <li><a href="../reservation/searchSimpleResidenceReservation.html">민박촌</a></li>
                        
                            <li><a href="../trail/searchTrailReservation.html">탐방로예약제</a></li>
                        
                            <li><a href="../trprogram/searchTrailProgram.html">탐방프로그램</a></li>
                        
                            <li><a href="../reservation/selectCampLottery.html">추첨제</a></li>
                        
                    </ul>
                </li>
            
                <li>
                    <a href="javascript:void(0);" class="depth1">알림마당</a>
                    <ul class="depth2">
                        
                            <li><a href="../community/board/notice/boardList.html">공지사항</a></li>
                        
                            <li><a href="../community/board/faq/boardList.html">자주하는 질문</a></li>
                        
                            <li><a href="../community/board/qna/boardList.html">묻고 답하기</a></li>
                        
                            <li><a href="../contents/rsvtRefundPolicy.html">예약·환불정책</a></li>
                        
                    </ul>
                </li>
            
                <li>
                    <a href="javascript:void(0);" class="depth1">마이페이지</a>
                    <ul class="depth2">
                        
                            <li><a href="../mmb/mmbLogin.html">나의 예약목록</a></li>
                        
                            <li><a href="../mmb/mmbLogin.html">알림메시지</a></li>
                        
                            <li><a href="../mmb/mmbLogin.html">즐겨찾기</a></li>
                        
                            <li><a href="../srchrefund/requestRefund.html">미환불금 조회</a></li>
                        
                    </ul>
                </li>
            
                <li>
                    <a href="javascript:void(0);" class="depth1">그린포인트</a>
                    <ul class="depth2">
                        
                            <li><a href="../mmb/mmbLogin603d.html" onclick="fn_greenUrlChk();">야영장</a></li>
                        
                            <li><a href="../mmb/mmbLogin603d.html?prdDvcd=S">대피소</a></li>
                        
                    </ul>
                </li>
            
        </ul>
    </nav>
    <div class="util-area" data-device-mode="pc">
        <a href="../srchrefund/searchRefund.html" class="btn-refund-inquiry">
            <i class="icon-refund-inquiry"></i>
            <span>미환불금조회</span>
        </a>
        
            <!-- 비 로그인 상태 -->
            <a href="../mmb/mmbLogin.html" class="btn-login">
                <i class="icon-user-check"></i>
                <span>로그인</span>
            </a>
            <a href="https://www.knps.or.kr/portal/member/join01.do?menuNo=7020113" class="btn-join" target="_blank">
                <i class="icon-user-plus"></i>
                <span>회원가입</span>
            </a>
        
        
        <div class="lang-area">
            <button class="btn btn-toggle" data-popup="layer-language">
                <i class="icon-globe"></i>
                <span>KR</span>
            </button>
            <div class="layer-language" id="layer-language">
                <button class="btn is-active">KR</button>
                <button class="btn" onclick="location.href='../foreigner/main.html'">EN</button>
            </div>
        </div>
    </div>
    <div class="util-area" data-device-mode="mobile">
        <button class="btn-menu" title="전체 메뉴 보기">
            <i class="icon-list"></i>
        </button>
        <div class="all-menu">
            <div class="head">
                <a href="../srchrefund/searchRefund.html" class="btn-refund-inquiry">
                    <i class="icon-refund-inquiry"></i>
                    <span>미환불금조회</span>
                </a>
                
                    <!-- 비 로그인 상태 -->
                    <a href="../mmb/mmbLogin.html" class="btn-login">로그인이<br>필요합니다.</a>
                    <a href="https://www.knps.or.kr/portal/member/join01.do?menuNo=7020113" class="btn-join" target="_blank">
                        <i class="icon-user-plus"></i>
                        <span>회원가입</span>
                    </a>
                    <div class="lang-area">
                        <button class="btn btn-toggle" data-popup="layer-language">
                            <i class="icon-globe"></i>
                            <span>KR</span>
                        </button>
                        <div class="layer-language" id="layer-language2">
                            <button class="btn is-active">KR</button>
                            <button class="btn" onclick="location.href='../foreigner/main.html'">EN</button>
                        </div>
                    </div>
                
                
                <button class="btn-close" title="전체 메뉴 닫기">
                    <i class="icon-close"></i>
                </button>
            </div>
            <ul class="gnb">
                
                    <li>
                        <a href="javascript:void(0);" class="depth1">이용안내</a>
                        <ul class="depth2">
                            
                                <li><a href="../contents/C/serviceGuideIntro.html"
                                       >야영장</a></li>
                            
                                <li><a href="../contents/S/serviceGuideIntro.html"
                                       >대피소</a></li>
                            
                                <li><a href="../contents/E/serviceGuideIntro.html"
                                       >생태탐방원</a></li>
                            
                                <li><a href="../contents/R/serviceGuideIntro.html"
                                       >민박촌</a></li>
                            
                                <li><a href="../contents/T/serviceGuideIntro.html"
                                       >탐방로예약제</a></li>
                            
                                <li><a href="../contents/G/serviceGuideIntro.html"
                                       >탐방프로그램</a></li>
                            
                        </ul>
                    </li>
                
                    <li>
                        <a href="javascript:void(0);" class="depth1">예약하기</a>
                        <ul class="depth2">
                            
                                <li><a href="../reservation/searchSimpleCampReservation.html"
                                       >야영장</a></li>
                            
                                <li><a href="../reservation/shelter/searchSimpleShelterReservation.html"
                                       >대피소</a></li>
                            
                                <li><a href="searchEcoReservation.html"
                                       >생태탐방원</a></li>
                            
                                <li><a href="../reservation/searchSimpleResidenceReservation.html"
                                       >민박촌</a></li>
                            
                                <li><a href="../trail/searchTrailReservation.html"
                                       >탐방로예약제</a></li>
                            
                                <li><a href="../trprogram/searchTrailProgram.html"
                                       >탐방프로그램</a></li>
                            
                                <li><a href="../reservation/selectCampLottery.html"
                                       style="display: none;" >추첨제</a></li>
                            
                        </ul>
                    </li>
                
                    <li>
                        <a href="javascript:void(0);" class="depth1">알림마당</a>
                        <ul class="depth2">
                            
                                <li><a href="../community/board/notice/boardList.html"
                                       >공지사항</a></li>
                            
                                <li><a href="../community/board/faq/boardList.html"
                                       >자주하는 질문</a></li>
                            
                                <li><a href="../community/board/qna/boardList.html"
                                       >묻고 답하기</a></li>
                            
                                <li><a href="../contents/rsvtRefundPolicy.html"
                                       >예약·환불정책</a></li>
                            
                        </ul>
                    </li>
                
                    <li>
                        <a href="javascript:void(0);" class="depth1">마이페이지</a>
                        <ul class="depth2">
                            
                                <li><a href="../mmb/mmbLogin.html"
                                       >나의 예약목록</a></li>
                            
                                <li><a href="../mmb/mmbLogin.html"
                                       >알림메시지</a></li>
                            
                                <li><a href="../mmb/mmbLogin.html"
                                       >즐겨찾기</a></li>
                            
                                <li><a href="../srchrefund/requestRefund.html"
                                       >미환불금 조회</a></li>
                            
                        </ul>
                    </li>
                
                    <li>
                        <a href="javascript:void(0);" class="depth1">그린포인트</a>
                        <ul class="depth2">
                            
                                <li><a href="../mmb/mmbLogin603d.html" onclick="fn_greenUrlChk();"
                                       >야영장</a></li>
                            
                                <li><a href="../mmb/mmbLogin603d.html?prdDvcd=S"
                                       >대피소</a></li>
                            
                        </ul>
                    </li>
                
            </ul>
        </div>
    </div>
</header>
			<div id="container">
				



<script src="../assets/js/lib/netfunnel.js"></script>
<script>

    let selectStartDate = null;         //선택된시작날짜
    let selectStartDayWeek = null;      //선택된시작요일

    let selectEndDate = null;           //선택된종료날짜
    let selectEndDayWeek = null;        //선택된종료요일

    let selectCurDate = null;           //현재 선택된 날짜

    let nightDays = 0;                  //nightDays 박수
    let totalAmt = 0;

    let isProgram = false;              //프로그램 예약 가능 여부
    let isLivingRoom = false;           //생활관 예약 가능 여부
    let isMeal = false;                 //식사 예약 가능 여부

    let isLoading = {
        
            program: "N",
        
        
            livingroom: "N",
        
        
            gangdang: "N",
        
        
            class: "N",
        
        
    }
    
    function getDateRange(startDate, endDate, listDate)    {        
    	var dateMove = new Date(startDate);        
    	var strDate = startDate;                
    	if (startDate == endDate)        
    	{            
    		var strDate = dateMove.toISOString().slice(0,10);            
    		listDate.push(strDate);        
    		}        
    		else        
    		{            
    			while (strDate < endDate)            
    			{                
    				var strDate = dateMove.toISOString().slice(0, 10);                
    				listDate.push(strDate);                
    				dateMove.setDate(dateMove.getDate() + 1);            
    			}        
    		}        
    		return listDate;    
    	};




    $(function(){
        init.event();
        clickEvent.calendar();
        clickEvent.rsrvtPax();
    })

    let init = {
        event : function(){
            //아코디언
            $(".collapse-wrap .check.collapse").off().click(function () {

                let selectedGoods = $(this).val();

                if ($(this).prop("checked")) {

                    if(selectStartDate == null || selectEndDate == null){
                        $(this).prop("checked",false);
                        toastrMsg("사용기간을 선택해주세요.");
                        return false;
                    }

                    funcArray.recalc();

                    if(selectedGoods == 'living') {
                        if(!isLivingRoom){
                            $(this).prop("checked",false);
                            toastrMsg("본 시설은 생태체험조합 시설로서 프로그램 참여, 환경 교육등을 위한 강당 및 강의실 예약시에만 생활관 대관이 가능합니다.");
                            return false;
                        }
                        if(nightDays < 1){
                            $(this).prop("checked",false);
                            toastrMsg("생활관 예약은 1박 이상일때 예약 가능합니다.");
                            return false;
                        }
                    }else if(selectedGoods == 'meal') {
                        if(!isMeal){
                            $(this).prop("checked",false);
                            toastrMsg("본 시설은 생태체험조합 시설로서 프로그램 참여, 환경 교육등을 위한 강당 및 강의실 예약시에만 식사 신청이 가능합니다.");
                            return false;
                        }
                    }
                    $(this).parents(".collapse-wrap").find(".a").stop().slideToggle(200);

                } else {
                    //추가예약 없을 시 선택값 초기화
                    switch (selectedGoods){
                        case 'program' : funcArray.drawProgram(); break;
                        case 'living' : funcArray.drawLivingRoom(); break;
                        case 'gangdang' : funcArray.drawGangdang(); break;
                        case 'class' : funcArray.drawClass(); break;
                        case 'meal' : funcArray.drawMeal(); break;
                    }
                    $(this).parents(".collapse-wrap").find(".a").slideUp(200);
                }

            });
        }
    }

    //함수모음
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
        //달력 및 선택값 초기화
        calendarClear : function(){
            //clear
            $('.start').removeClass('start');
            $('.end').removeClass('end');
            $('.selected').removeClass('selected');

            $("#startDt").html('-');
            $("#endDt").html('-');
            $(".length-stay").removeClass('selected');
            selectStartDate = null;
            selectEndDate = null;
        },
        //프로그램 그리기
        drawProgram : function(){
            isLoading.program = "N";
            ajaxCall({
                url :  '/eco/getEcoProgramInfo.do',
                data : { 'deptId' : 'B971002'
                    , 'useBgnDt' : selectStartDate
                    , 'useEndDt' : selectEndDate
                    , 'hrkPrdCtgId' : '06004'
                },
                success: function(dat) {
                    $(".ecoProgram .tbody").find("tr").remove();
                    let trHtml = [];
                    $("#programNm").html(dat.insttGoodsInfo[0].prdNm+"<br>오전 (10:00~13:00)");
                    $("#programNm2").html(dat.insttGoodsInfo[2].prdNm+"<br>오후 (14:00~17:00)");
                    for (let i = 0; i < dat.insttGoodsInfo.length; i++) {
                        if(i%4 == 0){
                            trHtml.push("<tr><td>",i/4+1,"일차</td>");
                        }
                        if(i%2 == 0){
                            if(dat.insttGoodsInfo[i].maxNopCnt-(dat.insttGoodsInfo[i].rsrvtCnt+dat.insttGoodsInfo[i+1].rsrvtCnt) > 0 && dat.insttGoodsInfo[i].rsvtPsblYn == 'Y' && dat.insttGoodsInfo[i].prdSalStcd == 'N'){
                                trHtml.push("<td>", "<span class='checkbox-1'>", "<input type='checkbox' class='program-checkbox' id='program-check1-",i,"' name='",dat.insttGoodsInfo[i].prdId,"_",dat.insttGoodsInfo[i].useDt,"' data-salchildamt='",dat.insttGoodsInfo[i].salAmt,"' data-saladultamt='",dat.insttGoodsInfo[i+1].salAmt,"' data-deptId='",dat.insttGoodsInfo[i].deptId,"' data-childtxnyn='",dat.insttGoodsInfo[i].txnYn,"' data-adulttxnyn='",dat.insttGoodsInfo[i+1].txnYn,"' data-rsvtpsblcnt='",dat.insttGoodsInfo[i].maxNopCnt-(dat.insttGoodsInfo[i].rsrvtCnt+dat.insttGoodsInfo[i+1].rsrvtCnt),"'>");
                                if(dat.insttGoodsInfo[i].maxNopCnt < 99999){
                                    trHtml.push("<label for='program-check1-",i,"'>[잔여인원:",dat.insttGoodsInfo[i].maxNopCnt-(dat.insttGoodsInfo[i].rsrvtCnt+dat.insttGoodsInfo[i+1].rsrvtCnt),"]</label>");
                                }
                                trHtml.push("</span>", "</td>");
                            }else{
                                trHtml.push("<td>",
                                    "<span class=''>예약불가</span>",
                                    "</td>");
                            }
                        }
                        if(i%4 == 3){
                            trHtml.push("</tr>");
                        }
                    }
                    $(".ecoProgram .tbody").append(trHtml.join(("")));
                    clickEvent.program();
                    funcArray.recalc();
                },
                complete : function (){
                    let isLoadingComplete = true;
                    isLoading.program = "Y";

                    for (let i = 0; i < Object.keys(isLoading).length; i++) {
                        if (Object.keys(isLoading)[i] == "N") {
                            isLoadingComplete = false;
                        }
                    }
                    if (isLoadingComplete) {
                        hideLoading();
                        NetFunnel_Complete();
                    }
                }
            });
        },//end 프로그램 그리기
        //생활관 그리기
        drawLivingRoom : function(){
            isLoading.livingroom = "N";
            ajaxCall({
                url :  '/eco/getEcoLivingRoomInfo.do',
                data : { 'deptId' : 'B971002'
                    , 'useBgnDt' : selectStartDate
                    , 'useEndDt' : selectEndDate
                    , 'hrkPrdCtgId' : '06001'
                },
                success: function(dat) {
                    $(".livingRoom .tbody").find("tr").remove();
                    let trHtml = [];
                    for (let i = 0; i < dat.insttGoodsInfo.length; i++) {
                        if(dat.insttGoodsInfo[i].maxNopCnt-dat.insttGoodsInfo[i].rsrvtCnt > 0 && dat.insttGoodsInfo[i].rsvtPsblYn == 'Y' && dat.insttGoodsInfo[i].prdSalStcd == 'N'){
                            trHtml.push("<tr>",
                                "<td>",dat.insttGoodsInfo[i].prdNm,"</td>",
                                "<td class='form'>",
                                "<span class='quantity-input'>",
                                "<button type='button'class='btn minus living-minus'>",
                                "<i class='icon-minus'></i>",
                                "</button>",
                                "<label>",
                                "<input type='number' class='living-room-cnt' value='0' readonly title='총 참여 인원' name='",dat.insttGoodsInfo[i].prdId,"' data-salamt='",dat.insttGoodsInfo[i].salAmt,"' data-txnyn='",dat.insttGoodsInfo[i].txnYn,"'>",
                                "</label>",
                                "<button type='button'class='btn plus living-plus' data-max='",dat.insttGoodsInfo[i].maxNopCnt-dat.insttGoodsInfo[i].rsrvtCnt,"'>",
                                "<i class='icon-plus'></i>",
                                "</button>",
                                "</span>",
                                "<span>[잔여수:",dat.insttGoodsInfo[i].maxNopCnt-dat.insttGoodsInfo[i].rsrvtCnt,"개]</span>",
                                "</td>",
                                "<td class='spy'>",dat.insttGoodsInfo[i].salAmt,"원</td>",
                                "</tr>");
                        }else{
                            trHtml.push("<tr><td>",dat.insttGoodsInfo[i].prdNm,"</td><td colspan='2'>예약불가</td></tr>");
                        }
                    }
                    $(".livingRoom .tbody").append(trHtml.join(("")));
                    clickEvent.livingRoom();
                    funcArray.recalc();
                },
                complete : function (){
                    let isLoadingComplete = true;
                    isLoading.livingroom = "Y";

                    for (let i = 0; i < Object.keys(isLoading).length; i++) {
                        if (Object.keys(isLoading)[i] == "N") {
                            isLoadingComplete = false;
                        }
                    }
                    if (isLoadingComplete) {
                        hideLoading();
                        NetFunnel_Complete();
                    }
                }
            });
        }//end 생활관 그리기
        //강당 그리기
        ,drawGangdang : function(){
            isLoading.gangdang = "N";
            ajaxCall({
                url :  '/eco/getEcoGoodsInfo.do',
                data : { 'deptId' : 'B971002'
                    , 'useBgnDt' : selectStartDate
                    , 'useEndDt' : selectEndDate
                    , 'hrkPrdCtgId' : '06003'
                },
                success: function(dat) {
                    $(".gangdang .tbody").find("tr").remove();
                    let trHtml = [];
                    for (let i = 0; i < dat.insttGoodsInfo.length; i++) {
                        if(i%3 == 0){
                            trHtml.push("<tr><td>",i/3+1,"일차</td>");
                        }
                        if( 1 / 2 == (dat.insttGoodsInfo.length / 3 - 1 ) ){

                        }else if(dat.insttGoodsInfo[i].maxNopCnt-dat.insttGoodsInfo[i].rsrvtCnt > 0 && dat.insttGoodsInfo[i].rsvtPsblYn == 'Y' && dat.insttGoodsInfo[i].prdSalStcd == 'N'){
                            trHtml.push("<td>",
                                "<span class='checkbox-1'>",
                                "<input type='checkbox' class='gangdang-checkbox' id='gangdang-check1-",i,"' name='",dat.insttGoodsInfo[i].prdId,"_",dat.insttGoodsInfo[i].useDt,"_",dat.insttGoodsInfo[i].optId,"' data-salamt='",dat.insttGoodsInfo[i].salAmt,"' data-txnyn='",dat.insttGoodsInfo[i].txnYn,"'>",
                                "<label for='gangdang-check1-",i,"'>[잔여수:",dat.insttGoodsInfo[i].maxNopCnt-dat.insttGoodsInfo[i].rsrvtCnt,"]</label>",
                                "</span>",
                                "</td>");
                        }else{
                            trHtml.push("<td>",
                                "<span class=''>예약불가</span>",
                                "</td>");
                        }

                        if(i%3 == 2){
                            trHtml.push("</tr>");
                        }
                    }
                    $(".gangdang .tbody").append(trHtml.join(("")));
                    clickEvent.gangdang();
                    funcArray.recalc();
                },
                complete : function (){
                    let isLoadingComplete = true;
                    isLoading.gangdang = "Y";

                    for (let i = 0; i < Object.keys(isLoading).length; i++) {
                        if (Object.keys(isLoading)[i] == "N") {
                            isLoadingComplete = false;
                        }
                    }
                    if (isLoadingComplete) {
                        hideLoading();
                        NetFunnel_Complete();
                    }
                }
            });
        },//end 강당 그리기
        //강의실 그리기
        drawClass : function(){
            isLoading.class = "N";
            ajaxCall({
                url :  '/eco/getEcoGoodsInfo.do',
                data : { 'deptId' : 'B971002'
                    , 'useBgnDt' : selectStartDate
                    , 'useEndDt' : selectEndDate
                    , 'hrkPrdCtgId' : '06002'
                },
                success: function(dat) {
                    $(".classRoom .tbody").find("tr").remove();

                    let trHtml = [];
                    for (let i = 0; i < dat.insttGoodsInfo.length; i++) {
                        if(i%3 == 0){
                            trHtml.push("<tr><td>",i/3+1,"일차<br/>(",dat.insttGoodsInfo[i].useDt,")</td>");
                        }

                        if(dat.insttGoodsInfo[i].maxNopCnt-dat.insttGoodsInfo[i].rsrvtCnt > 0 && dat.insttGoodsInfo[i].rsvtPsblYn == 'Y' && dat.insttGoodsInfo[i].prdSalStcd == 'N'){
                            trHtml.push("<td class='form'>",
                                "<span class='quantity-input'>",
                                "<button type='button'class='btn minus class-minus'>",
                                "<i class='icon-minus'></i>",
                                "</button>",
                                "<label>",
                                "<input type='number' class='class-room-cnt' value='0' readonly title='총 수량' name='",dat.insttGoodsInfo[i].prdId,"_",dat.insttGoodsInfo[i].useDt,"_",dat.insttGoodsInfo[i].optId,"' data-salamt='",dat.insttGoodsInfo[i].salAmt,"' data-txnyn='",dat.insttGoodsInfo[i].txnYn,"'>",
                                "</label>",
                                "<button type='button'class='btn plus class-plus' data-max='",dat.insttGoodsInfo[i].maxNopCnt-dat.insttGoodsInfo[i].rsrvtCnt,"'>",
                                "<i class='icon-plus'></i>",
                                "</button>",
                                "</span>",
                                "<span>[잔여수:",dat.insttGoodsInfo[i].maxNopCnt-dat.insttGoodsInfo[i].rsrvtCnt,"개]</span>",
                                "</td>");
                        }else{
                            trHtml.push("<td>",
                                "<span class=''>예약불가</span>",
                                "</td>");
                        }

                        if(i%3 == 2){
                            trHtml.push("</tr>");
                        }
                    }
                    $(".classRoom .tbody").append(trHtml.join(("")));
                    clickEvent.classRoom();
                    funcArray.recalc();
                },
                complete : function (){
                    let isLoadingComplete = true;
                    isLoading.class = "Y";

                    for (let i = 0; i < Object.keys(isLoading).length; i++) {
                        if (Object.keys(isLoading)[i] == "N") {
                            isLoadingComplete = false;
                        }
                    }
                    if (isLoadingComplete) {
                        hideLoading();
                        NetFunnel_Complete();
                    }
                }
            });
        },//end 강의실 그리기
        //식사 그리기
        drawMeal : function(){
            isLoading.meal = "N";
            ajaxCall({
                url :  '/eco/getEcoMealInfo.do',
                data : { 'deptId' : 'B971002'
                    , 'useBgnDt' : selectStartDate
                    , 'useEndDt' : selectEndDate
                },
                success: function(dat) {
                    $(".meal .tbody").find("tr").remove();
                    let trHtml = [];
                    
                    var listDate = [];
                    getDateRange(selectStartDate, selectEndDate, listDate);
                    var ord = 0;
                    
                    for (let i = 0; i < dat.insttGoodsInfo.length; i++) {
                    	if(listDate[ord] != dat.insttGoodsInfo[i].useDt){
                    		trHtml.push("<tr><td>",ord+1,"일차<br/>("+listDate[ord]+")</td><td><span class=''>예약불가</span></td><td><span class=''>예약불가</span></td><td><span class=''>예약불가</span></td></tr>"); 
                    		ord++;  
                    	} 
                        if(i%3 == 0){
                            trHtml.push("<tr><td>",ord+1,"일차<br/>(",dat.insttGoodsInfo[i].useDt,")</td>"); 
                        }
                        //예약가능수량이남아있고 && 판매가능한상황이고 && 판매상태코드가 판매가능일때
                        if(dat.insttGoodsInfo[i].maxNopCnt-dat.insttGoodsInfo[i].rsrvtCnt > 0 && dat.insttGoodsInfo[i].rsvtPsblYn == 'Y' && dat.insttGoodsInfo[i].salPsblYn == 'N' ){
                            trHtml.push("<td class='form'>",
                                "<span class='quantity-input'>",
                                "<button type='button'class='btn minus meal-minus'>",
                                "<i class='icon-minus'></i>",
                                "</button>",
                                "<label>",
                                "<input type='number' class='meal-room-cnt' value='0' readonly title='총 식사수' name='",dat.insttGoodsInfo[i].prdId,"_",dat.insttGoodsInfo[i].useDt,"_",dat.insttGoodsInfo[i].optId,"' data-salamt='",dat.insttGoodsInfo[i].salAmt,"' data-txnyn='",dat.insttGoodsInfo[i].txnYn,"'>",
                                "</label>",
                                "<button type='button'class='btn plus meal-plus' data-max='",dat.insttGoodsInfo[i].maxNopCnt-dat.insttGoodsInfo[i].rsrvtCnt,"'>",
                                "<i class='icon-plus'></i>",
                                "</button>",
                                "</span>",
                                "<span>[잔여인원:",dat.insttGoodsInfo[i].maxNopCnt-dat.insttGoodsInfo[i].rsrvtCnt,"개]</span>",
                                "</td>");
                        }else{
                            trHtml.push("<td>",
                                "<span class=''>예약불가</span>",
                                "</td>");
                        }

                        if(i%3 == 2){
                            trHtml.push("</tr>");
                            ord++; 
                        }
                    }
                    if(ord != listDate.length){
                    	for(var ord; ord<listDate.length; ord++){
                    		trHtml.push("<tr><td>",ord+1,"일차<br/>("+listDate[ord]+")</td><td><span class=''>예약불가</span></td><td><span class=''>예약불가</span></td><td><span class=''>예약불가</span></td></tr>");
                    	}
                    } 
                    
                    $(".meal .tbody").append(trHtml.join(("")));
                    clickEvent.meal();
                    funcArray.recalc();
                },
                complete : function (){
                    let isLoadingComplete = true;
                    isLoading.meal = "Y";

                    for (let i = 0; i < Object.keys(isLoading).length; i++) {
                        if (Object.keys(isLoading)[i] == "N") {
                            isLoadingComplete = false;
                        }
                    }
                    if (isLoadingComplete) {
                        hideLoading();
                        NetFunnel_Complete();
                    }
                }
            });
        },//end 식사 그리기
        //식사요금조회
        drawMealAmt : function(){
            ajaxCall({
                url :  '/eco/getEcoMealAmtInfo.do',
                data : { 'deptId' : 'B971002'
                    , 'useBgnDt' : selectStartDate
                    , 'useEndDt' : selectEndDate
                },
                dataType : 'html',
                success: function(dat) {
                    $("#mealAmtPop").html('');
                    $("#mealAmtPop").append(dat);
                    openPopup("mealAmtPop");
                },
                error : function(){
                    toastrMsg("조회 중 오류가 발생하였습니다.");
                }
            });
        },//식사요금조회끝
        //계산함수
        recalc : function(){

            isProgram	 = false;
            isLivingRoom = false;
            isMeal 		 = false;

            //토탈금액
            let totalVatAmt   = 0;                  //면세금액
            let totalTax   = 0;                     //부가세
            let totalTaxAmt   = 0;                  //과세합계

            //프로그램 시작
            let totalChildAmt = 0;                  //토탈 어린이금액
            let totalAdultAmt = 0;                  //토탈 성인금액
            let totalChildCnt = 0;                  //토탈 어린이 인원
            let totalAdultCnt = 0;                  //토탈 성인 인원

            for (let i = 0; i < $("input.program-checkbox:checked").size(); i++) {
                totalChildCnt = $("#programChildCnt").val();
                totalAdultCnt = $("#programAdultCnt").val();
                let childAmt = ($("input.program-checkbox:checked").eq(i).data("salchildamt") * totalChildCnt );
                let adultAmt = ($("input.program-checkbox:checked").eq(i).data("saladultamt") * totalAdultCnt );
                totalChildAmt += childAmt;
                totalAdultAmt += adultAmt;

                //부가세 체크..
                if("Y" == $("input.program-checkbox:checked").eq(i).data("childtxnyn")){ //과세상품이면 totalTax(부가세10%), totalTaxAmt(총금액) 더하기
                    totalTax += Math.floor(childAmt * 0.1);
                    totalTaxAmt += childAmt;
                }else{                                                              //비과세상품이면 부가세는 0원, totalVatAmt(총면세금액) 더하기
                    totalTax += 0;
                    totalVatAmt += childAmt;
                }
                if("Y" == $("input.program-checkbox:checked").eq(i).data("adulttxnyn")){ //과세상품이면 totalTax(부가세10%), totalTaxAmt(총금액) 더하기
                    totalTax += Math.floor(adultAmt * 0.1);
                    totalTaxAmt += adultAmt;
                }else{                                                              //비과세상품이면 부가세는 0원, totalVatAmt(총면세금액) 더하기
                    totalTax += 0;
                    totalVatAmt += adultAmt;
                }
            }
            $(".programDiv .cnt").html("청소년 "+totalChildCnt+"명 / 성인 "+totalAdultCnt+"명");
            $(".programDiv .amount").html("<em>"+(totalChildAmt+totalAdultAmt).toLocaleString()+"</em>원");

            if(totalChildCnt*1+totalAdultCnt*1>1){//프로그램 예약 가능 Y
                isProgram = true;
            }
            //프로그램 끝

            //생활관 시작
            let totalLivingAmt = 0;                     //토탈 생활관 금액
            let totalLivingCnt = 0;                     //토탈 생활관 수량
            for(let i = 0; i < $("input.living-room-cnt").size(); i++) {
                let price = $("input.living-room-cnt").eq(i).data("salamt");
                let cnt = $("input.living-room-cnt").eq(i).val();
                let livingAmt = (price * cnt * nightDays)
                totalLivingAmt += parseInt(livingAmt);
                totalLivingCnt += parseInt(cnt);

                if("Y" == $("input.living-room-cnt").eq(i).data("txnyn")){ //과세상품이면 totalTax(부가세10%), totalTaxAmt(총금액) 더하기
                    totalTax += Math.floor(livingAmt * 0.1);
                    totalTaxAmt += livingAmt;
                }else{                                                              //비과세상품이면 부가세는 0원, totalVatAmt(총면세금액) 더하기
                    totalTax += 0;
                    totalVatAmt += livingAmt;
                }
                $(".livingRoom .tbody").find("tr").eq(i).find(".spy").html(livingAmt.toLocaleString()+"원");
                $(".livingRoomDiv .cnt").html("총 수량 "+totalLivingCnt+"개");
                $(".livingRoomDiv .amount").html("<em>"+totalLivingAmt.toLocaleString()+"</em>원");
            }
            //생활관 끝

            //강당 시작
            let totalGangdangAmt = 0;                  //토탈 강당 금액
            let totalGangdangCnt = 0;                  //토탈 강당 수량
            for (let i = 0; i < $("input.gangdang-checkbox:checked").size(); i++) {
                let gangdangAmt = ($("input.gangdang-checkbox:checked").eq(i).data("salamt"));
                totalGangdangAmt += gangdangAmt;
                totalGangdangCnt++;

                if("Y" == $("input.gangdang-checkbox:checked").eq(i).data("txnyn")){ //과세상품이면 totalTax(부가세10%), totalTaxAmt(총금액) 더하기
                    totalTax += Math.floor(gangdangAmt * 0.1);
                    totalTaxAmt += gangdangAmt;
                }else{                                                              //비과세상품이면 부가세는 0원, totalVatAmt(총면세금액) 더하기
                    totalTax += 0;
                    totalVatAmt += gangdangAmt;
                }
            }
            $(".gangdangDiv .cnt").html("총 수량 "+totalGangdangCnt+"개");
            $(".gangdangDiv .amount").html("<em>"+totalGangdangAmt.toLocaleString()+"</em>원");
            //강당 끝

            //강의실 시작
            let totalClassAmt = 0;                     //토탈 강의실 금액
            let totalClassCnt = 0;                     //토탈 강의실 수량
            for(let i = 0; i < $("input.class-room-cnt").size(); i++) {
                let price = $("input.class-room-cnt").eq(i).data("salamt");
                let cnt = $("input.class-room-cnt").eq(i).val();
                let classAmt = (price * cnt);
                totalClassAmt += classAmt;
                totalClassCnt += parseInt(cnt);

                if("Y" == $("input.class-room-cnt").eq(i).data("txnyn")){ //과세상품이면 totalTax(부가세10%), totalTaxAmt(총금액) 더하기
                    totalTax += Math.floor(classAmt * 0.1);
                    totalTaxAmt += classAmt;
                }else{                                                              //비과세상품이면 부가세는 0원, totalVatAmt(총면세금액) 더하기
                    totalTax += 0;
                    totalVatAmt += classAmt;
                }
                $(".classRoom .tbody").find("tr").eq(i).find(".spy").html(classAmt.toLocaleString()+"원");
            }
            $(".classRoomDiv .cnt").html("총 수량 "+totalClassCnt+"개");
            $(".classRoomDiv .amount").html("<em>"+totalClassAmt.toLocaleString()+"</em>원");
            //강의실 끝

            //식당 시작
            let totalMealAmt = 0;                     //토탈 식사인원 금액
            let totalMealCnt = 0;                     //토탈 식사인원 수량
            for(let i = 0; i < $("input.meal-room-cnt").size(); i++) {
                let price = $("input.meal-room-cnt").eq(i).data("salamt");
                let cnt = $("input.meal-room-cnt").eq(i).val();
                let mealAmt = (price * cnt);
                totalMealAmt += mealAmt;
                totalMealCnt += parseInt(cnt);

                if("Y" == $("input.meal-room-cnt").eq(i).data("txnyn")){ //과세상품이면 totalTax(부가세10%), totalTaxAmt(총금액) 더하기
                    totalTax += Math.floor(mealAmt * 0.1);
                    totalTaxAmt += mealAmt;
                }else{                                                              //비과세상품이면 부가세는 0원, totalVatAmt(총면세금액) 더하기
                    totalTax += 0;
                    totalVatAmt += mealAmt;
                }
                $(".meal .tbody").find("tr").eq(i).find(".spy").html(mealAmt.toLocaleString()+"원");
            }
            $(".mealDiv .cnt").html("총 수량 "+totalMealCnt+"개");
            $(".mealDiv .amount").html("<em>"+totalMealAmt.toLocaleString()+"</em>원");
            //식당 끝

            //총결제금액 시작
            let paymentHtml = [];
            let totalAllTaxAmt = (totalVatAmt + totalTaxAmt + totalTax).toLocaleString();
            paymentHtml.push("<dl><dt><em>생태여행</em></dt><dd></dd></dl>");
            paymentHtml.push("<dl>");
            if(totalChildAmt > 0 || totalAdultAmt > 0){
                paymentHtml.push("<dt>프로그램 : 청소년 ",totalChildCnt,"명 / 성인 ",totalAdultCnt,"명</dt><dd>",(totalChildAmt+totalAdultAmt).toLocaleString(),"원</dd>");
            }
            if(totalLivingAmt > 0){
                paymentHtml.push("<dt>생활관/랏지 : 총 ",totalLivingCnt,"개</dt><dd>",totalLivingAmt.toLocaleString(),"원</dd>");
            }
            if(totalGangdangAmt > 0){
                paymentHtml.push("<dt>강당 : 총 ",totalGangdangCnt,"개</dt><dd>",totalGangdangAmt.toLocaleString(),"원</dd>");
            }
            if(totalClassAmt > 0){
                paymentHtml.push("<dt>강의실 : 총 ",totalClassCnt,"개</dt><dd>",totalClassAmt.toLocaleString(),"원</dd>");
            }
            if(totalMealAmt > 0){
                paymentHtml.push("<dt>식당 : 총 ",totalMealCnt,"개</dt><dd>",totalMealAmt.toLocaleString(),"원</dd>");
            }
            paymentHtml.push("</dl>");
            paymentHtml.push("<dl class='surtax'>");
            paymentHtml.push("<dt><em>과세 합계</em></dt><dd><em>",totalTaxAmt.toLocaleString(),"</em>원</dd>");
            paymentHtml.push("<dt><em>면세 합계*</em></dt><dd><em>",totalVatAmt.toLocaleString(),"</em>원</dd>");
            paymentHtml.push("<dt><em>부가세 합계</em></dt><dd><em>",totalTax.toLocaleString(),"</em>원</dd>");
            paymentHtml.push("</dl>");
            paymentHtml.push("<dl class='total'><dt><em>합계 예정 금액</em></dt><dd><em>",totalAllTaxAmt,"</em>원</dd></dl>");
            $(".payment").html(paymentHtml.join(""));
            //총결제금액 끝

            //총 결제금액 변수에 저장
            totalAmt = totalAllTaxAmt;

            //프로그램, 강의실, 강당 상품이 포함 => 생활관,식사 예약 가능
            if((totalChildAmt > 0 || totalAdultAmt > 0) || totalGangdangAmt > 0 || totalClassAmt > 0) {
                isLivingRoom = true;
                isMeal = true;
            }
        },//end 계산함수
        //이미지 load
        drawImage : function(prdCtgId){
            ajaxCall({
                url :  '/eco/getEcoInsttImages.do',
                data : { 'deptId' : 'B971002',
                    'prdCtgId' : prdCtgId
                },
                dataType : 'html',
                success: function(dat) {
                    $("#eco-view").html('');
                    $("#eco-view").append(dat);
                    openPopup("eco-view");
                },
                error : function(){
                    toastrMsg("조회 중 오류가 발생하였습니다.");
                }
            });
        },//end 이미지 load
        //예약시작
        reserStart : function(){

            if(!funcArray.validate()){return false};
            $("#useBgnDt").val(selectStartDate);
            $("#useEndDt").val(selectEndDate);


            let minCnt = 9999;                      //프로그램중 최소 예약가능수량  ( 오전 오후 다 합쳐서 예약인원 <= 잔여인원 가장 적은것 이 되어야함  )
            for (let i = 0; i < $("input.program-checkbox:checked").size(); i++) {
                if( minCnt > $("input.program-checkbox:checked").eq(i).data('rsvtpsblcnt') ){
                    minCnt = $("input.program-checkbox:checked").eq(i).data('rsvtpsblcnt');
                }
            }

            ajaxCall({
                url :  '/eco/checkEcoPolicy.do',
                data : $("#reservationForm").serialize(),
                success: function(dat) {
                    if(dat.result == 'LOGIN'){
                        loginPopup('funcArray.reserStart();');
                    }else if(dat.result =='N'){
                        alertPopup({
                            title:'예약불가 안내',
                            subTitle:'예약이 불가 합니다.',
                            content:dat.resultMsg,
                            type:'error'
                        });
                    }else{
                        let captchaHtml = [];
                        captchaHtml.push("<table class='table'> <caption>자동방지 입력문자</caption> <colgroup> <col style='width: 140px;'> <col> </colgroup>",
                            "<tbody class='tbody' id=''>",
                            "<tr>",
                            "<th scope='row'>국립공원</th>",
                            "<td>",$("#deptTitle").html(),"</td>",
                            "</tr>",
                            "<tr>",
                            "<th scope='row'>사용일</th>",
                            "<td>",selectStartDate," ~ ",selectEndDate,"</td>",
                            "</tr>",
                            "<tr>",
                            "<th scope='row'>체류기간</th>",
                            "<td>",nightDays,"박 ",nightDays+1,"일</td>",
                            "</tr>",
                            "<tr>",
                            "<th scope='row'>가격</th>",
                            "<td>",totalAmt,"원</td>",
                            "</tr>",
                            "</tbody>",
                            "</table>",
                            "<div class='captcha-area'>",
                            "<span class='label'>자동예약 방지문자</span>",
                            "<img src='/reserCaptcha.do' class='w-100' alt='자동예약 방지문자'>",
                            "<label for='captchaInput' class='hidden-text'>자동예약 방지문자</label><input type='text' class='input-text' title='자동예약 방지문자' id='captchaInput'>",
                            "</div>",
                            "<p class='copy-notice'>※ 예약 완료된 상품에 대해서는 마이페이지 나의예약목록 에서 확인 후 결제 가능합니다.</p><div class='btn-area'>",
                            "<button type='button'class='btn btn-cancel' onclick='closePopup(\"captchaPop\");'>취소</button>",
                            "<button type='button'class='btn btn-confirm is-active' onclick='funcArray.reserProc();'>확인</button></div>"
                        );
                        $("#captchaDiv").html("");
                        $("#captchaDiv").prepend(captchaHtml.join(""));

                        openPopup('captchaPop');

                    }
                },
                error : function(){
                    toastrMsg("예약정책 체크중 오류가 발생하였습니다.");
                }
            });
        },//end 예약시작 ( 로그인체크, 정책체크 ,캡챠 )
        //예약처리
        reserProc : function(){
            $("#captcha").val($("#captchaInput").val());
            ajaxCall({
                url :  '/eco/createEcoReservation.do',
                data : $("#reservationForm").serialize(),
                success: function(dat) {
                    if(dat.result == 'LOGIN'){
                        loginPopup('funcArray.reserProc();');
                    }else if(dat.result == 'CAPTCHA'){
                        alertPopup({
                            title:'예약불가 안내',
                            subTitle:'예약이 불가 합니다.',
                            content:dat.resultMsg,
                            type:'error'
                        });
                    }else if(dat.result == 'DPL') {
                        closePopup('captchaPop');
                        alertPopup({
                            title:'예약불가 안내',
                            subTitle:'예약이 불가 합니다.',
                            content:dat.resultMsg,
                            type:'error'
                        });
                    }else{
                        closePopup('captchaPop');
                        closePopup('captchaPop');
                        $('#ecoReservationConfirm [data-popup-information-eco="sttlmMtDtm"]').html(dat.stlmExpiDtm);//결제만기일시
                        openPopup('ecoReservationConfirm');
                    }
                },
                error : function(){
                    toastrMsg("처리 중 오류가 발생하였습니다.");
                }
            });
        },//end 예약처리
        //유효성체크
        validate : function(){
            let cnt = 0;
            for(let i=0; i<$(".collapse-wrap .check.collapse").length; i++){
                if($(".collapse-wrap .check.collapse")[i].checked){
                    let selectedGoods = $(".collapse-wrap .check.collapse")[i].value;
                    if(selectedGoods == 'program'){
                        if(!isProgram){
                            toastrMsg("프로그램 참여인원 최소 2명 이상 예약 가능합니다.");
                            return false;
                        }
                    }else if(selectedGoods == 'living') {
                        if(!isLivingRoom){
                            toastrMsg("생활관은 프로그램 참여 또는 강당 및 강의실 예약시에만 대관이 가능합니다.");
                            return false;
                        }
                        if(nightDays < 1){
                            $(this).prop("checked",false);
                            toastrMsg("생활관 예약은 1박 이상일때 예약 가능합니다.");
                            return false;
                        }
                    }else if(selectedGoods == 'meal') {
                        if(!isMeal){
                            toastrMsg("식사예약은 프로그램 참여 또는 강당 및 강의실 예약시에만 신청이 가능합니다.");
                            return false;
                        }
                    }
                    cnt++;
                }
            }
            if(cnt < 1){
                toastrMsg("최소 하나 이상의 시설은 선택하셔야 합니다.");
                return false;
            }
            
            return true;
        }
    }

    //예약 클릭 이벤트 모음
    let clickEvent = {
        //달력
        calendar : function(){
            //start 달력 클릭 이벤트
            $(".calendar-cell").off().click(function(){
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
                    $("#startDt").html(selectStartDate+"["+funcArray.getDayWeekNm(selectStartDayWeek)+"]");
                    $("#endDt").html(selectStartDate+"["+funcArray.getDayWeekNm(selectStartDayWeek)+"]");
                    $(".length-stay").removeClass('selected');
                    $("#nightDays0").addClass('selected');
                    toastrMsg("이용 기간은 3박 4일 이내로 선택해 주세요.");

                    nightDays = (new Date(selectCurDate) - new Date(selectStartDate))/1000/60/60/24;    //날짜계산
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
                    $("#startDt").html(selectCurDate+"["+funcArray.getDayWeekNm(selectStartDayWeek)+"]");
                    $("#endDt").html(selectCurDate+"["+funcArray.getDayWeekNm(selectStartDayWeek)+"]");
                    $(".length-stay").removeClass('selected');
                    $("#nightDays0").addClass('selected');
                    toastrMsg("이용 기간은 3박 4일 이내로 선택해 주세요.");

                    nightDays = (new Date(selectCurDate) - new Date(selectStartDate))/1000/60/60/24;    //날짜계산
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
                    $("#startDt").html(selectStartDate+"["+funcArray.getDayWeekNm(selectStartDayWeek)+"]");
                    $("#endDt").html(selectStartDate+"["+funcArray.getDayWeekNm(selectStartDayWeek)+"]");
                    $(".length-stay").removeClass('selected');
                    $("#nightDays0").addClass('selected');
                    return false;
                }else{  //그외 나머지 경우는 퇴실일 선택
                    nightDays = (new Date(selectCurDate) - new Date(selectStartDate))/1000/60/60/24;    //날짜계산
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
                        $("#endDt").html(selectEndDate+"["+funcArray.getDayWeekNm(selectEndDayWeek)+"]");
                        $(".length-stay").removeClass('selected');
                        $("#nightDays"+nightDays).addClass('selected');     //체류기간 선택

                        //사이값 선택된걸로 표시하기.
                        let date = new Date(selectStartDate);
                        for(let i=1; i<nightDays; i++){
                            date.setDate(date.getDate()+1);
                            $("."+date.getFullYear()+"-"+numPad(date.getMonth()+1,2)+"-"+numPad(date.getDate(),2)).addClass('selected');
                        }

                    }
                }
                    //상품초기화
                    if('Y'=='Y'){
                        funcArray.drawProgram();
                    }
                    if('Y'=='Y'){
                        funcArray.drawLivingRoom();
                    }
                    if('Y'=='Y'){
                        funcArray.drawGangdang();
                    }
                    if('Y'=='Y'){
                        funcArray.drawClass();
                    }
                    if('N'=='Y'){
                        funcArray.drawMeal();
                    }
                funcArray.recalc();
            });
        },//end 달력 클릭 이벤트
        //총 참여인원
        rsrvtPax : function(){
            $('.rsrvt-pax-minus').off().click(function(){
                let num = $(this).parent().find("input[type='number']").val();
                if(num > 1){
                    num--;
                }
                $(this).parent().find("input[type='number']").val(num);
            });
            $('.rsrvt-pax-plus').off().click(function(){
                let num = $(this).parent().find("input[type='number']").val();
                num++;
                $(this).parent().find("input[type='number']").val(num);
            });
        },//end 총 참여인원
        //프로그램
        program : function(){
            $('.program-minus').off().click(function(){
                let num = $(this).parent().find("input[type='number']").val();
                if(num > 0){
                    num--;
                }
                $(this).parent().find("input[type='number']").val(num);
                funcArray.recalc();
            });
            $('.program-plus').off().click(function(){
                let minCnt = 9999;
                for (let i = 0; i < $("input.program-checkbox:checked").size(); i++) {
                    if( minCnt > $("input.program-checkbox:checked").eq(i).data('rsvtpsblcnt') ){
                        minCnt = $("input.program-checkbox:checked").eq(i).data('rsvtpsblcnt');
                    }
                }
                let num = $(this).parent().find("input[type='number']").val();

                if($("#programChildCnt").val()*1 + $("#programAdultCnt").val()*1 < minCnt){
                    num++;
                    $(this).parent().find("input[type='number']").val(num);
                }
                funcArray.recalc();
            });
            $('.program-checkbox').off().click(function(){
                funcArray.recalc();
            });
        },//end 프로그램
        //생활관
        livingRoom : function(){
            $('.living-minus').off().click(function(){
                let num = $(this).parent().find("input[type='number']").val();
                if(num > 0){
                    num--;
                }
                $(this).parent().find("input[type='number']").val(num);
                funcArray.recalc();
            });
            $('.living-plus').off().click(function(){
                if(nightDays < 1){
                    toastrMsg("생활관 예약은 1박 이상일때 예약 가능합니다.");
                    return false;
                }
                let num = $(this).parent().find("input[type='number']").val();
                if(num < $(this).data("max") ){
                    num++;
                }
                $(this).parent().find("input[type='number']").val(num);
                funcArray.recalc();
            });
            $('.livingRoom-prsn-minus').off().click(function(){
                let num = $(this).parent().find("input[type='number']").val();
                if(num > 0){
                    num--;
                }
                $(this).parent().find("input[type='number']").val(num);
            });
            $('.livingRoom-prsn-plus').off().click(function(){
                let num = $(this).parent().find("input[type='number']").val();
                num++;
                $(this).parent().find("input[type='number']").val(num);
            });
        },//end 생활관
        //강의실
        classRoom : function(){
            $('.class-minus').off().click(function(){
                let num = $(this).parent().find("input[type='number']").val();
                if(num > 0){
                    num--;
                }
                $(this).parent().find("input[type='number']").val(num);
                funcArray.recalc();
            });
            $('.class-plus').off().click(function(){
                let num = $(this).parent().find("input[type='number']").val();
                if(num < $(this).data("max") ){
                    num++;
                }
                $(this).parent().find("input[type='number']").val(num);
                funcArray.recalc();
            });
            $('.class-prsn-minus').off().click(function(){
                let num = $(this).parent().find("input[type='number']").val();
                if(num > 0){
                    num--;
                }
                $(this).parent().find("input[type='number']").val(num);
            });
            $('.class-prsn-plus').off().click(function(){
                let num = $(this).parent().find("input[type='number']").val();
                num++;
                $(this).parent().find("input[type='number']").val(num);
            });

        },//end 강의실
        //식당
        meal : function(){
            $('.meal-minus').off().click(function(){
                let num = $(this).parent().find("input[type='number']").val();
                if(num > 0){
                    num--;
                }
                $(this).parent().find("input[type='number']").val(num);
                funcArray.recalc();
            });
            $('.meal-plus').off().click(function(){
                let num = $(this).parent().find("input[type='number']").val();
                if(num < $(this).data("max") ){
                    num++;
                }
                $(this).parent().find("input[type='number']").val(num);
                funcArray.recalc();
            });
        },//end 식당
        //강당
        gangdang : function(){
            $('.gangdang-checkbox').off().click(function(){
                funcArray.recalc();
            });
            $('.gangdang-prsn-minus').off().click(function(){
                let num = $(this).parent().find("input[type='number']").val();
                if(num > 0){
                    num--;
                }
                $(this).parent().find("input[type='number']").val(num);
            });
            $('.gangdang-prsn-plus').off().click(function(){
                let num = $(this).parent().find("input[type='number']").val();
                num++;
                $(this).parent().find("input[type='number']").val(num);
            });
        }//end 강당
    }
var a,b;
</script>
<div class="page-location">
    <span>홈</span><span>예약하기</span><span>생태탐방원</span>
</div>

<div class="reservation responsive eco">
    <h3 class="title">생태탐방원 예약</h3>
    <ul class="nav-tabs">
        <li class="is-active"><a href="javascript:void(0);">생태여행</a></li>
        <li><a href="searchEcoPackageGoods.html">특화프로그램</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane is-active">
            <ul class="nav-tabs type2">
                
                    
                    <li class="is-active"><a href="searchEcoReservationf799.html?deptId=B971002">북한산</a></li>
                
                    
                    <li class=""><a href="searchEcoReservation2085.html?deptId=B014003">지리산</a></li>
                
                    
                    <li class=""><a href="searchEcoReservatione8e6.html?deptId=B123002">소백산</a></li>
                
                    
                    <li class=""><a href="searchEcoReservation759b.html?deptId=B301002">설악산</a></li>
                
                    
                    <li class=""><a href="searchEcoReservationb1c9.html?deptId=B024002">한려해상</a></li>
                
                    
                    <li class=""><a href="searchEcoReservation462e.html?deptId=B231002">무등산</a></li>
                
                    
                    <li class=""><a href="searchEcoReservation7676.html?deptId=B133002">가야산</a></li>
                
                    
                    <li class=""><a href="searchEcoReservation1a0c.html?deptId=B331001">내장산</a></li>
                
            </ul>
            <form id="reservationForm" method="post">
                <input type="hidden" name="useBgnDt" id="useBgnDt" value="">
                <input type="hidden" name="useEndDt" id="useEndDt" value="">
                <input type="hidden" name="deptId" value="B971002">
                <input type="hidden" name="captcha" id="captcha" value="">
                <div class="tab-content">
                    <div class="tab-pane is-active">
                        <div class="title-area">
                            <span class="label"><i class="icon-location"></i>북한산</span>
                            <h4 class="title" id="deptTitle">북한산 생태탐방원</h4>
                        </div>
                        <div class="box-guide">
                            <div class="monthly-check">
                                <strong class="title">생태여행 관련하여 전체 월별 잔여현황을 우측 버튼을 눌러 확인 가능 합니다.</strong>
                                <a href="searchEcoMonthReservationf799.html?deptId=B971002" class="btn btn-monthly">월별 잔여현황 확인</a>
                            </div>
                            <ul class="dot-list">
                                <li>본 시설은 생태체험종합시설로서 프로그램 참여, 환경교육등을 위한 강당 및 강의실 예약시에만 생활관 대관이 가능합니다.</li>
                                <li>프로그램은 최소 2명이상 선택하셔야 대관이 가능합니다.</li>
                                
                                    <li>생활관 잔여객실이 남아있으나 프로그램이 모두 예약불가로 표출되어 예약이 진행되지 않는 경우, 02-901-0700(주간)으로 문의 바랍니다.</li>
                                    <li>서울특별시 코로나19 현황 주소 : <a href="https://www.seoul.go.kr/coronaV/coronaStatus.do" target="_blank">https://www.seoul.go.kr/coronaV/coronaStatus.do</a></li>
                                
                                
                                
                                
                                
                                
                                
                            </ul>
                        </div>
                        <!-- 예약일 설정 -->
                        <div class="title-area">
                            <h4 class="title">예약일 설정</h4>
                        </div>
                        <div class="detail-info">
                            <dl class="mb-block">
                                <dt>예약일 선택</dt>
                                <dd>
                                    <div class="calendar-container">
                                        <div class="calendar">
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
                                                    
                                                        <div class="calendar-cell     disabled "
                                                             data-date=""
                                                             data-dayweek="">
                                                                
                                                        </div>
                                                    
                                                        <div class="calendar-cell     disabled "
                                                             data-date=""
                                                             data-dayweek="">
                                                                
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-01     disabled"
                                                             data-date="2022-11-01"
                                                             data-dayweek="2">
                                                                1
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-02     disabled"
                                                             data-date="2022-11-02"
                                                             data-dayweek="3">
                                                                2
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-03     disabled"
                                                             data-date="2022-11-03"
                                                             data-dayweek="4">
                                                                3
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-04     disabled"
                                                             data-date="2022-11-04"
                                                             data-dayweek="5">
                                                                4
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-05  sat   disabled"
                                                             data-date="2022-11-05"
                                                             data-dayweek="6">
                                                                5
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-06   sun  disabled"
                                                             data-date="2022-11-06"
                                                             data-dayweek="7">
                                                                6
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-07     disabled"
                                                             data-date="2022-11-07"
                                                             data-dayweek="1">
                                                                7
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-08     disabled"
                                                             data-date="2022-11-08"
                                                             data-dayweek="2">
                                                                8
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-09     disabled"
                                                             data-date="2022-11-09"
                                                             data-dayweek="3">
                                                                9
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-10 today    disabled"
                                                             data-date="2022-11-10"
                                                             data-dayweek="4">
                                                                10
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-11     disabled"
                                                             data-date="2022-11-11"
                                                             data-dayweek="5">
                                                                11
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-12  sat   "
                                                             data-date="2022-11-12"
                                                             data-dayweek="6">
                                                                12
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-13   sun  "
                                                             data-date="2022-11-13"
                                                             data-dayweek="7">
                                                                13
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-14     "
                                                             data-date="2022-11-14"
                                                             data-dayweek="1">
                                                                14
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-15     "
                                                             data-date="2022-11-15"
                                                             data-dayweek="2">
                                                                15
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-16     "
                                                             data-date="2022-11-16"
                                                             data-dayweek="3">
                                                                16
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-17     "
                                                             data-date="2022-11-17"
                                                             data-dayweek="4">
                                                                17
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-18     "
                                                             data-date="2022-11-18"
                                                             data-dayweek="5">
                                                                18
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-19  sat   "
                                                             data-date="2022-11-19"
                                                             data-dayweek="6">
                                                                19
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-20   sun  "
                                                             data-date="2022-11-20"
                                                             data-dayweek="7">
                                                                20
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-21     "
                                                             data-date="2022-11-21"
                                                             data-dayweek="1">
                                                                21
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-22     "
                                                             data-date="2022-11-22"
                                                             data-dayweek="2">
                                                                22
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-23     "
                                                             data-date="2022-11-23"
                                                             data-dayweek="3">
                                                                23
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-24     "
                                                             data-date="2022-11-24"
                                                             data-dayweek="4">
                                                                24
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-25     "
                                                             data-date="2022-11-25"
                                                             data-dayweek="5">
                                                                25
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-26  sat   "
                                                             data-date="2022-11-26"
                                                             data-dayweek="6">
                                                                26
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-27   sun  "
                                                             data-date="2022-11-27"
                                                             data-dayweek="7">
                                                                27
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-28     "
                                                             data-date="2022-11-28"
                                                             data-dayweek="1">
                                                                28
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-29     "
                                                             data-date="2022-11-29"
                                                             data-dayweek="2">
                                                                29
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-11-30     "
                                                             data-date="2022-11-30"
                                                             data-dayweek="3">
                                                                30
                                                        </div>
                                                    
                                                </div>
                                            </div>
                                        </div>
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
                                                    
                                                        <div class="calendar-cell     disabled "
                                                             data-date=""
                                                             data-dayweek="">
                                                                
                                                        </div>
                                                    
                                                        <div class="calendar-cell     disabled "
                                                             data-date=""
                                                             data-dayweek="">
                                                                
                                                        </div>
                                                    
                                                        <div class="calendar-cell     disabled "
                                                             data-date=""
                                                             data-dayweek="">
                                                                
                                                        </div>
                                                    
                                                        <div class="calendar-cell     disabled "
                                                             data-date=""
                                                             data-dayweek="">
                                                                
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-01     "
                                                             data-date="2022-12-01"
                                                             data-dayweek="4">
                                                                1
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-02     "
                                                             data-date="2022-12-02"
                                                             data-dayweek="5">
                                                                2
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-03  sat   "
                                                             data-date="2022-12-03"
                                                             data-dayweek="6">
                                                                3
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-04   sun  "
                                                             data-date="2022-12-04"
                                                             data-dayweek="7">
                                                                4
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-05     "
                                                             data-date="2022-12-05"
                                                             data-dayweek="1">
                                                                5
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-06     "
                                                             data-date="2022-12-06"
                                                             data-dayweek="2">
                                                                6
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-07     "
                                                             data-date="2022-12-07"
                                                             data-dayweek="3">
                                                                7
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-08     "
                                                             data-date="2022-12-08"
                                                             data-dayweek="4">
                                                                8
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-09     "
                                                             data-date="2022-12-09"
                                                             data-dayweek="5">
                                                                9
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-10  sat   "
                                                             data-date="2022-12-10"
                                                             data-dayweek="6">
                                                                10
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-11   sun  "
                                                             data-date="2022-12-11"
                                                             data-dayweek="7">
                                                                11
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-12     "
                                                             data-date="2022-12-12"
                                                             data-dayweek="1">
                                                                12
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-13     "
                                                             data-date="2022-12-13"
                                                             data-dayweek="2">
                                                                13
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-14     "
                                                             data-date="2022-12-14"
                                                             data-dayweek="3">
                                                                14
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-15     "
                                                             data-date="2022-12-15"
                                                             data-dayweek="4">
                                                                15
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-16     "
                                                             data-date="2022-12-16"
                                                             data-dayweek="5">
                                                                16
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-17  sat   "
                                                             data-date="2022-12-17"
                                                             data-dayweek="6">
                                                                17
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-18   sun  "
                                                             data-date="2022-12-18"
                                                             data-dayweek="7">
                                                                18
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-19     "
                                                             data-date="2022-12-19"
                                                             data-dayweek="1">
                                                                19
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-20     "
                                                             data-date="2022-12-20"
                                                             data-dayweek="2">
                                                                20
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-21     "
                                                             data-date="2022-12-21"
                                                             data-dayweek="3">
                                                                21
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-22     "
                                                             data-date="2022-12-22"
                                                             data-dayweek="4">
                                                                22
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-23     "
                                                             data-date="2022-12-23"
                                                             data-dayweek="5">
                                                                23
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-24  sat   "
                                                             data-date="2022-12-24"
                                                             data-dayweek="6">
                                                                24
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-25   sun  "
                                                             data-date="2022-12-25"
                                                             data-dayweek="7">
                                                                25
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-26     "
                                                             data-date="2022-12-26"
                                                             data-dayweek="1">
                                                                26
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-27     "
                                                             data-date="2022-12-27"
                                                             data-dayweek="2">
                                                                27
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-28     "
                                                             data-date="2022-12-28"
                                                             data-dayweek="3">
                                                                28
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-29     "
                                                             data-date="2022-12-29"
                                                             data-dayweek="4">
                                                                29
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-30     "
                                                             data-date="2022-12-30"
                                                             data-dayweek="5">
                                                                30
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2022-12-31  sat   "
                                                             data-date="2022-12-31"
                                                             data-dayweek="6">
                                                                31
                                                        </div>
                                                    
                                                </div>
                                            </div>
                                        </div>
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
                                                             data-date="2023-01-01"
                                                             data-dayweek="7">
                                                                1
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-02     disabled"
                                                             data-date="2023-01-02"
                                                             data-dayweek="1">
                                                                2
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-03     disabled"
                                                             data-date="2023-01-03"
                                                             data-dayweek="2">
                                                                3
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-04     disabled"
                                                             data-date="2023-01-04"
                                                             data-dayweek="3">
                                                                4
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-05     disabled"
                                                             data-date="2023-01-05"
                                                             data-dayweek="4">
                                                                5
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-06     disabled"
                                                             data-date="2023-01-06"
                                                             data-dayweek="5">
                                                                6
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-07  sat   disabled"
                                                             data-date="2023-01-07"
                                                             data-dayweek="6">
                                                                7
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-08   sun  disabled"
                                                             data-date="2023-01-08"
                                                             data-dayweek="7">
                                                                8
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-09     disabled"
                                                             data-date="2023-01-09"
                                                             data-dayweek="1">
                                                                9
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-10     disabled"
                                                             data-date="2023-01-10"
                                                             data-dayweek="2">
                                                                10
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-11     disabled"
                                                             data-date="2023-01-11"
                                                             data-dayweek="3">
                                                                11
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-12     disabled"
                                                             data-date="2023-01-12"
                                                             data-dayweek="4">
                                                                12
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-13     disabled"
                                                             data-date="2023-01-13"
                                                             data-dayweek="5">
                                                                13
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-14  sat   disabled"
                                                             data-date="2023-01-14"
                                                             data-dayweek="6">
                                                                14
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-15   sun  disabled"
                                                             data-date="2023-01-15"
                                                             data-dayweek="7">
                                                                15
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-16     disabled"
                                                             data-date="2023-01-16"
                                                             data-dayweek="1">
                                                                16
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-17     disabled"
                                                             data-date="2023-01-17"
                                                             data-dayweek="2">
                                                                17
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-18     disabled"
                                                             data-date="2023-01-18"
                                                             data-dayweek="3">
                                                                18
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-19     disabled"
                                                             data-date="2023-01-19"
                                                             data-dayweek="4">
                                                                19
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-20     disabled"
                                                             data-date="2023-01-20"
                                                             data-dayweek="5">
                                                                20
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-21  sat   disabled"
                                                             data-date="2023-01-21"
                                                             data-dayweek="6">
                                                                21
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-22   sun  disabled"
                                                             data-date="2023-01-22"
                                                             data-dayweek="7">
                                                                22
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-23     disabled"
                                                             data-date="2023-01-23"
                                                             data-dayweek="1">
                                                                23
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-24     disabled"
                                                             data-date="2023-01-24"
                                                             data-dayweek="2">
                                                                24
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-25     disabled"
                                                             data-date="2023-01-25"
                                                             data-dayweek="3">
                                                                25
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-26     disabled"
                                                             data-date="2023-01-26"
                                                             data-dayweek="4">
                                                                26
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-27     disabled"
                                                             data-date="2023-01-27"
                                                             data-dayweek="5">
                                                                27
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-28  sat   disabled"
                                                             data-date="2023-01-28"
                                                             data-dayweek="6">
                                                                28
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-29   sun  disabled"
                                                             data-date="2023-01-29"
                                                             data-dayweek="7">
                                                                29
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-30     disabled"
                                                             data-date="2023-01-30"
                                                             data-dayweek="1">
                                                                30
                                                        </div>
                                                    
                                                        <div class="calendar-cell 2023-01-31     disabled"
                                                             data-date="2023-01-31"
                                                             data-dayweek="2">
                                                                31
                                                        </div>
                                                    
                                                </div>
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
                                <dt>입실일</dt>
                                <dd id="startDt">-</dd>
                            </dl>
                            <dl>
                                <dt>퇴실일</dt>
                                <dd id="endDt">-</dd>
                            </dl>
                            <dl>
                                <dt>체류기간</dt>
                                <dd class="form">
                                    <div class="stay-row">
                                        <span class="length-stay" id="nightDays0">당일</span>
                                        <span class="length-stay" id="nightDays1">1박 2일</span>
                                        <span class="length-stay" id="nightDays2">2박 3일</span>
                                        <span class="length-stay" id="nightDays3">3박 4일</span>
                                    </div>
                                </dd>
                            </dl>
                            <dl>
                                <dt>예약구분</dt>
                                <dd class="form">
                                    <span class="check-area">
                                        <span class="radio-1">
                                            <input type="radio" id="txblPblcN" name="txblPblcYn" checked="checked" value="N">
                                            <label for="txblPblcN">개인</label>
                                        </span>
                                        <span class="radio-1">
                                            <input type="radio" id="txblPblcY" name="txblPblcYn" value="Y">
                                            <label for="txblPblcY">단체</label>
                                        </span>
                                    </span>
                                    <span class="copy">※ 단체 선택 시 마이페이지에서 추가정보 입력 후 세금계산서 발행 신청 가능합니다.</span>
                                </dd>
                            </dl>
                        </div>
                        
                            <!-- 프로그램 -->
                            <div class="collapse-wrap">
                                <div class="title-area">
                                    <h4 class="title">프로그램</h4>
                                    <div class="btn-area">
                                        <button type="button" class="btn btn-view" onclick="funcArray.drawImage('06004');">프로그램 보기</button>
                                        <button type="button" class="btn btn-charge" onclick="openPopup('programAmtPop');">요금표</button>
                                        <span class="checkbox-1">
                                        <input type="checkbox" id="check1" class="check collapse" value="program">
                                        <label for="check1">옵션 추가예약</label>
                                    </span>
                                    </div>
                                </div>
                                <div class="a">
                                    <table class="table ecoProgram">
                                        <caption>프로그램</caption>
                                        <colgroup>
                                            <col>
                                            <col>
                                            <col>
                                        </colgroup>
                                        <thead class="thead">
                                        <tr>
                                            <th scope="col">날짜</th>
                                            <th scope="col" id="programNm">오전 (10:00~13:00)</th>
                                            <th scope="col" id="programNm2">오후 (14:00~17:00)</th>
                                        </tr>
                                        </thead>
                                        <tbody class="tbody">
                                        </tbody>
                                    </table>
                                    <div class="border-box quantity-wrap">
                                        <dl>
                                            <dt>참여인원 설정</dt>
                                            <dd class="form">
                                                <div class="row">
                                                    <span class="label">청소년 이하</span>
                                                    <span class="quantity-input">
                                                <button type="button" class="btn minus program-minus">
                                                    <i class="icon-minus"></i>
                                                </button>
                                                <label for="programChildCnt" class="hidden-text">청소년이하참여인원</label>
                                                <input type="number" value="0" readonly id="programChildCnt" name="programChildCnt">
                                                <button type="button" class="btn plus program-plus">
                                                    <i class="icon-plus"></i>
                                                </button>
                                                </span>
                                                </div>
                                                <div class="row">
                                                    <span class="label">성인</span>
                                                    <span class="quantity-input">
                                                <button type="button" class="btn minus program-minus">
                                                    <i class="icon-minus"></i>
                                                </button>
                                                <label for="programAdultCnt" class="hidden-text">성인참여인원</label>
                                                <input type="number" value="0" readonly id="programAdultCnt" name="programAdultCnt">
                                                <button type="button" class="btn plus program-plus">
                                                    <i class="icon-plus"></i>
                                                </button>
                                            </span>
                                                </div>
                                            </dd>
                                        </dl>
                                    </div>
                                    <ul class="dot-list">
                                        <li>프로그램 참여인원 최소 2명 이상 예약 가능합니다.</li>
                                        <li>원활한 프로그램 진행을 위해 10세 이하의 청소년이 참가하는 경우 보호자 1인도 함께 참여 부탁드립니다.</li>
                                    </ul>
                                    <div class="border-box total programDiv">
                                        <dl>
                                            <dt><em>선택 이용금액</em></dt>
                                            <dd class="cnt">청소년 0명 / 성인 0명</dd>
                                            <dd class="amount"><em>0</em>원</dd>
                                        </dl>
                                    </div>
                                </div>
                            </div>
                        
                        
                            <!-- 강당 -->
                            <div class="collapse-wrap">
                                <div class="title-area">
                                    <h4 class="title">강당</h4>
                                    <div class="btn-area">
                                        <button type="button" class="btn btn-view" onclick="funcArray.drawImage('06003');">강당 보기</button>
                                        <button type="button" class="btn btn-charge" onclick="openPopup('gangdangAmtPop');">요금표</button>
                                        <span class="checkbox-1">
                                        <input type="checkbox" id="check3" class="check collapse" value="gangdang">
                                        <label for="check3">옵션 추가예약</label>
                                    </span>
                                    </div>
                                </div>
                                <div class="a">
                                    <table class="table gangdang">
                                        <caption>강당</caption>
                                        <colgroup>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                        </colgroup>
                                        <thead class="thead">
                                        <tr>
                                            <th scope="col">날짜</th>
                                            <th scope="col">오전 (09:00~13:00)</th>
                                            <th scope="col">오후 (14:00~18:00)</th>
                                            <th scope="col">야간 (18:00~22:00)</th>
                                        </tr>
                                        </thead>
                                        <tbody class="tbody">
                                        </tbody>
                                    </table>
                                    <div class="border-box">
                                        <dl>
                                            <dt>사용인원 설정</dt>
                                            <dd class="form">
                                            <span class="quantity-input">
                                                <button type="button" class="btn minus gangdang-prsn-minus">
                                                    <i class="icon-minus"></i>
                                                </button>
                                                <label for="gangDangPrsnCnt" class="hidden-text">총참여인원</label>
                                                <input type="number" value="1" readonly title="총 참여 인원" name="gangDangPrsnCnt" id="gangDangPrsnCnt">
                                                <button type="button" class="btn plus gangdang-prsn-plus">
                                                    <i class="icon-plus"></i>
                                                </button>
                                            </span>
                                            </dd>
                                        </dl>
                                    </div>
                                    <ul class="dot-list">
                                        <li>사용인원은 이용요금과 상관이 없습니다. 규모에 맞는 강당 배정을 위해 예상 사용인원을 입력바랍니다.</li>
                                    </ul>
                                    <div class="border-box total gangdangDiv">
                                        <dl>
                                            <dt ><em>선택 이용금액</em></dt>
                                            <dd class="cnt">총 수량 0개</dd>
                                            <dd class="amount"><em>0</em>원</dd>
                                        </dl>
                                    </div>
                                </div>
                            </div>
                        
                        
                            <!-- 강의실 -->
                            <div class="collapse-wrap">
                                <div class="title-area">
                                    <h4 class="title">강의실</h4>
                                    <div class="btn-area">
                                        <button type="button" class="btn btn-view" onclick="funcArray.drawImage('06002');">강의실 보기</button>
                                        <button type="button" class="btn btn-charge" onclick="openPopup('classAmtPop');">요금표</button>
                                        <span class="checkbox-1">
                                        <input type="checkbox" id="check4" class="check collapse" value="class">
                                        <label for="check4">옵션 추가예약</label>
                                    </span>
                                    </div>
                                </div>
                                <div class="a">
                                    <table class="table classRoom">
                                        <caption>강의실</caption>
                                        <colgroup>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                        </colgroup>
                                        <thead class="thead">
                                        <tr>
                                            <th scope="col">날짜</th>
                                            <th scope="col">오전 (09:00~13:00)</th>
                                            <th scope="col">오후 (14:00~18:00)</th>
                                            <th scope="col">야간 (18:00~22:00)</th>
                                        </tr>
                                        </thead>
                                        <tbody class="tbody">
                                        </tbody>
                                    </table>
                                    <div class="border-box">
                                        <dl>
                                            <dt>사용인원 설정</dt>
                                            <dd class="form">
                                            <span class="quantity-input">
                                                <button type="button" class="btn minus class-prsn-minus">
                                                    <i class="icon-minus"></i>
                                                </button>
                                                <label for="classPrsnCnt" class="hidden-text">총참여인원</label>
                                                <input type="number" value="1" readonly title="총 참여 인원" name="classPrsnCnt" id="classPrsnCnt">
                                                <button type="button" class="btn plus class-prsn-plus">
                                                    <i class="icon-plus"></i>
                                                </button>
                                            </span>
                                            </dd>
                                        </dl>
                                    </div>
                                    <ul class="dot-list">
                                        <li>사용인원은 이용요금과 상관이 없습니다. 규모에 맞는 강의실 배정을 위해 예상 사용인원을 입력바랍니다.</li>
                                    </ul>
                                    <div class="border-box total classRoomDiv">
                                        <dl>
                                            <dt><em>선택 이용금액</em></dt>
                                            <dd class="cnt">총 수량 0개</dd>
                                            <dd class="amount"><em>0</em>원</dd>
                                        </dl>
                                    </div>
                                </div>
                            </div>
                        
                        
                            <!-- 생활관 -->
                            <div class="collapse-wrap">
                                <div class="title-area">
                                    <h4 class="title">생활관</h4>
                                    <div class="btn-area">
                                        <button type="button" class="btn btn-view" onclick="funcArray.drawImage('06001');">객실 보기</button>
                                        <button type="button" class="btn btn-charge" onclick="openPopup('livingAmtPop');">요금표</button>
                                        <span class="checkbox-1">
                                        <input type="checkbox" id="check2" class="check collapse" value="living">
                                        <label for="check2">옵션 추가예약</label>
                                    </span>
                                    </div>
                                </div>
                                <div class="a">
                                    <table class="table livingRoom">
                                        <caption>생활관</caption>
                                        <colgroup>
                                            <col>
                                            <col>
                                            <col>
                                        </colgroup>
                                        <thead class="thead">
                                        <tr>
                                            <th scope="col">생활관 타입</th>
                                            <th scope="col">객실</th>
                                            <th scope="col">금액</th>
                                        </tr>
                                        </thead>
                                        <tbody class="tbody">
                                        </tbody>
                                    </table>
                                    <div class="border-box">
                                        <dl>
                                            <dt>사용인원 설정</dt>
                                            <dd class="form">
                                            <span class="quantity-input">
                                                <button type="button" class="btn minus livingRoom-prsn-minus">
                                                    <i class="icon-minus"></i>
                                                </button>
                                                <label for="livingPrsnCnt" class="hidden-text">총참여인원</label>
                                                <input type="number" value="1" readonly title="총 참여 인원" name="livingPrsnCnt" id="livingPrsnCnt">
                                                <button type="button" class="btn plus livingRoom-prsn-plus">
                                                    <i class="icon-plus"></i>
                                                </button>
                                            </span>
                                            </dd>
                                        </dl>
                                    </div>
                                    <ul class="dot-list">
                                        <li>사용인원은 이용요금과 상관이 없습니다. 예상 사용인원을 입력바랍니다.</li>
                                    </ul>
                                    <div class="border-box total livingRoomDiv">
                                        <dl>
                                            <dt><em>선택 이용금액</em></dt>
                                            <dd class="cnt">총 수량 0개</dd>
                                            <dd class="amount"><em>0</em>원</dd>
                                        </dl>
                                    </div>
                                </div>
                            </div>
                        
                        
                        <!-- 총 선택 이용금액 -->
                        <div class="title-area">
                            <h4 class="title">총 결제 예정 금액</h4>
                        </div>
                        <div class="payment">
                            <dl>
                                <dt><em>생태여행</em></dt>
                                <dd></dd>
                            </dl>
                            <dl class="surtax">
                                <dt><em>과세 합계</em></dt>
                                <dd><em>0</em>원</dd>
                                <dt><em>면세 합계*</em></dt>
                                <dd><em>0</em>원</dd>
                                <dt><em>부가세</em></dt>
                                <dd><em>0</em>원</dd>
                            </dl>
                            <dl class="total">
                                <dt>결제(예정)금액</dt>
                                <dd><em>0</em>원</dd>
                            </dl>
                        </div>
                        <div class="board-bottom">
                            <div class="center">
                                <a href="javascript:void(0);" class="btn btn-register is-active" onclick="funcArray.reserStart(); return false;">예약하기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


<div class="modal-popup large" id="eco-view"></div>


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

<div class="modal-popup small" id="mealPop">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title">식사제공업체</strong>
            <button type="button" class="btn-close" title="닫기" onclick="closePopup('mealPop');">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container">
            <table class="table">
                <caption>식사제공업체</caption>
                <colgroup>
                    <col style="width: 140px;">
                    <col>
                </colgroup>
                <tbody class="tbody">
                <tr>
                    <th scope="row">상호명</th>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row">대표자명</th>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row">사업자등록번호</th>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row">주소</th>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row">대표번호</th>
                    <td></td>
                </tr>
                </tbody>
            </table>
            <div class="btn-area">
                <button type="button" class="btn btn-confirm is-active" onclick="closePopup('mealPop');" >확인</button>
            </div>
        </div>
    </div>
</div>

<div class="modal-popup large" id="programAmtPop">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title">프로그램 요금표 보기</strong>
            <button type="button" class="btn-close" title="닫기" onclick="closePopup('programAmtPop');">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container">
            <table class="table">
                <caption>프로그램 요금표 보기</caption>
                <colgroup>
                    <col style="width: 140px;">
                    <col>
                </colgroup>
                <thead class="thead">
                <tr>
                    <th scope="col">구분</th>
                    <th scope="col">3시간(반일형)</th>
                </tr>
                </thead>
                <tbody class="tbody">
                <tr>
                    <td>청소년 이하</td>
                    <td>3,600원</td>
                </tr>
                <tr>
                    <td>성인</td>
                    <td>4,900원</td>
                </tr>
                <tr>
                    <td>비고</td>
                    <td>부가가치세 별도</td>
                </tr>
                </tbody>
            </table>
            <table class="table">
                <caption>프로그램 요금표 보기</caption>
                <colgroup>
                    <col style="width: 140px;">
                    <col>
                </colgroup>
                <thead class="thead">
                <tr>
                    <th scope="col">구분</th>
                    <th scope="col">6시간 (당일형)</th>
                </tr>
                </thead>
                <tbody class="tbody">
                <tr>
                    <td>청소년 이하</td>
                    <td>7,100원</td>
                </tr>
                <tr>
                    <td>성인</td>
                    <td>9,800원</td>
                </tr>
                <tr>
                    <td>비고</td>
                    <td>부가가치세 별도</td>
                </tr>
                </tbody>
            </table>
            <table class="table">
                <caption>프로그램 요금표 보기</caption>
                <colgroup>
                    <col style="width: 140px;">
                    <col>
                </colgroup>
                <thead class="thead">
                <tr>
                    <th scope="col">구분</th>
                    <th scope="col">1박2일 (체류형)</th>
                </tr>
                </thead>
                <tbody class="tbody">
                <tr>
                    <td>청소년 이하</td>
                    <td>14,200원</td>
                </tr>
                <tr>
                    <td>성인</td>
                    <td>19,500원</td>
                </tr>
                <tr>
                    <td>비고</td>
                    <td>부가가치세 별도</td>
                </tr>
                </tbody>
            </table>
            <div class="btn-area">
                <button type="button" class="btn btn-confirm is-active" onclick="closePopup('programAmtPop');">확인</button>
            </div>
        </div>
    </div>
</div>


<div class="modal-popup large" id="livingAmtPop">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title">생활관 요금표 보기</strong>
            <button type="button" class="btn-close" title="닫기" onclick="closePopup('livingAmtPop');">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container">
            <table class="table">
                <caption>생활관 요금표 보기</caption>
                <colgroup>
                    <col style="width: 33%">
                    <col >
                </colgroup>
                <thead class="thead">
                	<tr>
	                	<th scope="col">생활관</th>
	                	<th scope="col">이용료<br/>(1박기준 / 부가가치세 별도)</th>
	                </tr>
                </thead>
                <tbody class="tbody">
	                <tr>
	                    <th class="ta-c" scope="row">A타입</th>
	                    <td class="ta-c">60,000원</td>
	                </tr>
	                <tr>
	                    <th class="ta-c" scope="row">B타입</th>
	                    <td class="ta-c">90,000원</td>
	                </tr>
	                <tr>
	                    <th class="ta-c" scope="row">C타입</th>
	                    <td class="ta-c">120,000원</td>
	                </tr>
                </tbody>
            </table>
            <div class="btn-area">
                <button type="button" class="btn btn-confirm is-active" onclick="closePopup('livingAmtPop');">확인</button>
            </div>
        </div>
    </div>
</div>


<div class="modal-popup large" id="gangdangAmtPop">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title">강당 요금표 보기</strong>
            <button type="button" class="btn-close" title="닫기" onclick="closePopup('gangdangAmtPop');">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container">
            <table class="table">
                <caption>강당 요금표 보기</caption>
                <colgroup>
                    <col style="width: 140px;">
                    <col>
                    <col>
                    <col>
                </colgroup>
                <thead class="thead">
	                <tr>
	                    <th scope="col" rowspan="2">구분</th>
	                    <th scope="col" colspan="2">대관료</th>
	                    <th scope="col" rowspan="2">비고</th>
	                </tr>
	                <tr>
	                    <th scope="col">4시간기준</th>
	                    <th scope="col">8시간기준</th>
	                </tr>
                </thead>
                <tbody class="tbody">
	                <tr>
	                    <td>강당</td>
	                    <td>200,000원</td>
	                    <td>400,000원</td>
	                    <td>※ 부가가치세 별도</td>
	                </tr>
                </tbody>
            </table>
            <div class="btn-area">
                <button type="button" class="btn btn-confirm is-active" onclick="closePopup('gangdangAmtPop');">확인</button>
            </div>
        </div>
    </div>
</div>


<div class="modal-popup large" id="classAmtPop">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title">강당 요금표 보기</strong>
            <button type="button" class="btn-close" title="닫기" onclick="closePopup('classAmtPop');">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container">
            <table class="table">
                <caption>강당 요금표 보기</caption>
                <colgroup>
                    <col style="width: 140px;">
                    <col>
                    <col>
                    <col>
                </colgroup>
                <thead class="thead">
                <tr>
                    <th scope="col" rowspan="2">구분</th>
                    <th scope="col" colspan="2">대관료</th>
                    <th scope="col" rowspan="2">비고</th>
                </tr>
                <tr>
                    <th scope="col">4시간기준</th>
                    <th scope="col">8시간기준</th>
                </tr>
                </thead>
                <tbody class="tbody">
                <tr>
                    <td>강당</td>
                    <td>125,000원</td>
                    <td>250,000원</td>
                    <td>※ 부가가치세 별도</td>
                </tr>
                </tbody>
            </table>
            <div class="btn-area">
                <button type="button" class="btn btn-confirm is-active" onclick="closePopup('classAmtPop');">확인</button>
            </div>
        </div>
    </div>
</div>


<div class="modal-popup large" id="mealAmtPop"></div>


<div class="modal-popup small" id="ecoReservationConfirm">
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
                <p class="copy-mid">결제 만기일시는 <em data-popup-information-eco="sttlmMtDtm"></em> 까지 입니다.<br>미 결제시 자동 취소되니 유의 하시기 바랍니다.</p>
                <p class="copy-sm">마이페이지 나의예약목록 에서 확인 후 결제를 계속 진행해주세요.</p>
            </div>
            <div class="btn-area">
                <a href="../mmb/mmbLogin.html" class="btn btn-link">나의 예약목록 보기</a>
            </div>
        </div>
    </div>
</div>
			</div>
			
		<footer id="footer">
            <ul class="content">
                <li>
                    <address>(국립공원공단) 강원도 원주시 혁신로 22 (우)26466</address>
                </li>
                <li>사업자등록번호: 211-82-06541</li>
                <li>예약안내: <a href="tel:1670-9201">1670-9201</a> (평일 09-18시, 점심시간 12-13시)</li>
                <li>FAX: 033-769-9579</li>
                <li>이메일: csnp@knps.or.kr</li>
            </ul>
            <p class="copyright">Copyright@Korea National Park Service. All Rights Reserved.</p>
            <div class="policy-area">
                <a href="../contents/copyrightPolicy.html" class="btn">저작권정책</a>
                <a href="http://www.knps.or.kr/portal/main/contents.do?menuNo=7020135" class="btn" target="_blank" style="font-weight: bold; color: #0033cc; background: #ffffff;">개인정보처리방침</a>
            </div>
        </footer>


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
	<img id="loadingImage" src="../assets/img/preloader.gif" alt="로딩이미지" style="position: absolute; left: 924.5px; top: 539.5px; z-index: 100000; display: none;">
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

<!-- Mirrored from reservation.knps.or.kr:443/eco/searchEcoReservation.do by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 10 Nov 2022 06:59:24 GMT -->
</html>
