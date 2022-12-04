<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="assets/style/infomations.css">
<script src="../../assets/js/lib/jquery-1.12.4.min.js"></script>
	<script src="assets/js/lib/toastr.min.js"></script>
<script>
	$('document').ready(function(){
		if(${msg != null}){
			toastrMsg("${msg}","메세지");
		}
		const urlParams = new URL(location.href).searchParams;
		const page = urlParams.get('page');
		console.log(page);
		
		$(".input1").val("${category2}").prop("selected",true);
		$(".input2").val("${select}").prop("selected",true);
		$(".input3").val("${search}");
	})
	
let pageNum = function(num){
		console.log(num)
	var url = "attentionList?page="+num+"&size=10"; 
	$("#attentionSearch").attr("action",url).submit();
}
</script>
</head>

<body>
<script type="text/javascript">


	 	
	 	</script>
	<%@ include file="../common/header.jsp"%>
	<div id="Attention_Wrap" style = "margin-top:80px;" class="sub">
	
		<div class="mypage">
			<h3 class="title">공지사항</h3>
			<div class="tab-content">
				<div class="tab-pane is-active" id="tab1">
					<!-- list -->
					<div class="board-area list">
						<div class="article-info">
							<div class="left">
								<span class="total"> 총 <span>${totalElements }</span>건
								</span>
							</div>
						</div>
						
						
						<form id="attentionSearch" method="Post">
								<div class="searchBox">
									<select name = "category2" class = "input1">
										<option value = "all">전체</option>
										<c:forEach var = "nameOfCat2" items = "${nameCategory2 }" varStatus = "status">
										<option value = "${category2s[status.index] }">${nameOfCat2 }</option>
										</c:forEach>
									</select>
									<select name="select" class="input2">
										<option value="all">전체</option>
										<option value="title">제목</option>
										<option value="content">내용</option>
									</select>
									<input type = "text" name = "search" class = "input3" placeholder="검색">
									<button class="searchbtn" onclick="pageNum('0')">
										<span class="searchB">조회</span>
									</button>
								</div>
						</form>


						<table class="table mem-list">

							<colgroup>
								<col style="width: 5%;">
								<col style="width: 10%;">
								<col style="width: 60%;">
								<col style="width: 5%;">
								<col style="width: 10%;">
<%-- 								<col style="width: 5%;"> --%>
<%-- 								<col style="width: 15%;"> --%>
							</colgroup>
							<thead class="thead">
								<tr>
									<th scope="col">No.</th>
									<th scope="col">공원명</th>
									<th scope="col">제목</th>
									<th scope="col">조회수</th>
									<th scope="col">등록일</th>
								</tr>
							</thead>
							<tbody class="tbody">
								<c:forEach var = "attention" items = "${attentions}" varStatus="status">
									<tr>
									<td style="width: 5%;">${attention.seq}</td>
									<td style="width: 10%;">${attention.category2 }</td>
									<td style="width: 20%;"><a href='attentionDetail?seq=${attention.seq }'>${attention.title }</a></td>
									<td style="width: 5%;">${attention.hit }</td>
									<td style="width: 30%;">${attention.createDate }</td>
									</tr>
								</c:forEach>
							</tbody>
							<tbody>
								<tr class = "page_tr">
								<td colspan = "5" class = "page_td">
							
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