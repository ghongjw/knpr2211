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
	<title>������������ ����ý���</title>

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
        <a href="../index.html" class="logo">�������� ����ý���</a>
    </h1>
    <nav>
        <ul class="gnb">
            
                <li>
                    <a href="javascript:void(0);" class="depth1">�̿�ȳ�</a>
                    <ul class="depth2">
                        
                            <li><a href="../contents/C/serviceGuideIntro.html">�߿���</a></li>
                        
                            <li><a href="../contents/S/serviceGuideIntro.html">���Ǽ�</a></li>
                        
                            <li><a href="../contents/E/serviceGuideIntro.html">����Ž���</a></li>
                        
                            <li><a href="../contents/R/serviceGuideIntro.html">�ι���</a></li>
                        
                            <li><a href="../contents/T/serviceGuideIntro.html">Ž��ο�����</a></li>
                        
                            <li><a href="../contents/G/serviceGuideIntro.html">Ž�����α׷�</a></li>
                        
                    </ul>
                </li>
            
                <li>
                    <a href="javascript:void(0);" class="depth1">�����ϱ�</a>
                    <ul class="depth2">
                        
                            <li><a href="../reservation/searchSimpleCampReservation.html">�߿���</a></li>
                        
                            <li><a href="../reservation/shelter/searchSimpleShelterReservation.html">���Ǽ�</a></li>
                        
                            <li><a href="searchEcoReservation.html">����Ž���</a></li>
                        
                            <li><a href="../reservation/searchSimpleResidenceReservation.html">�ι���</a></li>
                        
                            <li><a href="../trail/searchTrailReservation.html">Ž��ο�����</a></li>
                        
                            <li><a href="../trprogram/searchTrailProgram.html">Ž�����α׷�</a></li>
                        
                            <li><a href="../reservation/selectCampLottery.html">��÷��</a></li>
                        
                    </ul>
                </li>
            
                <li>
                    <a href="javascript:void(0);" class="depth1">�˸�����</a>
                    <ul class="depth2">
                        
                            <li><a href="../community/board/notice/boardList.html">��������</a></li>
                        
                            <li><a href="../community/board/faq/boardList.html">�����ϴ� ����</a></li>
                        
                            <li><a href="../community/board/qna/boardList.html">���� ���ϱ�</a></li>
                        
                            <li><a href="../contents/rsvtRefundPolicy.html">���ࡤȯ����å</a></li>
                        
                    </ul>
                </li>
            
                <li>
                    <a href="javascript:void(0);" class="depth1">����������</a>
                    <ul class="depth2">
                        
                            <li><a href="../mmb/mmbLogin.html">���� ������</a></li>
                        
                            <li><a href="../mmb/mmbLogin.html">�˸��޽���</a></li>
                        
                            <li><a href="../mmb/mmbLogin.html">���ã��</a></li>
                        
                            <li><a href="../srchrefund/requestRefund.html">��ȯ�ұ� ��ȸ</a></li>
                        
                    </ul>
                </li>
            
                <li>
                    <a href="javascript:void(0);" class="depth1">�׸�����Ʈ</a>
                    <ul class="depth2">
                        
                            <li><a href="../mmb/mmbLogin603d.html" onclick="fn_greenUrlChk();">�߿���</a></li>
                        
                            <li><a href="../mmb/mmbLogin603d.html?prdDvcd=S">���Ǽ�</a></li>
                        
                    </ul>
                </li>
            
        </ul>
    </nav>
    <div class="util-area" data-device-mode="pc">
        <a href="../srchrefund/searchRefund.html" class="btn-refund-inquiry">
            <i class="icon-refund-inquiry"></i>
            <span>��ȯ�ұ���ȸ</span>
        </a>
        
            <!-- �� �α��� ���� -->
            <a href="../mmb/mmbLogin.html" class="btn-login">
                <i class="icon-user-check"></i>
                <span>�α���</span>
            </a>
            <a href="https://www.knps.or.kr/portal/member/join01.do?menuNo=7020113" class="btn-join" target="_blank">
                <i class="icon-user-plus"></i>
                <span>ȸ������</span>
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
        <button class="btn-menu" title="��ü �޴� ����">
            <i class="icon-list"></i>
        </button>
        <div class="all-menu">
            <div class="head">
                <a href="../srchrefund/searchRefund.html" class="btn-refund-inquiry">
                    <i class="icon-refund-inquiry"></i>
                    <span>��ȯ�ұ���ȸ</span>
                </a>
                
                    <!-- �� �α��� ���� -->
                    <a href="../mmb/mmbLogin.html" class="btn-login">�α�����<br>�ʿ��մϴ�.</a>
                    <a href="https://www.knps.or.kr/portal/member/join01.do?menuNo=7020113" class="btn-join" target="_blank">
                        <i class="icon-user-plus"></i>
                        <span>ȸ������</span>
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
                
                
                <button class="btn-close" title="��ü �޴� �ݱ�">
                    <i class="icon-close"></i>
                </button>
            </div>
            <ul class="gnb">
                
                    <li>
                        <a href="javascript:void(0);" class="depth1">�̿�ȳ�</a>
                        <ul class="depth2">
                            
                                <li><a href="../contents/C/serviceGuideIntro.html"
                                       >�߿���</a></li>
                            
                                <li><a href="../contents/S/serviceGuideIntro.html"
                                       >���Ǽ�</a></li>
                            
                                <li><a href="../contents/E/serviceGuideIntro.html"
                                       >����Ž���</a></li>
                            
                                <li><a href="../contents/R/serviceGuideIntro.html"
                                       >�ι���</a></li>
                            
                                <li><a href="../contents/T/serviceGuideIntro.html"
                                       >Ž��ο�����</a></li>
                            
                                <li><a href="../contents/G/serviceGuideIntro.html"
                                       >Ž�����α׷�</a></li>
                            
                        </ul>
                    </li>
                
                    <li>
                        <a href="javascript:void(0);" class="depth1">�����ϱ�</a>
                        <ul class="depth2">
                            
                                <li><a href="../reservation/searchSimpleCampReservation.html"
                                       >�߿���</a></li>
                            
                                <li><a href="../reservation/shelter/searchSimpleShelterReservation.html"
                                       >���Ǽ�</a></li>
                            
                                <li><a href="searchEcoReservation.html"
                                       >����Ž���</a></li>
                            
                                <li><a href="../reservation/searchSimpleResidenceReservation.html"
                                       >�ι���</a></li>
                            
                                <li><a href="../trail/searchTrailReservation.html"
                                       >Ž��ο�����</a></li>
                            
                                <li><a href="../trprogram/searchTrailProgram.html"
                                       >Ž�����α׷�</a></li>
                            
                                <li><a href="../reservation/selectCampLottery.html"
                                       style="display: none;" >��÷��</a></li>
                            
                        </ul>
                    </li>
                
                    <li>
                        <a href="javascript:void(0);" class="depth1">�˸�����</a>
                        <ul class="depth2">
                            
                                <li><a href="../community/board/notice/boardList.html"
                                       >��������</a></li>
                            
                                <li><a href="../community/board/faq/boardList.html"
                                       >�����ϴ� ����</a></li>
                            
                                <li><a href="../community/board/qna/boardList.html"
                                       >���� ���ϱ�</a></li>
                            
                                <li><a href="../contents/rsvtRefundPolicy.html"
                                       >���ࡤȯ����å</a></li>
                            
                        </ul>
                    </li>
                
                    <li>
                        <a href="javascript:void(0);" class="depth1">����������</a>
                        <ul class="depth2">
                            
                                <li><a href="../mmb/mmbLogin.html"
                                       >���� ������</a></li>
                            
                                <li><a href="../mmb/mmbLogin.html"
                                       >�˸��޽���</a></li>
                            
                                <li><a href="../mmb/mmbLogin.html"
                                       >���ã��</a></li>
                            
                                <li><a href="../srchrefund/requestRefund.html"
                                       >��ȯ�ұ� ��ȸ</a></li>
                            
                        </ul>
                    </li>
                
                    <li>
                        <a href="javascript:void(0);" class="depth1">�׸�����Ʈ</a>
                        <ul class="depth2">
                            
                                <li><a href="../mmb/mmbLogin603d.html" onclick="fn_greenUrlChk();"
                                       >�߿���</a></li>
                            
                                <li><a href="../mmb/mmbLogin603d.html?prdDvcd=S"
                                       >���Ǽ�</a></li>
                            
                        </ul>
                    </li>
                
            </ul>
        </div>
    </div>
</header>
			<div id="container">
				



