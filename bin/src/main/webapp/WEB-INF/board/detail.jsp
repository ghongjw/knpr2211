<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div id="wrap" class="sub">
		<div id="container">
			 <input type="hidden" name="writer" id="id" value="${member.id }">
			 <input type="hidden" name="bno" id="bno" value="${boardDto.bno}">
			<div class="page-location">
				<span>홈</span> <span>알림마당</span> <span>묻고답하기</span>
			</div>
			<div class="notification">
				<h3 class="title">묻고답하기</h3>
				<!-- view -->
				<div class="board-area view qna">
					<div class="view-head">
						<strong class="view-title">${boardDto.title}</strong>
						<span>${boardDto.writer }</span>
						<span class="date">${boardDto.createDate}</span>
					</div>
					<div class="view-body">
						<div class="question">${boardDto.content}</div>
					<!-- 답변 --> 
					<div class="answer">
								<c:choose>
										<c:when test="${member.member == 'admin'}">
											<dl>
												<dt>${boardDto.title}</dt>
											</dl>
											<form id="reply" action="/reply_write" method="post">
												<input type="hidden" id="id" name="id"
													value="${sessionScope.id}"><br>
												<textarea name="content" id="cn" cols="30" rows="10"
													class="textarea" title="내용 입력" placeholder="내용 입력"></textarea>
												<input type="hidden" id="bno" name="bno"
													value="${boardDto.bno}"><br>
												<div align=right>
													<button type="submit">등록</button>
												</div>
											</form>
										</c:when>
										<c:when test="${boardDto.state == '1' }">
											<dt>${boardDto.title}</dt>
											<br>
											<c:forEach var="list" items="${list }">
												<dd>${list.content }</dd><br>
												<dd>
													<span>${boardDto.category1}</span><span>${list.createDate } </span>
												</dd>
											</c:forEach>
	            						</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
									</div>
									<!-- 답변 -->
								
					<div class="board-bottom">
						<div class="center">
                	<a href="/post/edit/${boardDto.bno}" class="btn btn-modify">수정</a>
               		<a href="/list" class="btn btn-list">목록</a><div style="margin:5px"></div>
                    
                    <form id="delete-form" action="/post/ + ${boardDto.bno}" method="post">
           				<input type="hidden" name="_method" value="delete"/>
            			<button class="btn btn-modify" id="delete-btn">삭제</button>
        			</form>
                    			<div>
   				 			</div>   
            			</div>
					</div>
				
				<!-- // view -->
				
			</div>
		</div>
	</div>
</div>
</div>
<%@ include file="../common/footer.jsp" %>
 
</body>
</html>