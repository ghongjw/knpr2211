<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세페이지</title>
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
                <strong class="view-title">${notice.title}</strong>
                <span class="date">${notice.createDate}</span>
                <span class="inquiry">조회수 <span>${notice.hit}</span></span>
            	</div>
            	<div class="view-body">
            		<p>${notice.content}</p>
            	</div>
            	<div class="file-area">
                	<ul class="file-list">
                    	<c:if test="${notice.fileName != '파일 없음' }">
							<a href="${root }download?fileName=${notice.fileName }">${notice.fileName }</a>
						</c:if>
                	</ul>
            	</div>
            	<div class="board-bottom">
                	<div class="center">
                    	<input type=button class="btn btn-list" value='수정' onclick="location.href='${root}modifyProc'"/>
                		<input type=button class="btn btn-list" value='목록' onclick="location.href='${root}noticeProc'"/>
						<input type=button class="btn btn-list" value='삭제' onclick="location.href='${root}deleteProc'"/>
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