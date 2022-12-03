<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.admin_container{background: url('cntnts/IMG_5643.jpg');
 background-repeat: no-repeat;
 background-size: 100%;  height: 70em;}
    .admin_container ul{text-align: center;}
	.admin_container ul li{ position: relative;
    display: block;
    width: 200px;
    height: 200px;
    line-height: 200px;
    align-content: flex-end;
    flex-direction: row;
    align-items: center;
    color:white;
    font-size:30px;
   font-family: "Gyeonggi Cheonnyeon";
    }
	.admin_container ul.type1 li span{position: absolute; background: darkblue; transition: all 0.5s;}
	.admin_container ul.type1 li span:nth-child(1) {left: 0; top: 0; width: 0; height: 1px;}
	.admin_container ul.type1 li span:nth-child(2) {right: 0; top: 0; width: 1px; height: 0;}
	.admin_container ul.type1 li span:nth-child(3) {right: 0; bottom: 0; width: 0; height: 1px;}
	.admin_container ul.type1 li span:nth-child(4) {left: 0; bottom: 0; width: 1px; height: 0;}
	.admin_container ul.type1 li:hover span:nth-child(1) {width: 100%;}
	.admin_container ul.type1 li:hover span:nth-child(2) {height: 100%;}
	.admin_container ul.type1 li:hover span:nth-child(3) {width: 100%;}
	.admin_container ul.type1 li:hover span:nth-child(4) {height: 100%;}

 </style>
<title>Knpr_manager</title>
</head>
<body id = "adminIndexBody">
	<div id = "adminIndex">
	</div>

<%@ include file="../common/headerAdmin.jsp" %>

<section>
  <div class="admin_container">
    <div class="background-img" style="position: absolute; display: flex; top: 30%;
    width: 100%; justify-content: space-evenly;">
      <div class="box1" onclick="location.href='adminMemberList'" style="background:rgba(0,0,0,0.2)">
		  <ul class="type1">
		      <li>회원조회
		        <span></span>
		        <span></span>
		        <span></span>
		        <span></span>
		      </li>
		    </ul>        
      </div>
      <div class="box2" style="background:rgba(0,0,0,0.2)">
		  <ul class="type1" onclick = "location.href='adminAttentionList?page=0&size=10'">
		      <li>공지사항
		        <span></span>
		        <span></span>
		        <span></span>
		        <span></span>
		      </li>
		    </ul>        
      </div>
      <div class="box3"  onclick="location.href='list?page=0&size=10'" style="background:rgba(0,0,0,0.2)">
		  <ul class="type1">
		      <li>묻고답하기
		        <span></span>
		        <span></span>
		        <span></span>
		        <span></span>
		      </li>
		    </ul>        
      </div>
    </div>
  </div>
</section>

</body>
</html>