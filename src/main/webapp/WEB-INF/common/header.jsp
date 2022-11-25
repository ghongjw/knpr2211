<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <head>
   <meta name="viewport" content="width=device-width">

      

<%--    <c:url var="root" value="/" /> --%>
	<link rel="stylesheet" href="${root }assets/style/commonb07b.css?ver1">
	<link rel="stylesheet" href="${root }assets/style/commonb07b.css">
	<script src="${root }assets/js/lib/jquery-1.12.4.min.js"></script>
	<script src="${root }assets/js/lib/swiper.js"></script>
	<script src="${root }assets/js/lib/datepicker.min.js"></script>
	<script src="${root }assets/js/lib/jquery.fs.zoomer.min.js"></script>
	<script src="${root }assets/js/lib/jquery.rwdImageMaps.min.js"></script>
	<script src="${root }assets/js/lib/toastr.min.js"></script>
	<script src="${root }assets/js/scripts.js"></script>
	<script src="${root }assets/js/common9b00.js?ver4"></script>
    

    <title>knpr2211</title>
    </head>
<header id="header">
    <h1>
        <a href="index" class="logo">국립공원 예약시스템</a>
    </h1>
    <nav>
        <ul class="gnb">
            
                <li>
                    <a href="javascript:void(0);" class="depth1">이용안내</a>
                    <ul class="depth2">
                        
                            <li><a href="campsiteInfo">야영장</a></li>
                        
                            <li><a href="shelterInfo">대피소</a></li>
                        
                            <li><a href="ecologyInfo">생태탐방원</a></li>
                        
                            <li><a href="cottageInfo">민박촌</a></li>
                        
                    </ul>
                </li>
            
                <li>
                    <a href="javascript:void(0);" class="depth1">예약하기</a>
                    <ul class="depth2">
                        
                            <li><a href="campsite">야영장</a></li>
                        
                            <li><a href="shelter">대피소</a></li>
                        
                            <li><a href="ecoReservation">생태탐방원</a></li>
                        
                            <li><a href="cottageReservation">민박촌</a></li>
                        
                    </ul>
                </li>
            
                <li>
                    <a href="javascript:void(0);" class="depth1">알림마당</a>
                    <ul class="depth2">
                        
                            <li><a href="noticeProc">공지사항</a></li>
                        
                            <li><a href="faq">자주하는 질문</a></li>
                        
                            <li><a href="list">묻고 답하기</a></li>
                        
                            <li><a href="policy">예약·환불정책</a></li>
                        
                    </ul>
                </li>
            
                <li>
                    <a href="javascript:void(0);" class="depth1">마이페이지</a>
                    <ul class="depth2">
                        
                            <li><a href="reservedList?reserve=future&page=0&size=10">나의 예약목록</a></li>
                        
                            <li><a href="">알림메시지</a></li>
                        
                            <li><a href="favoriteList">즐겨찾기</a></li>
                        
                            <li><a href="">미환불금 조회</a></li>
                        
                    </ul>
                </li>
            
               
        </ul>
    </nav>
    <div class="util-area" data-device-mode="pc">
        <a href="" class="btn-refund-inquiry">
            <i class="icon-refund-inquiry"></i>
            <span>미환불금조회</span>
        </a>
        
            <!-- 비 로그인 상태 -->
            <c:if test="${empty sessionScope.id }">
            <a href="login" class="btn-login">
                <i class="icon-user-check"></i>
                <span>로그인</span>
            </a>
            <a href="register" class="btn-join">
                <i class="icon-user-plus"></i>
                <span>회원가입</span>
            </a>
            </c:if>
               <!--  로그인 상태 -->
            <c:if test="${not empty sessionScope.id }">
            
			  <div class="lang-area">
                        <button class="btn btn-toggle" data-popup="layer-language">
                            <i class="icon-globe"></i>
                            <span>${sessionScope.name}님 반갑습니다</span>
                        </button>
                        <div class="layer-language" id="layer-language2">
                            <button class="btn is-active" onclick="location.href='logout'" >로그아웃</button>
                            <button class="btn" onclick="location.href='UserModify'">회원정보 수정</button>
                        </div>
                    </div>
            </c:if>
    </div>
    <div class="util-area" data-device-mode="mobile">
        <button class="btn-menu" title="전체 메뉴 보기">
            <i class="icon-list"></i>
        </button>
        <div class="all-menu">
            <div class="head">
                <a href="../../srchrefund/searchRefund.html" class="btn-refund-inquiry">
                    <i class="icon-refund-inquiry"></i>
                    <span>미환불금조회</span>
                </a>
                
                    <!-- 비 로그인 상태 -->
                 
           			 <c:if test="${empty sessionScope.id }">
       
                    <a href="" class="btn-login">로그인이<br>필요합니다.</a>
                    
                    
                    <a href="" class="btn-join" target="_blank">
                        <i class="icon-user-plus"></i>
                        <span>회원가입</span>
                    </a>
                   </c:if>
                    <c:if test="${not empty sessionScope.id }">
       
                          <span>${sessionScope.id}님 반갑습니다</span>
                   </c:if>
                   
                <button class="btn-close" title="전체 메뉴 닫기">
                    <i class="icon-close"></i>
                </button>
            </div>
            <ul class="gnb">
                
                    <li>
                        <a href="javascript:void(0);" class="depth1">이용안내</a>
                        <ul class="depth2">
                        
                            <li><a href="campsiteInfo">야영장</a></li>
                        
                            <li><a href="shelterInfo">대피소</a></li>
                        
                            <li><a href="ecologyInfo">생태탐방원</a></li>
                        
                            <li><a href="cottageInfo">민박촌</a></li>             
                        </ul>
                    </li>
                
                    <li>
                        <a href="javascript:void(0);" class="depth1">예약하기</a>
                        <ul class="depth2">
                            
                                <li><a href="" >야영장</a></li>
                            
                                <li><a href="">대피소</a></li>
                            
                                <li><a href="ecoReservation">생태탐방원</a></li>
                        
                           		<li><a href="cottageReservation">민박촌</a></li>
                         	   
                        </ul>
                    </li>
                
                    <li>
                        <a href="javascript:void(0);" class="depth1">알림마당</a>
                        <ul class="depth2">
                            
                            <li><a href="noticeProc">공지사항</a></li>
                        
                            <li><a href="faq">자주하는 질문</a></li>
                        
                            <li><a href="list">묻고 답하기</a></li>
                        
                            <li><a href="policy">예약·환불정책</a></li>
                            
                        </ul>
                    </li>
                
                    <li>
                        <a href="javascript:void(0);" class="depth1">마이페이지</a>
                        <ul class="depth2">
                            
                                <li><a href="reservedList?reserve=future&page=0&size=10">나의 예약목록</a></li>
                            
                                <li><a href="">알림메시지</a></li>
                            
                                <li><a href="favoriteList" >즐겨찾기</a></li>
                            
                                <li><a href="" >미환불금 조회</a></li>
                            
                        </ul>
                    </li>
            </ul>
        </div>
    </div>
</header>