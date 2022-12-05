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
	    				 

	    				 
	    			 }else{
	    				 state_tag += "<td data-rev="+"'"+reservations[i]+"'" + "id="+"'"+"a"+roomList[i]+dateList[i]+"'"+
	    				 " onclick="+"oneNightCheck("+"'"+roomList[i]+"'"+","+"'"+dateList[i]+"'"+
						 ","+"'"+reservations[i]+"'"+")"+"><i class="+"icon-end"+"></i></td>" 
	    				 arrayState.push("1")
	    				 

	    			 }
	    		 
	    		 }
	    		 
	    		 
	    		 if(i % 23 != 0){
	    			 
	    			 if(reservations[i] == "예약가능"){
	    				 state_tag += "<td data-rev="+"'"+reservations[i]+"'" +"id="+"'"+"a"+roomList[i]+dateList[i]+"'"+
	    				 " onclick="+"oneNightCheck("+"'"+roomList[i]+"'"+","+"'"+dateList[i]+"'"+
						 ","+"'"+reservations[i]+"'"+")"+"><i class="+"icon-reservation"+"></i></td>" 
	    				 arrayState.push("0")
	    				

	    				 
	    			 }else{
	    				 state_tag += "<td data-rev="+"'"+reservations[i]+"'"+"id="+"'"+"a"+roomList[i]+dateList[i]+"'"+
	    				 " onclick="+"oneNightCheck("+"'"+roomList[i]+"'"+","+"'"+dateList[i]+"'"+
						 ","+"'"+reservations[i]+"'"+")"+"><i class="+"icon-end"+"></i></td>" 
	    				 arrayState.push("1")
	    				

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
		$('#oneDaychecked').removeClass('length-stay');//1204추가
		$('#oneDaychecked').addClass('length-stay selected');//1204추가


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
					$('#oneDaychecked').removeClass('length-stay');//1204추가
					$('#oneDaychecked').addClass('length-stay selected');//1204추가
					
					toastrMsg("선택한 날짜는 1박 2일 예약이 불가합니다. 다른 날짜를 선택해 주세요."); 			
				}
	

				
			},
			error : function() {
				
				toastrMsg("error");
			}
		     	
		     
		});
	 
	 }else{
		 $('#oneDaychecked').removeClass('length-stay');//1204추가
		 $('#oneDaychecked').addClass('length-stay selected');//1204추가
		 
		 toastrMsg("선택한 날짜는 1박 2일 예약이 불가합니다. 다른 날짜를 선택해 주세요.");
	 }
 }
 



// 8. 사용자가 선택했을 때, 1박 2일 예약이 가능하면 장소 정보 화면에 출력
function inputSelectInfo1(room, date, nextDate, afterDate){
	var chkDate1 = $(document).find("#a"+room+date).data("rev")//1204추가
	var chkDate2 = $(document).find("#a"+room+nextDate).data("rev")//1204추가
	var chkDate3 = $(document).find("#a"+room+afterDate).data("rev")//1204추가
	
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
				
				
				var stay_tag = "<span class='length-stay' id='oneDaychecked' onclick="+
				"oneNightCheck("+"'"+room+"'"+","+"'"+date+"'"+","+"'"+chkDate1+"'"+") style='cursor:pointer'>1박 2일</span>"+//1204추가
                "<span class='length-stay' id='secondDayChecked' onclick="+"secondNightCheck("+
				"'"+room+"'"+","+"'"+date+"'"+","+"'"+nextDate+"'"+","+"'"+afterDate+"'"+ ") style='cursor:pointer'>2박 3일</span>"
				
				$('#stayInfo').html(stay_tag)
				
				
				var money = parseInt(price); //1204추가
				var totalMoney = money.toLocaleString(); ;//1204추가

	
                var pay_tag = "<dl><dt><em>"+c1+"</em></dt><dd></dd></dl>"+
                "<dl class='campsitePayment'><dt>"+c4+" "+roomNum+" : "+
                "<span style='font-size: 18px; font-weight:bold;' id='inputAllDay'>1박 2일"+
                "</span></dt><dd>"+totalMoney+"원</dd></dl><br><br><br>"+    //1204추가
            	"<dl><dt>결제(예정)금액</dt><dd><em style='font-size:30px' id='inputPrice'>"+
            	totalMoney+"</em>원</dd></dl>" //1204추가
				
            	$('#paymentGroup').html(pay_tag)
            	
            	$('input[name=inputValue]').attr('value', people);
				$('#selectPeopleNum').show();
				
				$('#productCode').attr('value', room);
				
				$('#oneDaychecked').removeClass('length-stay');
				$('#oneDaychecked').addClass('length-stay selected');

            	
			},
			error : function() {
				
				toastrMsg("error");
			}
	
	 });

}


// 9. 화면에서 1박 2일 선택한 다음에, 다시 2박 3일 선택했을 때, 2박 3일로 예약 가능한지 확인 후 예약 가능 여부 출력
	function secondNightCheck(room, date, nextDate, afterDate){
		//$('#secondDayChecked').removeClass('length-stay');//1204추가
		//$('#secondDayChecked').addClass('length-stay selected');//1204추가

	
		var chkDate1 = $(document).find("#a"+room+date).data("rev")
		var chkDate2 = $(document).find("#a"+room+nextDate).data("rev")
		var chkDate3 = $(document).find("#a"+room+afterDate).data("rev")
	
		
		if(chkDate2 == "예약불가" || chkDate3 == "예약불가"){
			//$('#oneDayChecked').removeClass('length-stay');//1204추가
			//$('#oneDayChecked').addClass('length-stay selected');//1204추가
			
		 
			toastrMsg("선택한 날짜는 2박 3일 예약이 불가합니다. 다른 날짜를 선택해 주세요.");
		
		}else{
		    $('#secondDayChecked').removeClass('length-stay');//1204추가
		    $('#secondDayChecked').addClass('length-stay selected');//1204추가
			
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
		var chkDate1 = $(document).find("#a"+room+date).data("rev")//1204추가
		var chkDate2 = $(document).find("#a"+room+nextDate).data("rev")//1204추가
		var chkDate3 = $(document).find("#a"+room+afterDate).data("rev")//1204추가
		
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
					
					
					
					var stay_tag = "<span class='length-stay' id='oneDaychecked' onclick="+
					"oneNightCheck("+"'"+room+"'"+","+"'"+date+"'"+","+"'"+chkDate1+"'"+") style='cursor:pointer'>1박 2일</span>"+//1204추가
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
	                
	        		$('#secondDayChecked').removeClass('length-stay');//1204추가
	        		$('#secondDayChecked').addClass('length-stay selected');//1204추가

	            	
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
 
  

