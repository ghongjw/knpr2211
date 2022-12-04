<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="assets/js/lib/jquery-1.12.4.min.js"></script>
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="assets/style/infomations.css">
<script>
	$('document').ready(function(){
		var a='';
		$(".programtab").off().on("click", function (type) {
			
		      $(".programtab").removeClass("is-active");
		      $(this).addClass("is-active");
		})
	})
	let send = function(type){
		if(type == 'e'){
			console.log("e")
			$("#e").css('display','block')
			$("#f").css('display','none')
			$("#g").css('display','none')
		}
		if(type == 'f'){
			console.log("f")
			$("#e").css('display','none')
			$("#f").css('display','block')
			$("#g").css('display','none')
		}
		if(type == 'g'){
			console.log("g")
			$("#e").css('display','none')
			$("#f").css('display','none')
			$("#g").css('display','block')
		}
		 	}
	let open_detailInfomation = function(seq,type,title,place,duration,target,people,extra){
		
		var cnt;
		$.ajax({
				type:'post',
				url:'imgCount',
				data: seq,
				dataType: "text",
				success: function(data){  
				cnt = data -1
			console.log(cnt)
			var swipe1 = ''
				
				
				for (i = 0; i <= cnt; i++) {
					swipe1 = swipe1
							+ '<div class="swiper-slide">'
							+ '<img src="../../cntnts/p_'+seq+'/p'+seq+'_'+i+'.png"/> </div>'
				}
				$(".swiper-wrapper").html(swipe1)
				init.loadImg();
			
			},
			error:function(){   //데이터 주고받기가 실패했을 경우 실행할 결과
			}
			})
			
			
		$(".title-1").html(title);
		$(".dot-list>li:eq(0)").html('<strong>활동장소 </strong>'+'${parkId}');
		$(".dot-list>li:eq(1)").html('<strong>소요시간 </strong>'+duration);
		$(".dot-list>li:eq(2)").html('<strong>참가대상 </strong>'+target);
		$(".dot-list>li:eq(3)").html('<strong>참가인원 </strong>'+people);
		$(".extra").html(extra);
		$(".title_image").attr('src','../../cntnts/p_'+seq+'/title.png')
		$(".schedule_image").attr('src','../../cntnts/p_'+seq+'/schedule.png')
		
		$(".popup-wrap").css({"top":"110px", "bottom": "40px", "display":"block"})
		$("#mod").css({"display":"block"})
		
		
	}
	   
	// 팝업창 닫기
		function closePop(popId) {
			$("#popup").css({"display":"none"})
			$("#mod").css({"top":"-200px", "bottom": "1px", "display":"none"})
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
</head>
<body>
<div id="mod"></div>
<%@ include file="../common/header.jsp" %>
<div class = "programInfo">
	<div class = "pageLocation">
	    <span>홈</span>
	    <span class="loca">이용안내</span>
	    <span class="loca">생태탐방원</span>
	    <span class="loca">프로그램</span>
	</div>
	<div class="program">
	    <h3 class="title">${parkId} 생태탐방원 프로그램</h3>
	</div>
	<div class="typeArea">
	    <a href="javascript:void(0)" class = "programtab is-active" onclick="send('e')">생태관광프로그램</a>
	    <a href="javascript:void(0)" class = "programtab" onclick="send('f')">환경교육</a>
	    <a href="javascript:void(0)" class = "programtab" onclick="send('g')">특화프로그램</a>
	</div>
	<div id = "e" class="program_Type" style="display:block;">
		<div class="program_Aria">
			<% int i = 0; %>
				<c:forEach var = "program" items = "${sessionScope.programs }" varStatus="status" >
					<c:if test="${program.type == 'e' }">
						<div class = "program_tumbnail">
						<span class = "imgForTunbnail">
							<img src="../../cntnts/p_${program.seq}/thumbnail.png" 
							onclick="open_detailInfomation('${program.seq }','${program.type }','${program.title }','${program.place }','${program.duration }','${program.target }','${program.people }','${program.extra }')">
			
						</span>
						<span class="titleForThumbnail">${program.title }</span>
						</div>
					<% i = 1; %>
					</c:if>
			</c:forEach>
			<%if(i==0){ %>
				<div></div>
				<div class="nodata">
	           	  <i class="icon-alert-circle"></i>
	            	 <span>준비중입니다</span>
	         	</div>
	        <%} %>
		</div>
	</div>
	<div id = "f" class="program_Type" style="display:none;">
		<div class="program_Aria">
			<% i = 0; %>
				<c:forEach var = "program" items = "${sessionScope.programs }" varStatus="status" >
					<c:if test="${program.type == 'f' }">
						<div class = "program_tumbnail">
						<span class = "imgForTunbnail">
							<img src="../../cntnts/p_${program.seq}/thumbnail.png" 
							onclick="open_detailInfomation('${program.seq }','${program.type }','${program.title }','${program.place }','${program.duration }','${program.target }','${program.people }','${program.extra }')">
			
						</span>
						<span class="titleForThumbnail">${program.title }</span>
						</div>
					<% i = 1; %>
					</c:if>
			</c:forEach>
			<%if(i==0){ %>
				<div></div>
				<div class="nodata">
	           	  <i class="icon-alert-circle"></i>
	            	 <span>준비중입니다</span>
	         	</div>
	         <%} %>
		</div>
	</div>
	<div id = "g" class="program_Type" style="display:none;">
		<div class="program_Aria">
			<% i = 0; %>
				<c:forEach var = "program" items = "${sessionScope.programs }" varStatus="status" >
					<c:if test="${program.type == 'g' }">
						<div class = "program_tumbnail">
						<span class = "imgForTunbnail">
							<img src="../../cntnts/p_${program.seq}/thumbnail.png" 
							onclick="open_detailInfomation('${program.seq }','${program.type }','${program.title }','${program.place }','${program.duration }','${program.target }','${program.people }','${program.extra }')">
			
						</span>
						<span class="titleForThumbnail">${program.title }</span>
						</div>
					<% i = 1; %>
					</c:if>
			</c:forEach>
			<%if(i==0){ %>
				<div></div>
				<div class="nodata">
	           	  <i class="icon-alert-circle"></i>
	            	 <span>준비중입니다</span>
	         	</div>
	         <%} %>
		</div>	
	</div>

	
<div id="popup" class="popup-wrap" style="top:110px; bottom: 40px; display:none;">
        <div class="popup-h">
            <strong class="popup-title">프로그램 상세보기</strong>
            <button type="button" class="btn-close" onclick="closePop(popup)">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container">
            <strong class="title-1"></strong>
            <div class="image-box">
                <img class="title_image" src="" alt="">
            </div>
            <strong class="title-2">프로그램 내용</strong>
            <ul class="dot-list">
                <li></li>
                <li><strong>소요시간</strong> 2시간</li>
                <li><strong>참가대상</strong> 전 국민</li>
                <li><strong>참가인원</strong> 2인 이상</li>
                <li><strong>기타사항</strong></li>
            </ul>

            <strong class="title-2">운영일정</strong>
            <ul class="dot-list">
                <li class = "extra">집결(화엄사 일주문) → 만남 → 천년고찰 화엄사 탐방 → 화엄사 치유의 숲길 힐링 트레킹 → 프로그램 마무리 및 소감 나누기</li>
            </ul>
            <strong class="title-2">일정표</strong>
            <span class="schedule_image">
                <img class ="schedule_image" src="" >
            </span>
            <!-- 슬라이드 -->
            <strong class="title-2">운영사진</strong>
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
            </div>
            <div class="btn-area">
                <button type="button" class="confirmButton" onclick="closePop(popup)">확인</button>
            </div>
        </div>
    </div>
</div>
<%@ include file="../common/footer.jsp" %>

</body>
</html>