<script src="../assets/js/lib/netfunnel.js"></script>
<script>

    let selectStartDate = null;         //���õȽ��۳�¥
    let selectStartDayWeek = null;      //���õȽ��ۿ���

    let selectEndDate = null;           //���õ����ᳯ¥
    let selectEndDayWeek = null;        //���õ��������

    let selectCurDate = null;           //���� ���õ� ��¥

    let nightDays = 0;                  //nightDays �ڼ�
    let totalAmt = 0;

    let isProgram = false;              //���α׷� ���� ���� ����
    let isLivingRoom = false;           //��Ȱ�� ���� ���� ����
    let isMeal = false;                 //�Ļ� ���� ���� ����

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
            //���ڵ��
            $(".collapse-wrap .check.collapse").off().click(function () {

                let selectedGoods = $(this).val();

                if ($(this).prop("checked")) {

                    if(selectStartDate == null || selectEndDate == null){
                        $(this).prop("checked",false);
                        toastrMsg("���Ⱓ�� �������ּ���.");
                        return false;
                    }

                    funcArray.recalc();

                    if(selectedGoods == 'living') {
                        if(!isLivingRoom){
                            $(this).prop("checked",false);
                            toastrMsg("�� �ü��� ����ü������ �ü��μ� ���α׷� ����, ȯ�� �������� ���� ���� �� ���ǽ� ����ÿ��� ��Ȱ�� ����� �����մϴ�.");
                            return false;
                        }
                        if(nightDays < 1){
                            $(this).prop("checked",false);
                            toastrMsg("��Ȱ�� ������ 1�� �̻��϶� ���� �����մϴ�.");
                            return false;
                        }
                    }else if(selectedGoods == 'meal') {
                        if(!isMeal){
                            $(this).prop("checked",false);
                            toastrMsg("�� �ü��� ����ü������ �ü��μ� ���α׷� ����, ȯ�� �������� ���� ���� �� ���ǽ� ����ÿ��� �Ļ� ��û�� �����մϴ�.");
                            return false;
                        }
                    }
                    $(this).parents(".collapse-wrap").find(".a").stop().slideToggle(200);

                } else {
                    //�߰����� ���� �� ���ð� �ʱ�ȭ
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

    //�Լ�����
    let funcArray = {
        //���� �ѱ۸����� return
        getDayWeekNm : function(dayWeek){
            switch (dayWeek) {
                case 1: return "��";
                case 2: return "ȭ";
                case 3: return "��";
                case 4: return "��";
                case 5: return "��";
                case 6: return "��";
                case 7: return "��";
            }
        },
        //�޷� �� ���ð� �ʱ�ȭ
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
        //���α׷� �׸���
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
                    $("#programNm").html(dat.insttGoodsInfo[0].prdNm+"<br>���� (10:00~13:00)");
                    $("#programNm2").html(dat.insttGoodsInfo[2].prdNm+"<br>���� (14:00~17:00)");
                    for (let i = 0; i < dat.insttGoodsInfo.length; i++) {
                        if(i%4 == 0){
                            trHtml.push("<tr><td>",i/4+1,"����</td>");
                        }
                        if(i%2 == 0){
                            if(dat.insttGoodsInfo[i].maxNopCnt-(dat.insttGoodsInfo[i].rsrvtCnt+dat.insttGoodsInfo[i+1].rsrvtCnt) > 0 && dat.insttGoodsInfo[i].rsvtPsblYn == 'Y' && dat.insttGoodsInfo[i].prdSalStcd == 'N'){
                                trHtml.push("<td>", "<span class='checkbox-1'>", "<input type='checkbox' class='program-checkbox' id='program-check1-",i,"' name='",dat.insttGoodsInfo[i].prdId,"_",dat.insttGoodsInfo[i].useDt,"' data-salchildamt='",dat.insttGoodsInfo[i].salAmt,"' data-saladultamt='",dat.insttGoodsInfo[i+1].salAmt,"' data-deptId='",dat.insttGoodsInfo[i].deptId,"' data-childtxnyn='",dat.insttGoodsInfo[i].txnYn,"' data-adulttxnyn='",dat.insttGoodsInfo[i+1].txnYn,"' data-rsvtpsblcnt='",dat.insttGoodsInfo[i].maxNopCnt-(dat.insttGoodsInfo[i].rsrvtCnt+dat.insttGoodsInfo[i+1].rsrvtCnt),"'>");
                                if(dat.insttGoodsInfo[i].maxNopCnt < 99999){
                                    trHtml.push("<label for='program-check1-",i,"'>[�ܿ��ο�:",dat.insttGoodsInfo[i].maxNopCnt-(dat.insttGoodsInfo[i].rsrvtCnt+dat.insttGoodsInfo[i+1].rsrvtCnt),"]</label>");
                                }
                                trHtml.push("</span>", "</td>");
                            }else{
                                trHtml.push("<td>",
                                    "<span class=''>����Ұ�</span>",
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
        },//end ���α׷� �׸���
        //��Ȱ�� �׸���
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
                                "<input type='number' class='living-room-cnt' value='0' readonly title='�� ���� �ο�' name='",dat.insttGoodsInfo[i].prdId,"' data-salamt='",dat.insttGoodsInfo[i].salAmt,"' data-txnyn='",dat.insttGoodsInfo[i].txnYn,"'>",
                                "</label>",
                                "<button type='button'class='btn plus living-plus' data-max='",dat.insttGoodsInfo[i].maxNopCnt-dat.insttGoodsInfo[i].rsrvtCnt,"'>",
                                "<i class='icon-plus'></i>",
                                "</button>",
                                "</span>",
                                "<span>[�ܿ���:",dat.insttGoodsInfo[i].maxNopCnt-dat.insttGoodsInfo[i].rsrvtCnt,"��]</span>",
                                "</td>",
                                "<td class='spy'>",dat.insttGoodsInfo[i].salAmt,"��</td>",
                                "</tr>");
                        }else{
                            trHtml.push("<tr><td>",dat.insttGoodsInfo[i].prdNm,"</td><td colspan='2'>����Ұ�</td></tr>");
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
        }//end ��Ȱ�� �׸���
        //���� �׸���
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
                            trHtml.push("<tr><td>",i/3+1,"����</td>");
                        }
                        if( 1 / 2 == (dat.insttGoodsInfo.length / 3 - 1 ) ){

                        }else if(dat.insttGoodsInfo[i].maxNopCnt-dat.insttGoodsInfo[i].rsrvtCnt > 0 && dat.insttGoodsInfo[i].rsvtPsblYn == 'Y' && dat.insttGoodsInfo[i].prdSalStcd == 'N'){
                            trHtml.push("<td>",
                                "<span class='checkbox-1'>",
                                "<input type='checkbox' class='gangdang-checkbox' id='gangdang-check1-",i,"' name='",dat.insttGoodsInfo[i].prdId,"_",dat.insttGoodsInfo[i].useDt,"_",dat.insttGoodsInfo[i].optId,"' data-salamt='",dat.insttGoodsInfo[i].salAmt,"' data-txnyn='",dat.insttGoodsInfo[i].txnYn,"'>",
                                "<label for='gangdang-check1-",i,"'>[�ܿ���:",dat.insttGoodsInfo[i].maxNopCnt-dat.insttGoodsInfo[i].rsrvtCnt,"]</label>",
                                "</span>",
                                "</td>");
                        }else{
                            trHtml.push("<td>",
                                "<span class=''>����Ұ�</span>",
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
        },//end ���� �׸���
        //���ǽ� �׸���
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
                            trHtml.push("<tr><td>",i/3+1,"����<br/>(",dat.insttGoodsInfo[i].useDt,")</td>");
                        }

                        if(dat.insttGoodsInfo[i].maxNopCnt-dat.insttGoodsInfo[i].rsrvtCnt > 0 && dat.insttGoodsInfo[i].rsvtPsblYn == 'Y' && dat.insttGoodsInfo[i].prdSalStcd == 'N'){
                            trHtml.push("<td class='form'>",
                                "<span class='quantity-input'>",
                                "<button type='button'class='btn minus class-minus'>",
                                "<i class='icon-minus'></i>",
                                "</button>",
                                "<label>",
                                "<input type='number' class='class-room-cnt' value='0' readonly title='�� ����' name='",dat.insttGoodsInfo[i].prdId,"_",dat.insttGoodsInfo[i].useDt,"_",dat.insttGoodsInfo[i].optId,"' data-salamt='",dat.insttGoodsInfo[i].salAmt,"' data-txnyn='",dat.insttGoodsInfo[i].txnYn,"'>",
                                "</label>",
                                "<button type='button'class='btn plus class-plus' data-max='",dat.insttGoodsInfo[i].maxNopCnt-dat.insttGoodsInfo[i].rsrvtCnt,"'>",
                                "<i class='icon-plus'></i>",
                                "</button>",
                                "</span>",
                                "<span>[�ܿ���:",dat.insttGoodsInfo[i].maxNopCnt-dat.insttGoodsInfo[i].rsrvtCnt,"��]</span>",
                                "</td>");
                        }else{
                            trHtml.push("<td>",
                                "<span class=''>����Ұ�</span>",
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
        },//end ���ǽ� �׸���
        //�Ļ� �׸���
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
                    		trHtml.push("<tr><td>",ord+1,"����<br/>("+listDate[ord]+")</td><td><span class=''>����Ұ�</span></td><td><span class=''>����Ұ�</span></td><td><span class=''>����Ұ�</span></td></tr>"); 
                    		ord++;  
                    	} 
                        if(i%3 == 0){
                            trHtml.push("<tr><td>",ord+1,"����<br/>(",dat.insttGoodsInfo[i].useDt,")</td>"); 
                        }
                        //���డ�ɼ����̳����ְ� && �ǸŰ����ѻ�Ȳ�̰� && �ǸŻ����ڵ尡 �ǸŰ����϶�
                        if(dat.insttGoodsInfo[i].maxNopCnt-dat.insttGoodsInfo[i].rsrvtCnt > 0 && dat.insttGoodsInfo[i].rsvtPsblYn == 'Y' && dat.insttGoodsInfo[i].salPsblYn == 'N' ){
                            trHtml.push("<td class='form'>",
                                "<span class='quantity-input'>",
                                "<button type='button'class='btn minus meal-minus'>",
                                "<i class='icon-minus'></i>",
                                "</button>",
                                "<label>",
                                "<input type='number' class='meal-room-cnt' value='0' readonly title='�� �Ļ��' name='",dat.insttGoodsInfo[i].prdId,"_",dat.insttGoodsInfo[i].useDt,"_",dat.insttGoodsInfo[i].optId,"' data-salamt='",dat.insttGoodsInfo[i].salAmt,"' data-txnyn='",dat.insttGoodsInfo[i].txnYn,"'>",
                                "</label>",
                                "<button type='button'class='btn plus meal-plus' data-max='",dat.insttGoodsInfo[i].maxNopCnt-dat.insttGoodsInfo[i].rsrvtCnt,"'>",
                                "<i class='icon-plus'></i>",
                                "</button>",
                                "</span>",
                                "<span>[�ܿ��ο�:",dat.insttGoodsInfo[i].maxNopCnt-dat.insttGoodsInfo[i].rsrvtCnt,"��]</span>",
                                "</td>");
                        }else{
                            trHtml.push("<td>",
                                "<span class=''>����Ұ�</span>",
                                "</td>");
                        }

                        if(i%3 == 2){
                            trHtml.push("</tr>");
                            ord++; 
                        }
                    }
                    if(ord != listDate.length){
                    	for(var ord; ord<listDate.length; ord++){
                    		trHtml.push("<tr><td>",ord+1,"����<br/>("+listDate[ord]+")</td><td><span class=''>����Ұ�</span></td><td><span class=''>����Ұ�</span></td><td><span class=''>����Ұ�</span></td></tr>");
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
        },//end �Ļ� �׸���
        //�Ļ�����ȸ
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
                    toastrMsg("��ȸ �� ������ �߻��Ͽ����ϴ�.");
                }
            });
        },//�Ļ�����ȸ��
        //����Լ�
        recalc : function(){

            isProgram	 = false;
            isLivingRoom = false;
            isMeal 		 = false;

            //��Ż�ݾ�
            let totalVatAmt   = 0;                  //�鼼�ݾ�
            let totalTax   = 0;                     //�ΰ���
            let totalTaxAmt   = 0;                  //�����հ�

            //���α׷� ����
            let totalChildAmt = 0;                  //��Ż ��̱ݾ�
            let totalAdultAmt = 0;                  //��Ż ���αݾ�
            let totalChildCnt = 0;                  //��Ż ��� �ο�
            let totalAdultCnt = 0;                  //��Ż ���� �ο�

            for (let i = 0; i < $("input.program-checkbox:checked").size(); i++) {
                totalChildCnt = $("#programChildCnt").val();
                totalAdultCnt = $("#programAdultCnt").val();
                let childAmt = ($("input.program-checkbox:checked").eq(i).data("salchildamt") * totalChildCnt );
                let adultAmt = ($("input.program-checkbox:checked").eq(i).data("saladultamt") * totalAdultCnt );
                totalChildAmt += childAmt;
                totalAdultAmt += adultAmt;

                //�ΰ��� üũ..
                if("Y" == $("input.program-checkbox:checked").eq(i).data("childtxnyn")){ //������ǰ�̸� totalTax(�ΰ���10%), totalTaxAmt(�ѱݾ�) ���ϱ�
                    totalTax += Math.floor(childAmt * 0.1);
                    totalTaxAmt += childAmt;
                }else{                                                              //�������ǰ�̸� �ΰ����� 0��, totalVatAmt(�Ѹ鼼�ݾ�) ���ϱ�
                    totalTax += 0;
                    totalVatAmt += childAmt;
                }
                if("Y" == $("input.program-checkbox:checked").eq(i).data("adulttxnyn")){ //������ǰ�̸� totalTax(�ΰ���10%), totalTaxAmt(�ѱݾ�) ���ϱ�
                    totalTax += Math.floor(adultAmt * 0.1);
                    totalTaxAmt += adultAmt;
                }else{                                                              //�������ǰ�̸� �ΰ����� 0��, totalVatAmt(�Ѹ鼼�ݾ�) ���ϱ�
                    totalTax += 0;
                    totalVatAmt += adultAmt;
                }
            }
            $(".programDiv .cnt").html("û�ҳ� "+totalChildCnt+"�� / ���� "+totalAdultCnt+"��");
            $(".programDiv .amount").html("<em>"+(totalChildAmt+totalAdultAmt).toLocaleString()+"</em>��");

            if(totalChildCnt*1+totalAdultCnt*1>1){//���α׷� ���� ���� Y
                isProgram = true;
            }
            //���α׷� ��

            //��Ȱ�� ����
            let totalLivingAmt = 0;                     //��Ż ��Ȱ�� �ݾ�
            let totalLivingCnt = 0;                     //��Ż ��Ȱ�� ����
            for(let i = 0; i < $("input.living-room-cnt").size(); i++) {
                let price = $("input.living-room-cnt").eq(i).data("salamt");
                let cnt = $("input.living-room-cnt").eq(i).val();
                let livingAmt = (price * cnt * nightDays)
                totalLivingAmt += parseInt(livingAmt);
                totalLivingCnt += parseInt(cnt);

                if("Y" == $("input.living-room-cnt").eq(i).data("txnyn")){ //������ǰ�̸� totalTax(�ΰ���10%), totalTaxAmt(�ѱݾ�) ���ϱ�
                    totalTax += Math.floor(livingAmt * 0.1);
                    totalTaxAmt += livingAmt;
                }else{                                                              //�������ǰ�̸� �ΰ����� 0��, totalVatAmt(�Ѹ鼼�ݾ�) ���ϱ�
                    totalTax += 0;
                    totalVatAmt += livingAmt;
                }
                $(".livingRoom .tbody").find("tr").eq(i).find(".spy").html(livingAmt.toLocaleString()+"��");
                $(".livingRoomDiv .cnt").html("�� ���� "+totalLivingCnt+"��");
                $(".livingRoomDiv .amount").html("<em>"+totalLivingAmt.toLocaleString()+"</em>��");
            }
            //��Ȱ�� ��

            //���� ����
            let totalGangdangAmt = 0;                  //��Ż ���� �ݾ�
            let totalGangdangCnt = 0;                  //��Ż ���� ����
            for (let i = 0; i < $("input.gangdang-checkbox:checked").size(); i++) {
                let gangdangAmt = ($("input.gangdang-checkbox:checked").eq(i).data("salamt"));
                totalGangdangAmt += gangdangAmt;
                totalGangdangCnt++;

                if("Y" == $("input.gangdang-checkbox:checked").eq(i).data("txnyn")){ //������ǰ�̸� totalTax(�ΰ���10%), totalTaxAmt(�ѱݾ�) ���ϱ�
                    totalTax += Math.floor(gangdangAmt * 0.1);
                    totalTaxAmt += gangdangAmt;
                }else{                                                              //�������ǰ�̸� �ΰ����� 0��, totalVatAmt(�Ѹ鼼�ݾ�) ���ϱ�
                    totalTax += 0;
                    totalVatAmt += gangdangAmt;
                }
            }
            $(".gangdangDiv .cnt").html("�� ���� "+totalGangdangCnt+"��");
            $(".gangdangDiv .amount").html("<em>"+totalGangdangAmt.toLocaleString()+"</em>��");
            //���� ��

            //���ǽ� ����
            let totalClassAmt = 0;                     //��Ż ���ǽ� �ݾ�
            let totalClassCnt = 0;                     //��Ż ���ǽ� ����
            for(let i = 0; i < $("input.class-room-cnt").size(); i++) {
                let price = $("input.class-room-cnt").eq(i).data("salamt");
                let cnt = $("input.class-room-cnt").eq(i).val();
                let classAmt = (price * cnt);
                totalClassAmt += classAmt;
                totalClassCnt += parseInt(cnt);

                if("Y" == $("input.class-room-cnt").eq(i).data("txnyn")){ //������ǰ�̸� totalTax(�ΰ���10%), totalTaxAmt(�ѱݾ�) ���ϱ�
                    totalTax += Math.floor(classAmt * 0.1);
                    totalTaxAmt += classAmt;
                }else{                                                              //�������ǰ�̸� �ΰ����� 0��, totalVatAmt(�Ѹ鼼�ݾ�) ���ϱ�
                    totalTax += 0;
                    totalVatAmt += classAmt;
                }
                $(".classRoom .tbody").find("tr").eq(i).find(".spy").html(classAmt.toLocaleString()+"��");
            }
            $(".classRoomDiv .cnt").html("�� ���� "+totalClassCnt+"��");
            $(".classRoomDiv .amount").html("<em>"+totalClassAmt.toLocaleString()+"</em>��");
            //���ǽ� ��

            //�Ĵ� ����
            let totalMealAmt = 0;                     //��Ż �Ļ��ο� �ݾ�
            let totalMealCnt = 0;                     //��Ż �Ļ��ο� ����
            for(let i = 0; i < $("input.meal-room-cnt").size(); i++) {
                let price = $("input.meal-room-cnt").eq(i).data("salamt");
                let cnt = $("input.meal-room-cnt").eq(i).val();
                let mealAmt = (price * cnt);
                totalMealAmt += mealAmt;
                totalMealCnt += parseInt(cnt);

                if("Y" == $("input.meal-room-cnt").eq(i).data("txnyn")){ //������ǰ�̸� totalTax(�ΰ���10%), totalTaxAmt(�ѱݾ�) ���ϱ�
                    totalTax += Math.floor(mealAmt * 0.1);
                    totalTaxAmt += mealAmt;
                }else{                                                              //�������ǰ�̸� �ΰ����� 0��, totalVatAmt(�Ѹ鼼�ݾ�) ���ϱ�
                    totalTax += 0;
                    totalVatAmt += mealAmt;
                }
                $(".meal .tbody").find("tr").eq(i).find(".spy").html(mealAmt.toLocaleString()+"��");
            }
            $(".mealDiv .cnt").html("�� ���� "+totalMealCnt+"��");
            $(".mealDiv .amount").html("<em>"+totalMealAmt.toLocaleString()+"</em>��");
            //�Ĵ� ��

            //�Ѱ����ݾ� ����
            let paymentHtml = [];
            let totalAllTaxAmt = (totalVatAmt + totalTaxAmt + totalTax).toLocaleString();
            paymentHtml.push("<dl><dt><em>���¿���</em></dt><dd></dd></dl>");
            paymentHtml.push("<dl>");
            if(totalChildAmt > 0 || totalAdultAmt > 0){
                paymentHtml.push("<dt>���α׷� : û�ҳ� ",totalChildCnt,"�� / ���� ",totalAdultCnt,"��</dt><dd>",(totalChildAmt+totalAdultAmt).toLocaleString(),"��</dd>");
            }
            if(totalLivingAmt > 0){
                paymentHtml.push("<dt>��Ȱ��/���� : �� ",totalLivingCnt,"��</dt><dd>",totalLivingAmt.toLocaleString(),"��</dd>");
            }
            if(totalGangdangAmt > 0){
                paymentHtml.push("<dt>���� : �� ",totalGangdangCnt,"��</dt><dd>",totalGangdangAmt.toLocaleString(),"��</dd>");
            }
            if(totalClassAmt > 0){
                paymentHtml.push("<dt>���ǽ� : �� ",totalClassCnt,"��</dt><dd>",totalClassAmt.toLocaleString(),"��</dd>");
            }
            if(totalMealAmt > 0){
                paymentHtml.push("<dt>�Ĵ� : �� ",totalMealCnt,"��</dt><dd>",totalMealAmt.toLocaleString(),"��</dd>");
            }
            paymentHtml.push("</dl>");
            paymentHtml.push("<dl class='surtax'>");
            paymentHtml.push("<dt><em>���� �հ�</em></dt><dd><em>",totalTaxAmt.toLocaleString(),"</em>��</dd>");
            paymentHtml.push("<dt><em>�鼼 �հ�*</em></dt><dd><em>",totalVatAmt.toLocaleString(),"</em>��</dd>");
            paymentHtml.push("<dt><em>�ΰ��� �հ�</em></dt><dd><em>",totalTax.toLocaleString(),"</em>��</dd>");
            paymentHtml.push("</dl>");
            paymentHtml.push("<dl class='total'><dt><em>�հ� ���� �ݾ�</em></dt><dd><em>",totalAllTaxAmt,"</em>��</dd></dl>");
            $(".payment").html(paymentHtml.join(""));
            //�Ѱ����ݾ� ��

            //�� �����ݾ� ������ ����
            totalAmt = totalAllTaxAmt;

            //���α׷�, ���ǽ�, ���� ��ǰ�� ���� => ��Ȱ��,�Ļ� ���� ����
            if((totalChildAmt > 0 || totalAdultAmt > 0) || totalGangdangAmt > 0 || totalClassAmt > 0) {
                isLivingRoom = true;
                isMeal = true;
            }
        },//end ����Լ�
        //�̹��� load
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
                    toastrMsg("��ȸ �� ������ �߻��Ͽ����ϴ�.");
                }
            });
        },//end �̹��� load
        //�������
        reserStart : function(){

            if(!funcArray.validate()){return false};
            $("#useBgnDt").val(selectStartDate);
            $("#useEndDt").val(selectEndDate);


            let minCnt = 9999;                      //���α׷��� �ּ� ���డ�ɼ���  ( ���� ���� �� ���ļ� �����ο� <= �ܿ��ο� ���� ������ �� �Ǿ����  )
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
                            title:'����Ұ� �ȳ�',
                            subTitle:'������ �Ұ� �մϴ�.',
                            content:dat.resultMsg,
                            type:'error'
                        });
                    }else{
                        let captchaHtml = [];
                        captchaHtml.push("<table class='table'> <caption>�ڵ����� �Է¹���</caption> <colgroup> <col style='width: 140px;'> <col> </colgroup>",
                            "<tbody class='tbody' id=''>",
                            "<tr>",
                            "<th scope='row'>��������</th>",
                            "<td>",$("#deptTitle").html(),"</td>",
                            "</tr>",
                            "<tr>",
                            "<th scope='row'>�����</th>",
                            "<td>",selectStartDate," ~ ",selectEndDate,"</td>",
                            "</tr>",
                            "<tr>",
                            "<th scope='row'>ü���Ⱓ</th>",
                            "<td>",nightDays,"�� ",nightDays+1,"��</td>",
                            "</tr>",
                            "<tr>",
                            "<th scope='row'>����</th>",
                            "<td>",totalAmt,"��</td>",
                            "</tr>",
                            "</tbody>",
                            "</table>",
                            "<div class='captcha-area'>",
                            "<span class='label'>�ڵ����� ��������</span>",
                            "<img src='/reserCaptcha.do' class='w-100' alt='�ڵ����� ��������'>",
                            "<label for='captchaInput' class='hidden-text'>�ڵ����� ��������</label><input type='text' class='input-text' title='�ڵ����� ��������' id='captchaInput'>",
                            "</div>",
                            "<p class='copy-notice'>�� ���� �Ϸ�� ��ǰ�� ���ؼ��� ���������� ���ǿ����� ���� Ȯ�� �� ���� �����մϴ�.</p><div class='btn-area'>",
                            "<button type='button'class='btn btn-cancel' onclick='closePopup(\"captchaPop\");'>���</button>",
                            "<button type='button'class='btn btn-confirm is-active' onclick='funcArray.reserProc();'>Ȯ��</button></div>"
                        );
                        $("#captchaDiv").html("");
                        $("#captchaDiv").prepend(captchaHtml.join(""));

                        openPopup('captchaPop');

                    }
                },
                error : function(){
                    toastrMsg("������å üũ�� ������ �߻��Ͽ����ϴ�.");
                }
            });
        },//end ������� ( �α���üũ, ��åüũ ,ĸí )
        //����ó��
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
                            title:'����Ұ� �ȳ�',
                            subTitle:'������ �Ұ� �մϴ�.',
                            content:dat.resultMsg,
                            type:'error'
                        });
                    }else if(dat.result == 'DPL') {
                        closePopup('captchaPop');
                        alertPopup({
                            title:'����Ұ� �ȳ�',
                            subTitle:'������ �Ұ� �մϴ�.',
                            content:dat.resultMsg,
                            type:'error'
                        });
                    }else{
                        closePopup('captchaPop');
                        closePopup('captchaPop');
                        $('#ecoReservationConfirm [data-popup-information-eco="sttlmMtDtm"]').html(dat.stlmExpiDtm);//���������Ͻ�
                        openPopup('ecoReservationConfirm');
                    }
                },
                error : function(){
                    toastrMsg("ó�� �� ������ �߻��Ͽ����ϴ�.");
                }
            });
        },//end ����ó��
        //��ȿ��üũ
        validate : function(){
            let cnt = 0;
            for(let i=0; i<$(".collapse-wrap .check.collapse").length; i++){
                if($(".collapse-wrap .check.collapse")[i].checked){
                    let selectedGoods = $(".collapse-wrap .check.collapse")[i].value;
                    if(selectedGoods == 'program'){
                        if(!isProgram){
                            toastrMsg("���α׷� �����ο� �ּ� 2�� �̻� ���� �����մϴ�.");
                            return false;
                        }
                    }else if(selectedGoods == 'living') {
                        if(!isLivingRoom){
                            toastrMsg("��Ȱ���� ���α׷� ���� �Ǵ� ���� �� ���ǽ� ����ÿ��� ����� �����մϴ�.");
                            return false;
                        }
                        if(nightDays < 1){
                            $(this).prop("checked",false);
                            toastrMsg("��Ȱ�� ������ 1�� �̻��϶� ���� �����մϴ�.");
                            return false;
                        }
                    }else if(selectedGoods == 'meal') {
                        if(!isMeal){
                            toastrMsg("�Ļ翹���� ���α׷� ���� �Ǵ� ���� �� ���ǽ� ����ÿ��� ��û�� �����մϴ�.");
                            return false;
                        }
                    }
                    cnt++;
                }
            }
            if(cnt < 1){
                toastrMsg("�ּ� �ϳ� �̻��� �ü��� �����ϼž� �մϴ�.");
                return false;
            }
            
            return true;
        }
    }

    //���� Ŭ�� �̺�Ʈ ����
    let clickEvent = {
        //�޷�
        calendar : function(){
            //start �޷� Ŭ�� �̺�Ʈ
            $(".calendar-cell").off().click(function(){
                selectCurDate = $(this).data('date');

                //���õ� ��¥�� ������ (���ʼ���)
                if(selectStartDate == null && selectEndDate == null){
                    //�޷� �� ���ð� �ʱ�ȭ
                    funcArray.calendarClear();
                    //�������� 1���� �ԽǷ� ���ý�
                    if($(this).data('date') =='2023'+'-'+numPad('1',2)+'-'+'01'){
                        toastrMsg("�ش� ���� ��Ǹ� �����մϴ�.");
                        return false;
                    }
                    //�Խ� ����
                    $(this).addClass('start').addClass('selected');
                    //data-�Ӽ� �� ��������
                    selectStartDate = selectCurDate;
                    selectStartDayWeek = $(this).data('dayweek');
                    selectEndDate = selectCurDate;
                    selectEndDayWeek = $(this).data('dayweek');
                    //�Խ��� ����� html ����
                    $("#startDt").html(selectStartDate+"["+funcArray.getDayWeekNm(selectStartDayWeek)+"]");
                    $("#endDt").html(selectStartDate+"["+funcArray.getDayWeekNm(selectStartDayWeek)+"]");
                    $(".length-stay").removeClass('selected');
                    $("#nightDays0").addClass('selected');
                    toastrMsg("�̿� �Ⱓ�� 3�� 4�� �̳��� ������ �ּ���.");

                    nightDays = (new Date(selectCurDate) - new Date(selectStartDate))/1000/60/60/24;    //��¥���
                }else if(selectStartDate != selectEndDate){ //���ο� �Խ����� ����������
                    //�޷� �� ���ð� �ʱ�ȭ
                    funcArray.calendarClear();
                    //�������� 1���� �ԽǷ� ���ý�
                    if($(this).data('date') =='2023'+'-'+numPad('1',2)+'-'+'01'){
                        toastrMsg("�ش� ���� ��Ǹ� �����մϴ�.");
                        return false;
                    }
                    //�Խ� ����
                    $(this).addClass('start').addClass('selected');
                    //���õȰ� ����
                    selectStartDate = selectCurDate;
                    selectStartDayWeek = $(this).data('dayweek');
                    selectEndDate = selectCurDate;
                    selectEndDayWeek = $(this).data('dayweek');
                    //�Խ��� ����� html ����
                    $("#startDt").html(selectCurDate+"["+funcArray.getDayWeekNm(selectStartDayWeek)+"]");
                    $("#endDt").html(selectCurDate+"["+funcArray.getDayWeekNm(selectStartDayWeek)+"]");
                    $(".length-stay").removeClass('selected');
                    $("#nightDays0").addClass('selected');
                    toastrMsg("�̿� �Ⱓ�� 3�� 4�� �̳��� ������ �ּ���.");

                    nightDays = (new Date(selectCurDate) - new Date(selectStartDate))/1000/60/60/24;    //��¥���
                }else if(selectStartDate == selectCurDate){ //���Ͽ��� ������ �ѹ� �� Ŭ��������
                    //�޷� �� ���ð� �ʱ�ȭ
                    funcArray.calendarClear();
                    //�Խ� ����
                    $(this).addClass('start').addClass('selected');
                    //���õȰ� ����
                    selectStartDate = selectCurDate;
                    selectStartDayWeek = $(this).data('dayweek');
                    selectEndDate = selectCurDate;
                    selectEndDayWeek = $(this).data('dayweek');
                    //�Խ��� ����� html ����
                    $("#startDt").html(selectStartDate+"["+funcArray.getDayWeekNm(selectStartDayWeek)+"]");
                    $("#endDt").html(selectStartDate+"["+funcArray.getDayWeekNm(selectStartDayWeek)+"]");
                    $(".length-stay").removeClass('selected');
                    $("#nightDays0").addClass('selected');
                    return false;
                }else{  //�׿� ������ ���� ����� ����
                    nightDays = (new Date(selectCurDate) - new Date(selectStartDate))/1000/60/60/24;    //��¥���
                    //����� ��¥���
                    if(selectStartDate > selectCurDate){
                        toastrMsg("������� �Խ��Ϻ��� Ŀ���մϴ�.");
                        //�޷� �� ���ð� �ʱ�ȭ
                        funcArray.calendarClear();
                        return false;
                    }else if(nightDays > 3) {
                        toastrMsg("�ִ� 3�� 4�ϱ��� ���� �����մϴ�.");
                        //�޷� �� ���ð� �ʱ�ȭ
                        funcArray.calendarClear();
                        return false;
                    }else{//��� ����
                        $(this).addClass('end').addClass('selected');
                        //���õȰ� ����
                        selectEndDate = selectCurDate;
                        selectEndDayWeek = $(this).data('dayweek');
                        $("#endDt").html(selectEndDate+"["+funcArray.getDayWeekNm(selectEndDayWeek)+"]");
                        $(".length-stay").removeClass('selected');
                        $("#nightDays"+nightDays).addClass('selected');     //ü���Ⱓ ����

                        //���̰� ���õȰɷ� ǥ���ϱ�.
                        let date = new Date(selectStartDate);
                        for(let i=1; i<nightDays; i++){
                            date.setDate(date.getDate()+1);
                            $("."+date.getFullYear()+"-"+numPad(date.getMonth()+1,2)+"-"+numPad(date.getDate(),2)).addClass('selected');
                        }

                    }
                }
                    //��ǰ�ʱ�ȭ
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
        },//end �޷� Ŭ�� �̺�Ʈ
        //�� �����ο�
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
        },//end �� �����ο�
        //���α׷�
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
        },//end ���α׷�
        //��Ȱ��
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
                    toastrMsg("��Ȱ�� ������ 1�� �̻��϶� ���� �����մϴ�.");
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
        },//end ��Ȱ��
        //���ǽ�
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

        },//end ���ǽ�
        //�Ĵ�
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
        },//end �Ĵ�
        //����
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
        }//end ����
    }
