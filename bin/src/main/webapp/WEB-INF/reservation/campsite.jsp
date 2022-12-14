<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<c:url var="root" value="/" />
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
	<title>국립공원공단 예약시스템</title>
  <link rel="stylesheet" href="/assets/style/reservation/campsite.css">
                            
 <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 <script src="https://www.google.com/recaptcha/api.js"></script>


<script>

 
//$.ajax({cache: false });
//$.ajax({async: false });


//1. 메뉴 클릭하면 테이블 화면 출력 
function clickPlace(sel1, sel2){

	if(sel1 != null && sel2 != null){
		document.getElementById("content-view").style.display = 'block';
		document.getElementById("nodata1").style.display = 'none';
		document.getElementById("nodata2").style.display = 'none';
		
		if(sel1 =='16' && sel2 == '01'){
			document.getElementById("content-view").style.display = 'none';
			document.getElementById("nodata1").style.display = 'none';
			document.getElementById("nodata2").style.display = 'block';
		}
		
		$('#inputSelectCampsite').html(" ")
		$('#inputStartDate').html(" ")
		$('#inputEndDate').html(" ")
		$('#stayInfo').html(" ")
		$('#paymentGroup').html(" ")
		
	}
	
	sendData(sel1, sel2);

}



//2. DB 조회 후, 예약 테이블에 데이터 출력
function sendData(sel1, sel2){
		
    var id = sel1 + sel2;
    var codeName = "A" + sel1 + sel2 ; 
    var campsiteCode = "";
    var camp_tag = "";
    var checkBox = "";
 
    
		//A0101 (야영장-가야산-삼정)
		$.ajax({
			type : "post",
			url : "campsiteView",
			cache : false,
			data : {
				code : codeName
			},
			
			success : function(result) {
				var list = result.list;
				var check = result.checkList;				

				for(var i = 0; i < list.length; i++){ 
					
					//2-1. 산이름 출력 (가야산)
					document.querySelector('#category2').innerHTML = "<i class=icon-location></i>" +list[i].category2;
					
					//2-2. 지역명 출력 (백운동)
					document.querySelector('#category3').innerHTML = list[i].category3 +" "+"야영장 예약현황";
					
					//2-3. 야영장명 출력 (자동차야영장 or 자연의 집)
  					if(i == 0 ){
						 camp_tag +="<tr><th rowspan=15 scope=row><span class=title>" + list[i].category4 + "</span></th>" +
		            	"<th scope=row><i class=icon-electricity></i><span class=title>" + list[i].room + "</span></th></tr>"
 	
					}else{
	 			
	 					camp_tag += "<tr><th scope=row><i class=icon-electricity></i><span class=title>" + list[i].room + "</span></th></tr>"
						
					} 
  					
  			
				}
				 
				
				
				//2-4. 야영장명 체크박스 출력 (자동차야영장 And 자연의 집)
				campsiteCode = codeName + "0";
				
				for(var j = 0; j < check.length; j++){
					var index = j + 1;
					
					//맨 처음 생성되는 체크 박스는 체크된 채로 들어오게 함
					//index 값을 1부터 하여 야영장번호를 01,02,03... 로 하여 인자값을 생성함
					if(index == 1){
					checkBox += "<li>" + 
                    "<span class=checkbox-1>" +
                    "<input type=checkbox id=check"+index +" name=campGnbChk value=" +campsiteCode+index+ " checked=checked" + 
                    " onclick=selectCampsite("+"'"+campsiteCode+index+"'"+");>" +
					"<label for=check"+index+">"+check[j]+"</label></span></li>"  
					selectCampsite(campsiteCode+index);
					
					//두번째 오는 체크 박스 부터는 여기에 해당
					}else{
						checkBox += "<li>" + 
	                    "<span class=checkbox-1>" +
	                    "<input type=checkbox id=check"+index +" name=campGnbChk value=" +campsiteCode+index+ 
	                    " onclick=selectCampsite("+"'"+campsiteCode+index+"'"+");>" +
						"<label for=check"+index+">"+check[j]+"</label></span></li>"  
						
					}
				}
			
				

				document.querySelector('#check-area').innerHTML = checkBox; 	
				document.querySelector('#campsiteName').innerHTML = camp_tag; 
				
				
				
				//2-5. 날짜 출력(월 And 일)
				var date_tag = "";
				var month_tag = "";
				
				var timestamp = Date.now(); //현재시간 타임스탬프 13자리 예)1599891939914
				var now = new Date(timestamp); 

				
				let lastDate = new Date(now.getFullYear(), now.getMonth()+1, 0);
				var lastDate_num = lastDate.getDate(); //현재 월 마지막 날짜
				var dateCheck = lastDate_num-now.getDate()-1; //현재 월에서 마지막 날까지 남은 일수-1
				
				
 				var selectDate = new Date();
				selectDate = new Date(selectDate.getFullYear(), (selectDate.getMonth()), selectDate.getDate());
				 
				 var thisDate = new Date();
				 var nextDate   = new Date();
				 
				 thisDate.setFullYear(selectDate.getFullYear());
				 nextDate.setFullYear(selectDate.getFullYear());
				 
				 thisDate.setMonth((selectDate.getMonth()));
				 nextDate.setMonth((selectDate.getMonth()+1));
				 
				 thisDate.setDate((selectDate.getDate()));
				 nextDate.setDate((selectDate.getDate()));
				 
				 
				var inputThisDate = "thisDate"+":"+thisDate.getFullYear()+"."+(thisDate.getMonth()+1)+"."+(thisDate.getDate())
			    var inputNextDate = "nextDate"+":"+nextDate.getFullYear()+"."+(nextDate.getMonth()+1)+"."+(nextDate.getDate())
			    
			    var thisMonth = thisDate.getMonth()+1;
				var nextMonth = nextDate.getMonth()+1;
				
				
				var colNum = lastDate_num-now.getDate();
				
				//월 출력
				if(colNum == 0){ //이번달의 마지막 날일 경우
					month_tag +=
						"<th colspan="+ 23 +" scope="+"'col'"+"><span>" + nextMonth + "월 </span></th>" 
				}else{
					var tmp = colNum-23; // tmp는 이번 달의 남은 일수 - 23
					
					if(tmp >= 0){ // 이번 달의 남은 일수가 23일이거나 23일보다 클 때
						month_tag +=
						"<th colspan="+ 23 +" scope="+"'col'"+"><span>"+ thisMonth +"월 </span></th>"
						
					} else{ // tmp < 0 일때
					month_tag +=
						"<th colspan="+ colNum +" scope="+"'col'"+"><span>"+ thisMonth +"월 </span></th>"
					month_tag +=
						"<th colspan="+ (tmp * -1)+" scope="+"'col'"+"><span>"+ nextMonth +"월 </span></th>" 
					}
					
				}

				
				
				
				//일 출력 (토,일 구분 가능)
				for(var i = 0; i < 23; i++){
					if(dateCheck >= i){
						var selectDate = new Date();
						selectDate = new Date(selectDate.getFullYear(), selectDate.getMonth(), (selectDate.getDate()+1+i));
						
						var thisDate = new Date();
						
						thisDate.setFullYear(selectDate.getFullYear());
						thisDate.setMonth((selectDate.getMonth()));
						thisDate.setDate((selectDate.getDate()));
						
						var inputDate = (("00"+thisDate.getDate().toString()).slice(-2));
						var selectDay = "'" + +thisDate.getFullYear() + "-" + (thisDate.getMonth()+1) + "-" + inputDate + "'" ;
						var inputDay = getInputDayLabel(selectDay)
						
						
						if(inputDay == "sat"){
							date_tag += "<td id='sat' class='sat'>"+inputDate+"</td>"
						
						}else if(inputDay == "sun"){
							date_tag += "<td id='sun' class='sun'>"+inputDate+"</td>"
						
						}else{
							date_tag += "<td>"+inputDate+"</td>"
						}
						
						
					
					}else{
						var selectDate = new Date();
						selectDate = new Date(selectDate.getFullYear(), selectDate.getMonth(), (selectDate.getDate()+1+i));
						
						var thisDate = new Date();
						
						thisDate.setFullYear(selectDate.getFullYear());
						thisDate.setMonth((selectDate.getMonth()));
						thisDate.setDate((selectDate.getDate()));
						
						var inputDate = (("00"+thisDate.getDate().toString()).slice(-2));
						var selectDay = "'" + +thisDate.getFullYear() + "-" + (thisDate.getMonth()+1) + "-" + inputDate + "'" ;
						var inputDay = getInputDayLabel(selectDay)

						
						if(inputDay == "sat"){
							date_tag += "<td id='sat' class='sat'>"+inputDate+"</td>"
						
						}else if(inputDay == "sun"){
							date_tag += "<td id='sun' class='sun'>"+inputDate+"</td>"
						
						}else{
							date_tag += "<td>"+inputDate+"</td>"
						}
			
					
					}
					
				}
				
		
				document.querySelector('.month').innerHTML = month_tag;  
 				document.querySelector('.day').innerHTML = date_tag;
				



		     },
			error : function() {
				toastrMsg("error");
			}
		     
		    
			
		     
		});
		
	
			
}

 

