<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="assets/js/lib/jquery-1.12.4.min.js"></script>
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="assets/style/infomations.css">
</head>
<body>
<script>
	$('document').ready(function(){
		
	})
	
</script>
<%@ include file="../common/header.jsp" %>
<div class="yeobeck"></div>
<div class = "pageLocation">
    <span>홈</span>
    <span class="loca">이용안내</span>
    <span class="loca">${cat[0].category1}</span>
</div>
<div class = "detailInformation">
	<h3 class = "title">${cat[0].category1} 이용안내</h3>
	<div class = "serchBox">
	<select id="category2">
	<c:forEach var="list" items="${cat }">
		<tr>
			<td style="width: 40px; height:40px;" align="center">
				<input class="chkbox" name="checks" value="${list.seq }" type="checkbox" />
			</td>
			<td style="width: 330px; height:40px;" align="center">
				<div id="${list.seq }" class="title">${list.category1 }  </div>
			</td>
			<td style="width: 80px; height:40px;" align="center">${list.category2 }</td>
			<td style="width: 120px; height:40px;" align="center">${list.category3 }</td>
			<td style="width: 80px; height:40px;" align="center">${list.memo } </td>
		</tr>
	</c:forEach>
	</select>
	</div>
</div>
</body>
</html>