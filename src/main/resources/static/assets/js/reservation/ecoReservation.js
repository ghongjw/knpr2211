// 날짜 정보 가져오기
var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)
var thisMonth = new Date(today.getFullYear(), today.getMonth());	

/* 달력 출력 */
$(document).ready(function() {
	calendarInit();
});

function calendarInit() {
	// 달력에서 표기하는 날짜 객체
	var currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
	var currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월(월은 해당월의 -1로 출력됨)
	var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일

	// kst 기준 현재시간
	// console.log(thisMonth);

	// 캘린더 렌더링
	renderCalender(thisMonth);

	function renderCalender(thisMonth) {
		var nextMonth = new Date(thisMonth.getFullYear(), thisMonth.getMonth() + 1);
		if (thisMonth.getMonth() == 12) nextMonth.setFullYear(1);
		var nextNextMonth = new Date(nextMonth.getFullYear(), nextMonth.getMonth() + 1);
		if (nextMonth.getMonth() == 12) nextNextMonth.setFullYear(1);

		var month = [3];
		month[0] = thisMonth;
		month[1] = nextMonth;
		month[2] = nextNextMonth;

		// 렌더링을 위한 데이터 정리
		// 렌더링 html 요소 생성
		var calendarTitle = document.querySelectorAll('.calendar-title')
		var calendar = document.querySelectorAll('.calendar-day')
		for (var j = 0; j < 4; j++) {
			// 현재 월 표기
			var currentYear = month[j].getFullYear();
			var currentMonth = month[j].getMonth();
			calendarTitle[j].innerText = currentYear + '.' + (currentMonth + 1);
			calendar[j].innerHTML = '';

			// 해당월
			// 이전 달의 마지막 날 날짜와 요일 구하기
			var startDay = new Date(currentYear, currentMonth, 0);
			var prevDate = startDay.getDate();
			var prevDay = startDay.getDay();

			// 이번 달의 마지막날 날짜와 요일 구하기
			var endDay = new Date(currentYear, currentMonth + 1, 0);
			var nextDate = endDay.getDate();
			var nextDay = endDay.getDay();
			// 지난달
			for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {
				calendar[j].innerHTML = calendar[j].innerHTML + '<div class="day prev disable">' + i + '</div>'
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
				var currentMonthDate = document.querySelectorAll('.calendar-day .current');
				currentMonthDate[todayDate - 1].classList.add('today');
			}

		}

	}
	
}

/* 계산 출력 */



