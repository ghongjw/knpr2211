<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
</head>
<body>
<%@ include file="../common/header.jsp" %>
	<div id="wrap" class="sub">

			<div id="container">
	<script>
    let goDetail = function(seq){
        $("#seq").val(seq);
        $("#searchForm").attr("action","/community/board/qna/boardDetail.do");
        $("#searchForm").submit();
    }

    let linkPage = function(pageNo){
        $("#pageNo").val(pageNo);
        $("#searchForm").attr("action","/community/board/qna/boardList.do");
        $("#searchForm").submit();
    }

    let goRegist = function(){
        
        let str = "location.href='/community/board/qna/boardRegist.do'";
        loginPopup(str);
        
        
    }
</script>
<div class="page-location">
    <span>홈</span>
    <span>알림마당</span>
    <span>묻고답하기</span>
</div>
<div class="notification">
    <h3 class="title">묻고답하기</h3>
    <form id="searchForm" name="searchForm" method="post">
        <div class="search-area">
            <input type="hidden" name="pageNo" id="pageNo" value="1">
            <input type="hidden" name="seq" id="seq" value="">
            <span class="select">
                <label for="national-park1">국립공원 선택</label>
                <select id="national-park1" name="deptId">
                    <option value="">국립공원 전체</option>
                    
                        
                        <option value="B000">본부</option>
                    
                        
                        <option value="B011">지리산경남</option>
                    
                        
                        <option value="B021">한려해상동부</option>
                    
                        
                        <option value="B022">한려해상</option>
                    
                        
                        <option value="B031">설악산</option>
                    
                        
                        <option value="B041">내장산백암</option>
                    
                        
                        <option value="B051">덕유산</option>
                    
                        
                        <option value="B061">오대산</option>
                    
                        
                        <option value="B071">주왕산</option>
                    
                        
                        <option value="B081">태안해안</option>
                    
                        
                        <option value="B091">다도해해상</option>
                    
                        
                        <option value="B101">치악산</option>
                    
                        
                        <option value="B111">월악산</option>
                    
                        
                        <option value="B121">소백산</option>
                    
                        
                        <option value="B131">가야산</option>
                    
                        
                        <option value="B141">북한산</option>
                    
                        
                        <option value="B151">경주</option>
                    
                        
                        <option value="B161">계룡산</option>
                    
                        
                        <option value="B171">무등산</option>
                    
                        
                        <option value="B181">변산반도</option>
                    
                        
                        <option value="B191">속리산</option>
                    
                        
                        <option value="B201">월출산</option>
                    
                        
                        <option value="B211">한라산</option>
                    
                        
                        <option value="B221">태백산</option>
                    
                        
                        <option value="B301">설악산생태탐방원</option>
                    
                        
                        <option value="B012">지리산전북</option>
                    
                        
                        <option value="B042">내장산</option>
                    
                        
                        <option value="B092">다도해해상서부</option>
                    
                        
                        <option value="B122">소백산북부</option>
                    
                        
                        <option value="B133">가야산생태탐방원</option>
                    
                        
                        <option value="B142">북한산도봉</option>
                    
                        
                        <option value="B172">무등산동부</option>
                    
                        
                        <option value="B013">지리산전남</option>
                    
                        
                        <option value="B024">한려해상생태탐방원</option>
                    
                        
                        <option value="B123">소백산생태탐방원</option>
                    
                        
                        <option value="B014001">지리산생태탐방원</option>
                    
                        
                        <option value="B231">무등산생태탐방원</option>
                    
                        
                        <option value="B331">내장산생태탐방원</option>
                    
                        
                        <option value="B961">산악안전교육원</option>
                    
                        
                        <option value="B971">북한산생태탐방원</option>
                    
                        
                        <option value="B981">연구원</option>
                    
                        
                        <option value="B991">생물종보전원</option>
                    
                </select>
            </span>
            <span class="select">
                <label for="national-park2">검색조건</label>
                <select id="national-park2" name="searchCondition">
                    <option value="all">전체</option>
                    <option value="sj">제목</option>
                    <option value="cn">내용</option>
                </select>
            </span>
            <label for="searchKeyword" class="hidden-text">검색값 입력</label>
            <input type="text" class="input-text" id="searchKeyword" name="searchKeyword" title="검색값을 입력해주세요." value="">
            <button class="btn">
                <i class="icon-search"></i>
                <span>조회</span>
            </button>
        </div>
    </form>
    <!-- list -->
    <div class="board-area list">
        <div class="article-info">
            <div class="left"><span class="total">총 <span> </span>건</span></div>
        </div>
        <table class="table">
            <caption>묻고답하기 리스트</caption>
            <colgroup>
                <col style="width: 5%;">
                <col style="width: 10%;">
                <col style="width: 10%;">
                <col>
                <col style="width: 10%;">
                <col style="width: 10%;">
                <col style="width: 10%;">
            </colgroup>
            <thead class="thead">
            <tr>
                <th scope="col">No</th>
                <th scope="col">공원명</th>
                <th scope="col">문의유형</th>
                <th scope="col">제목</th>
                <th scope="col">작성자</th>
                <th scope="col">등록일</th>
                <th scope="col">상태</th>
            </tr>
            </thead>
            <tbody class="tbody">
    
                
       
            </tbody>
        </table>
        <div class="board-bottom">
            <div class="right">
                <a href="javascript:void(0);" class="btn btn-list" onclick="goRegist(); return false;">글쓰기</a>
            </div>
        </div>
        <nav>
            <div class="paginator">
                 <button type="button" class="paginator-first" title="맨 처음" onclick="linkPage(1);return false;"> <i class="icon-chevrons-left"></i> </button> <button type="button" class="paginator-prev" title="이전" onclick="linkPage(1);return false;"><i class="icon-chevron-left"></i></button><span class="paginator-pages"><button type="button" class="paginator-page is-active">1</button><button type="button" class="paginator-page" onclick="linkPage(2);return false;">2</button><button type="button" class="paginator-page" onclick="linkPage(3);return false;">3</button><button type="button" class="paginator-page" onclick="linkPage(4);return false;">4</button><button type="button" class="paginator-page" onclick="linkPage(5);return false;">5</button><button type="button" class="paginator-page" onclick="linkPage(6);return false;">6</button><button type="button" class="paginator-page" onclick="linkPage(7);return false;">7</button><button type="button" class="paginator-page" onclick="linkPage(8);return false;">8</button><button type="button" class="paginator-page" onclick="linkPage(9);return false;">9</button><button type="button" class="paginator-page" onclick="linkPage(10);return false;">10</button></span><button type="button" class="paginator-next" title="다음" onclick="linkPage(11);return false; "><i class="icon-chevron-right"></i></button><button type="button" class="paginator-last" title="맨 마지막" onclick="linkPage(1299);return false;"><i class="icon-chevrons-right"></i></button>

            </div>
        </nav>
    </div>
    <!-- // list -->
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