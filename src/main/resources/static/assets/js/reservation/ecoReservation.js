// 날짜 정보 가져오기
var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000) // uct 표준시 도출
var kstGap = 9 * 60 * 60 * 1000 // 한국 kst 기준시간 더하기
var today = new Date(utc + kstGap) // 한국 시간으로 date 객체 만들기(오늘)
var thisMonth = new Date(today.getFullYear(), today.getMonth())

/* 달력 출력 */
$(document).ready(function() {
	calendarInit()
});

function calendarInit() {
	var nextMonth = new Date(thisMonth.getFullYear(), thisMonth.getMonth() + 1)
	if (thisMonth.getMonth() == 12) nextMonth.setFullYear(1);
	var nextNextMonth = new Date(nextMonth.getFullYear(), nextMonth.getMonth() + 1)
	if (nextMonth.getMonth() == 12) nextNextMonth.setFullYear(1)

	var year = [3];
	year[0] = thisMonth.getFullYear()
	year[1] = nextMonth.getFullYear()
	year[2] = nextNextMonth.getFullYear()
	var month = [3];
	month[0] = thisMonth.getMonth()
	month[1] = nextMonth.getMonth()
	month[2] = nextNextMonth.getMonth()


	// 렌더링을 위한 데이터 정리
	// 렌더링 html 요소 생성
	var calendar = document.querySelectorAll('.calendar-day')
	for (var j = 0; j < 4; j++) {

		// 현재 월 표기
		var currentYear = year[j]
		var currentMonth = month[j]

		var inputText = currentYear + '.' + (currentMonth + 1)
		$(".calendar-title").eq(j).html(inputText)
		$(".calendar-day").eq(j).html('')

		// 해당월
		// 이전 달의 마지막 날 날짜와 요일 구하기
		var startDay = new Date(currentYear, currentMonth, 0)
		var prevDate = startDay.getDate()
		var prevDay = startDay.getDay()

		// 이번 달의 마지막날 날짜와 요일 구하기
		var endDay = new Date(currentYear, currentMonth + 1, 0)
		var nextDate = endDay.getDate()
		var nextDay = endDay.getDay()
		// 지난달
		for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {
			calendar[j].innerHTML = calendar[j].innerHTML + '<div class="day prev disable">' + i + '</div>'
			$(".calendar-day").eq(j).html()
		}
		// 이번달
		for (var i = 1; i <= nextDate; i++) {
			var classDay = currentYear + '-' + (currentMonth + 1) + '-' + i;
			calendar[j].innerHTML = calendar[j].innerHTML + '<div class="day current ' + classDay + ' ">' + i + '</div>'
		}
		// 다음달
		for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
			calendar[j].innerHTML = calendar[j].innerHTML + '<div class="day next disable">' + i + '</div>'
		}

		// 오늘 날짜 표기
		if (today.getMonth() == thisMonth.getMonth()) {
			var todayDate = today.getDate();
			var currentMonthDate = document.querySelectorAll('.calendar-day .current')
			currentMonthDate[todayDate - 1].classList.add('today')
		}
	}
}