var a,b;
</script>
<div class="page-location">
    <span>Ȩ</span><span>�����ϱ�</span><span>����Ž���</span>
</div>

<div class="reservation responsive eco">
    <h3 class="title">����Ž��� ����</h3>
    <ul class="nav-tabs">
        <li class="is-active"><a href="javascript:void(0);">���¿���</a></li>
        <li><a href="searchEcoPackageGoods.html">Ưȭ���α׷�</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane is-active">
            <ul class="nav-tabs type2">
                
                    
                    <li class="is-active"><a href="searchEcoReservationf799.html?deptId=B971002">���ѻ�</a></li>
                
                    
                    <li class=""><a href="searchEcoReservation2085.html?deptId=B014003">������</a></li>
                
                    
                    <li class=""><a href="searchEcoReservatione8e6.html?deptId=B123002">�ҹ��</a></li>
                
                    
                    <li class=""><a href="searchEcoReservation759b.html?deptId=B301002">���ǻ�</a></li>
                
                    
                    <li class=""><a href="searchEcoReservationb1c9.html?deptId=B024002">�ѷ��ػ�</a></li>
                
                    
                    <li class=""><a href="searchEcoReservation462e.html?deptId=B231002">�����</a></li>
                
                    
                    <li class=""><a href="searchEcoReservation7676.html?deptId=B133002">���߻�</a></li>
                
                    
                    <li class=""><a href="searchEcoReservation1a0c.html?deptId=B331001">�����</a></li>
                
            </ul>
            <form id="reservationForm" method="post">
                <input type="hidden" name="useBgnDt" id="useBgnDt" value="">
                <input type="hidden" name="useEndDt" id="useEndDt" value="">
                <input type="hidden" name="deptId" value="B971002">
                <input type="hidden" name="captcha" id="captcha" value="">
                <div class="tab-content">
                    <div class="tab-pane is-active">
                        <div class="title-area">
                            <span class="label"><i class="icon-location"></i>���ѻ�</span>
                            <h4 class="title" id="deptTitle">���ѻ� ����Ž���</h4>
                        </div>
                        <div class="box-guide">
                            <div class="monthly-check">
                                <strong class="title">���¿��� �����Ͽ� ��ü ���� �ܿ���Ȳ�� ���� ��ư�� ���� Ȯ�� ���� �մϴ�.</strong>
                                <a href="searchEcoMonthReservationf799.html?deptId=B971002" class="btn btn-monthly">���� �ܿ���Ȳ Ȯ��</a>
                            </div>
                            <ul class="dot-list">
                                <li>�� �ü��� ����ü�����սü��μ� ���α׷� ����, ȯ�汳������ ���� ���� �� ���ǽ� ����ÿ��� ��Ȱ�� ����� �����մϴ�.</li>
                                <li>���α׷��� �ּ� 2���̻� �����ϼž� ����� �����մϴ�.</li>
                                
                                    <li>��Ȱ�� �ܿ������� ���������� ���α׷��� ��� ����Ұ��� ǥ��Ǿ� ������ ������� �ʴ� ���, 02-901-0700(�ְ�)���� ���� �ٶ��ϴ�.</li>
                                    <li>����Ư���� �ڷγ�19 ��Ȳ �ּ� : <a href="https://www.seoul.go.kr/coronaV/coronaStatus.do" target="_blank">https://www.seoul.go.kr/coronaV/coronaStatus.do</a></li>
                                
                                
                                
                                
                                
                                
                                
                            </ul>
                        </div>
                        <!-- ������ ���� -->
                        <div class="title-area">
                            <h4 class="title">������ ����</h4>
                        </div>
                        <div class="detail-info">
                            <dl class="mb-block">
                                <dt>������ ����</dt>
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
                                        <li>������ �Ⱓ�� �޷¿��� �����ϼ���.</li>
                                        <li>������ ������ ������ ��¥�� ������ ���� ���ϰ� 1��2�ϸ� �����մϴ�.</li>
                                    </ul>
                                </dd>
                            </dl>
                            <dl>
                                <dt>�Խ���</dt>
                                <dd id="startDt">-</dd>
                            </dl>
                            <dl>
                                <dt>�����</dt>
                                <dd id="endDt">-</dd>
                            </dl>
                            <dl>
                                <dt>ü���Ⱓ</dt>
                                <dd class="form">
                                    <div class="stay-row">
                                        <span class="length-stay" id="nightDays0">����</span>
                                        <span class="length-stay" id="nightDays1">1�� 2��</span>
                                        <span class="length-stay" id="nightDays2">2�� 3��</span>
                                        <span class="length-stay" id="nightDays3">3�� 4��</span>
                                    </div>
                                </dd>
                            </dl>
                            <dl>
                                <dt>���౸��</dt>
                                <dd class="form">
                                    <span class="check-area">
                                        <span class="radio-1">
                                            <input type="radio" id="txblPblcN" name="txblPblcYn" checked="checked" value="N">
                                            <label for="txblPblcN">����</label>
                                        </span>
                                        <span class="radio-1">
                                            <input type="radio" id="txblPblcY" name="txblPblcYn" value="Y">
                                            <label for="txblPblcY">��ü</label>
                                        </span>
                                    </span>
                                    <span class="copy">�� ��ü ���� �� �������������� �߰����� �Է� �� ���ݰ�꼭 ���� ��û �����մϴ�.</span>
                                </dd>
                            </dl>
                        </div>
                        
                            <!-- ���α׷� -->
                            <div class="collapse-wrap">
                                <div class="title-area">
                                    <h4 class="title">���α׷�</h4>
                                    <div class="btn-area">
                                        <button type="button" class="btn btn-view" onclick="funcArray.drawImage('06004');">���α׷� ����</button>
                                        <button type="button" class="btn btn-charge" onclick="openPopup('programAmtPop');">���ǥ</button>
                                        <span class="checkbox-1">
                                        <input type="checkbox" id="check1" class="check collapse" value="program">
                                        <label for="check1">�ɼ� �߰�����</label>
                                    </span>
                                    </div>
                                </div>
                                <div class="a">
                                    <table class="table ecoProgram">
                                        <caption>���α׷�</caption>
                                        <colgroup>
                                            <col>
                                            <col>
                                            <col>
                                        </colgroup>
                                        <thead class="thead">
                                        <tr>
                                            <th scope="col">��¥</th>
                                            <th scope="col" id="programNm">���� (10:00~13:00)</th>
                                            <th scope="col" id="programNm2">���� (14:00~17:00)</th>
                                        </tr>
                                        </thead>
                                        <tbody class="tbody">
                                        </tbody>
                                    </table>
                                    <div class="border-box quantity-wrap">
                                        <dl>
                                            <dt>�����ο� ����</dt>
                                            <dd class="form">
                                                <div class="row">
                                                    <span class="label">û�ҳ� ����</span>
                                                    <span class="quantity-input">
                                                <button type="button" class="btn minus program-minus">
                                                    <i class="icon-minus"></i>
                                                </button>
                                                <label for="programChildCnt" class="hidden-text">û�ҳ����������ο�</label>
                                                <input type="number" value="0" readonly id="programChildCnt" name="programChildCnt">
                                                <button type="button" class="btn plus program-plus">
                                                    <i class="icon-plus"></i>
                                                </button>
                                                </span>
                                                </div>
                                                <div class="row">
                                                    <span class="label">����</span>
                                                    <span class="quantity-input">
                                                <button type="button" class="btn minus program-minus">
                                                    <i class="icon-minus"></i>
                                                </button>
                                                <label for="programAdultCnt" class="hidden-text">���������ο�</label>
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
                                        <li>���α׷� �����ο� �ּ� 2�� �̻� ���� �����մϴ�.</li>
                                        <li>��Ȱ�� ���α׷� ������ ���� 10�� ������ û�ҳ��� �����ϴ� ��� ��ȣ�� 1�ε� �Բ� ���� ��Ź�帳�ϴ�.</li>
                                    </ul>
                                    <div class="border-box total programDiv">
                                        <dl>
                                            <dt><em>���� �̿�ݾ�</em></dt>
                                            <dd class="cnt">û�ҳ� 0�� / ���� 0��</dd>
                                            <dd class="amount"><em>0</em>��</dd>
                                        </dl>
                                    </div>
                                </div>
                            </div>
                        
                        
                            <!-- ���� -->
                            <div class="collapse-wrap">
                                <div class="title-area">
                                    <h4 class="title">����</h4>
                                    <div class="btn-area">
                                        <button type="button" class="btn btn-view" onclick="funcArray.drawImage('06003');">���� ����</button>
                                        <button type="button" class="btn btn-charge" onclick="openPopup('gangdangAmtPop');">���ǥ</button>
                                        <span class="checkbox-1">
                                        <input type="checkbox" id="check3" class="check collapse" value="gangdang">
                                        <label for="check3">�ɼ� �߰�����</label>
                                    </span>
                                    </div>
                                </div>
                                <div class="a">
                                    <table class="table gangdang">
                                        <caption>����</caption>
                                        <colgroup>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                        </colgroup>
                                        <thead class="thead">
                                        <tr>
                                            <th scope="col">��¥</th>
                                            <th scope="col">���� (09:00~13:00)</th>
                                            <th scope="col">���� (14:00~18:00)</th>
                                            <th scope="col">�߰� (18:00~22:00)</th>
                                        </tr>
                                        </thead>
                                        <tbody class="tbody">
                                        </tbody>
                                    </table>
                                    <div class="border-box">
                                        <dl>
                                            <dt>����ο� ����</dt>
                                            <dd class="form">
                                            <span class="quantity-input">
                                                <button type="button" class="btn minus gangdang-prsn-minus">
                                                    <i class="icon-minus"></i>
                                                </button>
                                                <label for="gangDangPrsnCnt" class="hidden-text">�������ο�</label>
                                                <input type="number" value="1" readonly title="�� ���� �ο�" name="gangDangPrsnCnt" id="gangDangPrsnCnt">
                                                <button type="button" class="btn plus gangdang-prsn-plus">
                                                    <i class="icon-plus"></i>
                                                </button>
                                            </span>
                                            </dd>
                                        </dl>
                                    </div>
                                    <ul class="dot-list">
                                        <li>����ο��� �̿��ݰ� ����� �����ϴ�. �Ը� �´� ���� ������ ���� ���� ����ο��� �Է¹ٶ��ϴ�.</li>
                                    </ul>
                                    <div class="border-box total gangdangDiv">
                                        <dl>
                                            <dt ><em>���� �̿�ݾ�</em></dt>
                                            <dd class="cnt">�� ���� 0��</dd>
                                            <dd class="amount"><em>0</em>��</dd>
                                        </dl>
                                    </div>
                                </div>
                            </div>
                        
                        
                            <!-- ���ǽ� -->
                            <div class="collapse-wrap">
                                <div class="title-area">
                                    <h4 class="title">���ǽ�</h4>
                                    <div class="btn-area">
                                        <button type="button" class="btn btn-view" onclick="funcArray.drawImage('06002');">���ǽ� ����</button>
                                        <button type="button" class="btn btn-charge" onclick="openPopup('classAmtPop');">���ǥ</button>
                                        <span class="checkbox-1">
                                        <input type="checkbox" id="check4" class="check collapse" value="class">
                                        <label for="check4">�ɼ� �߰�����</label>
                                    </span>
                                    </div>
                                </div>
                                <div class="a">
                                    <table class="table classRoom">
                                        <caption>���ǽ�</caption>
                                        <colgroup>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                        </colgroup>
                                        <thead class="thead">
                                        <tr>
                                            <th scope="col">��¥</th>
                                            <th scope="col">���� (09:00~13:00)</th>
                                            <th scope="col">���� (14:00~18:00)</th>
                                            <th scope="col">�߰� (18:00~22:00)</th>
                                        </tr>
                                        </thead>
                                        <tbody class="tbody">
                                        </tbody>
                                    </table>
                                    <div class="border-box">
                                        <dl>
                                            <dt>����ο� ����</dt>
                                            <dd class="form">
                                            <span class="quantity-input">
                                                <button type="button" class="btn minus class-prsn-minus">
                                                    <i class="icon-minus"></i>
                                                </button>
                                                <label for="classPrsnCnt" class="hidden-text">�������ο�</label>
                                                <input type="number" value="1" readonly title="�� ���� �ο�" name="classPrsnCnt" id="classPrsnCnt">
                                                <button type="button" class="btn plus class-prsn-plus">
                                                    <i class="icon-plus"></i>
                                                </button>
                                            </span>
                                            </dd>
                                        </dl>
                                    </div>
                                    <ul class="dot-list">
                                        <li>����ο��� �̿��ݰ� ����� �����ϴ�. �Ը� �´� ���ǽ� ������ ���� ���� ����ο��� �Է¹ٶ��ϴ�.</li>
                                    </ul>
                                    <div class="border-box total classRoomDiv">
                                        <dl>
                                            <dt><em>���� �̿�ݾ�</em></dt>
                                            <dd class="cnt">�� ���� 0��</dd>
                                            <dd class="amount"><em>0</em>��</dd>
                                        </dl>
                                    </div>
                                </div>
                            </div>
                        
                        
                            <!-- ��Ȱ�� -->
                            <div class="collapse-wrap">
                                <div class="title-area">
                                    <h4 class="title">��Ȱ��</h4>
                                    <div class="btn-area">
                                        <button type="button" class="btn btn-view" onclick="funcArray.drawImage('06001');">���� ����</button>
                                        <button type="button" class="btn btn-charge" onclick="openPopup('livingAmtPop');">���ǥ</button>
                                        <span class="checkbox-1">
                                        <input type="checkbox" id="check2" class="check collapse" value="living">
                                        <label for="check2">�ɼ� �߰�����</label>
                                    </span>
                                    </div>
                                </div>
                                <div class="a">
                                    <table class="table livingRoom">
                                        <caption>��Ȱ��</caption>
                                        <colgroup>
                                            <col>
                                            <col>
                                            <col>
                                        </colgroup>
                                        <thead class="thead">
                                        <tr>
                                            <th scope="col">��Ȱ�� Ÿ��</th>
                                            <th scope="col">����</th>
                                            <th scope="col">�ݾ�</th>
                                        </tr>
                                        </thead>
                                        <tbody class="tbody">
                                        </tbody>
                                    </table>
                                    <div class="border-box">
                                        <dl>
                                            <dt>����ο� ����</dt>
                                            <dd class="form">
                                            <span class="quantity-input">
                                                <button type="button" class="btn minus livingRoom-prsn-minus">
                                                    <i class="icon-minus"></i>
                                                </button>
                                                <label for="livingPrsnCnt" class="hidden-text">�������ο�</label>
                                                <input type="number" value="1" readonly title="�� ���� �ο�" name="livingPrsnCnt" id="livingPrsnCnt">
                                                <button type="button" class="btn plus livingRoom-prsn-plus">
                                                    <i class="icon-plus"></i>
                                                </button>
                                            </span>
                                            </dd>
                                        </dl>
                                    </div>
                                    <ul class="dot-list">
                                        <li>����ο��� �̿��ݰ� ����� �����ϴ�. ���� ����ο��� �Է¹ٶ��ϴ�.</li>
                                    </ul>
                                    <div class="border-box total livingRoomDiv">
                                        <dl>
                                            <dt><em>���� �̿�ݾ�</em></dt>
                                            <dd class="cnt">�� ���� 0��</dd>
                                            <dd class="amount"><em>0</em>��</dd>
                                        </dl>
                                    </div>
                                </div>
                            </div>
                        
                        
                        <!-- �� ���� �̿�ݾ� -->
                        <div class="title-area">
                            <h4 class="title">�� ���� ���� �ݾ�</h4>
                        </div>
                        <div class="payment">
                            <dl>
                                <dt><em>���¿���</em></dt>
                                <dd></dd>
                            </dl>
                            <dl class="surtax">
                                <dt><em>���� �հ�</em></dt>
                                <dd><em>0</em>��</dd>
                                <dt><em>�鼼 �հ�*</em></dt>
                                <dd><em>0</em>��</dd>
                                <dt><em>�ΰ���</em></dt>
                                <dd><em>0</em>��</dd>
                            </dl>
                            <dl class="total">
                                <dt>����(����)�ݾ�</dt>
                                <dd><em>0</em>��</dd>
                            </dl>
                        </div>
                        <div class="board-bottom">
                            <div class="center">
                                <a href="javascript:void(0);" class="btn btn-register is-active" onclick="funcArray.reserStart(); return false;">�����ϱ�</a>
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
            <strong class="popup-title">�ڵ����� �Է¹���</strong>
            <button type="button" class="btn-close" title="�ݱ�"  onclick="closePopup('captchaPop');">
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
            <strong class="popup-title">�Ļ�������ü</strong>
            <button type="button" class="btn-close" title="�ݱ�" onclick="closePopup('mealPop');">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container">
            <table class="table">
                <caption>�Ļ�������ü</caption>
                <colgroup>
                    <col style="width: 140px;">
                    <col>
                </colgroup>
                <tbody class="tbody">
                <tr>
                    <th scope="row">��ȣ��</th>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row">��ǥ�ڸ�</th>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row">����ڵ�Ϲ�ȣ</th>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row">�ּ�</th>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row">��ǥ��ȣ</th>
                    <td></td>
                </tr>
                </tbody>
            </table>
            <div class="btn-area">
                <button type="button" class="btn btn-confirm is-active" onclick="closePopup('mealPop');" >Ȯ��</button>
            </div>
        </div>
    </div>
