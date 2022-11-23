<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/" />
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
<div class="page-location"><span>홈</span> <span>알림마당</span> <span>공지사항</span></div>
		<div class="notification">
			<h3 class="title">공지사항</h3>
			<!-- view -->
			<div class="board-area view">
            	<div class="view-head">
                <strong class="view-title">제목</strong>
                <span class="date">날짜들어갑니다</span>
                <span class="inquiry">조회수 <span>조회수 들어갑니다</span></span>
            	</div>
            	<div class="view-body">
            		<p>내용이 들어갑니다</p>
            	</div>
            	<div class="file-area">
                	<ul class="file-list">
                    	<c:if test="${board.fileName != '파일 없음' }">
							<a href="${root }download?fileName=${board.fileName }">${board.fileName }</a>
						</c:if>
                	</ul>
            	</div>
            	<div class="board-bottom">
                	<div class="center">
                    	<a href="javascript:void(0);" class="btn btn-list">목록</a>
                    	<input type=button class="btn btn-list" style="width: 60px; " value='목록' onclick="location.href='${root}noticeProc'"/>
                	</div>
            	</div>
        	</div>
				<!-- // view -->
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>