// (ajax) 민박촌 - 객실 리스트 출력
var req;
function sendCot() {

	// 날짜 선택 여부 체크
	var startDt = $("#startDt").html()
	var endDt = $("#endDt").html()
	var betweenDt = $('#nightDays').html();

	if (endDt == "-") {
		$("input[name='minbakChk']").prop('checked', false);
		toastrMsg("날짜를 먼저 선택해주세요.");
	} else if ($("#nightDays").html() == 0) {
		$("input[name='minbakChk']").prop('checked', false);
		toastrMsg("1박 이상일때 예약이 가능합니다.")
	} else if ($("input:radio[name='minbakChk']").is(':checked') == false) {
		toastrMsg("민박촌 타입을 선택해주세요.")
	} else {
		$(".sendview").css("display", "block")

		var category3code = $("input[name='minbakChk']:checked").attr('id') //category3 code
		//console.log("코드: "+category3code+", 입실일: "+startDt+", 퇴실일: "+endDt+", 체류기간: "+betweenDt );
		var reqData = { 'category3': category3code, 'startDate': startDt, 'diff': betweenDt, 'endDate': endDt }

		req = new XMLHttpRequest()
		req.onreadystatechange = cotChangeText
		req.open('post', "cottageReservation")
		reqData = JSON.stringify(reqData)
		req.setRequestHeader('Content-Type', "application/json; charset=UTF-8")
		req.send(reqData);
	}
}
function cotChangeText() {
	if (req.readyState == 4 && req.status == 200) {
		var resData = JSON.parse(req.responseText)
		var num = resData.allowRoomCount;

		//예약 가능 룸
		var inner;
		if (num == 0) {
			inner = "<tr><td colspan='4'> 선택가능한 방이 없습니다. </td></tr>";
		} else {

			for (var i = 0; i < num; i++) {
				inner += "<tr><td><input type='radio' name='selectRoom' id='"
					+ resData.category3 + "'"
					+ "value='"
					+ resData.nameCategory3 + "'"
					+ "onclick='sendCot2()'></td><td>"
					+ resData.nameCategory3
					+ "</td><td>"
					+ resData.price
					+ "</td></tr>";
			}
		}
		$(".residenceProgram .tbody").html(inner)

	}

}
// 민박촌 인원 선택
function selectPeople(num) {
	$("#minbakMax").html(num)
	$("#livingPrsnCnt").attr("value", "1");
}

// (ajax) 민박촌 - 총 결제 예정 금액 
function sendCot2() {
	if ($("input:radio[name='selectRoom']").is(':checked') == false) {
		toastrMsg("민박촌 객실을 선택해주세요.")
	} else {
		var category3code = $("input[name='minbakChk']:checked").attr('id')
		var nameCategory3 = $("input[name='minbakChk']:checked").val()
		var addPeople = $("#addPeopleCnt").val();
		var betweenDt = $('#nightDays').html();

		var reqData = {
			'category3': category3code, 'nameCategory3': nameCategory3,
			'addPeople': addPeople, 'diff': betweenDt
		}

		req = new XMLHttpRequest()
		req.onreadystatechange = cotChangeText2
		req.open('post', "cottageReservation2")
		reqData = JSON.stringify(reqData)
		req.setRequestHeader('Content-Type', "application/json; charset=UTF-8")
		req.send(reqData);
	}

}

function cotChangeText2() {
	if (req.readyState == 4 && req.status == 200) {
		resData = JSON.parse(req.responseText)

		var text = resData.nameCategory3 + " [ " + resData.diff + "일 ] "
		var basicPrice = Number(resData.price) * Number(resData.diff)
		var addPrice = 5000 * Number(resData.diff) * Number(resData.addPeople)
		var total = basicPrice + addPrice;

		$(".payment").find('dt:eq(0)').html(text)
		$(".payment").find('dd:eq(0)').html(String(basicPrice))
		$(".payment").find('dd:eq(1)').html(String(addPrice))
		$(".total").find('em:eq(0)').html(String(total))
	}
}

// 민박촌 팝업 오픈하기
function open_Popup_cot(id, sessionId, sessionMember) {
	//console.log("팝업 오픈: "+sessionId+", "+sessionMember)
	//console.log("자료형 확인: "+typeof(sessionId)+", "+typeof(sessionMember))
	if (sessionId == "null") {
		toastrMsg("로그인 후 이용해주세요.")
	} else if (sessionMember == "admin") {
		toastrMsg("관리자는 이용하실 수 없습니다.")
	} else {
		var category3code = $("input[name='selectRoom']:checked").attr('id') //선택한 민박촌 타입 
		var nameCategory3 = $("input[name='selectRoom']:checked").val() // 객실명
		var startDt = $("#startDt").html()
		var endDt = $("#endDt").html()
		var betweenDt = $('#nightDays').html();
		if (betweenDt == "1") {
			betweenDt = "1박 2일"
		} else if (betweenDt == "2") {
			betweenDt = "2박 3일"
		} else if (betweenDt == "3") {
			betweenDt = "3박 4일"
		}
		var Inwon = $("#livingPrsnCnt").val()
		var addInwon = $("#addPeopleCnt").val()
		var people = Number(Inwon) + Number(addInwon)
		var total = $(".total").find('em:eq(0)').html()

		if ($("input:radio[name='selectRoom']").is(':checked') == false) {
			toastrMsg("민박촌 객실을 선택해주세요.")
		} else {
			$("#txtCotCode").attr("value", category3code) //예약상품
			$("#txtCotNm").attr("value", nameCategory3) //예약상품
			$("#selRsrvtQntt").attr("value", betweenDt) // 사용기간
			$("#txtUseBgnDate").attr("value", startDt) // 입실날짜
			$("#txtUseEndDate").attr("value", endDt) // 퇴실날짜
			$("#Inwon").attr("value", people) // 객실인원
			$("#selPrice").attr("value", total + "원 (부가세 포함)")
			$("#" + id).css("display", "block");
		}
	}
}

