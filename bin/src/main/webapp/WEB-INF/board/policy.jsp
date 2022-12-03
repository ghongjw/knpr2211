<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>policy</title>
</head>
<body>
<%@ include file="../common/header.jsp" %>
	<div id="wrap" class="sub">
			<div id="container">
				

<script>
    $(function(){
        $('.nav-tabs > li').click(function() {
            event.preventDefault();
            $(".nav-tabs > li").removeClass('is-active');
            $(this).addClass('is-active');
            $('.tab-content > div').removeClass('is-active');
            $("#" + $(this).data("tabid")).addClass('is-active');
        });
    })

</script>
<div class="page-location">
    <span>홈</span>
    <span>알림마당</span>
    <span>예약 · 환불정책</span>
</div>
<div class="notification">
    <h3 class="title">예약 · 환불정책</h3>
    <ul class="nav-tabs">
        <li class="is-active" data-tabid="tab1"><a href="javascript:void(0);">예약신청 안내</a></li>
        <li data-tabid="tab2" class=""><a href="javascript:void(0);">대기 예약 안내</a></li>
        <li data-tabid="tab3" class=""><a href="javascript:void(0);">결제 및 환불 안내</a></li>
        <li data-tabid="tab4" class=""><a href="javascript:void(0);">감면율 안내</a></li>
        <li data-tabid="tab5" class=""><a href="javascript:void(0);">부도자 이용 제한 안내</a></li>
        <li data-tabid="tab6" class=""><a href="javascript:void(0);">그린포인트</a></li>
        <li data-tabid="tab7" class=""><a href="javascript:void(0);">추첨제 안내</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane is-active" id="tab1">
            <div class="scroll-x">
                <table class="table">
                    <caption>예약 및 취소/변경</caption>
                    <colgroup>
                        <col style="width: 8%;">
                        <col style="width: 10%;">
                        <col>
                        <col>
                        <col>
                        <col>
                        <col>
                        <col>
                    </colgroup>
                    <thead class="thead">
                    <tr>
                        <th scope="col">구분</th>
                        <th scope="col">세부내용</th>
                        <th scope="col">대피소</th>
                        <th scope="col">야영장</th>
                        <th scope="col">태백산 민박촌</th>
                        <th scope="col">생태탐방원</th>
                        <th scope="col">탐방로예약제</th>
                        <th scope="col">탐방프로그램</th>
                    </tr>
                    </thead>
                    <tbody class="tbody">
                    <tr>
                        <td rowspan="6">예약신청</td>
                        <td rowspan="2">개시일 기준<br>(공지팝업 참고)</td>
                        <td colspan="2">매월 2회(1일, 15일)</td>
                        <td>매월 1회(1일)</td>
                        <td>매월 1회(1일)</td>
                        <td>매월 2회(1일, 15일)</td>
                        <td rowspan="2">상시</td>
                    </tr>
                    <tr>
                        <td colspan="5">※개시일이 공휴일, 주말인 경우 다음 평일에 개시(공통)</td>
                    </tr>
                    <tr>
                        <td>개시 시간</td>
                        <td>10:00 ~</td>
                        <td>14:00 ~</td>
                        <td>17:00 ~</td>
                        <td>17:00 ~</td>
                        <td>10:00 ~</td>
                        <td>해당없음</td>
                    </tr>
                    <tr>
                        <td rowspan="2">최대<br>예약건수</td>
                        <td rowspan="2">개시기간(15일) 내<br>1인당 2건, 5명까지<br>※지리산 종주 시는 3건</td>
                        <td>개시기간(15일)내<br>1인당 2건<br>(2박 3일까지 가능)</td>
                        <td>개시기간(30일)내<br>1인당 4건<br>(3박 4일까지 가능)</td>
                        <td>개시기간(30일)내<br>1인당 4건<br>(3박 4일까지 가능)</td>
                        <td rowspan="2">개시기간(15일)내<br>1인당 2건<br>*우이령은 제한없음</td>
                        <td rowspan="2">제한 없음</td>
                    </tr>
                    <tr>
                        <td colspan="3">※예약 개시 대상일의 마지막 날은 1박 2일만 가능</td>
                    </tr>
                    <tr>
                        <td>당일 예약</td>
                        <td>~15시</td>
                        <td>~15시</td>
                        <td>~15시</td>
                        <td>(해당 탐방원으로<br>전화 문의)</td>
                        <td>(전일 17시 마감)<br> (※우이령, 노고단은 당일 16시까지 예약가능)</td>
                        <td>(2일전 마감)</td>
                    </tr>
                    <tr>
                        <td rowspan="2">취소/변경</td>
                        <td>예약 취소</td>
                        <td colspan="4">미결제 시 : 예약 후 익일 22:00까지 미입금되면 자동 취소<br>결제 시 : 본인 변경/취소하는 경우 사용당일 12시 이전까지 가능, 부도자 미적용</td>
                        <td>취소가능</td>
                        <td>취소가능</td>
                    </tr>
                    <tr>
                        <td>예약 변경</td>
                        <td>(변경/삭제)동행인<br>(변경)동일 사무소 대피소간<br>*1회 한정</td>
                        <td>(취소)1박/옵션<br>(변경)차량번호, 동일 야영장 동가 사이트<br>*1회 한정</td>
                        <td>(취소)숙박, 인원옵션</td>
                        <td>(취소)옵션취소</td>
                        <td>(변경/삭제)인원</td>
                        <td>-</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="tab-pane" id="tab2">
            <div class="fixed">
                <table class="table">
                    <caption>대기 예약 안내</caption>
                    <colgroup>
                        <col>
                        <col>
                        <col>
                    </colgroup>
                    <thead class="thead">
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">대피소</th>
                        <th scope="col">야영장</th>
                    </tr>
                    </thead>
                    <tbody class="tbody">
                    <tr>
                        <td>대기정원</td>
                        <td>정원의 10%</td>
                        <td>1사이트당 1개</td>
                    </tr>
                    <tr>
                        <td>대기 가능 건수<br>[예약가능기간(약15일)기준]</td>
                        <td colspan="2">1인당 3건<br>※ 최대 예약 건수(2건)을 초과할 경우, 신청이 자동 취소됩니다.<br>※ 예약전환을 포함한 총 예약 건수가  2건을 초과할 경우, 잔여 대기신청은 자동 취소됩니다.</td>
                    </tr>
                    <tr>
                        <td>대기자 일괄 취소</td>
                        <td colspan="2">사용예정일 이틀전 밤 12시(전일 0시) 일괄 취소<br>※야영장의 경우 앞 예약자가 결제시에도 자동취소</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <dl class="rule">
                <dt>대기 예약 주의 사항</dt>
                <dd>
                    야영장 대기는 원 예약자가 결제하지 않은 경우(예약상태)에만 대기 신청이 가능합니다. 원 예약자가 결제할 경우 대기가 자동으로 취소됩니다.<br>
                    대기자에서 예약자로 전환되면 예약 결제 안내 문자가 발송됩니다.<br>
                    단, 예약 전환 시 발송되는 문자는 부가서비스이므로, 잘못된 연락처 및 통신사 환경 등에 따라 전송이 실패할 수도 있습니다.<br>
                    이에 따른 피해에 대해서는 국립공원공단에서 보상하지 않습니다.<br>
                    반드시 '나의 예약 정보'에서 예약상태를 확인하여 주시기 바랍니다.</dd>
            </dl>
        </div>
        <div class="tab-pane" id="tab3">
            <ul class="dot-list">
                <li>
                    <strong>결제 방법</strong><span> : 카드 결제, 실시간 계좌 이체, 무통장 입금 (카카오페이, 네이버페이, 삼성페이 등 간편결제 포함)</span>
                </li>
                <li><strong>가상 계좌 발급 및 결제</strong><span> : 가상 계좌 및 실시간 계좌 이체 서비스 이용 시 해당 은행별 업무 마감 시간을 반드시 확인 부탁드립니다. 밤 10시 이전에 가상 계좌 발급 및 결제 서비스를 이용하시기 바랍니다.</span></li>
                <li><span>이용금액 기준은 주중, 주말 및 집중수요기간에 따라 다릅니다. 아래 표를 참고하시기 바랍니다.</span></li>
            </ul>
            <!-- 2022.06.13 스크롤 삭제 -->
            <div class="fixed">
                <table class="table">
                    <caption>결제 및 환불 안내</caption>
                    <colgroup>
                        <col>
                        <col>
                        <col>
                        <col>
                        <col>
                    </colgroup>
                    <thead class="thead">
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">대피소</th>
                        <th scope="col">야영장</th>
                        <th scope="col">민박촌</th>
                        <th scope="col">생태탐방원</th>
                    </tr>
                    </thead>
                    <tbody class="tbody">
                    <tr>
                        <td>주중</td>
                        <td colspan="2">법정공휴일의 전일을 제외한 매주 일요일 ~ 목요일</td>
                        <td rowspan="2">(비수기) 3~6, 9~12월</td>
                        <td rowspan="2">구분없음</td>
                    </tr>
                    <tr>
                        <td>주말</td>
                        <td colspan="2">매주 금요일, 토요일, 법정공휴일의 전일(임시공휴일 제외)</td>
                    </tr>
                    <tr>
                        <td>집중수요기간</td>
                        <td colspan="2">7.1 ~ 8.31, 10.1 ~ 11.15</td>
                        <td>(성수기) 1,2,7,8월</td>
                        <td>구분없음</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <h4 class="title">결제 취소 시 위약금 발생</h4>
            <!-- 2022.06.13 스크롤 삭제 -->
            <div class="fixed">
                <table class="table">
                    <caption>결제 취소 시 위약금 발생</caption>
                    <colgroup>
                        <col>
                        <col>
                        <col>
                    </colgroup>
                    <thead class="thead">
                    <tr>
                        <th scope="col" rowspan="2">구분</th>
                        <th scope="col" colspan="2">환불기준</th>
                    </tr>
                    <tr>
                        <th scope="col">사용예정일</th>
                        <th scope="col">환불</th>
                    </tr>
                    </thead>
                    <tbody class="tbody">
                    <tr>
                        <td rowspan="4">예약자의 책임있는 사유로 취소한 경우</td>
                        <td>사용예정일 3일 전에 취소 또는 결제 당일 취소</td>
                        <td>예약금 전액 환불</td>
                    </tr>
                    <tr>
                        <td>사용예정일 2일 전에 취소</td>
                        <td>예약금의 10% 공제 후 환불</td>
                    </tr>
                    <tr>
                        <td>사용 예정일 1일 전에 취소</td>
                        <td>예약금의 20% 공제 후 환불</td>
                    </tr>
                    <tr>
                        <td>사용 예정일 당일 취소 또는 미 사용자</td>
                        <td>예약금의 30% 공제 후 환불</td>
                    </tr>
                    <tr>
                        <td rowspan="4">국립공원의 책임있는 사유로 취소한 경우</td>
                        <td>사용 예정일 3일 전까지 통보</td>
                        <td>예약금 전액 환불</td>
                    </tr>
                    <tr>
                        <td>사용 예정일 2일 전까지 통보</td>
                        <td>예약금의 110% 환불</td>
                    </tr>
                    <tr>
                        <td>사용 예정일 1일 전까지 통보</td>
                        <td>예약금의 120% 환불</td>
                    </tr>
                    <tr>
                        <td>사용예정일 당일 통보</td>
                        <td>손해배상 + 예약금 전액 환불</td>
                    </tr>
                    <tr>
                        <td>사용료 반환</td>
                        <td colspan="2" class="ta-l">※「재난 및 안전관리 기본법」제3조에 따른 재난 또는 기상특보(예비특보 포함)로 사용을 중단하게 될 경우 제13조2제4항을 준용</td>
                    </tr>
                    <tr>
                        <td>위약금 미부과</td>
                        <td colspan="2" class="ta-l">※「재난 및 안전관리 기본법」제3조에 따른 재난 또는 기상특보(예비특보 포함)로 인하여 예약자의 이동 또는 예약시설의 접근이 곤란하다고 예약업무 담당부서 또는 사무소장이 인정하는 경우</td>
                    </tr>
                    <tr>
                        <td>손해배상</td>
                        <td colspan="2" class="ta-l">
                            <ul>
                                <li>※ 전염병 확진자의 방문에 따른 시설 일시 폐쇄 등 공단의 책임없는 사유로 예약의 목적을 달성할 수 없는 경우, 손해배상을 하지 아니함</li>
                                <li>※「재난 및 안전관리 기본법」 제3조에 따른 재난 또는 기상특보(예비특보 포함)로 시설 사용자(예약자)의 사용 제한 및 퇴장을 명할 경우, 손해배상을 하지 아니함</li>
                                <li>※ 국립공원의 책임있는 사유로 예약취소 시 손해배상금액은 공단 여비규칙 별표1의 국내여비 지급표를 준용</li>
                            </ul>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <ul class="dot-list">
                <li>결제 당일 취소시 100% 환불</li>
                <li>환불은 예약취소 후 은행영업일 기준 3~7일 정도(토, 일, 공휴일 포함) 소요되며, 국립공원공단의 환불규정에 따라 위약금을 공제한 금액이 환불됩니다.</li>
            </ul>
        </div>
        <div class="tab-pane" id="tab4">
            <div class="fixed">
                <table class="table">
                    <caption>결제 및 환불 안내</caption>
                    <colgroup>
                        <col>
                        <col>
                        <col>
                        <col>
                    </colgroup>
                    <thead class="thead">
                    <tr>
                        <th scope="col" colspan="2">구분</th>
                        <th scope="col">대피소(본인만 해당)</th>
                        <th scope="col">야영장</th>
                    </tr>
                    </thead>
                    <tbody class="tbody">
                    <tr>
                        <td rowspan="3">국가보훈 대상자</td>
                        <td>1~3급</td>
                        <td>100%</td>
                        <td>100%<br>감면 대상자 외 추가 인원이 있을 경우,<br>감면율 50%</td>
                    </tr>
                    <tr>
                        <td>4~7급</td>
                        <td>50%</td>
                        <td>50%</td>
                    </tr>
                    <tr>
                        <td>등급 외 (무공, 보국수훈자, 배우자, 유족 등)</td>
                        <td>50%</td>
                        <td>50%</td>
                    </tr>
                    <tr>
                        <td rowspan="2">장애인</td>
                        <td>중증, 1~3급(보호자 1명)</td>
                        <td>100%</td>
                        <td>100%<br>감면 대상자 외 추가 인원이 있을 경우,<br>감면율 50%</td>
                    </tr>
                    <tr>
                        <td>경증, 4~6급</td>
                        <td>50%</td>
                        <td>50%</td>
                    </tr>
                    <tr>
                        <td colspan="2">5.18 민주 유공자</td>
                        <td>50%</td>
                        <td>50%</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <ul class="dot-list">
                <li>풀옵션, 카라반(체류형), 자연의집, 전기·옵션 등 제외</li>
                <li>감면 사유가 중복되는 경우에는 사용자에게 유리한 한 가지만 적용</li>
            </ul>
            <h4 class="title">국립공원 시설 사용료 감면 절차</h4>
            <div class="step">
                <ul class="step-list">
                    <li>
                        <em>STEP 1</em>
                        <span>시설예약</span>
                    </li>
                    <li>
                        <em>STEP 2</em>
                        <span>예약자 정보란 체크<br>(장애인, 국가유공자)</span>
                    </li>
                    <li>
                        <em>STEP 3</em>
                        <span>결제</span>
                    </li>
                    <li>
                        <em>STEP 4</em>
                        <span>현장 본인 확인</span>
                    </li>
                    <li>
                        <em>STEP 5</em>
                        <span>본인 확인 후 환불 처리<br>및 감면율 적용 재결제</span>
                    </li>
                </ul>
            </div>
            <ul class="dot-list">
                <li>현장 본인 확인을 위해 예약자 본인의 예약 확인증, 국가유공자·장애인증 반드시 지참 (가족증은 해당 되지 않습니다)</li>
            </ul>
        </div>
        <div class="tab-pane" id="tab5">
            <div class="fixed">
                <table class="table">
                    <caption>부도자 이용 제한 안내</caption>
                    <colgroup>
                        <col>
                        <col>
                        <col>
                    </colgroup>
                    <thead class="thead">
                    <tr>
                        <th scope="col">부도횟수</th>
                        <th scope="col">1회</th>
                        <th scope="col">2회 이상</th>
                    </tr>
                    </thead>
                    <tbody class="tbody">
                    <tr>
                        <td>제한 기간</td>
                        <td>1개월</td>
                        <td>3개월</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <ul class="dot-list">
                <li>벌칙 부과 후 1년간 추가 예약 부도가 없을 경우 기록 소멸</li>
                <li>단체에서 예약 부도 후 위약금을 미납하는 경우 전 탐방원에 위약금 내용을 고지하고 1년 동안 생태탐방원 예약 및 이용 제한</li>
                <li>본인이 예약시스템으로 이용일 당일 12시 전에 취소시(상태: 예약취소(본인)) 예약부도 면제 됩니다. 관리자 취소시에는 예약부도자 처리 됩니다.</li>
            </ul>
        </div>
        <div class="tab-pane" id="tab6">
            <dl class="txt-area">
                <dt>그린포인트란?</dt>
                <dd>국립공원 내 버려진 쓰레기 수거 및 자기 쓰레기를 되가져 가는 경우 포인트를 제공받고, 포인트로 공원시설을 이용하거나 상품으로 교환하는 문화운동입니다.</dd>
            </dl>
            <dl class="txt-area">
                <dt>그린포인트 조회방법</dt>
                <dd>그린포인트 조회는 국립공원 홈페이지 내 &lt;그린포인트 홈페이지&gt;를 이용하시길 바랍니다.</dd>
                <dd><a href="https://greenpoint.knps.or.kr/main.do" class="btn btn-link" target="_blank">그린포인트 웹페이지 바로가기</a></dd>
            </dl>
            <dl class="txt-area">
                <dt>예약시설 포인트 사용방법</dt>
                <dd>그린포인트로 상품 교환 및 공원시설(대피소, 야영장, 주차장 등)을 이용할 수 있습니다.</dd>
            </dl>
            <div class="step">
                <ul class="step-list">
                    <li>
                        <em>STEP 1</em>
                        <span>그린포인트 홈페이지 접속</span>
                    </li>
                    <li>
                        <em>STEP 2</em>
                        <span>로그인 후 마이페이지에서 포인트 조회</span>
                    </li>
                    <li>
                        <em>STEP 3</em>
                        <span>예약시스템으로 이동</span>
                    </li>
                    <li>
                        <em>STEP 4</em>
                        <span>공원시설 선택 예약하기</span>
                    </li>
                </ul>
            </div>
            <ul class="dot-list">
                <li><span class="important">포인트 사용 유효기간 : 24개월</span></li>
                <li>신청기간은 대피소, 야영장 <span class="important">예약시작일로부터 5일전</span> 입니다.</li>
                <li>대피소 정원의 10%가 그린포인트 사용 예약인원으로 배정됩니다.</li>
                <li>시설사용료(대피소, 야영장) 금액만큼 그린포인트를 보유한 사람은 예약시스템에서 대피소, 야영장 예약이 가능합니다.<br>단, 대피소, 일반야영장, 자동차 야영장만 해당되며, 그 외 풀옵션, 카라반 등은 대상에서 제외됩니다.</li>
            </ul>
            <!-- 2022.06.13 스크롤 삭제 -->
            <div class="fixed">
                <table class="table">
                    <caption>예약시설 포인트 사용방법</caption>
                    <colgroup>
                        <col>
                        <col>
                        <col>
                        <col>
                    </colgroup>
                    <thead class="thead">
                    <tr>
                        <th scope="col" rowspan="2">구분</th>
                        <th scope="col" rowspan="2">유형</th>
                        <th scope="col" colspan="2">포인트</th>
                    </tr>
                    <tr>
                        <th scope="col">성수기</th>
                        <th scope="col">비수기</th>
                    </tr>
                    </thead>
                    <tbody class="tbody">
                    <tr>
                        <td rowspan="2">대피소</td>
                        <td>일반형</td>
                        <td>8,000</td>
                        <td>7,000</td>
                    </tr>
                    <tr>
                        <td>독립형</td>
                        <td>13,000</td>
                        <td>12,000</td>
                    </tr>
                    <tr>
                        <td rowspan="4">야영장</td>
                        <td>일반 영지 (30㎡ ~ 40㎡)</td>
                        <td>7,000</td>
                        <td>5,000</td>
                    </tr>
                    <tr>
                        <td>대형 영지 (41㎡ ~ 60㎡)</td>
                        <td>9,000</td>
                        <td>7,000</td>
                    </tr>
                    <tr>
                        <td rowspan="2">자동차 야영장</td>
                        <td>19,000</td>
                        <td>15,000</td>
                    </tr>
                    <tr>
                        <td colspan="2">※ 내장산백암(가인), 가야산(치인,삼정) 별도 요금제 적용<br>(집중수요기간 : 13,000원, 비수기 : 11,000원)</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="tab-pane" id="tab7">
            <ul class="dot-list">
                <li>봄, 여름, 가을 성수기에 모든 탐방객에게 균등한 시설 이용 기회를 제공하기 위하여 추첨제를 시행하고 있습니다. 성수기에 조기 마감되는 사전 선착순 예약제 운영 방식을 보완해, 국민 대표가 무작위로 이용객을 뽑습니다.</li>
                <li>대상은 국립공원 전체 대피소, 야영장 예약 시설입니다.</li>
                <li>추첨은 아래와 같이 진행됩니다. 일정(접수 일자, 결과 발표 일자 등)은 매년 조금씩 변동될 수 있으며, 세부 일정은 예약통합시스템에 공지됩니다.</li>
            </ul>
            <div class="step">
                <ul class="step-list">
                    <li>
                        <em>추첨제 공고 및 신청자 접수</em>
                        <span>마감일 20일 전</span>
                    </li>
                    <li>
                        <em>추첨</em>
                        <span>마감일 14:00</span>
                    </li>
                    <li>
                        <em>결과 발표</em>
                        <span>마감일 17:00</span>
                    </li>
                    <li>
                        <em>결제</em>
                        <span>발표일로부터 3일간</span>
                    </li>
                    <li>
                        <em>잔여석 공고</em>
                        <span>결제 마감일 4일 이내</span>
                    </li>
                </ul>
            </div>
            <ul class="dot-list">
                <li>결과 발표 : 예약통합시스템 「나의 예약 정보」 에서 확인가능 / 당첨자 안내 문자 발송</li>
                <li>잔여석 공고 : 미 결제에 따른 자동 취소 건, 본인 취소 건, 추첨제 미신청 건 등</li>
                <li><span class="important">잔여석은 예약 개시일에 선착순 예약으로 전환</span></li>
            </ul>
        </div>
    </div>
</div>

			</div>
			
	


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
<%@ include file="../common/footer.jsp" %>
</body>
</html>