//3. DB 조회 후, 테이블에 방번호 01~ 부터 출력
 function selectCampsite(selectCode){
	var camp_tag = "";
	var room_tag = "";
	var timestamp = Date.now(); 
	var now = new Date(timestamp); 
	let lastDate = new Date(now.getFullYear(), now.getMonth()+1, 0);
	var lastDate_num = lastDate.getDate(); //현재 월 마지막 날짜
	var dateCheck = lastDate_num-now.getDate()-1; //현재 월에서 마지막 날까지 남은 일수-1
	var arrayRoom = [];
	var arrayDate = [];
	
	//A010101(야영장-가야산-삼정-자동차야영장)
	$.ajax({
		url : "roomView",
		type : "post",
		cache : false,
		data : {
			code : selectCode
		},
		
		success : function(result) {
			var rooms = result.rooms;
			var roomTotal = rooms.length;
			
			for(var i = 0; i < rooms.length; i++){
				
				if(i == 0 ){
					
					camp_tag += "<tr><th rowspan=15 scope=row><span class=title>" + rooms[i].category4 + "</span></th>" + 
	            	"<th scope=row><i class=icon-electricity></i><span class=title>" + rooms[i].room + "</span></th></tr>"
	            	
	            	var roomNumber = selectCode + rooms[i].room ;
	            	arrayRoom.push(roomNumber)
	      			

				}else{
						 
					camp_tag +="<tr><th scope=row><i class=icon-electricity></i><span class=title>" + rooms[i].room + "</span></th></tr>"
		            	
		            	var roomNumber = selectCode + rooms[i].room ;
		            	arrayRoom.push(roomNumber)
						
				}
				
			}
			
			
			
			//전체영지수 (토,일 구분 가능)
			for(var i = 0; i < 23; i++){
				if(dateCheck >= i){
					var selectDate = new Date();
					selectDate = new Date(selectDate.getFullYear(), selectDate.getMonth(), (selectDate.getDate()+1+i));
					
					var thisDate = new Date();
					
					thisDate.setFullYear(selectDate.getFullYear());
					thisDate.setMonth((selectDate.getMonth()));
					thisDate.setDate((selectDate.getDate()));
					
					var inputDate = (("00"+thisDate.getDate().toString()).slice(-2));
					var selectDay = "'" + +thisDate.getFullYear() + "-" + (thisDate.getMonth()+1) + "-" + inputDate + "'" ;
					var arrDate = thisDate.getFullYear() + "-" + (thisDate.getMonth()+1) + "-" + inputDate ;
					var inputDay = getInputDayLabel(selectDay)
					
					if(inputDay == "sat"){
						room_tag += "<td id='sat' class='sat'>"+roomTotal+"</td>"
					
					}else if(inputDay == "sun"){
						room_tag += "<td id='sun' class='sun'>"+roomTotal+"</td>"
					
					}else{
						room_tag += "<td>"+roomTotal+"</td>"
					}
					
					arrayDate.push(arrDate)
					
					
				
				}else{
					var selectDate = new Date();
					selectDate = new Date(selectDate.getFullYear(), selectDate.getMonth(), (selectDate.getDate()+1+i));
					
					var thisDate = new Date();
					
					thisDate.setFullYear(selectDate.getFullYear());
					thisDate.setMonth((selectDate.getMonth()));
					thisDate.setDate((selectDate.getDate()));
					
					var inputDate = (("00"+thisDate.getDate().toString()).slice(-2));
					var selectDay = "'" + +thisDate.getFullYear() + "-" + (thisDate.getMonth()+1) + "-" + inputDate + "'" ;
					var arrDate = thisDate.getFullYear() + "-" + (thisDate.getMonth()+1) + "-" + inputDate ;
					var inputDay = getInputDayLabel(selectDay)

					
					if(inputDay == "sat"){
						room_tag += "<td id='sat' class='sat'>"+roomTotal+"</td>"
					
					}else if(inputDay == "sun"){
						room_tag += "<td id='sun' class='sun'>"+roomTotal+"</td>"
					
					}else{
						room_tag += "<td>"+roomTotal+"</td>"
					}
					
					
					arrayDate.push(arrDate)
				
				}
				
			}
			
			
	
			reservationState(arrayRoom, arrayDate)


			document.querySelector('#campsiteName').innerHTML = camp_tag; 
			document.querySelector('.roomTotal').innerHTML = room_tag;
			
		},
		error : function() {
			toastrMsg("error");
		}
	     	
	     
	});

	


}



//4. 야영장명 체크박스 클릭시, 단일 선택되게 하되, 무조건 1개는 필수 선택되게 함
 $(document).on('click', 'input:checkbox[name="campGnbChk"]', function(){
	 var cnt = 0;
	
    if(this.checked) {
        const checkboxes = $('input:checkbox[name="campGnbChk"]');
        for(let ind = 0; ind < checkboxes.length; ind++){
            checkboxes[ind].checked = false;
        }
        this.checked = true;
        cnt++;
        
		$('#inputSelectCampsite').html(" ")
		$('#inputStartDate').html(" ")
		$('#inputEndDate').html(" ")
		$('#stayInfo').html(" ")
		$('#paymentGroup').html(" ")
        
    }else{
    	
    	if(cnt == 0){
    		this.checked = true;
    		toastrMsg("한개 이상 선택해야 합니다.")
    		
    	}else{
    		this.checked = false;
    		
    		$('#inputSelectCampsite').html(" ")
    		$('#inputStartDate').html(" ")
    		$('#inputEndDate').html(" ")
    		$('#stayInfo').html(" ")
    		$('#paymentGroup').html(" ")
    	}
        

    }
}); 



 
 //5-1. 날짜 별로 요일 확인 후 영문 요일로 반환
 function getInputDayLabel(selectDay) {
	    
	    var week = new Array('sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat');
	    
	    var today = new Date(selectDay).getDay();
	    var todayLabel = week[today];
	    
	    return todayLabel;
}
 
 //5-2. 날짜 별로 요일 확인 후 한글 요일로 반환
 function getInputDayKRLabel(selectDay) {
	    
	    var week = new Array('일', '월', '화', '수', '목', '금', '토');
	    
	    var today = new Date(selectDay).getDay();
	    var todayLabel = week[today];
	    
	    return todayLabel;
}
 
 
 //6. 현재 예약 상태 조회 후 예약가능/불가능 반환
  function reservationState(arrayRoom, arrayDate){
   var state_tag = "";
   var num = 1;
   var arrayState = [];
 
	 
	 $.ajax({
	     method      : 'POST',
	     url         : 'reservationState',
	     traditional : true,
	     data        : {
	         'rooms' : arrayRoom
	     },
	     success     : function(result) {
	    	 var reservations = result.reservations;
	    	 var roomList = result.roomList;
	    	 var dateList = result.dateList;
	    	 var roomMax = result.roomMax;
	    	 var check1 = 0;
	    	 

	    	 
	    	  for(var i = 0; i < reservations.length; i++){
	    		 if(i % 23 == 0){
	    			 state_tag += "<tr>"
	    			  
	    			 if(reservations[i] == "예약가능"){
		    				 state_tag += "<td data-rev="+"'"+reservations[i]+"'"+"id="+"'"+"a"+roomList[i]+dateList[i]+"'"+
		    				 " onclick="+"oneNightCheck("+"'"+roomList[i]+"'"+","+"'"+dateList[i]+"'"+
							 ","+"'"+reservations[i]+"'"+")"+"><i class="+"icon-reservation"+"></i></td>" 
	    				 arrayState.push("0")
	    				 console.log(dateList[i])

	    				 
	    			 }else{
	    				 state_tag += "<td data-rev="+"'"+reservations[i]+"'" + "id="+"'"+"a"+roomList[i]+dateList[i]+"'"+
	    				 " onclick="+"oneNightCheck("+"'"+roomList[i]+"'"+","+"'"+dateList[i]+"'"+
						 ","+"'"+reservations[i]+"'"+")"+"><i class="+"icon-end"+"></i></td>" 
	    				 arrayState.push("1")
	    				 console.log(dateList[i])

	    			 }
	    		 
	    		 }
	    		 
	    		 
	    		 if(i % 23 != 0){
	    			 
	    			 if(reservations[i] == "예약가능"){
	    				 state_tag += "<td data-rev="+"'"+reservations[i]+"'" +"id="+"'"+"a"+roomList[i]+dateList[i]+"'"+
	    				 " onclick="+"oneNightCheck("+"'"+roomList[i]+"'"+","+"'"+dateList[i]+"'"+
						 ","+"'"+reservations[i]+"'"+")"+"><i class="+"icon-reservation"+"></i></td>" 
	    				 arrayState.push("0")
	    				console.log(dateList[i])

	    				 
	    			 }else{
	    				 state_tag += "<td data-rev="+"'"+reservations[i]+"'"+"id="+"'"+"a"+roomList[i]+dateList[i]+"'"+
	    				 " onclick="+"oneNightCheck("+"'"+roomList[i]+"'"+","+"'"+dateList[i]+"'"+
						 ","+"'"+reservations[i]+"'"+")"+"><i class="+"icon-end"+"></i></td>" 
	    				 arrayState.push("1")
	    				 console.log(dateList[i])

	    			 }
	    		 
	    		 } 
	    		 
	    		 
	    		 if( ((23 * num) -1 ) == i ){
	    			 state_tag += "</tr>"
	    			 num ++;
	    		 }
	    		 
	    	 }
	    	  


				// 7. 예약가능 시설수 출력
				var arrRoomMax = []; //방 갯수를 23개의 배열에 담아줌
				for(var i = 0; i < 23; i++){
					arrRoomMax[i] = roomMax;
				}

				var tmp = "";
				var k = 1;
				var j = 0;  //각 날짜 별 방번호에 해당하는 예약현황(예약불가는 "1"/예약가능은 "0""-숫자로 담음)만큼 배열을 만듦 / 23개 씩 row(tr)이 생성되므로 23의 배수				
				for(var i = 0; i < arrayState.length; i++){ 
	    			  if((23*k) - i == 1 ){ //23*1 / 23*2 / 23*3... 의 -1의 지점에서 다시 arrRoomMax[0] 으로 초기화
	    				  var tmp = parseInt(arrRoomMax[j])-parseInt(arrayState[i]);
	    				  var str = tmp.toString();
	    				  arrRoomMax[j] = str;
	    				  k++;
	    				  j = 0;
	    				  
	    			  }else{//arrRoomMax[0]~arrRoomMax[21] 과 같이 순차적으로 배열에 담김
	    				  var tmp = parseInt(arrRoomMax[j])-parseInt(arrayState[i]);
	    				  var str = tmp.toString();
	    				  arrRoomMax[j] = str;
	    				  j++;
	    			  }
    		  
	    	  }
				
				//요일 구분
				var timestamp = Date.now(); 
				var now = new Date(timestamp); 
				let lastDate = new Date(now.getFullYear(), now.getMonth()+1, 0);
				var lastDate_num = lastDate.getDate(); //현재 월 마지막 날짜
				var dateCheck = lastDate_num-now.getDate()-1; //현재 월에서 마지막 날까지 남은 일수-1
				
				
				var roomMax_tag;
				for(var i = 0; i < arrRoomMax.length; i++ ){
					
					for(var i = 0; i < 23; i++){
						if(dateCheck >= i){
							var selectDate = new Date();
							selectDate = new Date(selectDate.getFullYear(), selectDate.getMonth(), (selectDate.getDate()+1+i));
							
							var thisDate = new Date();
							
							thisDate.setFullYear(selectDate.getFullYear());
							thisDate.setMonth((selectDate.getMonth()));
							thisDate.setDate((selectDate.getDate()));
							
							var inputDate = (("00"+thisDate.getDate().toString()).slice(-2));
							var selectDay = "'" + +thisDate.getFullYear() + "-" + (thisDate.getMonth()+1) + "-" + inputDate + "'" ;
							var inputDay = getInputDayLabel(selectDay)
							
							if(inputDay == "sat"){
								roomMax_tag += "<td id='sat' class='sat'>"+arrRoomMax[i]+"</td>"
							
							}else if(inputDay == "sun"){
								roomMax_tag += "<td id='sun' class='sun'>"+arrRoomMax[i]+"</td>"
							
							}else{
								roomMax_tag += "<td>"+arrRoomMax[i]+"</td>"
							}

							
							
						}else{
							var selectDate = new Date();
							selectDate = new Date(selectDate.getFullYear(), selectDate.getMonth(), (selectDate.getDate()+1+i));
							
							var thisDate = new Date();
							
							thisDate.setFullYear(selectDate.getFullYear());
							thisDate.setMonth((selectDate.getMonth()));
							thisDate.setDate((selectDate.getDate()));
							
							var inputDate = (("00"+thisDate.getDate().toString()).slice(-2));
							var selectDay = "'" + +thisDate.getFullYear() + "-" + (thisDate.getMonth()+1) + "-" + inputDate + "'" ;
							var inputDay = getInputDayLabel(selectDay)

							
							if(inputDay == "sat"){
								roomMax_tag += "<td id='sat' class='sat'>"+arrRoomMax[i]+"</td>"
							
							}else if(inputDay == "sun"){
								roomMax_tag += "<td id='sun' class='sun'>"+arrRoomMax[i]+"</td>"
							
							}else{
								roomMax_tag += "<td>"+arrRoomMax[i]+"</td>"
							}
				
						
						}
						
					}
				
				}
	  
	    	
			 $(".roomMax").html(roomMax_tag);
	    	 $("#reservationState").html(state_tag);
	    	
	    	 
	     },
	     error       : function() {
	    	 toastrMsg("error");
	     }
	  
	 }); 
	 
		
	
 } 
 
 
 // 7. 1박 2일 일때, 사용자가 선택한 값이 예약가능하다면 입퇴실 선택 가능
 function oneNightCheck(room, date, state){


	 if(state == "예약가능"){
	 
	 $.ajax({
			url : "oneNightCheck",
			type : "post",
			cache : false,
			data : {
				room : room,
				date : date
			},
			
			success : function(result) {
				var dateList = result.dateList;
				var nextRoom = dateList.room
				var nextDate = dateList.date1
				var afterDate = dateList.date2
				var nextState = dateList.state
				
				
				if(nextState == "예약가능"){
					tds = document.querySelectorAll('td');
					for(var i = 0; i < tds.length; i++){
						td = tds[i];
						td.className = "";
					}
 					document.getElementById("a"+room+date).className = 'start selected';
  					document.getElementById("a"+room+nextDate).className = 'end selected';
 					
 					inputSelectInfo1(room, date, nextDate, afterDate)			
								
					
				}else {
					toastrMsg("선택한 날짜는 1박 2일 예약이 불가합니다. 다른 날짜를 선택해 주세요."); 			
				}
	

				
			},
			error : function() {
				
				toastrMsg("error");
			}
		     	
		     
		});
	 
	 }else{
		 toastrMsg("선택한 날짜는 1박 2일 예약이 불가합니다. 다른 날짜를 선택해 주세요.");
	 }
 }
 



