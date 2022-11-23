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

// (ajax) 생태탐방원 - 총 결제 예정 금액 
var req;
function sendEco() {
	$("#livingPrsnCnt").attr("value",1);
	// 날짜 선택 여부 체크
	if ($("#endDt").html() == "-") {
		$("input[name='txblPblc']").prop('checked', false)
		toastrMsg("날짜를 먼저 선택해주세요.")
	} else if ($("#nightDays").html() == 0) {
		$("input[name='txblPblc']").prop('checked', false)
		toastrMsg("1박 이상일때 예약이 가능합니다.")
	} else {
		$(".border-box").css("display", "block")
		var num = $("input[name='txblPblc']:checked").val()

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

// (ajax) 민박촌 - 총 결제 예정 금액 
function sendCot() {
	// 날짜 선택 여부 체크
	var startDate = $("#startDate").html()
	var endDt = $("#endDt").html()
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

		req = new XMLHttpRequest()
		req.onreadystatechange = ecoChangeText
		req.open('post', "cotReservation")
		
		var category3 = $("input[name='minbakChk']:checked").attr('id'); //category3 code
		var reqData = {cateogry3: category3, startDate: startDate, endDt: endDt}
		reqData = JSON.stringify(reqData)
		req.setRequestHeader('Content-Type',"application/json; charset=UTF-8")
		req.send(reqData);
	}
}
function cotChangeText() {
	if (req.readyState == 4 && req.status == 200) {
		var em = Number(req.responseText) * 0.1
		var total = Number(req.responseText) + em
		$(".surtax").find('em:eq(1)').html(req.responseText)
		$(".surtax").find('em:eq(3)').html(String(em))
		$(".total").find('em:eq(0)').html(String(total))
	}
}

