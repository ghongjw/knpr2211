<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../../assets/js/lib/jquery-1.12.4.min.js"></script>
	<script src="../../assets/js/lib/swiper.js"></script>
<script src="assets/js/lib/jquery-1.12.4.min.js"></script>
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="assets/style/infomations.css">
</head>
<body>
<script>
	$('document').ready(function(){
		
		var swipe1 = ''
		var cnt = ${imagecount}
		for (i=1; i<=cnt; i++){
			swipe1 = swipe1+ '<div class=\"swiper-slide\">'
             +'<img src=\"../../cntnts/${selectedParkDetail}_'+i+'.jpg\"/> </div>'
             
		}
		$(".swiper-wrapper").html(swipe1)
		init.loadImg();
		
		$(".input1").val('${detailInfo[0].category2}').prop('selected',true)
		$(".input2").val('${detailInfo[0].category3}').prop('selected',true)
		
		$(".input1").change(function(){
			$("#f").submit()
		})
		$(".input2").change(function(){
			$("#f").submit()
		})

		});
	
		
</script>
<%@ include file="../common/header.jsp" %>
<div class="yeobeck"></div>
	<div class = "pageLocation">
	    <span>홈</span>
	    <span class="loca">이용안내</span>
	    <span class="loca">${detailInfo[0].nameCategory1}</span>
	</div>
	<form action = "detailInfo" id ="f">
		<div class = "detailInformation">
			<h3 class = "title">${detailInfo[0].nameCategory1} 이용안내</h3>
			<div class = "serchBox">
				<select name = "parkId" class="input1" >
					<c:forEach var="a" items="${category2s }" varStatus = "status">
						<option value = "${a }">${nameOfCategory2s[status.index] }</option>
					</c:forEach>
				</select>
				<c:choose>
					<c:when test="${detailInfo[0].category1 eq 'C' }"> </c:when>
					<c:when test="${detailInfo[0].category1 eq 'D' }">
						<select name = "parkDetail" class="input2">
						<option value = "D0101">태백산 민박촌</option>
						</select>
					 </c:when>
					<c:when test="${detailInfo[0].category1 != 'C' }">
						<select name = "parkDetail" class="input2">
							<c:forEach var="a" items="${category3s }" varStatus = "status">
								<option value = "${a }">${nameOfCategory3s[status.index] }</option>
							</c:forEach>
						</select>
					</c:when>
			
				</c:choose>
				<button class = "searchbtn"><span class="searchB">조회</span> 
				</button>
			</div>
		</div>
	</form>
		<div class = "title favorite">
			<span class = "informTitle">[${detailInfo[0].nameCategory2}] ${detailInfo[0].nameCategory3} ${detailInfo[0].nameCategory1}</span>
     		 <button type="button" class="btn btn-bookmark ">
      			<i class="icon-bookmark"></i>
      			<span>즐겨찾기</span>
     	 	</button>
		</div>
		<div class="center-wrap">
	   <div class="slide-view">
            <div class="swiper view">
                <div class="swiper-wrapper"></div>
                <div class="swiper-pagination"></div>
            </div>
            <div class="swiper thumb">
                <div class="swiper-wrapper">
                </div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
     <div class = "gongbeck"></div>
     </div>
     
           <div class="detail-info">
                <dl>
        <dt>주소</dt>
        <dd>${detailInfo[0].address }<button class="btn-location"></button>
        </dd>
        <dt>문의처</dt>
        <dd>${detailInfo[0].mobile }</dd>
    </dl>
    <dl>
        <dt>입/퇴실시간</dt>
        <dd>${detailInfo[0].time }</dd>
    </dl>
    <dl>
        <dt>이용금액</dt>
        <dd>
            <table class="table">
                <caption>이용금액</caption>
                <colgroup>
                    <col>
                    <col>
                    <col>
                <thead class="thead">
                    <tr>
                        <th scope="col">구분</th>
                        <th scope="col" class="ta-r">주말 및 성수기</th>
                        <th scope="col" class="ta-r">주중</th>
                    </tr>
                </thead>
                
                 <tbody class="tbody">
                 
                <c:choose> 
                <c:when test="${detailInfo[0].category1 eq 'C' }"> 
	                <c:forEach var = "list" items="${detailInfo}">
	                    <tr>
	                        <td><em>${list.nameCategory3 } </em></td>
	                        <td class="ta-r"><em>${list.priceWeekend }</em>원</td>
	                        <td class="ta-r"><em>${list.priceDay }</em>원</td>
	                    </tr>
	                 </c:forEach>
                </c:when>
                
			<c:when test="${detailInfo[0].category1 != 'C' }">
               
                <c:forEach var = "list" items="${detailInfo}">
                    <tr>
                        <td><em>${list.nameCategory4 }</em></td>
                        <td class="ta-r"><em>${list.priceWeekend }</em>원</td>
                        <td class="ta-r"><em>${list.priceDay }</em>원</td>
                    </tr>
                 </c:forEach>
            
                </c:when>
                 
               </c:choose> 
                </tbody>
            </table>
            
        </dd>
    </dl>
    <div style=" height:100px;">
    <div style="float:left; height:100px; width:50%;"></div>
    <div class="c-wrap">
        <button class="arcodion">편의시설</button>
        <div class="arc" style="display:none">
            <dl>
                <dt class="panel is-active">편의시설</dt>
                <dd> ${detailInfo[0].memo} </dd>
            </dl>
        </div>
    </div>
    <div class="bottom-area">
                <button type="button" class="btn btn-reservation" onclick="">예약하기</button>
            </div>
        </div>
     
    </div>
<script>

var acodian = {
  click: function(target) {
    var $target =  $(".arcodion");
    $target.on('click', function() {

      if ($(this).hasClass('is-active')) {
        slideUp($target);
      } else {
        slideUp($target);
        $(this).addClass('is-active').next().slideDown();
      }

      function slideUp($target) {
        $target.removeClass('is-active').next().slideUp();
      }

    });
  }
};
acodian.click('.accodian > dt');


let init = {
        loadImg : function(){
            var swiper = new Swiper(".swiper.thumb", {
                loop: true,
                spaceBetween: 20,
                slidesPerView: 4,
                freeMode: true,
                watchSlidesProgress: true,
                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev",
                },
            });

            var swiper2 = new Swiper(".swiper.view", {
                loop: true,
                spaceBetween: 10,
                pagination: {
                    el: '.swiper-pagination',
                    type: "fraction"
                },
                thumbs: {
                    swiper: swiper,
                },
            });
        }
    }

</script>
</div>
<%@ include file="../common/footer.jsp" %>
		</body>
		</html>