// 8. 사용자가 선택했을 때, 1박 2일 예약이 가능하면 장소 정보 화면에 출력
function inputSelectInfo1(room, date, nextDate, afterDate){
	
	 $.ajax({
			url : "inputSelectInfo",
			type : "post",
			cache : false,
			data : {
				room : room,
			},
			
			success : function(result) {
				var infoMap = result.infoMap;
				var c1 = infoMap.c1
				var c2 = infoMap.c2
				var c3 = infoMap.c3
				var c4 = infoMap.c4
				var roomNum = infoMap.roomNum
				var price = infoMap.price
				var people = infoMap.people
				
				var selectInfo = c2+"-"+c3+"-"+c4+"-"+roomNum
				
				var str1 = "'"+date+"'";
				var startLabel = getInputDayKRLabel(str1)
				var str2 = "'"+nextDate+"'";
				var endLabel = getInputDayKRLabel(str2)
				
				var startDate = date+"["+startLabel+"]"
				var endDate = nextDate+"["+endLabel+"]"
				
				
				$('#inputSelectCampsite').html(selectInfo)
				$('#inputStartDate').html(startDate)
				$('#inputEndDate').html(endDate)
				
				
				var stay_tag = "<span class='length-stay selected' id='oneDaychecked' onclick="+
				"oneDayInputSelectInfo("+"'"+room+"'"+","+"'"+date+"'"+","+"'"+nextDate+"'"+") style='cursor:pointer'>1박 2일</span>"+
                "<span class='length-stay' id='secondDayChecked' onclick="+"secondNightCheck("+
				"'"+room+"'"+","+"'"+date+"'"+","+"'"+nextDate+"'"+","+"'"+afterDate+"'"+ ") style='cursor:pointer'>2박 3일</span>"
				
				$('#stayInfo').html(stay_tag)

	
	
                var pay_tag = "<dl><dt><em>"+c1+"</em></dt><dd></dd></dl>"+
                "<dl class='campsitePayment'><dt>"+c4+" "+roomNum+" : "+
                "<span style='font-size: 18px; font-weight:bold;' id='inputAllDay'>1박 2일"+
                "</span></dt><dd>"+price+"원</dd></dl><br><br><br>"+
            	"<dl><dt>결제(예정)금액</dt><dd><em style='font-size:30px' id='inputPrice'>"+
            	price+"</em>원</dd></dl>"
				
            	$('#paymentGroup').html(pay_tag)
            	
            	$('input[name=inputValue]').attr('value', people);
				$('#selectPeopleNum').show();
				
				$('#productCode').attr('value', room);

            	
			},
			error : function() {
				
				toastrMsg("error");
			}
	
	 });

}


