<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="assets/js/lib/jquery-1.12.4.min.js"></script>
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="assets/style/infomations.css">
<script>
	$('document').ready(function(){
		
	}
</script>
</head>
<body>
<div id="mod"></div>
<%@ include file="../common/header.jsp" %>
<div class = "programInfo">
	<div class = "pageLocation">
	    <span>홈</span>
	    
	</div>
	<div class="program">
	    <h3 class="title">나의 예약목록</h3>
	</div>
	<div class="typeArea">
	    <a href="#">예약목록</a>
	    <a href="#">지난예약목록</a>
	</div>
	<div id = "e" class="program_Type" style="display:block;">
		<div class="program_Aria">
	
		</div>
	</div>
		<table class="table mem-list">

							<colgroup>
								<col style="width: 7%;">
								<col style="width: 7;">
								<col style="width: 26%;">
								<col style="width: 20%;">
								<col style="width: 10%;">
								<col style="width: 5%;">
							</colgroup>
							<thead class="thead">
								<tr>
									<th scope="col">예약상태</th>
									<th scope="col">구분</th>
									<th scope="col">상품명</th>
									<th scope="col">이용일자</th>
									<th scope="col">이용금액</th>
									<th scope="col">결제 ・ 취소</th>
								</tr>
							</thead>
							
							<tbody class="tbody">
								<c:forEach var = "member" items = "${members}">
									<tr>
									<td scope="col">예약상태</td>
									<td scope="col">구분</td>
									<td scope="col">상품명</td>
									<td scope="col">이용일자</td>
									<td scope="col">이용금액</td>
									<td scope="col">결제 ・ 취소</td>
									</tr>
								</c:forEach>
							</tbody>
							<tbody>
								<tr class = "page_tr">
								<td colspan = "6" class = "page_td">
							
									<c:forEach var = "i" begin="0" end = "${totalPage -1}">
										<c:choose>
										<c:when test="${i == param.page }">
										<button class = "index_paging" style = "background:#004ea2; color:white;" id = "pageNum" onclick = "pageNum('${i}')">
									${i + 1}
									</button>
										</c:when>
										<c:otherwise>
									<button class = "index_paging" id = "pageNum" onclick = "pageNum('${i}')">
									${i + 1}
									</button>
									</c:otherwise>
									</c:choose>
								</c:forEach>
							</td>
						</tr>
					</tbody>
				</table>
	</div>
</div>
	
	
<%@ include file="../common/footer.jsp" %>

</body>
</html>