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
		$(".programtab").off().on("click", function () {
		      $(".programtab").removeClass("is-active");
		      $(this).addClass("is-active");
		})
	})
	
	let send = function(type){
		console.log(type)
			var params = {
					'parkId' : '${param.parkId}'
					,'type' : type
			}
			$.ajax({
				type:'post',
				url:'programType',
				data: JSON.stringify(params),
				dataType: "text",
				contentType:"application/json; charset=UTF-8",
				success: function(data){  
				var a = '';
				var cnt = ${programs_cnt}
				console.log(cnt)
		
					$(".program_Aria").text(a)
			
				console.log(type)
			},
			error:function(){   //데이터 주고받기가 실패했을 경우 실행할 결과
			console.log("here")
			}
			})
		}

	
</script>
</head>
<body>
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
	<div class="program_Aria">

		<c:forEach var = "program" items = "${sessionScope.programs }" >
		<div class = "program_tumbnail">
		<span class = "imgForTunbnail">
		<img src="../../cntnts/p_${sessionScope.programs[0].seq}/thumbnail.jpg">
		</span>
		<span class="titleForThumbnail">${sessionScope.programs[0].title }</span>
		</div>	
		</c:forEach>
	</div>
	</div>

<%@ include file="../common/footer.jsp" %>
</body>
</html>