</div>

<div class="modal-popup large" id="programAmtPop">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title">���α׷� ���ǥ ����</strong>
            <button type="button" class="btn-close" title="�ݱ�" onclick="closePopup('programAmtPop');">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container">
            <table class="table">
                <caption>���α׷� ���ǥ ����</caption>
                <colgroup>
                    <col style="width: 140px;">
                    <col>
                </colgroup>
                <thead class="thead">
                <tr>
                    <th scope="col">����</th>
                    <th scope="col">3�ð�(������)</th>
                </tr>
                </thead>
                <tbody class="tbody">
                <tr>
                    <td>û�ҳ� ����</td>
                    <td>3,600��</td>
                </tr>
                <tr>
                    <td>����</td>
                    <td>4,900��</td>
                </tr>
                <tr>
                    <td>���</td>
                    <td>�ΰ���ġ�� ����</td>
                </tr>
                </tbody>
            </table>
            <table class="table">
                <caption>���α׷� ���ǥ ����</caption>
                <colgroup>
                    <col style="width: 140px;">
                    <col>
                </colgroup>
                <thead class="thead">
                <tr>
                    <th scope="col">����</th>
                    <th scope="col">6�ð� (������)</th>
                </tr>
                </thead>
                <tbody class="tbody">
                <tr>
                    <td>û�ҳ� ����</td>
                    <td>7,100��</td>
                </tr>
                <tr>
                    <td>����</td>
                    <td>9,800��</td>
                </tr>
                <tr>
                    <td>���</td>
                    <td>�ΰ���ġ�� ����</td>
                </tr>
                </tbody>
            </table>
            <table class="table">
                <caption>���α׷� ���ǥ ����</caption>
                <colgroup>
                    <col style="width: 140px;">
                    <col>
                </colgroup>
                <thead class="thead">
                <tr>
                    <th scope="col">����</th>
                    <th scope="col">1��2�� (ü����)</th>
                </tr>
                </thead>
                <tbody class="tbody">
                <tr>
                    <td>û�ҳ� ����</td>
                    <td>14,200��</td>
                </tr>
                <tr>
                    <td>����</td>
                    <td>19,500��</td>
                </tr>
                <tr>
                    <td>���</td>
                    <td>�ΰ���ġ�� ����</td>
                </tr>
                </tbody>
            </table>
            <div class="btn-area">
                <button type="button" class="btn btn-confirm is-active" onclick="closePopup('programAmtPop');">Ȯ��</button>
            </div>
        </div>
    </div>