// 9. 화면에서 1박 2일 선택한 다음에, 다시 2박 3일 선택했을 때, 2박 3일로 예약 가능한지 확인 후 예약 가능 여부 출력
	function secondNightCheck(room, date, nextDate, afterDate){
	
		$('#secondDayChecked').addClass('length-stay selected');
		$('#oneDaychecked').removeClass('length-stay selected');
		$('#oneDaychecked').addClass('length-stay');
	
		var chkDate1 = $(document).find("#a"+room+date).data("rev")
		var chkDate2 = $(document).find("#a"+room+nextDate).data("rev")
		var chkDate3 = $(document).find("#a"+room+afterDate).data("rev")
	
		
		if(chkDate2 == "예약불가" || chkDate3 == "예약불가"){
			toastrMsg("선택한 날짜는 2박 3일 예약이 불가합니다. 다른 날짜를 선택해 주세요.");
		
		}else{
			
			tds = document.querySelectorAll('td');
			for(var i = 0; i < tds.length; i++){
				td = tds[i];
				td.className = "";
			}
			
				document.getElementById("a"+room+date).className = 'start selected';
				document.getElementById("a"+room+nextDate).className = 'selected';
				document.getElementById("a"+room+afterDate).className = 'end selected';
				
				
				inputSelectInfo2(room, date, nextDate, afterDate)
				
		}
		

		
	}
	
	
	// 10. 사용자가 선택했을 때, 2박 3일 예약이 가능하면 장소 정보 화면에 출력
	function inputSelectInfo2(room, date, nextDate, afterDate){
		
		 $.ajax({
				url : "inputSelectInfo",
				type : "post",
				cache : false,
				data : {
					room : room,
				},
				
				success : function(result) {
					var infoMap = result.infoMap;
					var c1 = infoMap.c1
					var c2 = infoMap.c2
					var c3 = infoMap.c3
					var c4 = infoMap.c4
					var roomNum = infoMap.roomNum
					var price = infoMap.price
					var people = infoMap.people
					
					var selectInfo = c2+"-"+c3+"-"+c4+"-"+roomNum
					
					var str1 = "'"+date+"'";
					var startLabel = getInputDayKRLabel(str1)
					var str2 = "'"+afterDate+"'";
					var endLabel = getInputDayKRLabel(str2)
					
					var startDate = date+"["+startLabel+"]"
					var endDate = afterDate+"["+endLabel+"]"
					
					
					$('#inputSelectCampsite').html(selectInfo)
					$('#inputStartDate').html(startDate)
					$('#inputEndDate').html(endDate)
					
					
					
					var stay_tag = "<span class='length-stay selected' id='oneDaychecked' onclick="+
					"oneDayInputSelectInfo("+"'"+room+"'"+","+"'"+date+"'"+","+"'"+nextDate+"'"+") style='cursor:pointer'>1박 2일</span>"+
	                "<span class='length-stay' id='secondDayChecked' onclick="+"secondNightCheck("+
					"'"+room+"'"+","+"'"+date+"'"+","+"'"+nextDate+"'"+","+"'"+afterDate+"'"+ ") style='cursor:pointer'>2박 3일</span>"
					
					$('#stayInfo').html(stay_tag)
					

					
					var tmp = price.replace(",", "");
					var money = parseInt(tmp); 
					var totalMoney = (money * 2).toLocaleString(); ;
					
	                var pay_tag = "<dl><dt><em>"+c1+"</em></dt><dd></dd></dl>"+
	                "<dl class='campsitePayment'><dt>"+c4+" "+roomNum+" : "+
	                "<span style='font-size: 18px; font-weight:bold;' id='inputAllDay'>2박 3일"+
	                "</span></dt><dd>"+totalMoney+"원</dd></dl><br><br><br>"+
	            	"<dl><dt>결제(예정)금액</dt><dd><em style='font-size:30px' id='inputPrice'>"+
	            	totalMoney+"</em>원</dd></dl>"
					
	            	$('#paymentGroup').html(pay_tag)
	            	
	            	$('input[name=inputValue]').attr('value', people);
	                $('#selectPeopleNum').show();
	                
	                $('#productCode').attr('value', room);

	            	
				},
				error : function() {
					
					toastrMsg("error");
				}
		
		 });

	}


	
    // 11. 인원수 선택      
	 $(function(){
		 $('#decreaseQuantity').click(function(e){
		 e.preventDefault();
		 var stat = $('#numberUpDown').text();
		 var num = parseInt(stat,10); //10진수 정수로 변환
		 num--;
		 if(num <= 0){
			 toastrMsg('1명 이상 선택해야 합니다.');
		 num = 1;
		 }
		 
		$('#numberUpDown').text(num);
	});
		 
		$('#increaseQuantity').click(function(e){
		 e.preventDefault();
		 var stat = $('#numberUpDown').text();
		 var num = parseInt(stat,10);
		 num++;
		 
		 var people = $('#peopleMaxchange').val();
		 console.log(people)

		if(num > people){
			 toastrMsg(people+' 명 이상 선택이 불가합니다.');
		 num=people;
		}
		$('#numberUpDown').text(num);
	});
		 
});


  //12. 새로고침  
 function refresh(){
	 location.reload(); 
 }
 
  

</script>

	
</head>




<body>
<div id="wrap" class="sub">
			



<%@ include file="../common/header.jsp" %>


<div id="container">



	<div class="page-location">
         <span>홈</span>
         <span>예약하기</span>
         <span>야영장</span>
     </div>
     <div class="reservation" data-device-mode="pc">
         <h3 class="title">야영장 예약</h3>
     	<input type="hidden" id="reserFlag" name="reserFlag" value="N" />
         
         <div class="collapse-wrap" data-reservation-wrap="campsite">
         	
         	
   		
         			<ul class="menu-tabs">
         		
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">가야산</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">
	                         	
                       		
                       			<li><a id="0101"  href="" onclick="clickPlace('01','01');">삼정 </a></li>
 
                       			<li><a id="0102" href="" onclick="clickPlace('01','02'); ">치인 </a></li>

                       			<li><a id="0103" href="" onclick="clickPlace('01','03'); ">백운동 </a></li>

	                         </ul>
	                     </div>
	                 </li>                 
                 
             
         		
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">계룡산</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">
	
	                         			<li><a id="0201" href="" onclick="clickPlace('02','01');">동학사 </a></li>
	
	                             
	                         </ul>
	                     </div>
	                 </li>                 
                 
             
         		
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">내장산</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">
	
	                         			<li><a id="0301" href="" onclick="clickPlace('03','01');">가인 </a></li>

	                         			<li><a id="0302" href="" onclick="clickPlace('03','02');">내장 </a></li>
	                         		

	                         </ul>
	                     </div>
	                 </li>                 
   
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">다도해해상</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">

	                         			<li><a id="0401" href="" onclick="clickPlace('04','01');">팔영산 </a></li>
   		
	                         			<li><a id="0402" href="" onclick="clickPlace('04','02');">염포 </a></li>
  		
	                         			<li><a id="0403" href="" onclick="clickPlace('04','03');">구계등 </a></li>
	
	                             
	                         </ul>
	                     </div>
	                 </li>                 
                 
         			</ul>

         			<ul class="menu-tabs">
         		
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">덕유산</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">

	                         			<li><a id="0501" href="" onclick="clickPlace('05','01');">덕유대 체류형 숙박시설 </a></li>
	
	                         			<li><a id="0502" href="" onclick="clickPlace('05','02');">덕유대 야영장 </a></li>
	                         		
	                             
	                         </ul>
	                     </div>
	                 </li>                 
                 
             
         		
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">무등산</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">

	                         		
	                         			<li><a id="0601" href="" onclick="clickPlace('06','01');">도원 </a></li>

	                         </ul>
	                     </div>
	                 </li>                 
                 
             
         		
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">변산반도</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">

	                         			<li><a id="0701" href="" onclick="clickPlace('07','01'); ">고사포 </a></li>

	                         </ul>
	                     </div>
	                 </li>                 
 
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">설악산</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">

	                         			<li><a id="0801" href="" onclick="clickPlace('08','01'); ">설악 </a></li>

	                         </ul>
	                     </div>
	                 </li>                 
                 
         			</ul>
 
         			<ul class="menu-tabs">
         		
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">소백산</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">

	                         			<li><a id="0901" href="" onclick="clickPlace('09','01'); ">삼가 </a></li>
	
	                         			<li><a id="0902" href="" onclick="clickPlace('09','02'); ">남천 </a></li>
   
	                         </ul>
	                     </div>
	                 </li>                 
                 
             
         		
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">오대산</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">
	
	                         			<li><a id="1001" href="" onclick="clickPlace('10','01');">소금강 </a></li>
	
	                             
	                         </ul>
	                     </div>
	                 </li>                 
                 
             
         		
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">월악산</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">
	                         	

	                         			<li><a id="1101" href="" onclick="clickPlace('11','01'); ">닷돈재풀옵션 </a></li>

	                         			<li><a id="1102" href="" onclick="clickPlace('11','02'); ">닷돈재자동차 </a></li>
	
	                         			<li><a id="1103" href="" onclick="clickPlace('11','03'); ">덕주 </a></li>

	                         			<li><a id="1104" href="" onclick="clickPlace('11','04'); ">송계 </a></li>

	                         			<li><a id="1105" href="" onclick="clickPlace('11','05'); ">용하 </a></li>

	                         			<li><a id="1106" href="" onclick="clickPlace('11','06'); ">하선암 </a></li>
	                         		
 
	                         </ul>
	                     </div>
	                 </li>                 
                 
  
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">월출산</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">

	                         			<li><a id="1201" href="" onclick="clickPlace('12','01'); ">천황 </a></li>
	                         		
	
	                             
	                         </ul>
	                     </div>
	                 </li>                 
                 
         			</ul>
 
         			<ul class="menu-tabs">
         		
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">주왕산</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">
	                         	

	                         			<li><a id="1301" href="" onclick="clickPlace('13','01'); ">상의 </a></li>
	
	                             
	                         </ul>
	                     </div>
	                 </li>                 
 
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">지리산</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">

	                         			<li><a id="1401" href="" onclick="clickPlace('14','01'); ">학천카라반 </a></li>
	
	                         			<li><a id="1402" href="" onclick="clickPlace('14','02'); ">덕동 </a></li>

	                         			<li><a id="1403" href="" onclick="clickPlace('14','03'); ">달궁힐링 </a></li>

	                         			<li><a id="1404" href="" onclick="clickPlace('14','04'); ">달궁자동차 </a></li>

	                         			<li><a id="1405" href="" onclick="clickPlace('14','05'); ">뱀사골자동차 </a></li>

	                         			<li><a id="1406" href="" onclick="clickPlace('14','06'); ">뱀사골힐링 </a></li>

	                         			<li><a id="1407" href="" onclick="clickPlace('14','07'); ">소막골 </a></li>

	                         			<li><a id="1408" href="" onclick="clickPlace('14','08'); ">내원 </a></li>

	                         			<li><a id="1409" href="" onclick="clickPlace('14','09'); ">백무동 </a></li>
	
	                             
	                         </ul>
	                     </div>
	                 </li>                 
                 
             
         		
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">치악산</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">

	                         			<li><a id="1501" href="" onclick="clickPlace('15','01'); ">구룡 </a></li>

	                         			<li><a id="1502" href="" onclick="clickPlace('15','02'); ">금대 </a></li>

	                         </ul>
	                     </div>
	                 </li>                 

					<li>
	                     <a href="javascript:void(0);" class="btn collapse">태백산</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">

	                         			<li><a id="1601" href="" onclick="clickPlace('16','01'); return">소도 </a></li>
	
	                             
	                         </ul>
	                     </div>
	                 </li>                 
                 
         			</ul>
         		 
  
         			<ul class="menu-tabs">
         		
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">태안해안</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">

	                         			<li><a id="1701" href="" onclick="clickPlace('17','01'); ">몽산포 </a></li>
	
	                         			<li><a id="1702" href="" onclick="clickPlace('17','02'); ">학암포 </a></li>
	                         		
	
	                         </ul>
	                     </div>
	                 </li>                 
                 
             
         		
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">한려해상</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">
	                         	

	                         			<li><a id="1801" href="" onclick="clickPlace('18','01');">학동 </a></li>

	                         </ul>
	                     </div>
	                 </li>                 
                 
         			</ul>
         		 
             
         </div>
         
         
         <div class="nodata" id="nodata1">
             <i class="icon-alert-circle"></i>
             <span>선택된 야영장이 없습니다. 야영장을 선택해주세요.</span>
         </div>
         
         <br><br><br><br><br><br><br><div class="nodata" id="nodata2" style="display:none;">
         <i class="icon-alert-circle"></i><br><br>
             <span>현재 조성중인 시설입니다.</span>
         </div>
        
      
      
         
         <div class="content-view" id="content-view" style="display:none;">
                    <div class="tab-pane is-active" id="tab14-5">
                        <div class="title-area">
                            <span class="label" id="category2"><i class="icon-location"></i> 산이름</span><!-- 산이름 -->
                            <h4 class="title" id="category3">야영장 예약현황</h4><!-- 야영장 예약현황 -->
                            <!-- <span class="copy">야영장은 개시기간 기준 아이디 당 2건으로 제한 됩니다.</span> -->
                        </div>
                        

                        <div class="top-guide">
                            <ul class="state-list">
                                <li>
                                    <i class="icon-reservation"></i>
                                    <span>예약가능</span>
                                </li>
 <!--                                <li>
                                    <i class="icon-waiting"></i>
                                    <span>대기가능</span>
                                </li>
                                <li>
                                    <i class="icon-none-reservation"></i>
                                    <span>예약만료</span>
                                </li> -->
                                <li>
                                    <i class="icon-end"></i>
                                    <span>예약불가</span>
                                </li>
                                
 <!--                            <li>
                                    <i class="icon-reserve"></i>
                                    <span>예비영지</span>
                                </li> -->
                                
                                <li>
                                    <i class="icon-electricity"></i>
                                    <span>전기가능영지</span>
                                </li>
