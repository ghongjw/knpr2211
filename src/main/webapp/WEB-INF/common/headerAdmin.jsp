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
    
    <title>knpr2211 Manager</title>
    </head>
<header id="header">
    <h1>
        <a href="index" class="logo">국립공원 예약시스템 관리자 </a>
    </h1>
    <nav>
        <ul class="gnb">
         
            
                <li>
                    <a href="javascript:void(0);" class="depth1">회원관리</a>
                    <ul class="depth2">
                        
                            <li><a href="adminMemberList?page=0&size=10">회원조회</a></li>
                        
                    </ul>
                </li>
            
            
                <li>
                    <a href="javascript:void(0);" class="depth1">공지/질문</a>
                    <ul class="depth2">
                        
                            <li><a href="adminAttentionList?page=0&size=10">공지사항조회/등록</a></li>
                        
                        
                            <li><a href="list?page=0&size=10">묻고 답하기</a></li>

<!--                             <li><a href="">프로그램등록</a></li> -->
                        
                    </ul>
                </li>
                <li>
                    <a href="adminIndex" class="depth1">관리자 홈</a>
                    
                    <ul class="depth2">
                    <li> <a href="adminIndex" class="depth1">관리자 홈</a></li>
                    </ul>
                </li>
         
        </ul>
    </nav>
    <div class="util-area" data-device-mode="pc">
      
        
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
                            <span>${sessionScope.id}님 반갑습니다</span>
                        </button>
                        <div class="layer-language" id="layer-language2">
                            <button class="btn is-active" onclick="location.href='logout'" >로그아웃</button>
                            <button class="btn" onclick="">회원정보 수정</button>
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
                    <a href="javascript:void(0);" class="depth1">회원관리</a>
                    <ul class="depth2">
                        
                            <li><a href="adminMemberList?page=0&size=10">회원조회/수정</a></li>
                        
                    </ul>
                </li>
         
            
                <li>
                    <a href="javascript:void(0);" class="depth1">알림마당관리</a>
                    <ul class="depth2">
                        
                            <li><a href="adminAttentionList?page=0&size=10">공지사항조회/등록</a></li>
                        
                            <li><a href="faq">자주하는 질문</a></li>
                        
                            <li><a href="list?page=0&size=10">묻고 답하기</a></li>
                            
<!--                             <li><a href="">프로그램 등록(할수있으면 하기)</a></li> -->
                        
                    </ul>
                </li>
         
        </ul>
        </div>
    </div>
</header>