</div>


<div class="modal-popup large" id="livingAmtPop">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title">��Ȱ�� ���ǥ ����</strong>
            <button type="button" class="btn-close" title="�ݱ�" onclick="closePopup('livingAmtPop');">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container">
            <table class="table">
                <caption>��Ȱ�� ���ǥ ����</caption>
                <colgroup>
                    <col style="width: 33%">
                    <col >
                </colgroup>
                <thead class="thead">
                	<tr>
	                	<th scope="col">��Ȱ��</th>
	                	<th scope="col">�̿��<br/>(1�ڱ��� / �ΰ���ġ�� ����)</th>
	                </tr>
                </thead>
                <tbody class="tbody">
	                <tr>
	                    <th class="ta-c" scope="row">AŸ��</th>
	                    <td class="ta-c">60,000��</td>
	                </tr>
	                <tr>
	                    <th class="ta-c" scope="row">BŸ��</th>
	                    <td class="ta-c">90,000��</td>
	                </tr>
	                <tr>
	                    <th class="ta-c" scope="row">CŸ��</th>
	                    <td class="ta-c">120,000��</td>
	                </tr>
                </tbody>
            </table>
            <div class="btn-area">
                <button type="button" class="btn btn-confirm is-active" onclick="closePopup('livingAmtPop');">Ȯ��</button>
            </div>
        </div>
    </div>
