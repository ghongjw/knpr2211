<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>


<!DOCTYPE html>
<html lang="ko">

<!-- Mirrored from reservation.knps.or.kr:443/reservation/searchSimpleResidenceReservation.do by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 10 Nov 2022 06:59:25 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->
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

					<li><a href="javascript:void(0);" class="depth1">�̿�ȳ�</a>
						<ul class="depth2">

							<li><a href="../contents/C/serviceGuideIntro.html">�߿���</a></li>

							<li><a href="../contents/S/serviceGuideIntro.html">���Ǽ�</a></li>

							<li><a href="../contents/E/serviceGuideIntro.html">����Ž���</a></li>

							<li><a href="../contents/R/serviceGuideIntro.html">�ι���</a></li>

							<li><a href="../contents/T/serviceGuideIntro.html">Ž��ο�����</a></li>

							<li><a href="../contents/G/serviceGuideIntro.html">Ž�����α׷�</a></li>

						</ul></li>

					<li><a href="javascript:void(0);" class="depth1">�����ϱ�</a>
						<ul class="depth2">

							<li><a href="searchSimpleCampReservation.html">�߿���</a></li>

							<li><a href="shelter/searchSimpleShelterReservation.html">���Ǽ�</a></li>

							<li><a href="../eco/searchEcoReservation.html">����Ž���</a></li>

							<li><a href="searchSimpleResidenceReservation.html">�ι���</a></li>

							<li><a href="../trail/searchTrailReservation.html">Ž��ο�����</a></li>

							<li><a href="../trprogram/searchTrailProgram.html">Ž�����α׷�</a></li>

							<li><a href="selectCampLottery.html">��÷��</a></li>

						</ul></li>

					<li><a href="javascript:void(0);" class="depth1">�˸�����</a>
						<ul class="depth2">

							<li><a href="../community/board/notice/boardList.html">��������</a></li>

							<li><a href="../community/board/faq/boardList.html">�����ϴ�
									����</a></li>

							<li><a href="../community/board/qna/boardList.html">����
									���ϱ�</a></li>

							<li><a href="../contents/rsvtRefundPolicy.html">���ࡤȯ����å</a></li>

						</ul></li>

					<li><a href="javascript:void(0);" class="depth1">����������</a>
						<ul class="depth2">

							<li><a href="../mmb/mmbLogin.html">���� ������</a></li>

							<li><a href="../mmb/mmbLogin.html">�˸��޽���</a></li>

							<li><a href="../mmb/mmbLogin.html">���ã��</a></li>

							<li><a href="../srchrefund/requestRefund.html">��ȯ�ұ� ��ȸ</a></li>

						</ul></li>

					<li><a href="javascript:void(0);" class="depth1">�׸�����Ʈ</a>
						<ul class="depth2">

							<li><a href="../mmb/mmbLogin603d.html"
								onclick="fn_greenUrlChk();">�߿���</a></li>

							<li><a href="../mmb/mmbLogin603d.html?prdDvcd=S">���Ǽ�</a></li>

						</ul></li>

				</ul>
			</nav>
			<div class="util-area" data-device-mode="pc">
				<a href="../srchrefund/searchRefund.html" class="btn-refund-inquiry">
					<i class="icon-refund-inquiry"></i> <span>��ȯ�ұ���ȸ</span>
				</a>

				<!-- �� �α��� ���� -->
				<a href="../mmb/mmbLogin.html" class="btn-login"> <i
					class="icon-user-check"></i> <span>�α���</span>
				</a> <a
					href="https://www.knps.or.kr/portal/member/join01.do?menuNo=7020113"
					class="btn-join" target="_blank"> <i class="icon-user-plus"></i>
					<span>ȸ������</span>
				</a>


				<div class="lang-area">
					<button class="btn btn-toggle" data-popup="layer-language">
						<i class="icon-globe"></i> <span>KR</span>
					</button>
					<div class="layer-language" id="layer-language">
						<button class="btn is-active">KR</button>
						<button class="btn"
							onclick="location.href='../foreigner/main.html'">EN</button>
					</div>
				</div>
			</div>
			<div class="util-area" data-device-mode="mobile">
				<button class="btn-menu" title="��ü �޴� ����">
					<i class="icon-list"></i>
				</button>
				<div class="all-menu">
					<div class="head">
						<a href="../srchrefund/searchRefund.html"
							class="btn-refund-inquiry"> <i class="icon-refund-inquiry"></i>
							<span>��ȯ�ұ���ȸ</span>
						</a>

						<!-- �� �α��� ���� -->
						<a href="../mmb/mmbLogin.html" class="btn-login">�α�����<br>�ʿ��մϴ�.
						</a> <a
							href="https://www.knps.or.kr/portal/member/join01.do?menuNo=7020113"
							class="btn-join" target="_blank"> <i class="icon-user-plus"></i>
							<span>ȸ������</span>
						</a>
						<div class="lang-area">
							<button class="btn btn-toggle" data-popup="layer-language">
								<i class="icon-globe"></i> <span>KR</span>
							</button>
							<div class="layer-language" id="layer-language2">
								<button class="btn is-active">KR</button>
								<button class="btn"
									onclick="location.href='../foreigner/main.html'">EN</button>
							</div>
						</div>


						<button class="btn-close" title="��ü �޴� �ݱ�">
							<i class="icon-close"></i>
						</button>
					</div>
					<ul class="gnb">

						<li><a href="javascript:void(0);" class="depth1">�̿�ȳ�</a>
							<ul class="depth2">

								<li><a href="../contents/C/serviceGuideIntro.html">�߿���</a></li>

								<li><a href="../contents/S/serviceGuideIntro.html">���Ǽ�</a></li>

								<li><a href="../contents/E/serviceGuideIntro.html">����Ž���</a></li>

								<li><a href="../contents/R/serviceGuideIntro.html">�ι���</a></li>

								<li><a href="../contents/T/serviceGuideIntro.html">Ž��ο�����</a></li>

								<li><a href="../contents/G/serviceGuideIntro.html">Ž�����α׷�</a></li>

							</ul></li>

						<li><a href="javascript:void(0);" class="depth1">�����ϱ�</a>
							<ul class="depth2">

								<li><a href="searchSimpleCampReservation.html">�߿���</a></li>

								<li><a href="shelter/searchSimpleShelterReservation.html">���Ǽ�</a></li>

								<li><a href="../eco/searchEcoReservation.html">����Ž���</a></li>

								<li><a href="searchSimpleResidenceReservation.html">�ι���</a></li>

								<li><a href="../trail/searchTrailReservation.html">Ž��ο�����</a></li>

								<li><a href="../trprogram/searchTrailProgram.html">Ž�����α׷�</a></li>

								<li><a href="selectCampLottery.html" style="display: none;">��÷��</a></li>

							</ul></li>

						<li><a href="javascript:void(0);" class="depth1">�˸�����</a>
							<ul class="depth2">

								<li><a href="../community/board/notice/boardList.html">��������</a></li>

								<li><a href="../community/board/faq/boardList.html">�����ϴ�
										����</a></li>

								<li><a href="../community/board/qna/boardList.html">����
										���ϱ�</a></li>

								<li><a href="../contents/rsvtRefundPolicy.html">���ࡤȯ����å</a></li>

							</ul></li>

						<li><a href="javascript:void(0);" class="depth1">����������</a>
							<ul class="depth2">

								<li><a href="../mmb/mmbLogin.html">����
										������</a></li>

								<li><a href="../mmb/mmbLogin.html">�˸��޽���</a></li>

								<li><a href="../mmb/mmbLogin.html">���ã��</a></li>

								<li><a href="../srchrefund/requestRefund.html">��ȯ�ұ�
										��ȸ</a></li>

							</ul></li>

						<li><a href="javascript:void(0);" class="depth1">�׸�����Ʈ</a>
							<ul class="depth2">

								<li><a href="../mmb/mmbLogin603d.html"
									onclick="fn_greenUrlChk();">�߿���</a></li>

								<li><a href="../mmb/mmbLogin603d.html?prdDvcd=S">���Ǽ�</a></li>

							</ul></li>

					</ul>
				</div>
			</div>
		</header>
		<div id="container">





			<script src="../assets/js/lib/netfunnel.js"></script>
			<script>

    let selectStartDate = null;        //���õȽ��۳�¥
    let selectStartDayWeek = null;     //���õȽ��ۿ���

    let selectEndDate = null;          //���õ����ᳯ¥
    let selectEndDayWeek = null;       //���õ��������

    let selectCurDate = null;          //���� ���õ� ��¥

    let globalAmt = null;			   //������ ��ǰ����
    let globalPrdNm = null;			   //������ ��ǰ��

    var addOptionPrice = 0;

    //var prdCtgIdArr = [];

    $(function(){
        init.event();
    })

    let init = {
        event : function(){

            //�ι��� Ÿ�� �⺻ ����
            $('input[name="minbakChk"]:eq(0)').prop('checked', true);

            //�߰��ο� ���� -,+ ��ư Ŭ��
            $('.add').on('click', function(){

                //ü���Ⱓ ��(�ڼ�)
                var baksu = '';
                $('.length-stay').each(function(){
                    if($(this).hasClass('selected')) {
                        baksu = $(this).data('val');
                    }
                });

                //�ι��� �ܿ���Ȳ ���� ���� �ȵǾ� ���� �� ���� ���ϰ�
                var checkFlag = false;
                var selectBtnLen = $('input[name="selectBtn"]:checked').length;

                if(selectBtnLen == 0) {
                    checkFlag = false;
                }else {
                    checkFlag = true;
                }

                //üũ�� ���� ������
                if(!checkFlag) {
                    toastrMsg("�ι��� Ÿ���� �������ּ���.");
                    return false;
                }else {

                    //ó�� input ��
                    var inputVal = $('.addPeopleNum').val();

                    if($(this).hasClass('plus')) {	//�÷��� ��ư�� ��
                        if(inputVal < 2) {
                            //if(inputVal < 4)
                            inputVal++;
                        }
                    } else if($(this).hasClass('minus')) {	//���̳ʽ� ��ư�� ��
                        if(inputVal > 0) {
                            inputVal--;
                        } else if(inputVal <= 0) {
                            inputVal = 0;
                        }
                    }

                    //�ο� �߰��� �ݾ� ���
                    var addPrice = inputVal * addOptionPrice * baksu;
                    var bakPerPrice = globalAmt != 0 ? globalAmt.replace(/,/g, '') : globalAmt;
                    var totPrice = (Number(bakPerPrice) + (Number(inputVal*addOptionPrice)* Number(baksu))) ;

                    //�߰��ο� ���� input
                    $('.addPeopleNum').val(inputVal);

                    //�� �̿�ݾ� �߰��ο�
                    $('div.payment dl:eq(1)').find('dt:eq(0)').html('�߰��ο� : '+inputVal+'��');
                    $('div.payment dl:eq(1)').find('dd:eq(0)').html(numberWithCommas(addPrice)+'��');

                    $('.total').find('dd').html('<em>'+numberWithCommas(totPrice)+'</em>' +'��');
                }
            });

            //start �޷� Ŭ�� �̺�Ʈ
            $(".calendar-cell").click(function(){

                //����
                funcArray.eleHide();

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
                    $("#startDt").html(selectStartDate+" ["+funcArray.getDayWeekNm(selectStartDayWeek)+"]");
                    $("#endDt").html(selectStartDate+" ["+funcArray.getDayWeekNm(selectStartDayWeek)+"]");
                    $(".length-stay").removeClass('selected');

                    //��� ���ø� ����
                    funcArray.selectPreventEvent(selectStartDate.replace(/-/g, ''));

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
                    $("#startDt").html(selectCurDate+" ["+funcArray.getDayWeekNm(selectStartDayWeek)+"]");
                    $("#endDt").html(selectCurDate+" ["+funcArray.getDayWeekNm(selectStartDayWeek)+"]");
                    $(".length-stay").removeClass('selected');

                    //��� ���ø� ����
                    funcArray.selectPreventEvent(selectStartDate.replace(/-/g, ''));

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
                    $("#startDt").html(selectStartDate+" ["+funcArray.getDayWeekNm(selectStartDayWeek)+"]");
                    $("#endDt").html(selectStartDate+" ["+funcArray.getDayWeekNm(selectStartDayWeek)+"]");
                    $(".length-stay").removeClass('selected');

                }else{  //�׿� ������ ���� ����� ����

                    let nightDays = (new Date(selectCurDate) - new Date(selectStartDate))/1000/60/60/24;    //��¥���

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
                        $("#endDt").html(selectEndDate+" ["+funcArray.getDayWeekNm(selectEndDayWeek)+"]");
                        $(".length-stay").removeClass('selected');
                        $("#nightDays"+nightDays).addClass('selected');     //ü���Ⱓ ����

                        $('#lengthTxt').html('<em class="text-success">'+$("#nightDays"+nightDays).text()+'</em>�� �����ϼ̽��ϴ�.');	//���Ⱓ �ؽ�Ʈ

                        //���̰� ���õȰɷ� ǥ���ϱ�.
                        let date = new Date(selectStartDate);
                        for(let i=1; i<nightDays; i++){
                            date.setDate(date.getDate()+1);
                            $("."+date.getFullYear()+"-"+numPad(date.getMonth()+1,2)+"-"+numPad(date.getDate(),2)).addClass('selected');
                        }

                    }
                }

            });	//end �޷� Ŭ�� �̺�Ʈ

            //���ΰ�ħ ��ư
            $('button.btn-refresh').on('click', function(){
                location.href = 'searchSimpleResidenceReservation.html';
            });

            //�����ϱ� ��ư ��ȿ��(�ι����� �������ּ���)
            $(document).on('click', '.btn-register', function(e){

                e.stopImmediatePropagation();

                if($(this).attr('onclick') == '') {
                    e.preventDefault();
                    toastrMsg("���� �ɼ��� �������ּ���.");
                    return false;
                }
            });

            //ĸí input ���ڸ� �Է� ����
            $(document).on('keyup','#captInput', function () {

                let check = /^[0-9]+$/;

                if (!check.test($(this).val())) {
                    $(this).val('');
                    $('#btnSubmit').removeClass('is-active');

                } else {
                    if($(this).val().length == 4) {
                        $('#btnSubmit').addClass('is-active');
                    }
                }
            });

            //�ڵ����� �Է¹��� �˾� Ȯ�� ��ư
            $(document).on('click','#btnSubmit', function(e){
                e.stopImmediatePropagation();
                showLoading();

                setTimeout(function() {
                    funcArray.reserStart($('#txtShelterNm').text());
                    //hideLoading();
                },100);

            });
        }
    }

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

        //����
        eleHide : function() {
            $('.remainDiv').hide();
            $('.residenceProgram').hide();
            $('.addHum').hide();
            $('.totTitle').hide();
            $('div.payment').hide();
            $('.btn-register').closest('div').parent('div').hide();
            $('div.reserv').html('<a href="javascript:void(0);" onclick="" class="btn btn-register is-active">�����ϱ�</a>');
        },

        //����
        eleShow : function() {
            $('.remainDiv').show();
            $('.residenceProgram').show();
            $('.addHum').show();
            $('.totTitle').show();
            $('div.payment').show();
            $('.btn-register').closest('div').parent('div').show();
        },

        //'���' Ŭ�� ������ ��츸 ����° ���� 1�� ���� ����(�Խ� ������ �� �ƿ� ���ϰ� �ϱ�)
        selectPreventEvent : function(val) {
            
            if('20230101' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230102' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230103' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230104' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230105' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230106' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230107' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230108' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230109' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230110' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230111' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230112' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230113' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230114' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230115' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230116' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230117' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230118' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230119' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230120' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230121' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230122' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230123' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230124' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230125' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230126' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230127' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230128' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230129' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230130' == val) {
                funcArray.calendarClear();
                return false;
            }
            
            if('20230131' == val) {
                funcArray.calendarClear();
                return false;
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
            $('#lengthTxt').html('-');
            $(".length-stay").removeClass('selected');
            selectStartDate = null;
            selectEndDate = null;
        },
        //����ȸ �� �ʱ�ȭ
        clearSelectVal : function() {
            $('.addPeopleNum').val(0);	//�߰��ο�
            $('div.payment dl:eq(0)').find('dt').text('-');
            $('div.payment dl:eq(0)').find('dd').text('0��');
            $('div.payment dl:eq(1)').find('dt:eq(0)').text('-');	//��ǰ��
            $('div.payment dl:eq(1)').find('dd:eq(0)').text('0��');
            $('div.payment dl:eq(1)').find('dt:eq(1)').text('�߰��ο� : 0��');
            $('div.payment dl:eq(1)').find('dd:eq(1)').text('0��');
            $('.total').find('dd').html('<em>0</em>��');
        },
        //�ڵ����� �Է¹��� �˾� ��� ��
        removeReserLayer : function(){
            $("#automatic-character").hide();
            $("#pnlRsrImg").html("");
            $('#automatic-character').empty();
            maskBackgroundOff();
        },
        //����Ϸ� �˾� �ݱ�
        removeSucReservPop : function() {
            $('#reservation-information1').empty();
            closePopup('reservation-information1');
            //location.reload();
        },
        closeSucReservPop : function() {
            location.reload();
        },
        //F5 ���ΰ�ħ ����
        noRefreshEvent : function() {
            if (event.keyCode == 116) {
                event.keyCode= 2;
                return false;
            }
            else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82))
            {
                return false;
            }
        },
        //���� ���� ��
        checked : function(obj) {

            var id = $(obj).attr('id');
            var value = $(obj).val();
            var prdNm = $(obj).data('prdnm');
            var prdSalAmt = $(obj).data('amt');
            var remainCnt = $(obj).data('cnt');

            //���� ������ ����.
            globalAmt = prdSalAmt;

            $('input[name="selectBtn"]').each(function(){
                if($(this).attr('id') == id) {
                    $('#' + id).attr('checked', true);
                }else {
                    $(this).attr('checked', false);
                }
            });

            //ü���Ⱓ ��(�ڼ�)
            var baksu = '';
            $('.length-stay').each(function(){
                if($(this).hasClass('selected')) {
                    baksu = $(this).data('val');
                }
            });

            //���� �� �ݾ� ����
            var bakPerPrice = prdSalAmt != 0 ? prdSalAmt.replace(/,/g, '') : prdSalAmt;
            var totProdPrice = Number(bakPerPrice);
            var totPrice = (Number(bakPerPrice) + (Number($('.addPeopleNum').val()*addOptionPrice)* Number(baksu))) ;

            //��ǰ��� ��ǰ���� ����
            $('div.payment dl:eq(0)').find('dt:eq(0)').html(prdNm);
            $('div.payment dl:eq(0)').find('dd:eq(0)').html(numberWithCommas(totProdPrice)+'��');

            //�� �̿�ݾ� ���� (����) �ݾ�
            $('.total').find('dd').html('<em>'+numberWithCommas(totPrice)+'</em>' +'��');

            //��� �ɼ��� �� �������� �� �����ϱ� ��ư����(��ư ��Ȱ��ó�� Ȯ���غ����ҵ�..)
            if(selectStartDate != null && selectStartDate != '' && selectEndDate != null && selectEndDate != '') {
                if(selectStartDate != selectEndDate) {
                    $('div.reserv').html("<a href='javascript:void(0);' onclick=\"funcArray.goReserv('"+prdNm+"','"+value+"')"+"\" class='btn btn-register is-active'>�����ϱ�</a>");
                }
            }
        },
        //���α׷� �׸���
        drawProgram : function(){

            //���� �ʱ�ȭ
            funcArray.clearSelectVal();

            //���� ��¥ ���� ��ȿ�� üũ
            if(selectStartDate == null || selectStartDate == '' || selectEndDate == null || selectEndDate == '' || selectStartDate == selectEndDate) {
                toastrMsg("���೯¥�� �������ּ���.");
                return false;
            }

            var minbakChkFlag = false;
            var selectedPrdCtgId = '';

            $.each($('input[name="minbakChk"]'), function(){

                if($(this).is(':checked')) {
                    minbakChkFlag = true;
                    selectedPrdCtgId = $(this).val();
                }
            });

            //�ι��� Ÿ�� ���� üũ
            if(!minbakChkFlag) {
                toastrMsg("�ι��� Ÿ���� �������ּ���.");
                return false;
            }

            //üũ�� ��¥ ����� �迭 ���ؼ� ���� ����.
            var checkDateArr = new Array();

            $.each($('.calendar-cell'), function(){

                if($(this).hasClass('selected') && !$(this).hasClass('end')) {

                    var val = $(this).attr('id');

                    checkDateArr.push(val);
                }
            });
            NetFunnel_Action({action_id:'reservation4'},function(ev, ret){
                ajaxCall({
                    url :  '/reservation/getResidenceInsttGoodsInfo.do',
                    data : { 'deptId' 		: 'B221001'
                        , 'orgnztGbn' 	: '08'
                        , 'useBgnDt' 	: selectStartDate.replace(/-/g, '')
                        , 'useEndDt' 	: selectEndDate.replace(/-/g, '')
                        , 'selectedPrdCtgId' : selectedPrdCtgId
                        , 'checkDateArr' : checkDateArr
                    },
                    success: function(dat){

                        var reservList = dat.insttGoodsInfo;
                        var optionPrice = dat.optMap.OPT_SAL_AMT;
                        var tblHtml = '';

                        $(".residenceProgram .tbody").empty();

                        //�ι��� ������Ȳ �׸���
                        if(reservList != null && reservList != '' && reservList.length > 0) {

                            //���̱�
                            funcArray.eleShow();

                            $.each(reservList, function(i, item){
                                tblHtml +='<tr>';
                                tblHtml +='    <td><input type="radio" name="selectBtn" value="'+item.prdId+'" data-prdnm="'+item.prdNmTot+'" data-amt="'+numberWithCommas(item.prdSalAmt)+'" data-cnt="'+item.totcnt+'" onclick="funcArray.checked(this);"/></td>';
                                tblHtml +='    <td>'+item.prdNmTot+'</td>';
                                tblHtml +='    <td class="form">';
                                tblHtml +='			<span>'+item.resiRoomInfo+'</span>';
                                tblHtml +='    </td>';
                                tblHtml +='    <td>'+numberWithCommas(item.prdSalAmt)+'��</td>';
                                tblHtml +='</tr>';
                            });

                            //�ɼǱݾ� ����
                            if(optionPrice != null && optionPrice != '' && typeof optionPrice != 'undefined') {

                                if(optionPrice == 0) {
                                    optionPrice = 5000;
                                    addOptionPrice = optionPrice;
                                }else {
                                    addOptionPrice = optionPrice;
                                }
                            }

                            $("#drawImageButton").css("display","block");

                        } else {

                            //���̱�
                            funcArray.eleShow();

                            tblHtml +='<tr>';
                            tblHtml +='		<td colspan="4">';
                            tblHtml +='			<div class="nodata">';
                            tblHtml +='				<span>���డ���� ������ �����ϴ�. �ٸ� �������� ��ȸ���ּ���.</span>';
                            tblHtml +='			</div>';
                            tblHtml +='		</td>';
                            tblHtml +='</tr>';
                            $("#drawImageButton").css("display","none");

                        }

                        $(".residenceProgram .tbody").append(tblHtml);
                    },
                    complete : function(){
                        NetFunnel_Complete();
                        hideLoading();
                    }
                });
            });

        },//end ���α׷� �׸���

        //�ڵ����� �Է¹��� �˾� ����
        drawAutoPreventPop : function() {

            var autoHtml = '';

            autoHtml += '     <div class="popup-wrap" style="top: 65px; bottom: 150px;">';
            autoHtml += '         <div class="popup-head">';
            autoHtml += '             <strong class="popup-title">���డ��</strong>';
            autoHtml += '             <button type="button" class="btn-close" onclick="funcArray.removeReserLayer();" title="�ݱ�">';
            autoHtml += '                 <i class="icon-close"></i>';
            autoHtml += '             </button>';
            autoHtml += '         </div>';
            autoHtml += '         <div class="popup-container">';
            autoHtml += '             <table class="table">';
            autoHtml += '                 <caption>�ڵ����� �Է¹���</caption>';
            autoHtml += '                 <colgroup>';
            autoHtml += '                     <col style="width: 140px;">';
            autoHtml += '                     <col>';
            autoHtml += '                 </colgroup>';
            autoHtml += '                 <tbody class="tbody">';
            autoHtml += '                     <tr>';
            autoHtml += '                         <th scope="row">�����ǰ</th>';
            autoHtml += '                         <td id="txtShelterNm"></td>';
            autoHtml += '                     </tr>';
            autoHtml += '                     <tr>';
            autoHtml += '                         <th scope="row">���Ⱓ</th>';
            autoHtml += '						  <td id="selRsrvtQntt"></td>';
            autoHtml += '                     </tr>';
            autoHtml += '                     <tr>';
            autoHtml += '                         <th scope="row">�Խǳ�¥</th>';
            autoHtml += '                         <td id="txtUseBgnDate"></td>';
            autoHtml += '                     </tr>';
            autoHtml += '                     <tr>';
            autoHtml += '                         <th scope="row">��ǳ�¥</th>';
            autoHtml += '                         <td id="txtUseEndDate"></td>';
            autoHtml += '                     </tr>';
            autoHtml += '                     <tr>';
            autoHtml += '                         <th scope="row">�߰��ο�</th>';
            autoHtml += '                         <td id="addInwon"></td>';
            autoHtml += '                     </tr>';
            autoHtml += '                     <tr>';
            autoHtml += '                         <th scope="row">����(����)�ݾ�</th>';
            autoHtml += '                         <td id="selPrice"></td>';
            autoHtml += '                     </tr>';
            autoHtml += '                 </tbody>';
            autoHtml += '             </table>';
            autoHtml += '             <div class="captcha-area">';
            autoHtml += '                 <span class="label">�ڵ����� ��������</span>';
            autoHtml += '                 <span class="captcha" id="pnlRsrImg">ĸí����</span>';
            autoHtml += '                 <label for="captInput" class="hidden-text">�ڵ����� ��������</label><input type="text" class="input-text" id="captInput" title="�ڵ����� ��������" maxlength="4">';
            autoHtml += '             </div>';
            autoHtml += '             <p class="copy-notice">�� ���� �Ϸ�� ��ǰ�� ���ؼ��� ���������� ���ǿ����� ���� Ȯ�� �� ���� �����մϴ�.</p>';
            autoHtml += '             <div class="btn-area">';
            autoHtml += '                 <button class="btn btn-cancel" id="btnClose" onclick="funcArray.removeReserLayer();">���</button>';
            autoHtml += '                 <button class="btn btn-confirm is-active" id="btnSubmit">Ȯ��</button>';
            autoHtml += '             </div>';
            autoHtml += '         </div>';
            autoHtml += '     </div>';

            $('#automatic-character').append(autoHtml);

        },

        //����Ϸ� �˾�
        drawSucReservPop : function(prdNm, expiDtm) {

            var popHtml = '';

            popHtml += '<div class="popup-wrap">';
            popHtml += '	<div class="popup-head">';
            popHtml += '		<strong class="popup-title">����Ϸ�ȳ�</strong>';
            popHtml += '		<button type="button" class="btn-close" onclick="funcArray.closeSucReservPop();" title="�ݱ�">';
            popHtml += '			<i class="icon-close"></i>';
            popHtml += '		</button>';
            popHtml += '	</div>';
            popHtml += '	<div class="popup-container">';
            popHtml += '		<div class="center">';
            popHtml += '			<i class="icon-check"></i>';
            popHtml += '			<strong class="title-1">������ �Ϸ�Ǿ����ϴ�.</strong>';
            popHtml += '			<p class="copy-mid">'+prdNm+'�� <br>���� �����Ͻô� <em>'+expiDtm+'</em> ���� �Դϴ�.<br>�� ������ �ڵ� ��ҵǴ� ���� �Ͻñ� �ٶ��ϴ�.</p>';
            popHtml += '			<p class="copy-sm">���������� ���ǿ����� ���� Ȯ�� �� ������ ��� �������ּ���.</p>';
            popHtml += '		</div>';
            popHtml += '		<div class="btn-area">';
            popHtml += '			<a href="/mypage/dashBoard.do" class="btn btn-link">���� ������ ����</a>';
            popHtml += '		</div>';
            popHtml += '	</div>';
            popHtml += '</div>';

            $('#reservation-information1').append(popHtml);
            openPopup('reservation-information1');

        },

        //�����ϱ� �� �ڵ��������� �˾� ����
        beforeReser : function(prdNm, prdId) {

            var parkNm = '�¹��'; 	//��������
            var txtShelterNm = '';	//�ι��̸�
            var txtUseBgnDate = '';	//������
            var txtUseEndDate = '';	//������
            var selRsrvtQntt = '';	//�ڼ�
            var selPrice = '';		//����

            //�ڵ����� �Է¹��� �˾� ����
            funcArray.drawAutoPreventPop();

            //ü���Ⱓ ��(�ڼ�)
            var checkPer = '';
            $('.length-stay').each(function(){
                if($(this).hasClass('selected')) {
                    checkPer = $(this).data('val');
                    selRsrvtQntt = $(this).text();
                }
            });

            //������ �ι��� ��
            txtShelterNm = prdNm;
            //������
            txtUseBgnDate = $('#startDt').text();
            //������
            txtUseEndDate = $('#endDt').text();
            //����
            selPrice = $('.total').find('dd em').text();

            //�˾��� ����
            $('#txtShelterNm').html(txtShelterNm);		//�ι���
            $('#txtUseBgnDate').text(txtUseBgnDate);	//������
            $('#txtUseEndDate').text(txtUseEndDate);	//������
            $('#selRsrvtQntt').text(selRsrvtQntt);		//�ڼ�
            $('#selPrice').text(selPrice+'�� (�ΰ��� ����)');			//����
            $("#period").val(checkPer);					//ü���Ⱓ �� hidden
            $('#addInwon').text($('.addPeopleNum').val() == 0 ? '����' : $('.addPeopleNum').val()+'��');

            //�ڵ����� ��������
            $("#pnlRsrImg").html("");
            $("#pnlRsrImg").append("<img alt='�ڵ����� ��������'/>").find("img:last").attr("src", "/reserCaptcha.do?dummy=" + (new Date()).getTime());
            $('.input-text').val("");
            $('.input-text').attr('placeholder', '�� ���ڸ� �Է����ּ���.');
            $('.input-text').attr('name', 'captcha').addClass('txt-captcha');

            //�ڵ����� �Է¹��� �˾� ����
            $('#automatic-character').show();
            $('.txt-captcha').focus();

            //�⺻ hidden ����
            $("#fRsrvtQntt").val(1);
            $("#fUseBgnDtm").val(selectStartDate.replace(/-/g, ''));	//��������
            $('#fUseEndDtm').val(selectEndDate.replace(/-/g, ''));		//���������
            $("#fFcltId").val(prdId);	//��ǰID
            $("#fRsrvtType").val("R");

            //����󼼿� ���� �� �ٽ� ���� ���(��ǰ�ݾ� / �ڼ�)
            var totPrice = Number($('div.payment dl:eq(0)').find('dd:eq(0)').text().replace(/,/g, '').replace(/��/g, '')) / Number(checkPer);

            $('#detailPrice').val(totPrice);
        },

        //�����ϱ� ��ư Ŭ��
        goReserv : function(prdNm, prdId){

            //�α��� üũ
            ajaxCall({
                url :  '/common/ajax/checkResidencePolicy.do',
                data : {},
                success: function(dat){
                    //�����ϱ� �� �α����� �� �Ǿ� ���� ��
                    if(dat.result == 'NLOGIN'){
                        loginPopup("funcArray.goReserv('"+prdNm+"','"+prdId+"');");
                    } else {
                        //�����ϱ� �� �ڵ��������� �˾� ����
                        funcArray.beforeReser(prdNm, prdId);
                    }

                }
            });

        },

        //�����ϱ�
        reserStart : function(prdNm) {

            var txtCaptcha = $("#captInput");

            if(txtCaptcha.val() == null || txtCaptcha.val().trim() == "") {
                toastrMsg("�ڵ������������ �Է����ּ���.","��� �޽���","e");
                txtCaptcha.focus();
                return;
            }

            var prdId = $("input[name='selectBtn']:checked").val();
            var optionPrice = Number($('.addPeopleNum').val() * addOptionPrice);

            ajaxCall({
                url :  '/common/ajax/registerResidenceReser.do',
                data : { 'rsrvtQntt'  	: $("#fRsrvtQntt").val()
                    , 'deptId'	  	: $('#fDprtmId').val()
                    , 'prdId'	  	: prdId
                    , 'optionPrice'	: optionPrice
                    , 'useBgnDtm' 	: $("#fUseBgnDtm").val()
                    , 'useEndDtm' 	: $('#fUseEndDtm').val()
                    , 'rsvtMmbId' 	: 'ss1830'
                    , 'prdDvcd'   	: $("#fRsrvtType").val()
                    , 'rsvtTpcd'  	: '01'
                    , 'rsvtDvcd'  	: '01'
                    , 'rsvtStcd'  	: '20'
                    , 'period'    	: $("#period").val()
                    , 'price'     	: $('#detailPrice').val()
                    , 'pttNopCnt' 	: '1'
                    , 'addPeopleNum': $('.addPeopleNum').val()
                    , 'captcha'   	: $("#captInput").val()
                },
                success: function(dat){

                    //�˾� �ʱ�ȭ
                    funcArray.removeReserLayer();
                    funcArray.removeSucReservPop();

                    if(dat.result != null && dat.result != '') {
                        toastrMsg(dat.result);

                        if(dat.returnURL != null && dat.returnURL != '') {
                            location.href = dat.returnURL;
                        }
                        return false;
                    }

                    //��å
                    if(dat.resultCd != null && dat.resultCd != '') {

                        if(dat.resultCd == 'F') {
                            //toastrMsg(dat.resultMsg);
                            alertPopup({
                                title:'����Ұ� �ȳ�',
                                subTitle:'����Ұ� �ȳ�',
                                content:dat.resultMsg,
                                type:'error'
                            });
                            //hideLoading();
                            //return false;
                        } else if(dat.resultCd == 'S') {

                            var ymdhm = function(value){

                                if(value){
                                    var year = value.substring(0, 4);
                                    var month = value.substring(4, 6);
                                    var day = value.substring(6, 8);
                                    var hour = value.substring(8, 10);
                                    var minute = value.substring(10, 12);
                                    //var second = value.substring(12, 14);
                                    return year + '�� ' + month + '�� ' + day + '�� ' + hour + ':' + minute;
                                }
                                return '';
                            };

                            //STLM_EXPI_DTM ���������Ͻ�
                            if(dat.reservationMap != null && dat.reservationMap != '') {
                                //����Ϸ� �˾�
                                funcArray.drawSucReservPop(prdNm, ymdhm(dat.dataMap.sttlmMtDtm2));
                            }
                        }
                    }

                    hideLoading();
                }
            });
        },//reserStart end

        //���Ǻ���
        drawImage : function(){

            var minbakCheckLen = $('input[name="minbakChk"]:checked').length;
			var minbakPrdId = $("input[name='selectBtn']:checked").val();
            if(minbakCheckLen == 0) {
                toastrMsg("�ι��� Ÿ���� �������ּ���.");
                return false;
            }


            if(minbakPrdId == null || minbakPrdId == '') {
                toastrMsg("������ �������ּ���.");
                return false;
            }

            ajaxCall({
                url :  '/reservation/getResiInsttImages.do',
                data : { 'deptId' 	   : 'B221001',
                    'prdCtgId' : $('input[name="minbakChk"]:checked').val(),
                    'prdId'	   : minbakPrdId
                },
                dataType : 'html',
                success: function(dat) {
                    $("#resi-view").html('');
                    $("#resi-view").append(dat);
                    openPopup("resi-view");
                },
                error : function(){
                    toastrMsg("��ȸ �� ������ �߻��Ͽ����ϴ�.");
                }
            });
        },//end �̹��� load

    }
