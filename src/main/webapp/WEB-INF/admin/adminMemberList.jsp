<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="assets/style/infomations.css">
<script src="../../assets/js/lib/jquery-1.12.4.min.js"></script>

<script>
	$('document').ready(function(){
		$(".input1").val("${member}")
		$(".input2").val("${select}")
		$(".input3").val("${search}")
		
		
		const urlParams = new URL(location.href).searchParams;
		const page = urlParams.get('page');
		console.log(page);
		
	})
</script>
</head>

<body>
<script type="text/javascript">


let pageNum = function(num){
	var url = "adminMemberList?page="+num+"&size=10"; 
	
	$("#memberSearch").attr("action",url).submit();
}
	 	
	 	</script>
	<%@ include file="../common/headerAdmin.jsp"%>
	<div id="wrap_memberList" class="sub">
		<div class="mypage">
			<h3 class="title">회원 관리</h3>
			<div class="tab-content">
				<div class="tab-pane is-active" id="tab1">
					<!-- list -->
					<div class="board-area list">
						<div class="article-info">
							<div class="left">
								<span class="total"> 총 <span>${totalElement }</span>건
								</span>
							</div>
						</div>
						
						
						<form id="memberSearch" method="post">
								<div class="searchBox">
									<select name = "member" class = "input1">
										<option value="all">전체</option>
										<option value="admin">관리자</option>
										<option value="normal">회원</option>
									</select>
									<select name="select" class="input2">
											<option value="id">아이디</option>
											<option value="name">이름</option>
											<option value="email">이메일</option>
											<option value="mobile">전화번호</option>
									</select>
									<input type = "text" name = "search" class = "input3" placeholder="검색해보세용">
									<button class="searchbtn" onclick="pageNum('0')">
										<span class="searchB">조회</span>
									</button>
								</div>
						</form>


						<table class="table mem-list">

							<colgroup>
								<col style="width: 10%;">
								<col style="width: 10%;">
								<col style="width: 10%;">
								<col style="width: 20%;">
								<col style="width: 10%;">
								<col style="width: 5%;">
								<col style="width: 5%;">
							</colgroup>
							<thead class="thead">
								<tr>
									<th scope="col">아이디</th>
									<th scope="col">이름</th>
									<th scope="col">구분</th>
									<th scope="col">이메일</th>
									<th scope="col">전화번호</th>
									<th scope="col">예약조회</th>
									<th scope="col">수정</th>
								</tr>
							</thead>
							
							<tbody class="tbody">
								<c:forEach var = "member" items = "${members}">
									<tr>
									<td style="width: 10%;">${member.id }</td>
									<td style="width: 10%;">${member.name }</td>
									<td style="width: 10%;">${member.member }</td>
									<td style="width: 20%;">${member.email }</td>
									<td style="width: 10%;">${member.mobile }</td>
									<td style="width: 5%;"><button class="modiA" onclick="location.href='adminMemberReservationModify?memberId=${member.id }'" style="margin-right:5px; width:98%;">예약조회</button></td>
									<td style="width: 5%;"><button class="modiB" onclick="location.href='adminMemberModify?memberId=${member.id }'">수정</button></td>
						
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
	</div>
</div>
</div>
<%@ include file="../common/footer.jsp"%>
</body>
</html>