</div>


<div class="modal-popup large" id="gangdangAmtPop">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title">���� ���ǥ ����</strong>
            <button type="button" class="btn-close" title="�ݱ�" onclick="closePopup('gangdangAmtPop');">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container">
            <table class="table">
                <caption>���� ���ǥ ����</caption>
                <colgroup>
                    <col style="width: 140px;">
                    <col>
                    <col>
                    <col>
                </colgroup>
                <thead class="thead">
	                <tr>
	                    <th scope="col" rowspan="2">����</th>
	                    <th scope="col" colspan="2">�����</th>
	                    <th scope="col" rowspan="2">���</th>
	                </tr>
	                <tr>
	                    <th scope="col">4�ð�����</th>
	                    <th scope="col">8�ð�����</th>
	                </tr>
                </thead>
                <tbody class="tbody">
	                <tr>
	                    <td>����</td>
	                    <td>200,000��</td>
	                    <td>400,000��</td>
	                    <td>�� �ΰ���ġ�� ����</td>
	                </tr>
                </tbody>
            </table>
            <div class="btn-area">
                <button type="button" class="btn btn-confirm is-active" onclick="closePopup('gangdangAmtPop');">Ȯ��</button>
            </div>
        </div>
    </div>
</div>


<div class="modal-popup large" id="classAmtPop">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title">���� ���ǥ ����</strong>
            <button type="button" class="btn-close" title="�ݱ�" onclick="closePopup('classAmtPop');">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container">
            <table class="table">
                <caption>���� ���ǥ ����</caption>
                <colgroup>
                    <col style="width: 140px;">
                    <col>
                    <col>
                    <col>
                </colgroup>
                <thead class="thead">
                <tr>
                    <th scope="col" rowspan="2">����</th>
                    <th scope="col" colspan="2">�����</th>
                    <th scope="col" rowspan="2">���</th>
                </tr>
                <tr>
                    <th scope="col">4�ð�����</th>
                    <th scope="col">8�ð�����</th>
                </tr>
                </thead>
                <tbody class="tbody">
                <tr>
                    <td>����</td>
                    <td>125,000��</td>
                    <td>250,000��</td>
                    <td>�� �ΰ���ġ�� ����</td>
                </tr>
                </tbody>
            </table>
            <div class="btn-area">
                <button type="button" class="btn btn-confirm is-active" onclick="closePopup('classAmtPop');">Ȯ��</button>
            </div>
        </div>
    </div>