</script>
			<div class="page-location">
				<span>Ȩ</span> <span>�����ϱ�</span> <span>�ι���</span>
			</div>
			<div class="reservation responsive">
				<h3 class="title">�ι��� �����ϱ�</h3>
				<div class="title-area">
					<span class="label"><i class="icon-location"></i> �¹��</span>
					<h4 class="title">�¹�� �ι��� ������Ȳ</h4>
					<p class="copy">�ι����� ���ñⰣ ���� ���̵� �� 4������ ���ѵǸ�, ���� ��¥�� �ι����� ���úҰ�
						�մϴ�.</p>
				</div>
				<div class="box-guide">
					<div class="monthly-check">
						<strong class="title">�ι��� ���� �����Ͽ� ��ü ���� �ܿ���Ȳ�� ���� ��ư�� ����
							Ȯ�� ���� �մϴ�.</strong> <a href="searchResidenceMonthReservation.html"
							class="btn btn-monthly">���� �ܿ���Ȳ Ȯ��</a>
					</div>
					<ul class="dot-list">
						<li>�ι����� ���ñⰣ ���� ���̵� �� 4������ ���ѵǸ�, ���� ��¥�� �ι����� ���� �Ұ� �մϴ�.</li>
						<li>�α� �ι����� �̿��ڰ� ���� ������ �ϴ� ���� ���� ������ �� �ֽ��ϴ�.</li>
						<li>���� �¹�� �ڷγ�19 ��Ȳ �ּ� : <a
							href="https://www.taebaek.go.kr/intro.jsp">https://www.taebaek.go.kr/intro.jsp</a></li>
					</ul>
				</div>
				<!-- ������ ���� -->
				<div class="title-area">
					<h4 class="title">������ ����</h4>
					<div class="btn-area">
						<button class="btn btn-refresh">
							<i class="icon-refresh"></i> <span>���ΰ�ħ</span>
						</button>
					</div>
				</div>
				<div class="detail-info">
					<dl class="mb-block">
						<dt>������ ����</dt>
						<dd>
							<div class="calendar-container">
								<div class="calendar">
									<!-- ����� Ķ���� -->
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

											<!-- disabled -->
											<div class="calendar-cell     disabled  " data-date=""
												data-dayweek=""></div>

											<!-- disabled -->
											<div class="calendar-cell     disabled  " data-date=""
												data-dayweek=""></div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-01     disabled "
												data-date="2022-11-01" data-dayweek="2">1</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-02     disabled "
												data-date="2022-11-02" data-dayweek="3">2</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-03     disabled "
												data-date="2022-11-03" data-dayweek="4">3</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-04     disabled "
												data-date="2022-11-04" data-dayweek="5">4</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-05  sat   disabled "
												data-date="2022-11-05" data-dayweek="6">5</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-06   sun  disabled "
												data-date="2022-11-06" data-dayweek="7">6</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-07     disabled "
												data-date="2022-11-07" data-dayweek="1">7</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-08     disabled "
												data-date="2022-11-08" data-dayweek="2">8</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-09     disabled "
												data-date="2022-11-09" data-dayweek="3">9</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-10 today    disabled "
												data-date="2022-11-10" data-dayweek="4">10</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-11      "
												data-date="2022-11-11" data-dayweek="5">11</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-12  sat    "
												data-date="2022-11-12" data-dayweek="6">12</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-13   sun   "
												data-date="2022-11-13" data-dayweek="7">13</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-14      "
												data-date="2022-11-14" data-dayweek="1">14</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-15      "
												data-date="2022-11-15" data-dayweek="2">15</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-16      "
												data-date="2022-11-16" data-dayweek="3">16</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-17      "
												data-date="2022-11-17" data-dayweek="4">17</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-18      "
												data-date="2022-11-18" data-dayweek="5">18</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-19  sat    "
												data-date="2022-11-19" data-dayweek="6">19</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-20   sun   "
												data-date="2022-11-20" data-dayweek="7">20</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-21      "
												data-date="2022-11-21" data-dayweek="1">21</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-22      "
												data-date="2022-11-22" data-dayweek="2">22</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-23      "
												data-date="2022-11-23" data-dayweek="3">23</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-24      "
												data-date="2022-11-24" data-dayweek="4">24</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-25      "
												data-date="2022-11-25" data-dayweek="5">25</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-26  sat    "
												data-date="2022-11-26" data-dayweek="6">26</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-27   sun   "
												data-date="2022-11-27" data-dayweek="7">27</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-28      "
												data-date="2022-11-28" data-dayweek="1">28</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-29      "
												data-date="2022-11-29" data-dayweek="2">29</div>

											<!-- disabled -->
											<div class="calendar-cell 2022-11-30      "
												data-date="2022-11-30" data-dayweek="3">30</div>

										</div>
									</div>
								</div>

								<!-- ���� �� Ķ���� -->
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

											<div class="calendar-cell     disabled " data-date=""
												data-dayweek=""></div>

											<div class="calendar-cell     disabled " data-date=""
												data-dayweek=""></div>

											<div class="calendar-cell     disabled " data-date=""
												data-dayweek=""></div>

											<div class="calendar-cell     disabled " data-date=""
												data-dayweek=""></div>

											<div class="calendar-cell 2022-12-01     "
												data-date="2022-12-01" data-dayweek="4">1</div>

											<div class="calendar-cell 2022-12-02     "
												data-date="2022-12-02" data-dayweek="5">2</div>

											<div class="calendar-cell 2022-12-03  sat   "
												data-date="2022-12-03" data-dayweek="6">3</div>

											<div class="calendar-cell 2022-12-04   sun  "
												data-date="2022-12-04" data-dayweek="7">4</div>

											<div class="calendar-cell 2022-12-05     "
												data-date="2022-12-05" data-dayweek="1">5</div>

											<div class="calendar-cell 2022-12-06     "
												data-date="2022-12-06" data-dayweek="2">6</div>

											<div class="calendar-cell 2022-12-07     "
												data-date="2022-12-07" data-dayweek="3">7</div>

											<div class="calendar-cell 2022-12-08     "
												data-date="2022-12-08" data-dayweek="4">8</div>

											<div class="calendar-cell 2022-12-09     "
												data-date="2022-12-09" data-dayweek="5">9</div>

											<div class="calendar-cell 2022-12-10  sat   "
												data-date="2022-12-10" data-dayweek="6">10</div>

											<div class="calendar-cell 2022-12-11   sun  "
												data-date="2022-12-11" data-dayweek="7">11</div>

											<div class="calendar-cell 2022-12-12     "
												data-date="2022-12-12" data-dayweek="1">12</div>

											<div class="calendar-cell 2022-12-13     "
												data-date="2022-12-13" data-dayweek="2">13</div>

											<div class="calendar-cell 2022-12-14     "
												data-date="2022-12-14" data-dayweek="3">14</div>

											<div class="calendar-cell 2022-12-15     "
												data-date="2022-12-15" data-dayweek="4">15</div>

											<div class="calendar-cell 2022-12-16     "
												data-date="2022-12-16" data-dayweek="5">16</div>

											<div class="calendar-cell 2022-12-17  sat   "
												data-date="2022-12-17" data-dayweek="6">17</div>

											<div class="calendar-cell 2022-12-18   sun  "
												data-date="2022-12-18" data-dayweek="7">18</div>

											<div class="calendar-cell 2022-12-19     "
												data-date="2022-12-19" data-dayweek="1">19</div>

											<div class="calendar-cell 2022-12-20     "
												data-date="2022-12-20" data-dayweek="2">20</div>

											<div class="calendar-cell 2022-12-21     "
												data-date="2022-12-21" data-dayweek="3">21</div>

											<div class="calendar-cell 2022-12-22     "
												data-date="2022-12-22" data-dayweek="4">22</div>

											<div class="calendar-cell 2022-12-23     "
												data-date="2022-12-23" data-dayweek="5">23</div>

											<div class="calendar-cell 2022-12-24  sat   "
												data-date="2022-12-24" data-dayweek="6">24</div>

											<div class="calendar-cell 2022-12-25   sun  "
												data-date="2022-12-25" data-dayweek="7">25</div>

											<div class="calendar-cell 2022-12-26     "
												data-date="2022-12-26" data-dayweek="1">26</div>

											<div class="calendar-cell 2022-12-27     "
												data-date="2022-12-27" data-dayweek="2">27</div>

											<div class="calendar-cell 2022-12-28     "
												data-date="2022-12-28" data-dayweek="3">28</div>

											<div class="calendar-cell 2022-12-29     "
												data-date="2022-12-29" data-dayweek="4">29</div>

											<div class="calendar-cell 2022-12-30     "
												data-date="2022-12-30" data-dayweek="5">30</div>

											<div class="calendar-cell 2022-12-31  sat   "
												data-date="2022-12-31" data-dayweek="6">31</div>

										</div>
									</div>
								</div>

								<!--������ �� ��Ȱ��ȭ ���� -->
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
												data-date="2023-01-01" data-dayweek="7">1</div>

											<div class="calendar-cell 2023-01-02     disabled"
												data-date="2023-01-02" data-dayweek="1">2</div>

											<div class="calendar-cell 2023-01-03     disabled"
												data-date="2023-01-03" data-dayweek="2">3</div>

											<div class="calendar-cell 2023-01-04     disabled"
												data-date="2023-01-04" data-dayweek="3">4</div>

											<div class="calendar-cell 2023-01-05     disabled"
												data-date="2023-01-05" data-dayweek="4">5</div>

											<div class="calendar-cell 2023-01-06     disabled"
												data-date="2023-01-06" data-dayweek="5">6</div>

											<div class="calendar-cell 2023-01-07  sat   disabled"
												data-date="2023-01-07" data-dayweek="6">7</div>

											<div class="calendar-cell 2023-01-08   sun  disabled"
												data-date="2023-01-08" data-dayweek="7">8</div>

											<div class="calendar-cell 2023-01-09     disabled"
												data-date="2023-01-09" data-dayweek="1">9</div>

											<div class="calendar-cell 2023-01-10     disabled"
												data-date="2023-01-10" data-dayweek="2">10</div>

											<div class="calendar-cell 2023-01-11     disabled"
												data-date="2023-01-11" data-dayweek="3">11</div>

											<div class="calendar-cell 2023-01-12     disabled"
												data-date="2023-01-12" data-dayweek="4">12</div>

											<div class="calendar-cell 2023-01-13     disabled"
												data-date="2023-01-13" data-dayweek="5">13</div>

											<div class="calendar-cell 2023-01-14  sat   disabled"
												data-date="2023-01-14" data-dayweek="6">14</div>

											<div class="calendar-cell 2023-01-15   sun  disabled"
												data-date="2023-01-15" data-dayweek="7">15</div>

											<div class="calendar-cell 2023-01-16     disabled"
												data-date="2023-01-16" data-dayweek="1">16</div>

											<div class="calendar-cell 2023-01-17     disabled"
												data-date="2023-01-17" data-dayweek="2">17</div>

											<div class="calendar-cell 2023-01-18     disabled"
												data-date="2023-01-18" data-dayweek="3">18</div>

											<div class="calendar-cell 2023-01-19     disabled"
												data-date="2023-01-19" data-dayweek="4">19</div>

											<div class="calendar-cell 2023-01-20     disabled"
												data-date="2023-01-20" data-dayweek="5">20</div>

											<div class="calendar-cell 2023-01-21  sat   disabled"
												data-date="2023-01-21" data-dayweek="6">21</div>

											<div class="calendar-cell 2023-01-22   sun  disabled"
												data-date="2023-01-22" data-dayweek="7">22</div>

											<div class="calendar-cell 2023-01-23     disabled"
												data-date="2023-01-23" data-dayweek="1">23</div>

											<div class="calendar-cell 2023-01-24     disabled"
												data-date="2023-01-24" data-dayweek="2">24</div>

											<div class="calendar-cell 2023-01-25     disabled"
												data-date="2023-01-25" data-dayweek="3">25</div>

											<div class="calendar-cell 2023-01-26     disabled"
												data-date="2023-01-26" data-dayweek="4">26</div>

											<div class="calendar-cell 2023-01-27     disabled"
												data-date="2023-01-27" data-dayweek="5">27</div>

											<div class="calendar-cell 2023-01-28  sat   disabled"
												data-date="2023-01-28" data-dayweek="6">28</div>

											<div class="calendar-cell 2023-01-29   sun  disabled"
												data-date="2023-01-29" data-dayweek="7">29</div>

											<div class="calendar-cell 2023-01-30     disabled"
												data-date="2023-01-30" data-dayweek="1">30</div>

											<div class="calendar-cell 2023-01-31     disabled"
												data-date="2023-01-31" data-dayweek="2">31</div>

										</div>
									</div>
								</div>
							</div>
						</dd>
					</dl>
					<dl>
						<dt>���Ⱓ</dt>
						<dd id="lengthTxt">-</dd>
					</dl>
					<dl>
						<dt>�Խǳ�¥</dt>
						<dd id="startDt">-</dd>
					</dl>
					<dl>
						<dt>��ǳ�¥</dt>
						<dd id="endDt">-</dd>
					</dl>
					<dl>
						<dt>�ι��� Ÿ��</dt>
						<dd class="form">
							<ul class="radio-list" id="minbakTyps">

								<li><span class="radio-1"> <input type="radio"
										name="minbakChk" id="mbTp0" value="0300202"> <label
										for="mbTp0">������ 29.7��(9��/2��) ħ��</label>
								</span></li>

								<li><span class="radio-1"> <input type="radio"
										name="minbakChk" id="mbTp1" value="0300201"> <label
										for="mbTp1">������ 29.7��(9��/2��) �µ�</label>
								</span></li>

								<li><span class="radio-1"> <input type="radio"
										name="minbakChk" id="mbTp2" value="0300101"> <label
										for="mbTp2">������ 49.5��(15��/6��) ����</label>
								</span></li>

								<li><span class="radio-1"> <input type="radio"
										name="minbakChk" id="mbTp3" value="0300102"> <label
										for="mbTp3">������ 59.4��(18��/6��) ����</label>
								</span></li>

								<li><span class="radio-1"> <input type="radio"
										name="minbakChk" id="mbTp4" value="0300301"> <label
										for="mbTp4">��ü�� 105.6��(32��/13��) ����</label>
								</span></li>

							</ul>

						</dd>
					</dl>
					<dl style="display: none;">
						<dt>ü���Ⱓ</dt>
						<dd class="form">
							<div class="stay-row">
								<span class="length-stay" id="nightDays1" data-val="1">1��
									2��</span> <span class="length-stay" id="nightDays2" data-val="2">2��
									3��</span> <span class="length-stay" id="nightDays3" data-val="3">3��
									4��</span>
							</div>
						</dd>
					</dl>
				</div>

				<button class="btn btn-search" onclick="funcArray.drawProgram();">
					<i class="icon-search"></i> <span>�ι��� �ܿ���Ȳ ��ȸ</span>
				</button>

				<div class="title-area remainDiv" style="display: none;">
					<h4 class="title">�ι��� �ܿ���Ȳ</h4>
					<div class="btn-area">
						<button class="btn btn-view" onclick="funcArray.drawImage();"
							id="drawImageButton" style="display: none">���� ����</button>
					</div>
				</div>
				<table class="table residenceProgram" style="display: none;">
					<caption>�ι��� ������Ȳ</caption>
					<colgroup>
						<col style="width: 8%;">
						<col style="width: 40%">
						<col>
						<col>
					</colgroup>
					<thead class="thead">
						<tr>
							<th scope="col">����</th>
							<th scope="col">����</th>
							<th scope="col">����</th>
							<th scope="col">�̿�ݾ�</th>
						</tr>
					</thead>
					<tbody class="tbody">
					</tbody>
				</table>

				<!-- �߰��ο� ���� �κ� -->
				<div class="border-box mt-10 addHum" style="display: none;">
					<div class="option-wrap">
						<h5>�߰��ο� ����</h5>
						<ul class="option-list">
							<li><span class="quantity-input">
									<button class="btn minus add" id="minusB">
										<i class="icon-minus"></i>
									</button> <label for="addPeopleNum" class="hidden-text">�������ο�</label> <input
									type="number" class="addPeopleNum" id="addPeopleNum" value="0"
									readonly="" title="�� ���� �ο�">
									<button class="btn plus add" id="plusB">
										<i class="icon-plus"></i>
									</button>
							</span></li>
						</ul>
						<ul class="mt-10">
							<li>�� ������ �ü��� ���� ������ �� �̿�ݾ��� Ȯ���ϰ� �����ϱ� ��ư�� ������ �ٷ� ������ �Ϸ�˴ϴ�.</li>
							<li>�� ����Ϸ� �� ��ٷ� �ٸ� �ü� ������ �����մϴ�.</li>
							<li>�� ���� �����ο� �� �ο��� �߰��� ���, 1�� 1�ڴ� 5,000���� �߰��˴ϴ�. (�ִ� 2��)</li>
						</ul>
					</div>
				</div>

				<!-- �� �̿�ݾ� �κ� -->
				<div class="title-area totTitle" style="display: none;">
					<h4 class="title">�� �̿�ݾ�</h4>
				</div>

				<div class="payment" style="display: none;">
					<dl>
						<dt>-</dt>
						<dd>0��</dd>
					</dl>
					<dl>
						<dt>�߰��ο� : 0��</dt>
						<dd>0��</dd>
					</dl>
					<dl class="total">
						<dt>����(����)�ݾ�</dt>
						<dd>
							<em>0</em>��
						</dd>
					</dl>
				</div>

				<div class="board-bottom" style="display: none;">
					<div class="center reserv">
						<a href="javascript:void(0);" onclick=""
							class="btn btn-register is-active">�����ϱ�</a>
					</div>
				</div>
			</div>


			<form id="frmReservation" method="post"
				class="frm-select-reservation"
				action="https://reservation.knps.or.kr:443/reservation/selectResidenceReservation.action">
				<input type="hidden" name="rsrvtQntt" id="fRsrvtQntt" value="" /> <input
					type="hidden" name="useStDt" id="fUseBgnDtm" value="" /> <input
					type="hidden" name="useEdDt" id="fUseEndDtm" value="" /> <input
					type="hidden" name="fcltId" id="fFcltId" value="" /> <input
					type="hidden" name="dprtmId" id="fDprtmId" value="B221001" /> <input
					type="hidden" name="rsrvtType" id="fRsrvtType" value="" /> <input
					type="hidden" name="period" id="period" value="" /> <input
					type="hidden" name="detailPrice" id="detailPrice" value="" />
			</form>

			<div class="modal-popup small" id="automatic-character"
				style="display: none;"></div>
			<div class="modal-popup small" id="reservation-information1"></div>
			<div class="modal-popup large" id="resi-view"></div>
		</div>

		<footer id="footer">
			<ul class="content">
				<li>
					<address>(������������) ������ ���ֽ� ���ŷ� 22 (��)26466</address>
				</li>
				<li>����ڵ�Ϲ�ȣ: 211-82-06541</li>
				<li>����ȳ�: <a href="tel:1670-9201">1670-9201</a> (���� 09-18��,
					���ɽð� 12-13��)
				</li>
				<li>FAX: 033-769-9579</li>
				<li>�̸���: csnp@knps.or.kr</li>
			</ul>
			<p class="copyright">Copyright@Korea National Park Service. All
				Rights Reserved.</p>
			<div class="policy-area">
				<a href="../contents/copyrightPolicy.html" class="btn">���۱���å</a> <a
					href="http://www.knps.or.kr/portal/main/contents.do?menuNo=7020135"
					class="btn" target="_blank"
					style="font-weight: bold; color: #0033cc; background: #ffffff;">��������ó����ħ</a>
			</div>
		</footer>


		<div class="modal-popup small" id="confirmPop">
			<div class="popup-wrap">
				<div class="popup-head">
					<strong class="popup-title" id="confirmTitle"></strong>
					<button type="button" class="btn-close" title="�ݱ�"
						onclick="closePopup('confirmPop');">
						<i class="icon-close"></i>
					</button>
				</div>
				<div class="popup-container">
					<div class="center">
						<i class="icon-error"></i> <strong class="title-1"
							id="confirmSubTitle"></strong>
						<p class="copy-mid" id="confirmContent"></p>
						<p class="copy-sm" id="confirmSubContent"></p>
					</div>
					<div class="btn-area">
						<button class="btn btn-cancel forMypageClass"
							onclick="closePopup('confirmPop');">���</button>
						<button class="btn btn-confirm is-active" id="btn-confirm">Ȯ��</button>
					</div>
				</div>
			</div>
		</div>


		<div class="modal-popup small" id="alertPop">
			<div class="popup-wrap">
				<div class="popup-head">
					<strong class="popup-title" id="alertTitle">�α���</strong>
					<button type="button" class="btn-close" title="�ݱ�"
						onclick="closePopup('alertPop');">
						<i class="icon-close"></i>
					</button>
				</div>
				<div class="popup-container">
					<div class="center">
						<i class="icon-error"></i> <strong class="title-1"
							id="alertSubTitle"></strong>
						<p class="copy-mid" id="alertContent"></p>
						<p class="copy-sm" id="alertSubContent"></p>
					</div>
					<div class="btn-area">
						<button class="btn btn-confirm is-active"
							onclick="closePopup('alertPop');">Ȯ��</button>
					</div>
				</div>
			</div>
		</div>

		<div class="modal-popup small" id="loginPopup">
			<div class="popup-wrap">
				<div class="popup-head">
					<strong class="popup-title" id="loginTitle">�α���</strong>
					<button type="button" class="btn-close" title="�ݱ�"
						onclick="closePopup('loginPopup');">
						<i class="icon-close"></i>
					</button>
				</div>
				<div class="popup-container" id="loginPopupDiv"></div>
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
	<img id="loadingImage" src="../assets/img/preloader.gif" alt="�ε��̹���"
		style="position: absolute; left: 924.5px; top: 539.5px; z-index: 100000; display: none;">
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

<!-- Mirrored from reservation.knps.or.kr:443/reservation/searchSimpleResidenceReservation.do by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 10 Nov 2022 06:59:25 GMT -->
</html>
