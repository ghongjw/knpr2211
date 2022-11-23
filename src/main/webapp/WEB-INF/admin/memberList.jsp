<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
	<%@ include file="../common/headerAdmin.jsp"%>
	<div id="wrap" class="sub">


		<div class="mypage">
			<h3 class="title">회원 관리</h3>
			<ul class="nav-tabs">
				<li class="tab_list">회원목록</li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane is-active" id="tab1">
					<!-- list -->
					<div class="board-area list">
						<div class="article-info">
							<div class="left">
								<span class="total"> 총 <span>0</span>건
								</span>
							</div>
						</div>


						<table class="table res-list">

							<colgroup>
								<col style="width: 12%;">
								<col style="width: 12%;">
								<col>
								<col style="width: 20%;">
								<col style="width: 12%;">
								<col style="width: 13%;">
							</colgroup>
							<thead class="thead">
								<tr>
									<th scope="col">아이디</th>
									<th scope="col">이름</th>
									<th scope="col">구분</th>
									<th scope="col">이메일</th>
									<th scope="col">전화번호</th>
								</tr>
							</thead>
							<tbody class="tbody">
								<c:forEach var = "member" items = "${members}">
									<tr>
									<td>${member.id }</td>
									<td>${member.name }</td>
									<td>${member.member }</td>
									<td>${member.email }</td>
									<td>${member.mobile }</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>






</body>


</body>
</html>