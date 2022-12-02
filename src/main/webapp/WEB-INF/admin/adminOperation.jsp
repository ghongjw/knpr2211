<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="assets/js/lib/jquery-1.12.4.min.js"></script>
<script src="assets/js/lib/toastr.min.js"></script>
<script src="../assets/js/adminOperation/adminOperation.js"></script>

<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="assets/style/infomations.css">

</head>
<body>
	<div id="mod"></div>
	<%@ include file="../common/headerAdmin.jsp"%>
	<%
	//지금 날짜 구하기
	Calendar now = Calendar.getInstance();

	int year = now.get(Calendar.YEAR);
	int month = now.get(Calendar.MONTH) + 1;
	int day = now.get(Calendar.DATE);
	int START_DAY_OF_WEEK = 0;
	int END_DAY = 0;
	//오늘의 달 첫 날과 끝날 구하기
	Calendar sDay = Calendar.getInstance();
	Calendar eDay = Calendar.getInstance();
	sDay.set(year, month - 1, 1);
	eDay.set(year, month, 1);
	eDay.add(Calendar.DATE, -1);
	START_DAY_OF_WEEK = sDay.get(Calendar.DAY_OF_WEEK);
	// eDay에 지정된 날짜
	END_DAY = eDay.get(Calendar.DATE);
	//다음달 캘린더 구현하기
	Calendar next=Calendar.getInstance();
	next.add(Calendar.MONTH, +1);
	
	int year2 = next.get(Calendar.YEAR);
	int month2 = next.get(Calendar.MONTH) + 1;
	int day2 = next.get(Calendar.DATE);
	int START_DAY_OF_WEEK2 = 0;
	int END_DAY2 = 0;
	
	Calendar sDayNext = Calendar.getInstance();
	Calendar eDayNext = Calendar.getInstance();

	sDayNext.set(year, month , 1);

	eDayNext.set(year, month, 1);
	eDayNext.add(Calendar.DATE, -1);

	START_DAY_OF_WEEK2 = sDayNext.get(Calendar.DAY_OF_WEEK);
	// eDay에 지정된 날짜
	END_DAY2 = eDayNext.get(Calendar.DATE);
	
	
	%>
	<script>
	
		var category1=$(".input1").val();
		var category2=$(".input2").val();
		var category3=$(".input3").val();
		var category4=$(".input4").val();
		var room=$(".input4").val();
		var startDay = "";
		var endDay = "";
		var strStartDay="";
		var strEndDay="";
		
		var a = 0
		var b = 0
		function select1() {
			category1 = $(".input1").val();
			$(".input2").css('display', 'block');
			$.ajax({
				type : 'post',
				url : 'findCategory2',
				data : category1,
				success : function(data) {
					$(".input2").html(data);
					$(".input3").css('display', 'none');
					$(".input4").css('display', 'none');
					$(".radioBox").html("");
					a=0
					b=0
				},
				error : function() {
				}
			})
		}
		function select2() {
			category2 = $(".input2").val();
			$(".input3").css('display', 'block');
			$.ajax({
				type : 'post',
				url : 'findCategory3',
				data : category2,
				success : function(data) {
					$(".input3").html(data);
					$(".input4").css('display', 'none');
					$(".radioBox").html("");
					a=0
					b=0
				},
				error : function() { 
				}
			})

		}
		function select3() {
			category3 = $(".input3").val();
			if(category1 == 'A'){
			$(".input4").css('display', 'block');
			}else{
				$(".input4").css('display', 'none');
			}
			$.ajax({
				type : 'post',
				url : 'findCategory4',
				data : category3,
				success : function(data) {
					$(".input4").html(data);
					$(".radioBox").html("");
					a=0
					b=1
				},
				error : function() { //데이터 주고받기가 실패했을 경우 실행할 결과

				}
			})

		}
		function select4() {
			category4 = $(".input4").val();
			$.ajax({
				type : 'post',
				url : 'findRoom',
				data : category4,
				success : function(data) {
					$(".radioBox").html(data);
					a=1
				},
				error : function() { 
				}
			})

		}
		var startDay = '';
		var endDay = '';
		var i = 0
		//SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		function calendarClick(obj,year,month,day){
			//$(this).addClass("is-active");
			  obj.classList.add("is-active")
			if(i==0){
			strStartDay=year+'-'+month+'-'+day
			date1 = new Date(strStartDay);
			startDay = date1.getTime();
			i=1
			}else if(i==1){
			strEndDay=	year+'-'+month+'-'+day
				date1 = new Date(strEndDay);
				endDay = date1.getTime();
				if(startDay>endDay){
					tmp = startDay
					startDay = endDay
					endDay = tmp
					
					tmp = strStartDay
					strStartDay = strEndDay
					strEndDay = tmp
					
				}
			i=2
			}else if(i==2){
				startDay=""
				endDay=""
				$('.calendar-day').removeClass("is-active")
					i=0
			}
			console.log("startday:"+startDay);
			console.log("endday:"+endDay);
			console.log(year+"년"+month+"월"+day+"일")
		}
		function send(){
			
			$.ajax({
				type : 'post',
				url : 'findRoom',
				data : category4,
				success : function(data) {
					$(".radioBox").html(data);
					a=1
				},
				error : function() { 
				}
			})
			
		}
		
	</script>
	<div class="adminOperation">
		<form action="" id="f">
				<h3 class="title">예약관리</h3>
			<div class="adimin_selectBox">
				<select name="category1" class="input1" style="width: inherit;"onchange="select1()">
					<option>선택하세요</option>
					<option value="A">야영장</option>
					<option value="B">대피소</option>
					<option value="C">생태탐방원</option>
					<option value="D">민박촌</option>
				</select> 
				<select name="category2" class="input2" style="width: inherit; display:none;"onchange="select2()" ><option>선택하세요</option></select> 
				<select name="category3" class="input3" style="width: inherit; display:none;" onchange="select3()" ><option>선택하세요</option></select>
				<select name="category4" class="input4" style="width: inherit; display:none;"onchange="select4()" ><option>선택하세요</option></select>
			</div>
		</form>
	</div>
	<div class="radioBox"></div>
	
	
		
	<div class="calendarBox">
	<table class="operationCalendar">
		<tr>
			<td colspan=7 style="font-size:20px; font-weight:bold;"><%=year%>년 <%=month%>월</td>
		</tr>
		<tr>
			<td>MON</td><td>TUE</td><td>WED</td><td>THE</td><td>FRI</td><td style="color:#004ea2;">SAT</td><td style="color:red;">SUN</td>
		</tr>
		<tr>
			<%
			for (int i = 1; i < START_DAY_OF_WEEK; i++) {
			%><td></td>
			<%}for (int i = 1, n = START_DAY_OF_WEEK; i <= END_DAY; i++, n++) {
			if(i<day){%>
			<td><button class = "calendar-day not-active" href="javascript:void(0);"><%=i%></button></td>
			<%}else if(i==day){%>
			<td><button class = "calendar-day today" href="javascript:void(0);"><%=i%></button></td>
			<%}
			else{ %>
			<td><button class = "calendar-day" onclick="calendarClick(this,'<%=year %>','<%=month%>','<%=i%>')"><%=i%></button></td>
			<%}if (n % 7 == 0){
			%></tr><tr>
			<%}	}%>
		</tr>
	</table>
		<table class="operationCalendar">
		<tr>
			<td colspan=7 style="font-size:20px; font-weight:bold;"><%=year2%>년 <%=month2%>월</td>
		</tr>
		<tr>
			<td>MON</td><td>TUE</td><td>WED</td><td>THE</td><td>FRI</td><td style="color:#004ea2;">SAT</td><td style="color:red;">SUN</td>
		</tr>
		<tr>
			<%
			for (int i = 1; i < START_DAY_OF_WEEK2; i++) {
			%><td></td>
			<%}for (int i = 1, n = START_DAY_OF_WEEK2; i <= END_DAY2; i++, n++) {
			 %>
			<td> <button class = "calendar-day" onclick="calendarClick(this,'<%=year2 %>','<%=month2 %>','<%=i%>')"><%=i%></button></td>
			<%if (n % 7 == 0){
			%></tr><tr>
			<%}	}%>
		</tr>
	</table>
	<button class="searchbtn" onclick="send()">조회</button>
	</div>
	
	
	
	<%@ include file="../common/footer.jsp"%>

</body>
</html>