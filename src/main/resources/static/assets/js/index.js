$(document).ready(function() {
	$("#txtRoomCode").attr("name", "category3")
	$("#ResPopup").css("display", "none");
});


var req;
var tab; // 대분류 선택
var cat2; // 소분류 선택
var nameCat3;
var minback; // 박일수
var selectStartDay;	// 입실일 
var selectEndDay;	// 퇴실일

// (ajax) 메인 중분류 선택 > 소분류 출력
function mountain_ajax() {
	$(".cell3_view").css("display", "none");
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

// (ajax) 소분류 선택 > 소소분류 출력
function locationClick(parkId, nameCategory3) { //코드 : D0101
	console.log("선택한 소분류: " + parkId)
	cat2 = parkId;
	nameCat3 = nameCategory3;

	if (parkId.includes("A") == true) {
		req = new XMLHttpRequest()
		req.onreadystatechange = cotCat4Print
		req.open('post', "campCategory4")
		req.send(parkId)
	} else if (parkId.includes("B") == true) {
		$("#location_shel").html(nameCategory3);
		$(".shel_view").css("display", "block");
	}
}
function cotCat4Print() {
	if (req.readyState == 4 && req.status == 200) {
		console.log(req.responseText)
		$("#caminfo").html(req.responseText);
		$("#camPeopleCnt").attr("value", 1)
		$(".cam_view").css("display", "block");
	}
}

function camCot4Select(parkId, peopleMax) {
	var startDt = $("#startDt_cam").html();
	var endDt = $("#endDt_cam").html();
	//console.log(parkId)
	//console.log(peopleMax)
	if (startDt == null || endDt == null || startDt == "-" || endDt == "-") {
		$("input[name='uhang']").prop('checked', false)
		toastrMsg("날짜를 먼저 선택해주세요.");
	} else {
		$("#camPeopleCnt").attr("value", 1)
		$("#minbakMax").html(peopleMax)
		var cat3 = $("input[name='location']:checked").val()
		var cat4 = $("input[name='uhang']:checked").val()

		var reqData = { 'parkId': parkId, 'minback': minback, 'cat3': cat3, 'cat4': cat4 }
		req = new XMLHttpRequest()
		req.onreadystatechange = cotPricePrint
		req.open('post', "campPrice")
		reqData = JSON.stringify(reqData)
		req.setRequestHeader('Content-Type', "application/json; charset=UTF-8")
		req.send(reqData)
	}

}
// 야영장 상품&가격 출력
function cotPricePrint() {
	if (req.readyState == 4 && req.status == 200) {
		resData = JSON.parse(req.responseText)
		var price = Number(resData.price)
		var back = Number(resData.minback)
		if (back == 1 || back == 2 || back == 3) {
			price = price * back
		}
		var text = resData.cat3 + " " + resData.cat4
		$(".camTotal").find('span:eq(0)').html(text)
		$(".camTotal").find('span:eq(1)').html(String(price))
	}
}
// (캘린더) 날짜 선택
function calendarClick(cat1, year, month, day) { // cat1 : 대분류(cat2)
	//console.log(year + "년" + month + "월" + day + "일");
	console.log("대분류: " + tab + ", 위치선택: " + cat2);
	console.log("달력 대분류: " + cat1);
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
		if (tab != cat1 || cat2.includes(cat1) == false) {
			toastrMsg("위치를 다시 선택해주세요.");
		} else {
			if (tab == "B") { // (예외) 대분류: 대피소 - 일수 선택 1일만 가능
				if ($("#" + inEndId).html() == "-") {
					toastrMsg("위치를 먼저 선택해주세요.");
				} else {
					selectStartDay = year + "-" + month + "-" + day;
					$("#" + inStartId).html(selectStartDay);
					minback = 0;
					//console.log("박일수: " + minback)
					$("#shelSelect").find("em:eq(0)").html(nameCat3)
					$("#shelSelect").find("span:eq(0)").html(selectStartDay)
				}


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
						$("#" + inMinbackId).html("날짜를 선택해주세요.")
						$("input[name='uhang']").prop('checked', false)
						$(".camTotal").find('span:eq(0)').html("-")
						$(".camTotal").find('span:eq(1)').html("-")
					}
				} else {
					selectStartDay = null;
					selectEndDay = null;
					minback = null;
					$("#" + inStartId).html("-");
					$("#" + inEndId).html("-");
					$("#" + inMinbackId).html("날짜를 선택해주세요.");
					$("input[name='uhang']").prop('checked', false)
					$(".camTotal").find('span:eq(0)').html("-")
					$(".camTotal").find('span:eq(1)').html("-")
				}
			}
		}
	}
}

// 결제 팝업
function Res_openPopup(cat1, id) {
	if (cat1 == "A") {
		var check1 = $(".camTotal").find('span:eq(0)').html() // 예약상품
		var check2 = $(".camTotal").find('span:eq(1)').html() // 총 가격
		var check3 = $("input:radio[name='location']").is(':checked')
		var check4 = $("input:radio[name='uhang']").is(':checked') // 예약코드
		var check5 = $("#startDt_cam").html(); // 입실날짜
		var check6 = $("#endDt_cam").html(); // 퇴실날짜
		var check7 = $("#minback_cam").html(); // 사용기간
		var check8 = $("#camPeopleCnt").val() // 총 인원
		if (check1 == "-" || check2 == "-" || check3 == false || check4 == false ||
			check5 == "-" || check6 == "-" || check7 == "날짜를 입력해주세요.") {
			toastrMsg("먼저 위치/날짜/유형을 선택해주세요.");
		} else {
			check4 = $("input[name='uhang']:checked").attr("id")
			if (check7 == "1박 2일을 선택하셨습니다.") {
				check7 = "1박 2일";
			} else if (check7 == "2박 3일을 선택하셨습니다.") {
				check7 = "2박 3일";
			} else if (check7 == "3박 4일을 선택하셨습니다.") {
				check7 = "3박 4일";
			}
			$("#txtRoomCode").attr("name", "category4")
			$("#txtRoomCode").attr("value", check4) //예약상품 코드
			$("#txtRoom").attr("value", check1) //예약상품
			$("#txtDiff").attr("value", check7) // 사용기간
			$("#txtUseBgnDate").attr("value", check5) // 입실날짜
			$("#txtUseEndDate").attr("value", check6) // 퇴실날짜
			$("#txtInwon").attr("value", check8) // 객실인원
			$("#selPrice").attr("value", check2 + "원 (부가세 포함)")
			$("#" + id).css("display", "block");
		}

	} else if (cat1 == "B") {

	} else if (cat1 == "C") {

	} else if (cat1 == "D") {

	}
}

function Res_closePopup(id) {
	$("#" + id).css("display", "none");
}