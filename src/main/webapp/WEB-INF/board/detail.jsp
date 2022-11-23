<%@page import="java.util.Optional"%>
<%@page import="com.reservation.knpr2211.entity.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%
Optional<Board> op = (Optional<Board>) request.getAttribute("boardList");
%> --%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div id="wrap" class="sub">
		<div id="container">
			
			<div class="page-location">
				<span>홈</span> <span>알림마당</span> <span>묻고답하기</span>
			</div>
			<div class="notification">
				<h3 class="title">묻고답하기</h3>
				<!-- view -->
				<div class="board-area view qna">
					<div class="view-head">
						<strong class="view-title">${boardDto.title}</strong>
						<span>${boardDto.writer}</span>
						<span class="date">${boardDto.createDate}</span>
					</div>
					<div class="view-body">
						<div class="question">${boardDto.content}</div>
					
					
					<!-- 답변 -->
					
					<dl class="answer">
                    <dt>${boardDto.title}</dt>
                    <dd>
                        <p>댓글 내용</p>
                    </dd>
                    <dd>
                        <span>category1</span><span>답변시간</span>
                    </dd>
                	</dl>
               		<!-- 답변 -->
               		</div>
               		
            
               		
               		 
               		 
               		 
					<div class="board-bottom">
						<div class="center">
                	<a href="/post/edit/${boardDto.bno}" class="btn btn-modify">수정</a>
               		<a href="/" class="btn btn-list">목록</a>
                    <form id="delete-form" action="/post/ + ${boardDto.bno}" method="post">
           				<input type="hidden" name="_method" value="delete"/>
            			<button class="btn btn-modify" id="delete-btn">삭제</button>
        			</form>
                    <div>
    </div>   
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