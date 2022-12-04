<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../../assets/js/lib/jquery-1.12.4.min.js"></script>
<script src="../../assets/js/lib/swiper.js"></script>
<link rel="shortcut icon" href="#">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5473282e90dafe0fc8b497c28d5feec9"></script>
<script src="assets/js/lib/jquery-1.12.4.min.js"></script>

<link rel="stylesheet" href="assets/style/infomations.css">
</head>
<body>
	<script>
		$('document').ready(function() {

							var swipe1 = ''
 							var cnt = ${imagecount }
 							for (i = 1; i <= cnt; i++) {
 								swipe1 = swipe1
 										+ '<div class=\"swiper-slide\">'
 										+ '<img src=\"../../cntnts/${selectedParkDetail}_'+i+'.jpg\"/> </div>'

 							}
							$(".swiper-wrapper").html(swipe1)
							init.loadImg();

							$(".input1").val('${detailInfo[0].category2}')
									.prop('selected', true)
							$(".input2").val('${detailInfo[0].category3}')
									.prop('selected', true)

							$(".input1").change(function() {
								$("#f").submit()
							})
							$(".input2").change(function() {
								$("#f").submit()
							})
							
							
							var bookmarkChecked = "n"
							if(${sessionScope.id != null}){
							var param = "${detailInfo[0].category3}"
							console.log("${detailInfo[0].category3}")
							
							$.ajax({
								type:'post',
								url:'checkFavorite',
								data: param,
								success: function(data){
									console.log(data)
								if(data =='y'){
									$("#favorite_bookmark").addClass("is-active");
									$("#favorite_bookmark").value("on");
									bookmarkChecked = "y"
								
									}else {
										$("#favorite_bookmark").value("off");
										bookmarkChecked = "n"
									}
							},
							error:function(){   //데이터 주고받기가 실패했을 경우 실행할 결과
								
							}
							})
						}
							$("#favorite_bookmark").on('click',function(){
								var params = {
										'bookmarkChecked' : bookmarkChecked
										,'parkId' : '${detailInfo[0].category3}'
								}
								$.ajax({
									type:'post',
									url:'bookmarkChecked',
									data: JSON.stringify(params) ,
									dataType: "text",
									contentType:"application/json; charset=UTF-8",
									success: function(data){  
									if(data=='y'){
										$("#favorite_bookmark").addClass("is-active");
										$("#favorite_bookmark").value("on");
										bookmarkChecked = "y"
									
										}else if(data == 'n'){
											$("#favorite_bookmark").removeClass("is-active");
											bookmarkChecked = "n"
										}else{
											alert("로그인을 해주세요")
										}
									console.log(bookmarkChecked)
								},
								error:function(){   //데이터 주고받기가 실패했을 경우 실행할 결과
								console.log("here")
								}
								})
							})
							
							//카카오 지도를 위한 코드
/* 							var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
							var options = { //지도를 생성할 때 필요한 기본 옵션
								center: new kakao.maps.LatLng(${detailInfo[0].x}, ${detailInfo[0].y}), //지도의 중심좌표.
								level: 3 //지도의 레벨(확대, 축소 정도)
							};

							var map = new kakao.maps.Map(container, options);
							var markerPosition  = new kakao.maps.LatLng(${detailInfo[0].x}, ${detailInfo[0].y}); 
							var marker = new kakao.maps.Marker({
							    position: markerPosition
							});
							marker.setMap(map); */

						});
	</script>
	<%@ include file="../common/header.jsp"%>
	<div class="detailInfo">
		<div class="pageLocation">
			<span>홈</span> <span class="loca">이용안내</span> <span class="loca">${detailInfo[0].nameCategory1}</span>
		</div>
		<form action="detailInfo" id="f">
			<div class="detailInformation">
				<h3 class="title">${detailInfo[0].nameCategory1}이용안내</h3>
				<div class="searchBox" style="margin:0px auto 20px;  width: 70%;">
					<select name="parkId" class="input1" style="width: inherit;">
						<c:forEach var="a" items="${category2s }" varStatus="status">
							<option value="${a }">${nameOfCategory2s[status.index] }</option>
						</c:forEach>
					</select>
					<c:choose>
						<c:when test="${detailInfo[0].category1 eq 'C' }">
						</c:when>
						<c:when test="${detailInfo[0].category1 eq 'D' }">
							<select name="parkDetail" class="input2" style="width: 80%;">
								<option value="D0101">태백산 민박촌</option>
							</select>
						</c:when>
						<c:when test="${detailInfo[0].category1 != 'C' }">
							<select name="parkDetail" class="input2" style="width: 80%;">
								<c:forEach var="a" items="${category3s }" varStatus="status">
									<option value="${a }">${nameOfCategory3s[status.index] }</option>
								</c:forEach>
							</select>
						</c:when>

					</c:choose>
					<button class="searchbtn" style="width:10%; max-width:130px; min-width:100px;">
						<span class="searchB">조회</span>
					</button>
				</div>
			</div>
		</form>
		<div class="title favorite">
			<span class="informTitle">[${detailInfo[0].nameCategory2}]
				<c:choose>
				<c:when test="${detailInfo[0].category1 eq 'C' or detailInfo[0].category1 eq 'D'}"></c:when>
				<c:when test="${detailInfo[0].category1 eq 'A' or detailInfo[0].category1 eq 'B'}">${detailInfo[0].nameCategory3} </c:when>
				
				</c:choose>
				${detailInfo[0].nameCategory1}</span>
			<button type="button" id = "favorite_bookmark"class="btn btn-bookmark" value="">
				<i class="icon-bookmark"></i> <span>즐겨찾기</span>
			</button>
		</div>
		<div class="center-wrap">
			<div class="slide-view">
				<div class="swiper view">
					<div class="swiper-wrapper"></div>
					<div class="swiper-pagination"></div>
				</div>
				<div class="swiper thumb">
					<div class="swiper-wrapper"></div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
				</div>
				<div class="gongbeck"></div>
			</div>
