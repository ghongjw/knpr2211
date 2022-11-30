var req;
var tab; // 대분류 선택
var cat2; // 소분류 선택
var nameCat2;
var minback; // 박일수
var selectStartDay;	// 입실일 
var selectEndDay;	// 퇴실일

// (ajax)생태박물관 중분류 선택 > 소분류 출력
function mountain_ajax() {
	var category2 = $("input[name='mountain']:checked").val()
	//console.log(category2)
	req = new XMLHttpRequest()
	req.onreadystatechange = locationPrint
	req.open('post', "mountainSelect")
	req.send(category2)
}

function locationPrint() {
	if (req.readyState == 4 && req.status == 200) {
		tab = $(".is-active").attr("data-tabid")
		//console.log(req.responseText)
		//console.log(tab)
		$("#locationCam").html("")
		$("#locationShel").html("")
		$("#locationEco").html("")
		$("#locationCot").html("")
		
		if (tab == "tab1") {
			$("#locationCam").html(req.responseText);
			tab = "A";
		} else if (tab == "tab2") {
			$("#locationShel").html(req.responseText);
			tab = "B";
		} else if (tab == "tab3") {
			$("#locationEco").html(req.responseText);
			tab = "C";
		} else if (tab == "tab4") {
			$("#locationCot").html(req.responseText);
			tab = "D";
		}
	}
}

function locationClick(parkId, nameCategory3) { //코드 : D0101
	//console.log(parkId)
	cat2 = parkId;
	nameCat2 = nameCategory3;
}

function calendarClick(cat1, year, month, day) { // cat1 : 대분류(cat2)

	//console.log(year + "년" + month + "월" + day + "일");
	console.log("대분류: "+tab+", 위치선택: " + cat2);
	console.log("달력 대분류: "+cat1);
	//console.log("날짜형태: " + selectDate);
	
	var inStartId;
	var inEndId;
	var inMinbackId;
	if (tab == "A") {
		inStartId = "startDt_cam";
		inEndId = "endDt_cam"
		inMinbackId = "minback_cam"
	} else if (tab == "B") {
		inStartId = "startDt_shel"
		inEndId = "location_shel"
		inMinbackId = "minback_shel"
	} else if (tab == "C") {
		inStartId = "startDt_eco"
		inEndId = "endDt_eco"
		inMinbackId = "minback_eco"
	} else if (tab == "D") {
		inStartId = "startDt_cot"
		inEndId = "endDt_cot"
		inMinbackId = "minback_cot"
	}

	if (cat2 == null || tab == null) {
		toastrMsg("위치를 먼저 선택해주세요.");
	} else {
		if (tab != cat1) {
			toastrMsg("위치를 다시 선택해주세요.");
		}else {
			if (tab == "B") { // (예외) 대분류: 대피소 - 일수 선택 1일만 가능
				selectStartDay = year + "-" + month + "-" + day;
				$("#" + inStartId).html(selectStartDay);
				$("#" + inEndId).html(nameCat2);
				minback = 0;
				//console.log("박일수: " + minback)

			} else { // 대분류: 야영장, 생태탐방원, 민박촌
				if (selectStartDay == null && selectEndDay == null) {// 입실일 : 선택x , 퇴실일 : 선택x
					selectStartDay = year + "-" + month + "-" + day;
					$("#" + inStartId).html(selectStartDay);
				} else if (selectStartDay != null && selectEndDay == null) {// 입실일 : 선택o , 퇴실일 : 선택x
					selectEndDay = year + "-" + month + "-" + day;
					$("#" + inEndId).html(selectEndDay);

					// 체류기간(입실일 ~ 퇴실일)
					var startArr = selectStartDay.split("-");
					var startDate = new Date(startArr[0], startArr[1] - 1, startArr[2]);

					var endArr = selectEndDay.split("-");
					var endDate = new Date(endArr[0], endArr[1] - 1, endArr[2]);

					var diff = endDate - startDate;
					var currDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
					minback = parseInt(diff / currDay);
					//console.log("박일수: " + minback)

					if (minback == 0) {
						toastrMsg("같은 날은 선택하실 수 없습니다. 다시 선택해주세요.");
						selectStartDay = null;
						selectEndDay = null;
						$("#" + inStartId).html("-");
						$("#" + inEndId).html("-");
					} else if (minback == 1) {
						$("#" + inMinbackId).html("1박 2일을 선택하셨습니다.")
					} else if (minback == 2) {
						$("#" + inMinbackId).html("2박 3일을 선택하셨습니다.")
					} else if (minback == 3) {
						$("#" + inMinbackId).html("3박 4일을 선택하셨습니다.")
					} else if (minback < 0) {
						toastrMsg("입실일보다 전날을 선택하실 수 없습니다.");
						selectStartDay = null;
						selectEndDay = null;
						minback = null;
						$("#" + inStartId).html("-");
						$("#" + inEndId).html("-");
					} else {
						toastrMsg("최대 3박 4일만 선택하실 수 있습니다.");
						selectStartDay = null;
						selectEndDay = null;
						minback = null;
						$("#" + inStartId).html("-");
						$("#" + inEndId).html("-");
						$("#" + inMinbackId).html("-")
					}
				} else {
					selectStartDay = null;
					selectEndDay = null;
					minback = null;
					$("#" + inStartId).html("-");
					$("#" + inEndId).html("-");
					$("#" + inMinbackId).html("-");
				}
			}
		}
	}
}