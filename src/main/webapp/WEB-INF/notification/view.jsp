<%@page import="java.util.Optional"%>
<%@page import="com.reservation.knpr2211.entity.Board"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Optional<Board> op = (Optional<Board>) request.getAttribute("list");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<c:set var="board" value="<%=op %>"/>
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
						<strong class="view-title"> <%=op.get().getTitle()%> </strong> <span><%=op.get().getWriter()%></span>
						<span class="date"><%=op.get().getCreateDate()%></span>
					</div>
					<div class="view-body">
						<div class="question"><%=op.get().getContent()%></div>
					</div>
					<div class="board-bottom">
						<div class="center">
                
                    	<a href="modify" class="btn btn-modify" onclick="goUpdate(); return false;">수정</a>
                
               <a href="javascript:void(0);" class="btn btn-list" onclick="goList(); return false;">목록</a>
                
                    <a href="javascript:void(0);" class="btn btn-modify" onclick="goDelete(); return false;">삭제</a>
                
            </div>
					</div>
				</div>
				<!-- // view -->
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>