</div>


<div class="modal-popup large" id="mealAmtPop"></div>


<div class="modal-popup small" id="ecoReservationConfirm">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title">����Ϸ�ȳ�</strong>
            <button type="button" class="btn-close" title="�ݱ�">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container">
            <div class="center" data-area-name="reservation-popup-container">
                <i class="icon-check"></i>
                <strong class="title-1">������ �Ϸ�Ǿ����ϴ�.</strong>
                <p class="copy-mid">���� �����Ͻô� <em data-popup-information-eco="sttlmMtDtm"></em> ���� �Դϴ�.<br>�� ������ �ڵ� ��ҵǴ� ���� �Ͻñ� �ٶ��ϴ�.</p>
                <p class="copy-sm">���������� ���ǿ����� ���� Ȯ�� �� ������ ��� �������ּ���.</p>
            </div>
            <div class="btn-area">
                <a href="../mmb/mmbLogin.html" class="btn btn-link">���� ������ ����</a>
            </div>
        </div>
    </div>
</div>
			</div>
			
		<footer id="footer">
            <ul class="content">
                <li>
                    <address>(������������) ������ ���ֽ� ���ŷ� 22 (��)26466</address>
                </li>
                <li>����ڵ�Ϲ�ȣ: 211-82-06541</li>
                <li>����ȳ�: <a href="tel:1670-9201">1670-9201</a> (���� 09-18��, ���ɽð� 12-13��)</li>
                <li>FAX: 033-769-9579</li>
                <li>�̸���: csnp@knps.or.kr</li>
            </ul>
            <p class="copyright">Copyright@Korea National Park Service. All Rights Reserved.</p>
            <div class="policy-area">
                <a href="../contents/copyrightPolicy.html" class="btn">���۱���å</a>
                <a href="http://www.knps.or.kr/portal/main/contents.do?menuNo=7020135" class="btn" target="_blank" style="font-weight: bold; color: #0033cc; background: #ffffff;">��������ó����ħ</a>
            </div>
        </footer>


