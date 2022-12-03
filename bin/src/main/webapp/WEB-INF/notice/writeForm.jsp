<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writeForm</title>

</head>
<body>
<%@ include file="../common/header.jsp" %>
<div id="wrap" class="sub">
		<div id="container">
<div class="page-location">
    <span>홈</span>
    <span>알림마당</span>
    <span>묻고답하기</span>
</div>
			<div class="notification">
    <h3 class="title">묻고답하기</h3>
<form action="${root }writeProc" method="post" enctype="multipart/form-data">
	<div class="board-area write">
    	<table class="table">
        	<colgroup><col style="width: 15%;"><col></colgroup>
                <tbody class="tbody">
                <tr>
                    <th scope="row">제목 <span class="essential">필수입력</span></th>
                    <td class="form">
                        <label for="sj" class="hidden-text">제목</label>
                        <input type="text" class="input-text" placeholder="제목을 입력해주세요." title="제목" id="sj" name="title" value="">
                    </td>
                </tr>
                <tr>
                    <th scope="row">지역 <span class="essential">필수입력</span></th>
                    <td class="form">
                        <span class="select">
                            <select id="national-park1" name="category1">
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
                    </td>
                </tr>
                <tr>
                    <th scope="row">공지글여부</th>
                    <td class="form">
                        <span class="radio-1">
                            <input type="radio" name="noti" value="y"/>
                            <label for="radio20">중요 공지사항</label>
                        </span>
                        <span class="radio-1">
                            <input type="radio" name="noti" checked="checked" value="n"/>
                            <label for="radio19">일반 공지사항</label>
                        </span>
                    </td>
                </tr>
                <tr>
                    <th scope="row">내용 <span class="essential">필수입력</span></th>
                    <td class="form">
                      <textarea name="content" id="cn" cols="30" rows="10" class="textarea" title="내용 입력" placeholder="내용 입력"></textarea>
                    </td>
                </tr>
                <tr>
					<td align='right' height=40 colspan=2>
						<input type=file name="fileName" style="width: 300px; "/> 
					</td>
				</tr>
                </tbody>
            </table>
            <div class="board-bottom">
                <div class="center">
                    <a href="notice" class="btn btn-cancel">취소</a>
                    <input type=submit class="btn btn-register is-active" value="등록">
                </div>
            </div>
        </div>
    </form>
 </div>
 </div>
 </div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>