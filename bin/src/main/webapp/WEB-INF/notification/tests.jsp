<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../common/header.jsp" %>
	<div id="wrap" class="sub">
			<div id="container">
				


<script>
    $(function(){
        init.loadImg();
        event.changePark();
        event.bookmark();
        event.kakaoMapLink();
    });

    let init = {
        loadImg : function(){
            var swiper = new Swiper(".swiper.thumb", {
                loop: true,
                spaceBetween: 20,
                slidesPerView: 4,
                freeMode: true,
                watchSlidesProgress: true,
                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev",
                },
            });

            var swiper2 = new Swiper(".swiper.view", {
                loop: true,
                spaceBetween: 10,
                pagination: {
                    el: '.swiper-pagination',
                    type: "fraction"
                },
                thumbs: {
                    swiper: swiper,
                },
            });
        }
    }

    let event = {
        changePark : function(){
            $("#parkId").off().change(function(){
                ajaxCall({
                    url :  '/contents/selectFcltList.do',
                    data : {
                        'parkId' : $("#parkId").val(),
                        'orgnztGbn' : 6
                    },
                    success: function(dat){
                        let optionHtml = [];
                        for (let i=0; i<dat.fcltList.length; i++) {
                            optionHtml.push("<option value='",dat.fcltList[i].orgnztId,"'>",dat.fcltList[i].orgnztNm, "</option>");
                        }
                        $("#deptId").html('');
                        $("#deptId").append(optionHtml.join(''));
                        changeGuide();
                    }
                });
            });
        },
        bookmark : function(){

            $(".btn-bookmark").off().on("click", function (e) {

                let useYn = '';
                if($(this).attr("class").indexOf('is-active') < 0){
                    $(".btn-bookmark").addClass("is-active");
                    useYn= 'Y';
                }else{
                    $(".btn-bookmark").removeClass("is-active");
                    useYn= 'N';
                }

                mergeBookMark(useYn);

            });
        },
        kakaoMapLink : function(){
            $(".btn-location").off().click(function(){
                window.open('https://map.kakao.com/?q='+$(this).closest('dd').text(), '_blank');
            })
        }
    }

    let mergeBookMark = function(useYn){
        ajaxCall({
            url :  '/contents/mergeBookMark.do',
            data : {
                'deptId' : 'B131002',
                'prdDvcd' : 'C',
                'hrkDeptId' : 'B13',
                'bkmkNm' : '[가야산] 백운동 야영장',
                'useYn' : useYn
            },
            success: function(dat){
                if(dat.result == 'LOGIN'){
                    let retUrl = "mergeBookMark('"+useYn+"')";
                    loginPopup(retUrl);
                }else{
                    if(useYn == 'Y'){
                        alertPopup({
                            title:'처리완료',
                            subTitle:'즐겨찾기가 완료 되었습니다.',
                            content:'마이페이지 > 즐겨찾기 메뉴에서 확인 가능합니다.'
                        });
                    }else{
                        alertPopup({
                            title:'처리완료',
                            subTitle:'즐겨찾기가 삭제 되었습니다.',
                            content:'마이페이지 > 즐겨찾기 메뉴에서 확인 가능합니다.'
                        });
                    }
                }
            }

        });
    }

    function imgView(imgSrc){
        $(".zoomer-image").attr("src" , '');
        $(".zoomer-image").attr("src" , imgSrc);
        openPopup('blockplan');
    }

    function changeGuide(){
        $("#guideForm").submit();
    }
</script>
<div class="page-location">
    <span>홈</span>
    <span>이용안내</span>
    <span>야영장</span>