<!--                             <li>
                                    <i class="icon-carbon"></i>
                                    <span>탄소제로영지</span>
                                </li>
                                <li>
                                    <i class="icon-barrier-free"></i>
                                    <span>무장애영지</span>
                                </li> -->
                            
                            
                            </ul>
                            <div class="btn-area">
<!--                                 <button class="btn btn-360" onclick="javascript:imgView('/product/camp/camp0602_2_210611.jpg');">
                                    <i class="icon-360"></i>
                                    <span>배치도</span>
                                </button> -->
                               <button class="btn btn-refresh" onclick="javascript:refresh();">
                                    <i class="icon-refresh"></i>
                                    <span>새로고침</span>
                                </button>
                            </div>
                        </div>
                        <div class="check-box">
                            <ul class="check-area" id="check-area">
  
                                
                            </ul>
                        </div>
                        
                       <script> 
                       		//테이블 컬럼 스타일 생성
	                       var col_tag = "";
	                    
	                       	for(var i = 0; i < 23; i++){
	                       		col_tag += "<col style='width: 45px'>"
	                       	}
	                       	
	                       	$(".inputCol").html(col_tag);
                       
                       		
                       </script>
                        <!-- 예약하기 현황표 -->
                        <div class="table-reservation">
                            <div class="scroll-head">
                                <table class="table-sticky-head">
                                    <caption>야영장 예약현황</caption>
                                    <thead class="thead">
                                    <tr>
                                        <th class="title" scope="row">야영장</th>
                                    </tr>
                                    <tr>
                                        <th scope="row">전체 영지수</th>
                                    </tr>
                                    <tr>
                                        <th scope="row">예약가능 시설수</th>
                                    </tr>
                                    </thead>
                                </table>
                                <table class="table-head">
                                    <caption>야영장 예약 월 일</caption>

                                    <colgroup class="inputCol">
                                        
                                        <!-- 값 들어옴 -->
                                        
                                    </colgroup>
                                    <thead class="thead" id="inputDate">
 										<tr class="month">
 										
										<!-- 값 들어옴 -->
										
 										</tr>
                                    	<tr class="day">
                                    	
										<!-- 값 들어옴 -->
											 
 										</tr>
 									 
	  									 <tr class="roomTotal">
	  									 
	  									 <!-- 값 들어옴 -->

 									   </tr>
 									
                                       <tr class="roomMax">
                                       	
                                       	<!-- 값 들어옴 -->	
                                       		
 									 </tr>
 
                                   </thead>
                                </table>
                            </div>
                            
                            
                            <div class="scroll-body">
                                <table class="table-sticky-body">
                                    <caption>시설명 및 영지 명</caption>
                                    <colgroup>
                                        <col style="width: 130px">
                                        <col style="width: 130px">
                                    </colgroup>
                                    
                                    <tbody class="tbody" id="campsiteName">



                                    </tbody>
                                </table>
                                 <table class="table-body">
                                    <caption>시설 예약 현황</caption>
                                    <colgroup class="inputCol">
                                        
                                           <!-- 값 들어옴 -->
                                        
                                    </colgroup>
                                    <thead style="display:none;">
                                        <tr><th scope="col" colspan="23">시설 예약 현황</th>
                                    </tr></thead>
                                    <tbody class="tbody" id="reservationState" >
											
										  <!-- 값 들어옴 -->

                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="title-area" id="reservDiv" tabindex="0">
                            <h4 class="title">선택 야영장</h4>
                        </div>
                        <div class="table-row">
                            <div class="item">
                                <em class="label"><i class="icon-camp"></i>야영장</em>
                                <span class="text" id="inputSelectCampsite"></span>
                            </div>
                            <div class="item">
                                <em class="label"><i class="icon-checkin"></i>입실일자</em>
                                <span class="text" id="inputStartDate"></span>
                            </div>
                            <div class="item">
                                <em class="label"><i class="icon-checkout"></i>퇴실일자</em>
                                <span class="text" id="inputEndDate"></span>
                            </div>
                            <div class="item">
                                <em class="label"><i class="icon-stay"></i>체류기간</em>
                                <div class="stay-row" id="stayInfo"><!-- <span class="length-stay selected" data-check_per="1" id="inputOneNight">1박 2일</span>
                                <span class="length-stay" data-check_per="2" id="inputSecondNight">2박 3일</span> --></div>
                            </div>
                        </div>
                         <div class="border-box">
                            <div class="option-wrap" id="peopleCheckBox">
                                <h5>인원 선택</h5><br>
     	
						<div class="selectPeopleNum" id="selectPeopleNum" style="display: none;">
						<a href="javascript:void(0);" id="decreaseQuantity" style="width:50px; border:1px solid; border-radius: 5px;">
						&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;</a>
						<span id="numberUpDown">1</span>
						<a href="javascript:void(0);" id="increaseQuantity" style="border:1px solid; border-radius: 5px;">
						&nbsp;&nbsp;&nbsp;+&nbsp;&nbsp;&nbsp;</a>
  						</div>
  						<input type="hidden" value="" name="inputValue" id="peopleMaxchange">
                            
							                                
                          </div>
                        </div> 


                        <div class="title-area">
                            <h4 class="title">총 이용금액</h4>
                        </div>
                        
                        <!-- 값 들어옴 -->

                        <div class="payment" id="paymentGroup" >
                        
                        

                        </div>

                        <div class="payment collapse-wrap open">
                            <button class="btn collapse is-active">꼭 확인해주세요!</button>
                            <div class="a">
                                <ul class="dot-list">
                                    <li>인원을 선택한 후 이용금액을 확인하고 예약하기 버튼을 누르면 바로 접수가 완료됩니다.</li>
                                    <li>예약하기 버튼을 누르고 자동예약 방지문자를 입력한 후 예약이 완료됩니다.</li>
                                    <li>인기 야영장은 이용자가 많아 선택을 하는 도중 조기 마감될 수 있습니다.</li>
                                    <li>선착순 예약시 무장애 영지는 장애인 우선예약으로 운영되며, 미예약 영지는 일반인도 2일전부터 예약가능하도록 전환됩니다. (※본인 확인 불가시
                                        이용 제한)<br>(예시 : 5월 3일 사용예정일 기준 – 4월 30일까지 장애인 우선예약 / 5월 1일부터 일반인 예약 가능</li>
                                    <li id="warrning_msg">경남 합천군 코로나19 현황 주소: <a href="https://www.hc.go.kr/07370/08804.web" target="_blank">https://www.hc.go.kr/07370/08804.web</a></li>
                                    <li id="caravanCamp" style="display: none;"></li>
                                </ul>
                            </div>
                        </div>
                        <div class="board-bottom">
                            <div class="center btn-layer">
                                <a href="javascript:void(0)" class="btn btn-register is-active" id="btn-modal" >예약하기</a>
                               <!--  <a href="javascript:openModal('modal1');" class="button modal-open">모달열기1</a> -->
                            </div>
                        </div>
                    </div>
                </div>
                
                
                
                <!-- 예약하기 버튼 누르면 모달창 생성-->

     <div class="modal-popup small" id="modal" style="display: none;">
               <div class="popup-wrap" style="top: 65px; bottom: 150px;">
                  <div class="popup-head">
                     <strong class="popup-title">예약가능</strong>
                     <button type="button" class="btn-close" id="modalCloseBtn" title="닫기">
                        <i class="icon-close"></i>
                     </button>
                  </div>
                  <div class="popup-container">
                        <table class="table">
                           <caption>자동방지 입력문자</caption>
                           <colgroup>
                              <col style="width: 175px;">
                              <col>
                           </colgroup>
                           <tbody class="tbody">
                              <tr style="display: none;">
                                 <th scope="row">예약코드</th>
                                 <td><input type="text" id="productCode" name="productCode" value="" readonly="readonly" style="border: none;"></td>
                              </tr>
                              <tr style="display: none;">
                                 <th scope="row">예약자ID</th>
                                 <td><input type=text id="userId" name='userId' value="${sessionScope.id }" readonly="readonly" style="border: none;" ></td>
                              </tr>
                              <tr>
                                 <th scope="row">예약상품</th>
                                 <td><input type="text" id="selectCampsiteName" name="selectCampsiteName" value="" readonly="readonly" style="border: none;"></td>
                              </tr>
                              <tr>
                                 <th scope="row">사용기간</th>
                                 <td><input type="text" id="selectAllDay" name="selectAllDay" value="" readonly="readonly" style="border: none;"></td>
                              </tr>
                              <tr>
                                 <th scope="row">입실날짜</th>
                                 <td><input type="text" id="selectStartDt" name="startDt" value="" readonly="readonly" style="border: none;"></td>
                              </tr>
                              <tr>
                                 <th scope="row">퇴실날짜</th>
                                 <td><input type="text" id="selectEndDt" name="endDt" value="" readonly="readonly" style="border: none;"></td>
                              </tr>
                              <tr>
                                 <th scope="row">총 인원</th>
                                 <td><input type="text" id="selectPeople" name="selectPeople" value="" readonly="readonly" style="border: none;"></td>
                              </tr>
                              <tr>
                                 <th scope="row">결제(예정)금액</th>
                                 <td><input type="text" id="selectPrice" name="selectPrice" value="" readonly="readonly" style="border: none;"></td>
                              </tr>
                           </tbody>
                        </table>
                        <div class="captcha-area" style="margin: 0;">
                           <span class="label">자동예약 방지문자</span>
                           <span class="g-recaptcha" data-sitekey="6LeL0kwjAAAAANEySrA-9Bx398PJ1o60To4EbEkX"></span>
                        </div>
                        <p class="copy-notice">※ 예약 완료된 상품에 대해서는 마이페이지 나의예약목록 에서 확인 후
                           결제 가능합니다.</p>
                        <div class="btn-area">
                           <button class="btn" id="modalCancelBtn" >취소</button>
                           <input type="button" class="btn" id="dataSubmitBtn" value="확인" style="background: #fff; cursor:pointer;">
                        </div>
	                  </div>
	               </div>
	            </div>
	            
	
         
         <!-- 예약안내 레이어팝업 -->
<%--          <div class="modal-popup small" id="automatic-character">
	        <div class="popup-wrap">
	            <div class="popup-head">
	                <strong class="popup-title">자동방지 입력문자</strong>
	                <button type="button" class="btn-close" title="닫기">
	                    <i class="icon-close"></i>
	                </button>
	            </div>
	            <div class="popup-container">
	                <table class="table">
	                    <caption>자동방지 입력문자</caption>
	                    <colgroup>
	                        <col style="width: 140px;">
	                        <col>
	                    </colgroup>
	                    <tbody class="tbody" data-area-name="popup-container-tbody">
	                        <tr>
			                    <th scope="row">예약상품</th>
			                    <td></td>
			                </tr>
			                <tr>
			                    <th scope="row">사용기간</th>
			                    <td></td>
			                </tr>
			                <tr>
			                    <th scope="row">입실날짜</th>
			                    <td></td>
			                </tr>
			                <tr>
			                    <th scope="row">퇴실날짜</th>
			                    <td></td>
			                </tr>
			                <tr>
			                    <th scope="row">옵션추가</th>
			                    <td></td>
			                </tr>
			                <tr>
			                    <th scope="row">결제(예정)금액</th>
			                    <td></td>
			                </tr>
			                <tr data-area-name="brfeTerYn" style="display:none;">
						        <th scope="row">자격구분 <span class="text-info">*</span></th>
						        <td class="form">
						            <ul class="checkbox-1">
						                <li>
						                    <span class="radio-1">
						                        <input type="radio" id="brfe-radio1" name="rsvtDvcdDs" value="14">
						                        <label for="brfe-radio1">장애인(중증, 1~3급)</label>
						                    </span>
						                </li>
						                <li>
						                    <span class="radio-1">
						                        <input type="radio" id="brfe-radio2" name="rsvtDvcdDs" value="11">
						                        <label for="brfe-radio2">장애인(경증, 4~6급)</label>
						                    </span>
						                </li>
						            </ul>
						        </td>
						    </tr>
						    <tr data-area-name="brfeTerYn" style="display:none;">
						        <th scope="row">장애인등록번호(뒤 3자리) <span class="text-info">*</span></th>
						        <td class="form">
						            <ul>
						                <li>
											<label for="dstpRegNo" class="hidden-text">장애인등록번호</label>
											<input type="text" class="input-text" name="dstpRegNo" id="dstpRegNo" maxlength="3" title="장애인등록번호">
										</li>
						            </ul>
						        </td>
						    </tr>
						    <tr data-area-name="brfeTerYn" style="display:none;">
						        <th scope="row">온라인 자격검증</th>
						        <td class="form">
						            <p class="copy">※ 온라인 자격검증을 하지 않을 경우 현장에서 장애인등록증으로 확인합니다. 자격증빙이 없을 경우 입장이 제한될 수 있으니 필히 지참해주세요</p>
						            <span class="btn-input">
						                <button class="btn btn-layer" data-popup="exemption-auth">자격검증</button>
										<label for="exemptionAuthText" class="hidden-text">자격검증</label>
						                <input type="text" class="input-text" placeholder="자격검증 버튼을 눌러주세요." title="자격검증" id="exemptionAuthText" readonly>
						            </span>
						        </td>
						    </tr>
	                    </tbody>
	                </table>
	                <div class="captcha-area">
	                    <span class="label">자동예약 방지문자</span>
	                    <span class="captcha"></span>
						<label for="captchaInput" class="hidden-text">자동예약 방지문자</label>
	                    <input type="text" class="input-text" name="captcha" id="captchaInput" title="자동예약 방지문자" maxlength="4">
	                </div>
	                <p class="copy-notice">※ 예약 완료된 상품에 대해서는 마이페이지 나의예약목록 에서 확인 후 결제 가능합니다.</p>
	                <div class="btn-area">
	                    <button class="btn btn-cancel">취소</button>
	                    <button class="btn btn-confirm is-active" data-button-name="reservation" onclick="javacript:reservation();">확인</button>
	                </div>
	            </div>
	        </div>
	    </div>  --%>
     </div><!-- reservation -->
<!--      <a href="javascript:void(0);" style="display:none" class="btn btn-register is-active btn-layer" data-popup="automatic-character" >예약하기</a>
     
     <button type="button" style="display:none" class="btn btn-layer" data-popup="reservation-information1">예약안내</button>
    <div class="modal-popup small" id="reservation-information1">
        <div class="popup-wrap">
            <div class="popup-head">
                <strong class="popup-title">예약완료안내</strong>
                <button type="button" class="btn-close" title="닫기" onclick="javascript:lastPopClose();">
                    <i class="icon-close"></i>
                </button>
            </div>
            <div class="popup-container">
                <div class="center" data-area-name="reservation-popup-container">
                    <i class="icon-check"></i>
                    <strong class="title-1">예약이 완료되었습니다.</strong>
                    <p class="copy-mid">결제 만기일시는 <em data-popup-information-campsite="sttlmMtDtm">2020년 02월 17일 16:00</em> 까지 입니다.<br>미 결제시 자동 취소되니 유의 하시기 바랍니다.</p>
                    <p class="copy-sm">마이페이지 나의예약목록 에서 확인 후 결제를 계속 진행해주세요.</p>
                </div>
                
                <div class="center" data-area-name="reservation-popup-container-w">
	                <i class="icon-check"></i>
	                <strong class="title-1">대기신청이 완료되었습니다.</strong>
	                <p class="copy-mid">
	                	대기자에서 예약자로 전환되면 예약 결제 안내 문자가 발송됩니다.<br>
						단, 잘못된 연락처 및 통신사 환경 등에 따라 전송이 실패할 수도 있습니다.<br>
						이에 따른 피해에 대해서는 국립공원공단에서 보상하지 않습니다.<br>
						반드시 '나의 예약 목록'에서 예약상태를 확인하여 주시기 바랍니다.
					</p>
	                <p class="copy-sm">마이페이지 나의예약목록 에서 확인 후 결제를 계속 진행해주세요.</p>
	            </div>
                
                <div class="btn-area">
                    <a href="/mypage/dashBoard.do" class="btn btn-link">나의 예약목록 보기</a>
                </div>
            </div>
        </div>
    </div>  -->
    
    
    <!-- 배치도 -->
<!--     <button type="button" class="btn btn-layer" data-popup="blockplan" style="display:none">배치도</button>
    <div class="modal-popup medium" id="blockplan">
        <div class="popup-wrap">
            <div class="popup-head">
                <strong class="popup-title">배치도</strong>
                <button type="button" class="btn-close btn-img-close" title="닫기" >
                    <i class="icon-close"></i>
                </button>
            </div>
            <div class="popup-container">
                <div class="zoom-container">
                    <div class="zoomable">
                        <img src="../assets/img/@img-deployment.png" alt="배치도" />
                    </div>
                    <button class="btn-move">이미지 이동</button>
                </div>
                <div class="btn-area">
                    <button class="btn btn-confirm is-active btn-img-confirm">확인</button>
                </div>
            </div>
        </div>
    </div>


   

<script>
$(document).ready(function(){

		//다음
		$('.selfAuthModal').click(function(){
		
			var policyVal = $('input[name="policy"]:checked').val();
			if(policyVal  == ''){
				toastrMsg('개인정보 제공 동의를 해주세요.');
				return false;
			}
			
			if($('#usNmId').text() == ''){
				toastrMsg('본인인증을 진행해주세요.');
				return false;
			}

			if($('#usNm').val() == ''){
				toastrMsg('주민등록번호 뒷자리를 입력해주세요.');
				return false;
			}
			
            ajaxCall({
                url : "/common/authGpkiForPay.do",
                data : {
                    "tgtrNm" : $('#usNmId').text(),
                    "trtrNum" : $('#usNumId').text()+""+$('#usNm').val(),
                    "authType" : $('#authTypeId').val()
                },
                success : function(dat){
                    if( $('#authTypeId').val() == 'A'){ //장애인여부확인
                        reductionDisabledDc(dat);
                    }else{
                        naManMeritDc(dat);
                    }
                },
                error : function(){
                    toastrMsg('감면 인증 중 오류가 발생하였습니다. <br/>관리자에게 문의하여 주세요.');
                }
            })
		});

		//취소 감면인증정보 확인 모달 제거
		$('.selfAuthModalCancel').click(function(){
            $('#radio1-1').prop('checked',true);
            closePopup('exemption-auth');
		});
		
});
function reductionDisabledDc(dat){
    var qufyYn = dat.qufyYn;
    var disabledCode = dat.disabledCode;
    let subTitle = '';
    let content = '';
    let type = '';

    if ($('#usNmId').text() == '') {

        if(qufyYn == 'M'){

            subTitle = $('#usNmId').text() + '님은 대상자가 아닙니다.';
            content = '기존 대상자였지만 현재 비대상자로 전환 되었습니다.<br/>확인 후 다시 시도해주세요.';
            type = 'error';
            $('#radio1-1').prop('checked', true);

        }else if(qufyYn == 'Y') {

            if (disabledCode == '00' || disabledCode == '98' || disabledCode == '99') {

                var strMsg = '';
                if (disabledCode == '00') {
                    strMsg = '장애 미해당';
                } else if (disabledCode == '98') {
                    strMsg = '결정보류';
                } else if (disabledCode == '99') {
                    strMsg = '확인불가';
                }

                $('#exemptionAuthText').val('대상자가 아닙니다');
                subTitle = $('#usNmId').text() + '님은 대상자가 아닙니다.';
                content = '현재 '+strMsg+' 상태입니다.<br/>확인 후 다시 시도해주세요.';
                type = 'error';
                $('#radio1-1').prop('checked', true);

            } else {

                if ('10' == disabledCode) {
                    $('#radio1-2').prop('checked', true);
                    $('#certTextId').val('장애인(중증, 1~3급)');
                } else if ('20' == disabledCode) {
                    $('#radio1-3').prop('checked', true);
                    $('#certTextId').val('장애인(경증, 4~6급)');
                }else{
                    $('#radio1-3').prop('checked', true);
                    $('#certTextId').val('장애인 대상자');
                }

                subTitle = $('#usNmId').text() + '님은 감면 대상자입니다.';
                content = '';
                type = '';

                //결제금액 재계산
                recalWithExemption();

            }

        } else {

            subTitle = $('#usNmId').text() + '님은 대상자가 아닙니다.';
            content = '확인 후 다시 시도해주세요.';
            type = 'error';
            $('#radio1-1').prop('checked', true);

        }

    } else {

        subTitle = '예약자 본인이 아니므로 <br>자격확인을 할 수 없습니다.';
        content = '현장 방문 시 증빙을 지참하시고 할인 받으시기 바랍니다.';
        type = 'error';
        $('#radio1-1').prop('checked', true);

    }

    alertPopup({
        title: '알림',
        subTitle: subTitle,
        content: content,
        type: type
    });
    self.close();

}

function naManMeritDc(dat){

    let cnt = dat.cnt;
    let dcTargetYn = dat.dcTargetYn;
    let relCd = dat.relCd;
    let authoriPsnYn = dat.authoriPsnYn;
    let wondClassCd = dat.wondClassCd;
    let subjKbnCd = dat.subjKbnCd;
    let inquRsltCd = dat.inquRsltCd;

    let subTitle = '';
    let content = '';
    let type = '';

    if ($('#usNmId').text() == '') {
        //조회결과가 있을때
        if (cnt > 0) {
            //감면대상일때
            if(dcTargetYn == 'Y') {
                if ('00011' == wondClassCd || '00012' == wondClassCd
                    || '00013' == wondClassCd || '00020' == wondClassCd
                    || '00030' == wondClassCd || '00G01' == wondClassCd
                    || '00G02' == wondClassCd || '00G03' == wondClassCd) { //1~3급

                    $('#radio1-4').prop('checked', true);
                    $('#certTextId').val('국가유공자(1~3급)');
                } else if ('00017' == subjKbnCd || '00018' == subjKbnCd || '00019' == subjKbnCd) { //518 민주화운동자.
                    $('#radio1-5').prop('checked', true);
                    $('#certTextId').val('5.18 민주운동자');
                } else { //그 외
                    $('#radio1-6').prop('checked', true);
                    $('#certTextId').val('국가유공자(4~7급), 등급 외(무공·보훈수훈자, 배우자, 유족 등)');
                }

                //할인금액 재계산
                recalWithExemption();

                subTitle = $('#usNmId').text() + '님은 감면 대상자입니다.';
                content = '';
                type = '';
            } else {
                //조회 결과 (S:성공 이 아닐때 )
                if(inquRsltCd != 'S') {
                    subTitle = $('#usNmId').text() + '님은 대상자가 아닙니다.';
                    content = '조회 결과가 없습니다.<br/>확인 후 다시 시도해주세요.';
                    type = 'error';
                    $('#radio1-1').prop('checked', true);
                } else {
                    //수권자인지 체크
                    if(authoriPsnYn != 'Y') {
                        subTitle = $('#usNmId').text() + '님은 대상자가 아닙니다.';
                        content = '확인 후 다시 시도해주세요.';
                        type = 'error';
                        $('#radio1-1').prop('checked', true);
                    } else {
                        //조회결과가 있고, 수권자인데 본인이 아닌경우
                        if(relCd != 'A') {
                            subTitle = '본인인 경우에만 선할인 가능합니다.';
                            content = '수권자 본인만 할인 가능합니다.<br/>가족 및 배우자이신 경우 증빙을 지참하시고 현장할인 받으시기 바랍니다.';
                            type = 'error';
                            $('#radio1-1').prop('checked', true);
                        } else {
                            //이경우는 없긴한데 일단 처리
                            subTitle = $('#usNmId').text() + '님은 대상자가 아닙니다.';
                            content = '확인 후 다시 시도해주세요.';
                            type = 'error';
                            $('#radio1-1').prop('checked', true);
                        }
                    }//수권자 END

                }//조회결과 END

            }//감면대상 END
        } else {
            //조회결과가 없을때
            subTitle = $('#usNmId').text() + '님은 대상자가 아닙니다.';
            content = '확인 후 다시 시도해주세요.';
            type = 'error';
            $('#radio1-1').prop('checked', true);
        }//조회결과 0개 END

    } else {

        subTitle = '예약자 본인이 아니므로 <br>자격확인을 할 수 없습니다.';
        content = '현장 방문 시 증빙을 지참하시고 할인 받으시기 바랍니다.';
        type = 'error';
        $('#radio1-1').prop('checked', true);

    }

    alertPopup({
        title: '알림',
        subTitle: subTitle,
        content: content,
        type: type
    });
    self.close();

}
//국가유공자 등급확인

//휴대폰 인증
function goAuth(){
	
	$.ajax({
		url:"/pay/checkPlusForPay.do",  
		type: "POST", 
		dataType: "json",
		async : false ,
		data: {},
		success: function(dat) {
			
			//인증요청 암호화 데이터가 없을 경우 오류발생
            if(dat.result.sEncData == ''){
                toastrMsg(dat.result.sRtnMsg);
            }else{
                $("#EncodeData").val(dat.result.sEncData);
                window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
                document.form_chk.target = "popupChk";
                document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
                document.form_chk.submit();
            }
		},
		error: function(e1,e2,e3) {
			
		}
	});
	
}


//아이핀 인증
function goAuthiPin(){
	
	
	$.ajax({
		url:"/pay/iPinForPay.do",  
		type: "POST", 
		dataType: "json",
		async : false ,
		data: {},
		success: function(dat) {
			
			//인증요청 암호화 데이터가 없을 경우 오류발생
            if(dat.result.sEncData == ''){
                toastrMsg(dat.result.sRtnMsg);
            }else{
           	      $("#enc_data").val(dat.result.sEncData);
                  window.open('', 'popupIPIN2', 'width=450, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
                  document.form_ipin.target = "popupIPIN2";
                  document.form_ipin.action = "https://cert.vno.co.kr/ipin.cb";
                  document.form_ipin.submit();
            }
		},
		error: function(e1,e2,e3) {
			
		}
	});
	
} -->

<script>

const modal = document.getElementById("modal")
const btnModal = document.getElementById("btn-modal")
btnModal.addEventListener("click", e => {
	var campsiteNameChk = $('#inputSelectCampsite').html()
	
	if(campsiteNameChk == null || campsiteNameChk == " "){
		event.preventDefault();
		toastrMsg('예약 일정을 선택해 주세요.')
	
	}else{
	    modal.style.display = "flex"
	    	var campsiteName = $('#inputSelectCampsite').html()
	    	var startDate = $('#inputStartDate').html()
	    	var endDate = $('#inputEndDate').html()
	    	var allDay = $('#inputAllDay').html()
	    	var people = $('#numberUpDown').html()
	    	var price = $('#inputPrice').html()
	
	    	$('#selectCampsiteName').val(campsiteName)
	    	$('#selectStartDt').val(startDate)
	    	$('#selectEndDt').val(endDate)
	    	$('#selectAllDay').val(allDay)
	    	$('#selectPeople').val(people+"명")
	    	$('#selectPrice').val(price+"원 (부가세 포함)")
		
	}

    	
})

$('#modalCloseBtn').on("click", function(e){
	$('#modal').css("display", "none")
});

$('#modalCancelBtn').on("click", function(e){
	$('#modal').css("display", "none")
	location.reload()
});
// const closeBtn = modal.querySelector("#modalCloseBtn")
// closeBtn.addEventListener("click", e => {
//     modal.style.display = "none"
// }); // "X"버튼클릭시 작동


// const cancelBtn = modal.querySelector("#modalCancelBtn")
// cancelBtn.addEventListener("click", e => {
//     modal.style.display = "none"
// }); // "취소 버튼 " 클릭시 작동



</script>



<script>

$(function() {
    $('#dataSubmitBtn').click(function() {
    	

		//Recaptcha 체크 유무 검증
    	if(grecaptcha.getResponse().length == 0) {
    		toastrMsg('AI 인지 확인해 주세요.');
    		return false;
    	
    	}else{
    		var id = $('#userId').val();
    		
    		if(id == null || id == "" ){
    			toastrMsg('로그인 후 이용해 주세요.');
    		
    		 }else{
    			var code = $('#productCode').val();
    			var allDay = $('#selectAllDay').val();
    			var startDay = $('#selectStartDt').val();
    			var endDay = $('#selectEndDt').val();
    			var people = $('#selectPeople').val();
    			var price = $('#selectPrice').val();
    			
    			 $.ajax({
    					url : "reservationSave",
    					type : "post",
    					cache : false,
    					data : {
    						id : id,
    						code : code,
    						allDay : allDay,
    						startDay : startDay,
    						endDay : endDay,
    						people : people,
    						price : price
    						
    					},
    					
    					success : function(result) {
    						toastrMsg(result);
    						
    					},
    					error : function() {
    						toastrMsg("error");
    					}
    				     	
    				     
    				});
    			
    		}
    	}
    	

		
		//return true;
            

    });
});



</script>



<%-- <div class="modal-popup small" id="exemption-auth">
	
		<input type="hidden" id="authTypeId" value=""/>
		
        <div class="popup-wrap" style="top: 40px; bottom: 40px;">
            <div class="popup-head">
                <strong class="popup-title">감면자격 인증</strong>
                <button type="button" class="btn-close" title="닫기">
                    <i class="icon-close"></i>
                </button>
            </div>
            <div class="popup-container">
                <strong class="title-2">개인정보 제공 동의</strong>
                <div class="box-content" style="height: 300px">
                    <p>본 포털은 본인확인 및 공공시설 이용요금 감면서비스 대상여부 확인, 감면자자격 정보 저장 만료일 안내를 목적으로 개인정보(이름, 주민번호, 휴대전화 번호)를 수집합니다.</p>
                    <p>개인정보 수집 이용에 동의를 거부할 권리가 있으며, 거부 시 공공시설 이용요금 가면서비스 대상 여부 확인이 제한 될 수 있습니다.</p>
                    <p>수집된된 정보는 공공시설 이용요금 감면서비스 대상 여부 확인 후 즉시 파기됩니다.</p>
                </div>
                <div class="radio-area">
                    <label for="radio2-1">위 내용에 동의하십니까?</label>
                    <span class="radio-1">
                        <input type="radio" id="radio1-1" name="policy" checked="" value="">
                        <label for="radio1-1">동의하지 않음</label>
                    </span>
                    <span class="radio-1">
                        <input type="radio" id="radio2-1" name="policy"  value="T">
                        <label for="radio2-1">동의함</label>
                    </span>
                </div>
                
                <div class="personal-identification mb-20 mt-20">
                    <div class="auth-box phone">
                        <strong>휴대폰 인증</strong>
                        <p>본인 명의 휴대폰으로 인증 후 감면혜택을 받을 수 있습니다.</p>
                        <button class="btn" onclick="goAuth();">휴대폰 인증</button>
                    </div>
                    <div class="auth-box ipin">
                        <strong>아이핀(I-PIN) 인증</strong>
                        <p>본인 명의 아이핀 으로 인증 후 감면혜택을 받을 수 있습니다.</p>
                        <button class="btn" onclick="goAuthiPin();">아이핀 인증</button>
                    </div>
                </div>
                
                <strong class="title-2">개인정보 입력</strong>
                <table class="table">
                    <caption>개인정보 입력</caption>
                    <colgroup>
                        <col style="width: 140px;">
                        <col>
                    </colgroup>
                    <tbody class="tbody">
                        <tr>
                            <th scope="row">이름</th>
                            <td id="usNmId"></td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="usNm" class="hidden-text">주민번호</label></th>
                            <td class="form flex">
                                <span id="usNumId"></span> -
                                <label for="usNm" class="hidden-text">주민번호 뒷자리</label>
                                <input type="password" class="input-text" id="usNm" placeholder="뒷자리를 입력 해주세요." title="주민번호 뒷자리">
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="btn-area">
                    <button class="btn btn-cancel selfAuthModalCancel">취소</button>
                    <button class="btn btn-confirm is-active selfAuthModal">자격확인</button>
                </div>
            </div>
        </div>
    </div>
     --%>
			</div><!-- container -->
			

<%@ include file="../common/footer.jsp" %>


<div class="modal-popup small" id="confirmPop">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title" id="confirmTitle"></strong>
            <button type="button" class="btn-close" title="닫기" onclick="closePopup('confirmPop');">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container">
            <div class="center">
                <i class="icon-error"></i>
                <strong class="title-1" id="confirmSubTitle"></strong>
                <p class="copy-mid" id="confirmContent"></p>
                <p class="copy-sm" id="confirmSubContent"></p>
            </div>
            <div class="btn-area">
                <button class="btn btn-cancel forMypageClass" onclick="closePopup('confirmPop');">취소</button>
                <button class="btn btn-confirm is-active" id="btn-confirm">확인</button>
            </div>
        </div>
    </div>
</div>


<div class="modal-popup small" id="alertPop">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title" id="alertTitle">로그인</strong>
            <button type="button" class="btn-close" title="닫기" onclick="closePopup('alertPop');">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container">
            <div class="center">
                <i class="icon-error"></i>
                <strong class="title-1" id="alertSubTitle"></strong>
                <p class="copy-mid" id="alertContent"></p>
                <p class="copy-sm" id="alertSubContent"></p>
            </div>
            <div class="btn-area">
                <button class="btn btn-confirm is-active" onclick="closePopup('alertPop');">확인</button>
            </div>
        </div>
    </div>
</div>

<div class="modal-popup small" id="loginPopup">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title" id="loginTitle">로그인</strong>
            <button type="button" class="btn-close" title="닫기" onclick="closePopup('loginPopup');">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container" id="loginPopupDiv">
        </div>
    </div>
</div>
<!-- 아이핀 가상주민번호 서비스 팝업 호출 form -->
<form name="form_ipin" id="form_ipin" method="post">
    <!-- 요청모드 (필수 데이터) -->
    <input type="hidden" name="m" value="pubmain">
    <!-- 인증요청 암호화 데이터 -->
    <input type="hidden" name="enc_data" id="enc_data" value="">
</form>
<!-- 본인인증 서비스 팝업을 호출하기 위해서는 다음과 같은 form이 필요합니다. -->
<form name="form_chk" id="form_chk" method="post">
    <!-- 필수 데이타로, 누락하시면 안됩니다. -->
    <input type="hidden" name="m" value="checkplusService">
    <!-- 인증요청 암호화 데이터 -->
    <input type="hidden" name="EncodeData" id="EncodeData" value="">
</form>
	</div><!-- wrap -->
 	<img id="loadingImage" src="/assets/img/preloader.gif" alt="로딩이미지" style="position: absolute; left: 924.5px; top: 539.5px; z-index: 100000; display: none;">
<script>
	$(function(){
		let responseMessage = "";
		if(responseMessage != ""){
			toastrMsg(responseMessage);
		}
		let retChk = "";
		if(retChk == "Y"){
			alert(responseMessage);
			history.back();
		}
	})
</script> 
</body>
</html>