// (ajax) 생태탐방원 - 생태 객실 선택 및 총 결제 예정 금액
function selectRoom(num) {
	// 날짜 선택 여부 체크
	var startDt = $("#startDt").html()
	var endDt = $("#endDt").html()
	var betweenDt = $('#nightDays').html();

	if (startDt == "-" || endDt == "-") {
		$("input[name='txblPblc']").prop('checked', false)
		toastrMsg("날짜를 먼저 선택해주세요.")
	} else if (endDt == 0) {
		$("input[name='txblPblc']").prop('checked', false)
		toastrMsg("1박 이상일때 예약이 가능합니다.")
	} else {
		$("#minbakMax").html(num)
		$("#livingPrsnCnt").attr("value", "1");
		$(".sendview").css("display", "block")

		req = new XMLHttpRequest()
		req.onreadystatechange = ecoChangeText
		req.open('post', "ecoReservation")
		var category3 = $("input[name='txblPblc']:checked").attr('id')
		req.send(category3)
	}
}


function ecoChangeText() {
	if (req.readyState == 4 && req.status == 200) {
		
		var em = Number(req.responseText) * 0.1
		var total = Number(req.responseText) + em
		$(".surtax").find('em:eq(1)').html(req.responseText)
		$(".surtax").find('em:eq(3)').html(String(em))
		$(".total").find('em:eq(0)').html(String(total))
	}
}

// 생태 팝업 오픈하기
function open_Popup_eco(id, sessionId, sessionMember) {
	console.log("팝업 오픈: "+sessionId+", "+sessionMember)
	console.log("자료형 확인: "+typeof(sessionId)+", "+typeof(sessionMember))
	if (sessionId == "null") {
		toastrMsg("로그인 후 이용해주세요.")
	} else if (sessionMember == "admin") {
		toastrMsg("관리자는 이용하실 수 없습니다.")
	} else {
		console.log(sessionId)
		var category3code = $("input[name='txblPblc']:checked").attr('id') //선택한 객실 
		console.log(category3code)
		var nameCategory3 = $("input[name='txblPblc']:checked").val() // 객실명
		console.log(nameCategory3)
		var startDt = $("#startDt").html()
		console.log(startDt)
		var endDt = $("#endDt").html()
		console.log(endDt)
		var betweenDt = $('#nightDays').html();
		if (betweenDt == "1") {
			betweenDt = "1박 2일"
		} else if (betweenDt == "2") {
			betweenDt = "2박 3일"
		} else if (betweenDt == "3") {
			betweenDt = "3박 4일"
		}
		console.log(betweenDt)
		var Inwon = $("#livingPrsnCnt").val()
		console.log(Inwon)
		var total = $(".total").find('em:eq(0)').html()
		console.log(total)

		if ($("input:radio[name='txblPblc']").is(':checked') == false) {
			toastrMsg("객실을 선택해주세요.")
		} else {
			$("#txtEcoCode").attr("value", category3code) //예약상품
			$("#txtEcoNm").attr("value", nameCategory3) //예약상품
			$("#selRsrvtQntt").attr("value", betweenDt) // 사용기간
			$("#txtUseBgnDate").attr("value", startDt) // 입실날짜
			$("#txtUseEndDate").attr("value", endDt) // 퇴실날짜
			$("#Inwon").attr("value", Inwon) // 객실인원
			$("#selPrice").attr("value", total + "원 (부가세 포함)")
			$("#" + id).css("display", "block");
		}
	}
}

function close_Popup(id) {
	$("#" + id).css("display", "none");
	location.reload();
}

function checkBot() {
	if (grecaptcha.getResponse().length == 0) {
		toastrMsg('AI인지 확인해 주세요.');
		return false;
	}
	return true;
}