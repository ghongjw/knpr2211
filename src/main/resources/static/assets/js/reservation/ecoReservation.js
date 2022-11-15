/**
 * 
 */
$(document).ready(function() {
	calendarInit();
});

function calendarInit() {

	// 날짜 정보 가져오기
	var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
	var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
	var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
	var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)
	var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
	
	// 달력에서 표기하는 날짜 객체
	var currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
	var currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월(월은 해당월의 -1로 출력됨)
	var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일

	// kst 기준 현재시간
	// console.log(thisMonth);

	// 캘린더 렌더링
	renderCalender(thisMonth);


	function renderCalender(thisMonth) {
		console.log(thisMonth)
		var nextDate = thisMonth; 
		console.log('당월 : '+thisMonth+", "+ thisMonth.getMonth()+"월");
		console.log('1달 후 : ' + nextDate+ ", "+ nextDate.getMonth()+"월");
		
		nextDate.setMonth(thisMonth.getMonth() + 1);
		//var nextNextDate = nextDate; nextNextDate.setMonth(nextNextDate.getMonth() + 1);
		
		console.log("========================================")
		console.log('당월 : '+thisMonth+", "+ thisMonth.getMonth()+"월");
		console.log('1달 후 : ' + nextDate+ ", "+ nextDate.getMonth()+"월");
		//console.log('2달 후 : ' + nextNextDate+ ", "+ nextNextDate.getMonth()+"월");
		console.log("========================================")
		
		// 렌더링을 위한 데이터 정리
		
		// 해당월
		currentYear = thisMonth.getFullYear();
		currentMonth = thisMonth.getMonth();
		currentDate = thisMonth.getDate();
		
		// 다음달
		//var nextYear = nextMonth.getFullYear();
		//var nextMonth = nextMonth.getMonth();
		//var nextDate = nextMonth.getDate();
		
		// 다다음달 
		//var nextNextYear = nextNextMonth.getFullYear();
		//var nextNextMonth = nextNextMonth.getMonth();
		//var nextNextDate = nextNextMonth.getDate();

		// 이전 달의 마지막 날 날짜와 요일 구하기
		var startDay = new Date(currentYear, currentMonth, 0);
		var prevDate = startDay.getDate();
		var prevDay = startDay.getDay();
		console.log("startDay : " + startDay);
		console.log("prevDate : " + prevDate);
		console.log("prevDay : " + prevDay);

		// 이번 달의 마지막날 날짜와 요일 구하기
		var endDay = new Date(currentYear, currentMonth + 1, 0);
		var nextDate = endDay.getDate();
		var nextDay = endDay.getDay();
		console.log("endDay : " + endDay);
		console.log("nextDate : " + nextDate);
		console.log("nextDay : " + nextDay);

		// console.log(prevDate, prevDay, nextDate, nextDay);

		var calendarTitle = document.querySelectorAll('.calendar-title')
		calendarTitle[0].innerText = currentYear + '.' + (currentMonth + 1);
		calendarTitle[1].innerText = "넣는닷";
		calendarTitle[2].innerText = currentYear + '.' + (currentMonth + 1);

		// 현재 월 표기
		// $('.calendar-title.first').text(currentYear + '.' + (currentMonth + 1));

		// 렌더링 html 요소 생성
		calendar = document.querySelector('.calendar-day')
		calendar.innerHTML = '';

		// 지난달
		for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {
			calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable">' + i + '</div>'
		}
		// 이번달
		for (var i = 1; i <= nextDate; i++) {
			calendar.innerHTML = calendar.innerHTML + '<div class="day current">' + i + '</div>'
		}
		// 다음달
		for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
			calendar.innerHTML = calendar.innerHTML + '<div class="day next disable">' + i + '</div>'
		}




		// 오늘 날짜 표기
		if (today.getMonth() == currentMonth) {
			todayDate = today.getDate();
			var currentMonthDate = document.querySelectorAll('.calendar-day .current');
			currentMonthDate[todayDate - 1].classList.add('today');
		}
	}

}