<!--  ----------------------------------- -->
			<div class="detailInfo">
			<table class="detailInfoTable">
				<tr>
					<th>주소</th>
					<td>${detailInfo[0].address } 	
					<button id = "toMap" onclick="window.open('https://map.kakao.com/link/search/${detailInfo[0].address }')">
					<i></i>

<!-- 					<img src="assets/img/sub/kakao_map.png"> -->
					</button>
<!-- 			지도 가지고 와서 표시할 때 사용 -->
<!-- 					<div id="map" style="width:500px;height:400px;"></div> -->
					</td>
				</tr>
				<tr>
					<th>문의처</th>
					<td>${detailInfo[0].mobile }</td>
				</tr>
				<tr>
					<th>입/퇴실시간</th>
					<td>${detailInfo[0].time }</td>
				</tr>
				<tr>
					<th>이용금액</th>
					<td>
					<table class="table">
							
								<tr>
									<th scope="col" >구분</th>
									<th scope="col" >주말 및 성수기</th>
									<th scope="col" >주중</th>
								</tr>
							
								<c:choose>
									<c:when
										test="${detailInfo[0].category1 eq 'C' or detailInfo[0].category1 eq 'D'}">
										<c:forEach var="list" items="${detailInfo}">
											<tr>
												<td><em>${list.nameCategory3 } </em></td>
												<td><em>${list.priceWeekend }</em>원</td>
												<td><em>${list.priceDay }</em>원</td>
											</tr>
										</c:forEach>
									</c:when>

									<c:when test="${detailInfo[0].category1 != 'C' }">

										<c:forEach var="list" items="${detailInfo}">
											<tr>
												<td><em>${list.nameCategory4 }</em></td>
												<td class="ta-r"><em>${list.priceWeekend }</em>원</td>
												<td class="ta-r"><em>${list.priceDay }</em>원</td>
											</tr>
										</c:forEach>

									</c:when>

								</c:choose>
							
						</table>
					</td>
				</tr>
				<tr>
				<td colspan=2>
					<dl class = "a-warp">
						<dd>
							<button class="accordion">편의시설</button>
								<div class="panel">
	 							 <p>${detailInfo[0].memo}</p>
								</div>
						</dd>
					</dl>
				</td>
				</tr>
				<tr>
				<td colspan=2>
				<div class="bottom-area">
					<c:choose>
								<c:when test="${detailInfo[0].category1 eq 'C'}">
						<button type="button" class="btn btn-programs"  onclick="location.href='programInfo?parkId=${detailInfo[0].category2}'">프로그램 보기</button>
						</c:when>
						<c:when test="${detailInfo[0].category1 != 'C'}"></c:when>
					</c:choose>
					<c:choose>
						<c:when test="${detailInfo[0].category1 eq 'A'}" >
						<button type="button" class="btn btn-reservation" onclick="location.href='campsite'; return false">예약하기</button>
						</c:when>
						<c:when test="${detailInfo[0].category1 eq 'B'}" >
						<button type="button" class="btn btn-reservation" onclick="location.href='shelter'; return false">예약하기</button>
						</c:when>
						<c:when test="${detailInfo[0].category1 eq 'C'}" >
						<button type="button" class="btn btn-reservation" onclick="location.href='ecoReservation'; return false">예약하기</button>
						</c:when>
						<c:when test="${detailInfo[0].category1 eq 'D'}" >
						<button type="button" class="btn btn-reservation" onclick="location.href='cottageReservation'; return false">예약하기</button>
						</c:when>
					
					
					
					
					</c:choose>
				</div>
				</td>
				</tr>
			</table>

					
				</div>
			</div>

		</div>
		<script>

var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    /* Toggle between adding and removing the "active" class,
    to highlight the button that controls the panel */
    this.classList.toggle("active");

    /* Toggle between hiding and showing the active panel */
    var panel = this.nextElementSibling;
    if (panel.style.display === "block") {
      panel.style.display = "none";
    } else {
      panel.style.display = "block";
    }
  });
}
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight) {
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    }
  });
}



			let init = {
				loadImg : function() {
					var swiper = new Swiper(".swiper.thumb", {
						loop : true,
						spaceBetween : 20,
						slidesPerView : 4,
						freeMode : true,
						watchSlidesProgress : true,
						navigation : {
							nextEl : ".swiper-button-next",
							prevEl : ".swiper-button-prev",
						},
					});

					var swiper2 = new Swiper(".swiper.view", {
						loop : true,
						spaceBetween : 10,
						pagination : {
							el : '.swiper-pagination',
							type : "fraction"
						},
						thumbs : {
							swiper : swiper,
						},
					});
				}
			}
		</script>
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>