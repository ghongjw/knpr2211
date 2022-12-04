<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<script src="../assets/js/lib/jquery-1.12.4.min.js"></script>
<meta charset="UTF-8">
<style type="text/css">
.ReBtn{
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    max-width: 78px;
    height: 40px;
    margin-left: 8px;
    border-radius: 4px;
    background-color: #004ea2;
    color: white;
}


</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<script>
					function deleted(){
						var msg = confirm("삭제하시겠습니까?")
						if(msg == true){
							$("#delete-form").attr('action','boardDelete').submit();
							
						}
						else{
							$("#delete-form").attr('action','list?page=0&size=10').submit();
						}
					}
					
					</script>
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
								<dl>
											<dt>${boardDto.title}</dt>
											<c:forEach var="list" items="${list }">
											<br>
												<dd>${list.content }</dd><br>
												<dd>
													<span>${boardDto.category1}</span><span>${list.createDate } </span>
												</dd>
											</c:forEach>
											</dl>
	            						
										<c:if test="${member.member == 'admin'}">
											<dl style="height:50px;">
												
											</dl>
											<form id="reply" action="/reply_write" method="post">
												<input type="hidden" id="id" name="id"
													value="${sessionScope.id}"><br>
												<textarea name="content" id="cn" cols="30" rows="10"
													class="textarea" title="내용 입력" placeholder="내용 입력"></textarea>
												<input type="hidden" id="bno" name="bno"
													value="${boardDto.bno}"><br>
												<div align=right>
													<button style=cursor:pointer type="submit" class="ReBtn">등록</button>
												</div>
											</form>
										</c:if>
									
										
									</div>
									<!-- 답변 -->
								
					<div class="board-bottom">
						<div class="center">
						<c:if test="${member.member == 'admin'}">
                		</c:if>
                		<c:if test="${member.member == 'nomal'}">
                			<a href="/boardModify?bno=${boardDto.bno}" class="btn btn-modify">수정</a>
                		</c:if>
               		<a href="/list" class="btn btn-list">목록</a><div style="margin:5px"></div>
                    
                    <form id="delete-form"  method="post">
           				<input type="hidden" name="delete" value="${boardDto.bno}"/>
            			<button class="btn btn-modify" id="delete-btn" onclick="deleted()">삭제</button>
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