<div class="modal-popup small" id="confirmPop">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title" id="confirmTitle"></strong>
            <button type="button" class="btn-close" title="�ݱ�" onclick="closePopup('confirmPop');">
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
                <button class="btn btn-cancel forMypageClass" onclick="closePopup('confirmPop');">���</button>
                <button class="btn btn-confirm is-active" id="btn-confirm">Ȯ��</button>
            </div>
        </div>
    </div>
</div>


<div class="modal-popup small" id="alertPop">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title" id="alertTitle">�α���</strong>
            <button type="button" class="btn-close" title="�ݱ�" onclick="closePopup('alertPop');">
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
                <button class="btn btn-confirm is-active" onclick="closePopup('alertPop');">Ȯ��</button>
            </div>
        </div>
    </div>
</div>

<div class="modal-popup small" id="loginPopup">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title" id="loginTitle">�α���</strong>
            <button type="button" class="btn-close" title="�ݱ�" onclick="closePopup('loginPopup');">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container" id="loginPopupDiv">
        </div>
    </div>
</div>
<!-- ������ �����ֹι�ȣ ���� �˾� ȣ�� form -->
<form name="form_ipin" id="form_ipin" method="post">
    <!-- ��û��� (�ʼ� ������) -->
    <input type="hidden" name="m" value="pubmain">
    <!-- ������û ��ȣȭ ������ -->
    <input type="hidden" name="enc_data" id="enc_data" value="">
</form>
<!-- �������� ���� �˾��� ȣ���ϱ� ���ؼ��� ������ ���� form�� �ʿ��մϴ�. -->
<form name="form_chk" id="form_chk" method="post">
    <!-- �ʼ� ����Ÿ��, �����Ͻø� �ȵ˴ϴ�. -->
    <input type="hidden" name="m" value="checkplusService">
    <!-- ������û ��ȣȭ ������ -->
    <input type="hidden" name="EncodeData" id="EncodeData" value="">
</form>
	</div>
	<img id="loadingImage" src="../assets/img/preloader.gif" alt="�ε��̹���" style="position: absolute; left: 924.5px; top: 539.5px; z-index: 100000; display: none;">
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