</div>
<div class="information">
    <h3 class="title">야영장 이용안내</h3>
    <form id="guideForm" action="/contents/C/serviceGuide.do">
        <input type="hidden" name="prdDvcd" value="C">
        <div class="search-area">
            <span class="select">
                <label for="parkId">야영장 선택</label>
                <select id="parkId" name="parkId">
                 
                     <option value="B01">지리산</option>
                 
                     <option value="B16">계룡산</option>
                 
                     <option value="B02">한려해상</option>
                 
                     <option value="B03">설악산</option>
                 
                     <option value="B04">내장산</option>
                 
                     <option value="B13" selected="selected">가야산</option>
                 
                     <option value="B05">덕유산</option>
                 
                     <option value="B06">오대산</option>
                 
                     <option value="B07">주왕산</option>
                 
                     <option value="B08">태안해안</option>
                 
                     <option value="B09">다도해해상</option>
                 
                     <option value="B10">치악산</option>
                 
                     <option value="B11">월악산</option>
                 
                     <option value="B12">소백산</option>
                 
                     <option value="B20">월출산</option>
                 
                     <option value="B18">변산반도</option>
                 
                     <option value="B17">무등산</option>
                 
                     <option value="B22">태백산</option>
                 
                </select>
            </span>
            <span class="select">
                <label for="deptId">야영장 선택</label>
                <select id="deptId" name="deptId" onchange="changeGuide();">
                 
                     <option value="B131002" selected="selected">백운동</option>
                 
                     <option value="B131003">치인</option>
                 
                     <option value="B131001">삼정</option>
                 
                </select>
            </span>
            <button class="btn">
                <i class="icon-search"></i>
                <span>조회</span>
            </button>
        </div>
    </form>
    
    
        <div class="title-area">
            <h4 class="title">[가야산] 백운동 야영장</h4>
            <div class="btn-area">
                <button type="button" class="btn btn-apps" onclick="imgView('/product/camp/camp0603_11.jpg');">
                    <i class="icon-apps"></i>
                    <span>배치도</span>
                </button>
                
                <button type="button" class="btn btn-bookmark ">
                    <i class="icon-bookmark"></i>
                    <span>즐겨찾기</span>
                </button>
            </div>
        </div>
        <div class="slide-view">
            <div class="swiper view swiper-initialized swiper-horizontal swiper-pointer-events">
                <div class="swiper-wrapper" id="swiper-wrapper-51aacaea19d105a3e" aria-live="polite" style="transition-duration: 0ms; transform: translate3d(-690px, 0px, 0px);"><div class="swiper-slide swiper-slide-duplicate swiper-slide-prev" data-swiper-slide-index="13" role="group" aria-label="14 / 14" style="width: 680px; margin-right: 10px;">
                            <img src="/cntnts/camp0603_15.jpg" alt="가야산_백운동_15">
                        </div>
                    
                        <div class="swiper-slide swiper-slide-active" data-swiper-slide-index="0" role="group" aria-label="1 / 14" style="width: 680px; margin-right: 10px;">
                            <img src="/cntnts/camp0603_11.jpg" alt="가야산_백운동_11">
                        </div>
                    
                        <div class="swiper-slide swiper-slide-next" data-swiper-slide-index="1" role="group" aria-label="2 / 14" style="width: 680px; margin-right: 10px;">
                            <img src="/cntnts/camp0603_1.jpg" alt="가야산_백운동_1">
                        </div>
                    
                        <div class="swiper-slide" data-swiper-slide-index="2" role="group" aria-label="3 / 14" style="width: 680px; margin-right: 10px;">
                            <img src="/cntnts/camp0603_3.jpg" alt="가야산_백운동_3">
                        </div>
                    
                        <div class="swiper-slide" data-swiper-slide-index="3" role="group" aria-label="4 / 14" style="width: 680px; margin-right: 10px;">
                            <img src="/cntnts/camp0603_4.jpg" alt="가야산_백운동_4">
                        </div>
                    
                        <div class="swiper-slide" data-swiper-slide-index="4" role="group" aria-label="5 / 14" style="width: 680px; margin-right: 10px;">
                            <img src="/cntnts/camp0603_5.jpg" alt="가야산_백운동_5">
                        </div>
                    
                        <div class="swiper-slide" data-swiper-slide-index="5" role="group" aria-label="6 / 14" style="width: 680px; margin-right: 10px;">
                            <img src="/cntnts/camp0603_6.jpg" alt="가야산_백운동_6">
                        </div>
                    
                        <div class="swiper-slide" data-swiper-slide-index="6" role="group" aria-label="7 / 14" style="width: 680px; margin-right: 10px;">
                            <img src="/cntnts/camp0603_7.jpg" alt="가야산_백운동_7">
                        </div>
                    
                        <div class="swiper-slide" data-swiper-slide-index="7" role="group" aria-label="8 / 14" style="width: 680px; margin-right: 10px;">
                            <img src="/cntnts/camp0603_8.jpg" alt="가야산_백운동_8">
                        </div>
                    
                        <div class="swiper-slide" data-swiper-slide-index="8" role="group" aria-label="9 / 14" style="width: 680px; margin-right: 10px;">
                            <img src="/cntnts/camp0603_9.jpg" alt="가야산_백운동_9">
                        </div>
                    
                        <div class="swiper-slide" data-swiper-slide-index="9" role="group" aria-label="10 / 14" style="width: 680px; margin-right: 10px;">
                            <img src="/cntnts/camp0603_10.jpg" alt="가야산_백운동_10">
                        </div>
                    
                        <div class="swiper-slide" data-swiper-slide-index="10" role="group" aria-label="11 / 14" style="width: 680px; margin-right: 10px;">
                            <img src="/cntnts/camp0603_12.jpg" alt="가야산_백운동_12">
                        </div>
                    
                        <div class="swiper-slide" data-swiper-slide-index="11" role="group" aria-label="12 / 14" style="width: 680px; margin-right: 10px;">
                            <img src="/cntnts/camp0603_13.jpg" alt="가야산_백운동_13">
                        </div>
                    
                        <div class="swiper-slide" data-swiper-slide-index="12" role="group" aria-label="13 / 14" style="width: 680px; margin-right: 10px;">
                            <img src="/cntnts/camp0603_14.jpg" alt="가야산_백운동_14">
                        </div>
                    
                        <div class="swiper-slide swiper-slide-duplicate-prev" data-swiper-slide-index="13" role="group" aria-label="14 / 14" style="width: 680px; margin-right: 10px;">
                            <img src="/cntnts/camp0603_15.jpg" alt="가야산_백운동_15">
                        </div>
                    
                <div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active" data-swiper-slide-index="0" role="group" aria-label="1 / 14" style="width: 680px; margin-right: 10px;">
                            <img src="/cntnts/camp0603_11.jpg" alt="가야산_백운동_11">
                        </div></div>
                <div class="swiper-pagination swiper-pagination-fraction swiper-pagination-horizontal"><span class="swiper-pagination-current">1</span> / <span class="swiper-pagination-total">14</span></div>
            <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
            <div class="swiper thumb swiper-initialized swiper-horizontal swiper-pointer-events swiper-free-mode swiper-thumbs">
                <div class="swiper-wrapper" id="swiper-wrapper-215d55ab5d9ab3cf" aria-live="polite" style="transition-duration: 0ms; transform: translate3d(-620px, 0px, 0px);"><div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="10" role="group" aria-label="11 / 14" style="width: 135px; margin-right: 20px;">
                            <img src="/cntnts/camp0603_12.jpg" alt="가야산_백운동_12">
                        </div><div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="11" role="group" aria-label="12 / 14" style="width: 135px; margin-right: 20px;">
                            <img src="/cntnts/camp0603_13.jpg" alt="가야산_백운동_13">
                        </div><div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="12" role="group" aria-label="13 / 14" style="width: 135px; margin-right: 20px;">
                            <img src="/cntnts/camp0603_14.jpg" alt="가야산_백운동_14">
                        </div><div class="swiper-slide swiper-slide-duplicate swiper-slide-prev" data-swiper-slide-index="13" role="group" aria-label="14 / 14" style="width: 135px; margin-right: 20px;">
                            <img src="/cntnts/camp0603_15.jpg" alt="가야산_백운동_15">
                        </div>
                    
                        <div class="swiper-slide swiper-slide-visible swiper-slide-active swiper-slide-thumb-active" data-swiper-slide-index="0" role="group" aria-label="1 / 14" style="width: 135px; margin-right: 20px;">
                            <img src="/cntnts/camp0603_11.jpg" alt="가야산_백운동_11">
                        </div>
                    
                        <div class="swiper-slide swiper-slide-visible swiper-slide-next" data-swiper-slide-index="1" role="group" aria-label="2 / 14" style="width: 135px; margin-right: 20px;">
                            <img src="/cntnts/camp0603_1.jpg" alt="가야산_백운동_1">
                        </div>
                    
                        <div class="swiper-slide swiper-slide-visible" data-swiper-slide-index="2" role="group" aria-label="3 / 14" style="width: 135px; margin-right: 20px;">
                            <img src="/cntnts/camp0603_3.jpg" alt="가야산_백운동_3">
                        </div>
                    
                        <div class="swiper-slide swiper-slide-visible" data-swiper-slide-index="3" role="group" aria-label="4 / 14" style="width: 135px; margin-right: 20px;">
                            <img src="/cntnts/camp0603_4.jpg" alt="가야산_백운동_4">
                        </div>
                    
                        <div class="swiper-slide" data-swiper-slide-index="4" role="group" aria-label="5 / 14" style="width: 135px; margin-right: 20px;">
                            <img src="/cntnts/camp0603_5.jpg" alt="가야산_백운동_5">
                        </div>
                    
                        <div class="swiper-slide" data-swiper-slide-index="5" role="group" aria-label="6 / 14" style="width: 135px; margin-right: 20px;">
                            <img src="/cntnts/camp0603_6.jpg" alt="가야산_백운동_6">
                        </div>
                    
                        <div class="swiper-slide" data-swiper-slide-index="6" role="group" aria-label="7 / 14" style="width: 135px; margin-right: 20px;">
                            <img src="/cntnts/camp0603_7.jpg" alt="가야산_백운동_7">
                        </div>
                    
                        <div class="swiper-slide" data-swiper-slide-index="7" role="group" aria-label="8 / 14" style="width: 135px; margin-right: 20px;">
                            <img src="/cntnts/camp0603_8.jpg" alt="가야산_백운동_8">
                        </div>
                    
                        <div class="swiper-slide" data-swiper-slide-index="8" role="group" aria-label="9 / 14" style="width: 135px; margin-right: 20px;">
                            <img src="/cntnts/camp0603_9.jpg" alt="가야산_백운동_9">
                        </div>
                    
                        <div class="swiper-slide" data-swiper-slide-index="9" role="group" aria-label="10 / 14" style="width: 135px; margin-right: 20px;">
                            <img src="/cntnts/camp0603_10.jpg" alt="가야산_백운동_10">
                        </div>
                    
                        <div class="swiper-slide" data-swiper-slide-index="10" role="group" aria-label="11 / 14" style="width: 135px; margin-right: 20px;">
                            <img src="/cntnts/camp0603_12.jpg" alt="가야산_백운동_12">
                        </div>
                    
                        <div class="swiper-slide" data-swiper-slide-index="11" role="group" aria-label="12 / 14" style="width: 135px; margin-right: 20px;">
                            <img src="/cntnts/camp0603_13.jpg" alt="가야산_백운동_13">
                        </div>
                    
                        <div class="swiper-slide" data-swiper-slide-index="12" role="group" aria-label="13 / 14" style="width: 135px; margin-right: 20px;">
                            <img src="/cntnts/camp0603_14.jpg" alt="가야산_백운동_14">
                        </div>
                    
                        <div class="swiper-slide swiper-slide-duplicate-prev" data-swiper-slide-index="13" role="group" aria-label="14 / 14" style="width: 135px; margin-right: 20px;">
                            <img src="/cntnts/camp0603_15.jpg" alt="가야산_백운동_15">
                        </div>
                    
                <div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active swiper-slide-thumb-active" data-swiper-slide-index="0" role="group" aria-label="1 / 14" style="width: 135px; margin-right: 20px;">
                            <img src="/cntnts/camp0603_11.jpg" alt="가야산_백운동_11">
                        </div><div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next" data-swiper-slide-index="1" role="group" aria-label="2 / 14" style="width: 135px; margin-right: 20px;">
                            <img src="/cntnts/camp0603_1.jpg" alt="가야산_백운동_1">
                        </div><div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="2" role="group" aria-label="3 / 14" style="width: 135px; margin-right: 20px;">
                            <img src="/cntnts/camp0603_3.jpg" alt="가야산_백운동_3">
                        </div><div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="3" role="group" aria-label="4 / 14" style="width: 135px; margin-right: 20px;">
                            <img src="/cntnts/camp0603_4.jpg" alt="가야산_백운동_4">
                        </div></div>
                <div class="swiper-button-prev" tabindex="0" role="button" aria-label="Previous slide" aria-controls="swiper-wrapper-215d55ab5d9ab3cf"></div>
                <div class="swiper-button-next" tabindex="0" role="button" aria-label="Next slide" aria-controls="swiper-wrapper-215d55ab5d9ab3cf"></div>
            <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
            <div class="grade-area">
                    <span class="title">야영장 등급제</span>
                        <span class="grade">
                            <i class="icon-star"></i>
                            <i class="icon-star"></i>
                            <i class="icon-star"></i>
                            <i class="icon-star"></i>
                        </span>
            </div>
        </div>
        <div class="detail-info">
                <dl>
        <dt>주소</dt>
        <dd>경북 성주군 수륜면 가야산식물원길 17<button class="btn-location"><i class="icon-location"></i></button>
        </dd>
        <dt>문의처</dt>
        <dd>054-931-1430</dd>
    </dl>
    <dl>
        <dt>입/퇴실시간</dt>
        <dd>오후 3시 ~ 익일 낮 12시(정오)</dd>
    </dl>
    <dl>
        <dt>이용금액</dt>
        <dd>
            <table class="table">
                <caption>이용금액</caption>
                <colgroup>
                    <col>
                    <col>
                    <col>
                </colgroup><thead class="thead">
                    <tr>
                        <th scope="col">구분</th>
                        <th scope="col" class="ta-r">주말 및 성수기</th>
                        <th scope="col" class="ta-r">주중</th>
                    </tr>
                </thead>
                <tbody class="tbody">
                    <tr>
                        <td><em>자동차영지</em></td>
                        <td class="ta-r"><em>19,000</em>원</td>
                        <td class="ta-r"><em>15,000</em>원</td>
                    </tr>
                    <tr>
                        <td><em>자연의집(솔막)</em></td>
                        <td class="ta-r"><em>70,000</em>원</td>
                        <td class="ta-r"><em>55,000</em>원</td>
                    </tr>
                </tbody>
            </table>
            <div class="box">
                <ul class="dot-list">
                    <li>주중 : 법정공휴일의 전일을 제외한 매주 일요일 ~ 목요일</li>
                    <li>주말 : 매주 금요일, 토요일, 법정공휴일의 전일(임시공휴일 제외)</li>
                    <li>주말 및 성수기 : 7.1 ~ 8.31, 10.1 ~ 11.15</li>
                </ul>
            </div>
        </dd>
    </dl>
    <div class="collapse-wrap">
        <button class="btn collapse">편의시설</button>
        <div class="a">
            <dl>
                <dt class="hidden-text">편의시설</dt>
                <dd>테이블, 샤워장(04월 ~ 11월 운영), 개수대, 전기, 계곡, 탐방로, 화롯대(솔막), 아이스박스(솔막), 물통(솔막)</dd>
            </dl>
        </div>
    </div>
    <div class="collapse-wrap">
        <button class="btn collapse">영지형태</button>
        <div class="a">
            <dl>
                <dt class="hidden-text">영지형태</dt>
                <dd>자동차영지 : 오후 3시~익일 낮12시(정오)</dd>
                <dd>자연의집(솔막) : 오후 3시~익일 낮11시</dd>
            </dl>
        </div>
    </div>
    <div class="collapse-wrap">
        <button class="btn collapse is-active">영지유형</button>
        <div class="a" style="display: block;">
            <dl>
                <dt class="hidden-text">영지유형</dt>
                <dd>자동차영지 16동, 자연의집(솔막) 10동</dd>
            </dl>
        </div>
    </div>
            <div class="bottom-area">
                <button type="button" class="btn btn-reservation" onclick="window.location='/reservation/searchSimpleCampReservation.do'">예약하기</button>
            </div>
        </div>
    
</div>

<div class="modal-popup medium" id="blockplan">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title">배치도</strong>
            <button type="button" class="btn-close" title="닫기">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container">
            <div class="zoom-container">
                <div class="zoomable zoomer-element"><div class="zoomer"><div class="zoomer-positioner" style="transform: translate3d(50px, 225px, 0px);"><div class="zoomer-holder" style="height: 900px; width: 1480px; transform: translate3d(-50%, -50%, 0px) scale(0.027027, 0.0266667); opacity: 1;"><img class="zoomer-image" alt="배치도" src="/assets/img/@img-deployment.png"></div></div><div class="zoomer-controls zoomer-controls-bottom"><span class="zoomer-previous">‹</span><span class="zoomer-zoom-out">-</span><span class="zoomer-zoom-in">+</span><span class="zoomer-next">›</span></div></div></div>
                <button class="btn-move">이미지 이동</button>
            </div>
            <div class="btn-area">
                <button class="btn btn-confirm is-active" onclick="closePopup('blockplan')">확인</button>
            </div>
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