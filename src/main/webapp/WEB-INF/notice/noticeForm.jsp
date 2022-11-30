<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
     $("document").ready(function(){
            $("div.title").css("cursor", "pointer").click(function(){
                  let no = $(this).attr("id");
                  location.href='viewProc?writeNo=' + no;
            });
     });
</script>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div id="wrap" class="sub">
	<div id="container">

<div class="page-location">
<span>홈</span>
<span>알림마당</span>
<span>공지사항</span>
</div>
		<div class="notification">
			<h3 class="title">공지사항</h3>
			
			<!-- 조회 -->
			<form action="${root }noticeProc" id="searchForm" name="searchForm" method="POST">
				 <div class="search-area">
            <input type="hidden" name="pageNo" id="pageNo" value="1">
            <input type="hidden" name="seq" id="seq" value="">
            <span class="select">
                <select id="national-park1" name="category1">
                    <option value="국립공원 전체">국립공원 전체</option>
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
                    <option value="B121">소백산</option>
                    <option value="B131">가야산</option>
                    <option value="B141">북한산</option>
                    <option value="B151">경주</option>
                    <option value="B161">계룡산</option>
                    <option value="B171">무등산</option>
                    <option value="B181">변산반도</option>
                    <option value="B191">속리산</option>
                    <option value="B201">월출산</option>
                    <option value="B211">한라산</option>
                    <option value="B221">태백산</option>
                    <option value="B301">설악산생태탐방원</option>
                    <option value="B012">지리산전북</option>
                    <option value="B042">내장산</option>
                    <option value="B092">다도해해상서부</option>
                    <option value="B122">소백산북부</option>
                    <option value="B133">가야산생태탐방원</option>
                    <option value="B142">북한산도봉</option>
                    <option value="B172">무등산동부</option>
                    <option value="B013">지리산전남</option>
                    <option value="B024">한려해상생태탐방원</option>
                    <option value="B123">소백산생태탐방원</option>
                    <option value="B014001">지리산생태탐방원</option>
                    <option value="B231">무등산생태탐방원</option>
                    <option value="B331">내장산생태탐방원</option>
                    <option value="B961">산악안전교육원</option>
                    <option value="B971">북한산생태탐방원</option>
                    <option value="B981">연구원</option>
                    <option value="B991">생물종보전원</option>
                </select>
            </span>
            <span class="select">
                <select id="national-park2" name="select">
                    <option value="">전체</option>
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>
            </span>
            <input type="text" class="input-text" name='search' title="검색값을 입력해주세요." value="">
            <button class="btn" name='searchBtn'>
                <i class="icon-search"></i>
                <span>조회</span>
            </button>
        		</div>
			</form>
			<form id="f" method="get" >
			<div class="board-area list">
        	<div class="article-info"></div>
        	<c:choose>
        	<c:when test="${list.isEmpty() == true }">
        		<h1> 등록된 데이터가 존재하지 않습니다. </h1>
        	</c:when>
        	<c:otherwise>
	        <table class="table notice">
	            <caption>공지사항 리스트</caption>
	            <colgroup>
	                <col style="width: 10%;">
	                <col style="width: 15%;">
	                <col>
	                <col style="width: 15%;">
	                <col style="width: 15%;">
	            </colgroup>
	            <thead class="thead">
	            <tr>
	                <th scope="col">No</th>
	                <th scope="col">공원명</th>
	                <th scope="col">제목</th>
	                <th scope="col">조회수</th>
	                <th scope="col">등록일</th>
	            </tr>
	            </thead>
	            <tbody class="tbody">
	           
	            	<c:forEach var="list1" items="${noticeList1}">
	            	<c:set var="count" value="${count+1 }"/>
		            	<tr> 
		            		<td>${list1.no}</td>
		            		<td>${list1.category1}</td>
		            		<td><div id=${list1.no } class="title">${list1.title } </div></td>
		            		<td>${list1.hit}</td>
		            		<td>${list1.createDate}</td>
						</tr>
		            </c:forEach>
		            <c:forEach var="list" items="${noticeList}">
		            <c:set var="count" value="${count+1 }"/>
		            	<tr> 
		            		<td>${list.no}</td>
		            		<td>${list.category1}</td>
		            		<td><div id=${list.no } class="title">${list.title } </div></td>
		            		<td>${list.hit}</td>
		            		<td>${list.createDate}</td>
						</tr>
		            </c:forEach> 
	            </tbody>
	        </table>
	        </c:otherwise>
	        </c:choose>
	        <br>
	        <div class="article-info">
            	<div class="left"><span class="total">총 <span>${count}</span>건</span></div>
        	</div>
	      		<div class="board-bottom">
            		<div class="right">
            			<a class="btn btn-list" href="write">글쓰기</a>
            		</div>
        		</div>
    		</div>
    		</form>
    			<div class="paginator">${page }</div>
		</div>
	</div>
</div>

<%@ include file="../common/footer.jsp" %>

</body>
</html>