
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="assets/style/infomations.css">
<title>Insert title here</title>
<script src="../../assets/js/lib/jquery-1.12.4.min.js"></script>
	<script src="assets/js/lib/toastr.min.js"></script>
<script>
	$('document').ready(function(){
		if(${msg != null}){
			toastrMsg("${msg}","메세지");
		}
		
		$(".input1").val("${board}")
		$(".input2").val("${select}")
		$(".input3").val("${keyword}")
		
		const urlParams = new URL(location.href).searchParams;
		const page = urlParams.get('page');
		console.log(page);
	})
	
	
function secret() {
  alert("잠금처리된 게시글 입니다.");
}
</script>
</head>
<body>
<script type="text/javascript">
let pageNum = function(num){
	var url = "list?page="+num+"&size=10"; 
	
	$("#boardSearch").attr("action",url).submit();
}
</script>
<%@ include file="../common/header.jsp" %>
<div id="wrap" class="sub">
	<div id="container">
<!-- 페이지 위치 -->
<div class="page-location">
<span>홈</span>
<span>알림마당</span>
<span>묻고답하기</span>
</div>
		<div class="notification">
			<h3 class="title">묻고답하기</h3>
			<!-- 조회 -->
			<form id="boardSearch" method="POST">
				 <div class="search-area">
            <input type="hidden" name="writer" id="id" value="${member.id }">
            <input type="hidden" name="writer" id="bno" value="${boardDto.bno }">
            <span class="select">
                <select id="national-park1" name="category1">
                    <option value="all">국립공원 전체</option>
                    <option value="본부">본부</option>
                                
                                    <option value="지리산경남">지리산경남</option>
                                
                                    <option value="한려해상동부">한려해상동부</option>
                                
                                    <option value="한려해상">한려해상</option>
                                
                                    <option value="설악산">설악산</option>
                                
                               		<option value="내장산백암">내장산백암</option>
                                
                                    <option value="덕유산">덕유산</option>
                                
                                    <option value="오대산">오대산</option>
                                
                                    <option value="주왕산">주왕산</option>
                                
                                    <option value="태안해안">태안해안</option>
                                
                                    <option value="다도해해상">다도해해상</option>
                                
                                    <option value="치악산">치악산</option>
                                
                                    <option value="월악산">월악산</option>
                                
                                    <option value="소백산">소백산</option>
                                
                                    <option value="가야산">가야산</option>
                                
                                    <option value="북한산">북한산</option>
                                
                                    <option value="경주">경주</option>
                                
                                    <option value="계룡산">계룡산</option>
                                
                                    <option value="무등산">무등산</option>
                                
                                    <option value="변산반도">변산반도</option>
                                
                                    <option value="속리산">속리산</option>
                                
                                    <option value="월출산">월출산</option>
                                
                                    <option value="한라산">한라산</option>
                                
                                    <option value="태백산">태백산</option>
                                
                                    <option value="설악산생태탐방원">설악산생태탐방원</option>
                                
                                    <option value="지리산전북">지리산전북</option>
                                
                                    <option value="내장산">내장산</option>
                                
                                    <option value="다도해해상서부">다도해해상서부</option>
                                
                                    <option value="소백산북부">소백산북부</option>
                                
                                    <option value="가야산생태탐방원">가야산생태탐방원</option>
                                
                                    <option value="북한산도봉">북한산도봉</option>
                                
                                    <option value="무등산동부">무등산동부</option>
                                
                                    <option value="지리산전남">지리산전남</option>
                                
                                    <option value="한려해상생태탐방원">한려해상생태탐방원</option>
                                
                                    <option value="소백산생태탐방원">소백산생태탐방원</option>
                                
                                    <option value="지리산생태탐방원">지리산생태탐방원</option>
                                
                                    <option value="무등산생태탐방원">무등산생태탐방원</option>
                                
                                    <option value="내장산생태탐방원">내장산생태탐방원</option>
                                
                                    <option value="산악안전교육원">산악안전교육원</option>
                                
                                    <option value="북한산생태탐방원">북한산생태탐방원</option>
                                
                                    <option value="연구원">연구원</option>
                                
                                    <option value="생물종보전원">생물종보전원</option>
                </select>
            </span>
            <span class="select">
                <select id="national-park2" name="select">
                    <option value="all">전체</option>
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>
            </span>
            <input type="text" class="input-text" name="keyword" title="검색값을 입력해주세요." value="">
            <button class="btn" onclick="pageNum('0')">
                <i class="icon-search"></i>
                <span>조회</span>
            </button>
        		</div>
			</form>
			 <div class="article-info">
            <div class="left"><span class="total">총 <span>${totalElement }</span>건</span></div>
        </div>
			<!-- list -->
			<div class="board-area list">
			<table class="table">
            <caption>묻고답하기 리스트</caption>
            <colgroup>
                <col style="width: 5%;">
                <col style="width: 10%;">
                <col style="width: 10%;">
                <col>
                <col style="width: 10%;">
                <col style="width: 10%;">
                <col style="width: 10%;">
            </colgroup>
            <thead class="thead">
	            <tr>
	                <th scope="col">No</th>
	                <th scope="col">공원명</th>
	                <th scope="col">문의유형</th>
	                <th scope="col">제목</th>
	                <th scope="col">작성자</th>
	                <th scope="col">등록일</th>
	                <th scope="col">상태</th>
	            </tr>
            </thead>
            	<!-- 내용들어가는 곳 -->
            	<tbody class="tbody">
	             <c:forEach var="board" items="${boards}">
	            		<tr>
	            			<td>${board.bno}</td>
	            			<td>${board.category1}</td>
	            			<td>${board.type}</td>
	            			
	            			<c:choose>
	            				<c:when test="${member.id == board.writer || member.member == 'admin' || board.lock_yn == true}">
	            					<td><i class="icon-unlock"></i><a href="/boardDetail?bno=${board.bno}">${board.title}</a></td> 
	            				</c:when>
	            				<c:otherwise>
	            					<td><i class="icon-lock"></i><a href="/boardDetail?bno=${board.bno}" onclick="secret()">${board.title}</a></td> 
	            				</c:otherwise>
	            			</c:choose>
	            			
	            			<c:choose>
	            				<c:when test="${member.id == board.writer || member.member == 'admin'}"> 
	            					<td>${board.writer}</td>
	            				</c:when>
	            				<c:otherwise>
	            					<td>비밀입니다</td>
	            				</c:otherwise>
	            			</c:choose>
	            			<td>${board.createDate}</td>
	            			<td>
	            			<c:choose>
	            				<c:when test="${board.state == '0' }">
	            					<div style="color: red">접수</div>
	            				</c:when>
	            				<c:otherwise>
	            					<div style="color: green">처리완료</div>
	            				</c:otherwise>
	            			</c:choose>
	            			</td>
	            			<%-- <td>${board.state}</td> --%>
						</tr>
	            	</c:forEach>  
	            </tbody>
            </table>
            <c:if test="${member.member=='normal' }" >
            	<div class="board-bottom">
            	
            		<div class="right">
            			 <a href="/post" class="btn btn-list">글쓰기</a>
            		</div>
        		</div>
        		</c:if>
        
        		<!-- 페이징 -->
   					<table style = "text-align:center; width: 100%;">
   					<tr class = "page_tr">
								<td colspan = "6" class = "page_td">
							
									<c:forEach var = "i" begin="0" end ="${totalPage -1 }">
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
						</table>
			</div>
		</div>
		
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>