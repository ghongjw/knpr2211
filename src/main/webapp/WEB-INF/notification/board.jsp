<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
</head>
<body>
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
			<form id="searchForm" name="searchForm" method="post">
				 <div class="search-area">
            <input type="hidden" name="pageNo" id="pageNo" value="1">
            <input type="hidden" name="seq" id="seq" value="">
            <span class="select">
                <select id="national-park1" name="deptId">
                    <option value="">국립공원 전체</option>
                    <option value="B000">본부</option>
                    <option value="B011">지리산경남</option>
                    <option value="B021">한려해상동부</option>
                    <option value="B022">한려해상</option>
                    <option value="B031">설악산</option>
                    <option value="B041">내장산백암</option>
                    <option value="B051">덕유산</option>
                    <option value="B061">오대산</option>
                    <option value="B071">주왕산</option>
                    <option value="B081">태안해안</option>
                    <option value="B091">다도해해상</option>
                    <option value="B101">치악산</option>
                    <option value="B111">월악산</option>
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
                <select id="national-park2" name="searchCondition">
                    <option value="all">전체</option>
                    <option value="sj">제목</option>
                    <option value="cn">내용</option>
                </select>
            </span>
            <label for="searchKeyword" class="hidden-text">검색값 입력</label>
            <input type="text" class="input-text" id="searchKeyword" name="searchKeyword" title="검색값을 입력해주세요." value="">
            <button class="btn">
                <i class="icon-search"></i>
                <span>조회</span>
            </button>
        		</div>
			</form>
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
	           		<c:forEach var="board" items="${list}">
	            		<tr>
	            			<td>${board.bno}</td>
	            			<td>${board.category1}</td>
	            			<td>${board.type}</td>
	            			<td><a href="view?bno=${board.bno}">${board.title}</a></td>
	            			<td>${board.writer}</td>
	            			<td>${board.createDate}</td>
	            			<td>${board.state}</td>
						</tr>
	            	</c:forEach>  
	            </tbody>
            </table>
            	<div class="board-bottom">
            		<div class="right">
                		<a href="write" class="btn btn-list">글쓰기</a>
            		</div>
        		</div>
			</div>
		</div>
		
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>