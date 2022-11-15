<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
	<title>국립공원공단 예약시스템</title>

 <link rel="stylesheet" href="/assets/style/reservation/campsite.css">

<!-- <script src="/assets/js/lib/jquery-1.12.4.min.js"></script>
	<script src="/assets/js/lib/swiper.js"></script>
	<script src="/assets/js/lib/datepicker.min.js"></script>
	<script src="/assets/js/lib/jquery.fs.zoomer.min.js"></script>
	<script src="/assets/js/lib/jquery.rwdImageMaps.min.js"></script>
	<script src="/assets/js/lib/toastr.min.js"></script>
	<script src="/assets/js/scripts.js"></script>
	<script src="/assets/js/common.js?ver4"></script> -->


<script>

/*  	function selectPlace(sel1, sel2){
	req = new XMLHttpRequest();
	req.onreadystatechange = clickPlace(sel1, sel2);
	req.open('post', 'selectInfo');
	var userSelect = "A"+ sel1 + sel2 ;
	req.send(userSelect);
} 

function printMsg(){
	
	var msg = document.getElementById('msg');
	msg.innerHTML = req.responseText;
	
} */


function clickPlace(sel1, sel2){
	if(sel1 != null && sel2 != null){
		alert(sel1);
		document.getElementById("content-view").style.display = 'block';
		document.getElementById("nodata").style.display = 'none';
	}
}

/* function display(){
	if(req.readyState == 4 && req.status == 200){
		$("#content-view").show();
		$(".nodata").hide();
	}
} */



</script>

	
</head>




<body>
	<div id="wrap" class="sub">
			



<%@ include file="../common/header.jsp" %>


<div id="container">



	<div class="page-location">
         <span>홈</span>
         <span>예약하기</span>
         <span>야영장</span>
     </div>
     <div class="reservation" data-device-mode="pc">
         <h3 class="title">야영장 예약</h3>
     	<input type="hidden" id="reserFlag" name="reserFlag" value="N" />
         
         <div class="collapse-wrap" data-reservation-wrap="campsite">
         	
         	
   		
         			<ul class="menu-tabs">
         		
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">가야산</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">
	                         	
                       		
                       			<li><a href="javascript:void(0);" onclick="javascript:clickPlace('01','01'); ">삼정 </a></li>
 
                       			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('01','02'); return false;">치인 </a></li>

                       			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('01','02'); return false;">백운동 </a></li>

	                         </ul>
	                     </div>
	                 </li>                 
                 
             
         		
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">계룡산</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">
	
	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('02','01'); return false;">동학사 </a></li>
	
	                             
	                         </ul>
	                     </div>
	                 </li>                 
                 
             
         		
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">내장산</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">
	
	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('03','01'); return false;">가인 </a></li>

	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('03','02'); return false;">내장 </a></li>
	                         		

	                         </ul>
	                     </div>
	                 </li>                 
   
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">다도해해상</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">

	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('04','01'); return false;">팔영산 </a></li>
   		
	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('04','02'); return false;">염포 </a></li>
  		
	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('04','03'); return false;">구계등 </a></li>
	
	                             
	                         </ul>
	                     </div>
	                 </li>                 
                 
         			</ul>

         			<ul class="menu-tabs">
         		
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">덕유산</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">

	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('05','01'); return false;">덕유대 체류형 숙박시설 </a></li>
	
	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('05','02'); return false;">덕유대 야영장 </a></li>
	                         		
	                             
	                         </ul>
	                     </div>
	                 </li>                 
                 
             
         		
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">무등산</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">

	                         		
	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('06','01'); return false;">도원 </a></li>

	                         </ul>
	                     </div>
	                 </li>                 
                 
             
         		
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">변산반도</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">

	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('07','01'); return false;">고사포 </a></li>

	                         </ul>
	                     </div>
	                 </li>                 
 
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">설악산</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">

	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('08','01'); return false;">설악 </a></li>

	                         </ul>
	                     </div>
	                 </li>                 
                 
         			</ul>
 
         			<ul class="menu-tabs">
         		
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">소백산</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">

	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('09','01'); return false;">삼가 </a></li>
	
	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('09','02'); return false;">남천 </a></li>
   
	                         </ul>
	                     </div>
	                 </li>                 
                 
             
         		
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">오대산</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">
	
	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('10','01'); return false;">소금강 </a></li>
	
	                             
	                         </ul>
	                     </div>
	                 </li>                 
                 
             
         		
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">월악산</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">
	                         	

	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('11','01'); return false;">닷돈재풀옵션 </a></li>

	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('11','02'); return false;">닷돈재자동차 </a></li>
	
	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('11','03'); return false;">덕주 </a></li>

	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('11','04'); return false;">송계 </a></li>

	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('11','05'); return false;">용하 </a></li>

	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('11','06'); return false;">하선암 </a></li>
	                         		
 
	                         </ul>
	                     </div>
	                 </li>                 
                 
  
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">월출산</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">

	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('12','01'); return false;">천황 </a></li>
	                         		
	
	                             
	                         </ul>
	                     </div>
	                 </li>                 
                 
         			</ul>
 
         			<ul class="menu-tabs">
         		
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">주왕산</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">
	                         	

	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('13','01'); return false;">상의 </a></li>
	
	                             
	                         </ul>
	                     </div>
	                 </li>                 
 
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">지리산</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">

	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('14','01'); return false;">학천카라반 </a></li>
	
	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('14','02'); return false;">덕동 </a></li>

	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('14','03'); return false;">달궁힐링 </a></li>

	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('14','04'); return false;">달궁자동차 </a></li>

	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('14','05'); return false;">뱀사골자동차 </a></li>

	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('14','06'); return false;">뱀사골힐링 </a></li>

	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('14','07'); return false;">소막골 </a></li>

	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('14','08'); return false;">내원 </a></li>

	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('14','09'); return false;">백무동 </a></li>
	
	                             
	                         </ul>
	                     </div>
	                 </li>                 
                 
             
         		
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">치악산</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">

	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('15','01'); return false;">구룡 </a></li>

	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('15','02'); return false;">금대 </a></li>

	                         </ul>
	                     </div>
	                 </li>                 

					<li>
	                     <a href="javascript:void(0);" class="btn collapse">태백산</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">

	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('16','01'); return false;">소도 </a></li>
	
	                             
	                         </ul>
	                     </div>
	                 </li>                 
                 
         			</ul>
         		 
  
         			<ul class="menu-tabs">
         		
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">태안해안</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">

	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('17','01'); return false;">몽산포 </a></li>
	
	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('17','02'); return false;">학암포 </a></li>
	                         		
	
	                         </ul>
	                     </div>
	                 </li>                 
                 
             
         		
					<li>
	                     <a href="javascript:void(0);" class="btn collapse">한려해상</a>
	                     <div class="a">
	                         <ul class="nav-tabs tab-menu">
	                         	

	                         			<li><a href="javascript:void(0);" onclick="javascript:selectPlace('18','01'); return false;">학동 </a></li>

	                         </ul>
	                     </div>
	                 </li>                 
                 
         			</ul>
         		 
             
         </div>
         
         
         <div class="nodata" id="nodata">
             <i class="icon-alert-circle"></i>
             <span>선택된 야영장이 없습니다. 야영장을 선택해주세요.</span>
         </div>
         
         
         
         <div class="content-view" id="content-view" style="display:none;">
                    <div class="tab-pane is-active" id="tab14-5">
                        <div class="title-area">
                            <span class="label"><i class="icon-location"></i> 가야산</span>
                            <h4 class="title">삼정 야영장 예약현황</h4>
                            <span class="copy">야영장은 개시기간 기준 아이디 당 2건으로 제한 됩니다.</span>
                        </div>

                        

                        <div class="top-guide">
                            <ul class="state-list">
                                <li>
                                    <i class="icon-reservation"></i>
                                    <span>예약가능</span>
                                </li>
                                <li>
                                    <i class="icon-waiting"></i>
                                    <span>대기가능</span>
                                </li>
                                <li>
                                    <i class="icon-none-reservation"></i>
                                    <span>예약만료</span>
                                </li>
                                <li>
                                    <i class="icon-end"></i>
                                    <span>예약불가</span>
                                </li>
                                <!-- 2022.07.11 아이콘 추가 -->
                                <li>
                                    <i class="icon-reserve"></i>
                                    <span>예비영지</span>
                                </li>
                                <li>
                                    <i class="icon-electricity"></i>
                                    <span>전기가능영지</span>
                                </li>
                                <li>
                                    <i class="icon-carbon"></i>
                                    <span>탄소제로영지</span>
                                </li>
                                <li>
                                    <i class="icon-barrier-free"></i>
                                    <span>무장애영지</span>
                                </li>
                                <!--  //2022.07.11 아이콘 추가 -->
                            </ul>
                            <div class="btn-area">
                                <button class="btn btn-360" onclick="javascript:imgView('/product/camp/camp0602_2_210611.jpg');">
                                    <i class="icon-360"></i>
                                    <span>배치도</span>
                                </button>
                                <button class="btn btn-refresh" onclick="javascript:refresh();">
                                    <i class="icon-refresh"></i>
                                    <span>새로고침</span>
                                </button>
                            </div>
                        </div>
                        <div class="check-box">
                            <ul class="check-area">
                                
                                    <li>
                                   <span class="checkbox-1">
                                       <input type="checkbox" id="check1" name="campGnbChk" value="02011" checked="checked" onclick="javascript:campGbnChk('0','02011');">

                                       
                                           
                                           
                                               <label for="check1">자동차야영장</label>
                                           
                                       
                                   </span>
                                    </li>
                                
                            </ul>
                        </div>
                        <!-- 예약하기 현황표 -->
                        <div class="table-reservation">
                            <div class="scroll-head">
                                <table class="table-sticky-head">
                                    <caption>야영장 예약현황</caption>
                                    <thead class="thead">
                                    <tr>
                                        <th class="title" scope="row">야영장</th>
                                    </tr>
                                    <tr>
                                        <th scope="row">전체 영지수</th>
                                    </tr>
                                    <tr>
                                        <th scope="row">예약가능 시설수</th>
                                    </tr>
                                    <tr>
                                        <th scope="row">대기가능 시설수</th>
                                    </tr>
                                    </thead>
                                </table>
                                <table class="table-head">
                                    <caption>야영장 예약 월 일</caption>
                                    <colgroup>
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                    </colgroup>
                                    <thead class="thead">
                                    
                                        
                                            
                                                
                                                    <tr><th colspan="16" scope="col"><span>11월</span></th>
                                                
                                                
                                            
                                        
                                    
                                        
                                    
                                        
                                    
                                        
                                    
                                        
                                    
                                        
                                    
                                        
                                    
                                        
                                    
                                        
                                    
                                        
                                    
                                        
                                    
                                        
                                    
                                        
                                    
                                        
                                    
                                        
                                    
                                        
                                    
                                    </tr>
                                    <tr class="day">
                                        
                                            
                                                
                                                
                                                
                                                    <td>15</td>
                                                
                                            

                                        
                                            
                                                
                                                
                                                
                                                    <td>16</td>
                                                
                                            

                                        
                                            
                                                
                                                
                                                
                                                    <td>17</td>
                                                
                                            

                                        
                                            
                                                
                                                
                                                
                                                    <td>18</td>
                                                
                                            

                                        
                                            
                                                
                                                    <td class="sat">19</td>
                                                
                                                
                                                
                                            

                                        
                                            
                                                
                                                
                                                    <td class="sun">20</td>
                                                
                                                
                                            

                                        
                                            
                                                
                                                
                                                
                                                    <td>21</td>
                                                
                                            

                                        
                                            
                                                
                                                
                                                
                                                    <td>22</td>
                                                
                                            

                                        
                                            
                                                
                                                
                                                
                                                    <td>23</td>
                                                
                                            

                                        
                                            
                                                
                                                
                                                
                                                    <td>24</td>
                                                
                                            

                                        
                                            
                                                
                                                
                                                
                                                    <td>25</td>
                                                
                                            

                                        
                                            
                                                
                                                    <td class="sat">26</td>
                                                
                                                
                                                
                                            

                                        
                                            
                                                
                                                
                                                    <td class="sun">27</td>
                                                
                                                
                                            

                                        
                                            
                                                
                                                
                                                
                                                    <td>28</td>
                                                
                                            

                                        
                                            
                                                
                                                
                                                
                                                    <td>29</td>
                                                
                                            

                                        
                                            
                                                
                                                
                                                
                                                    <td>30</td>
                                                
                                            

                                        
                                    </tr>
                                    <tr>
                                        
                                            
                                                
                                                
                                                
                                                    <td>17</td>
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td>17</td>
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td>17</td>
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td>17</td>
                                                
                                            
                                        
                                            
                                                
                                                    <td class="sat">17</td>
                                                
                                                
                                                
                                            
                                        
                                            
                                                
                                                
                                                    <td class="sun">17</td>
                                                
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td>17</td>
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td>17</td>
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td>17</td>
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td>17</td>
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td>17</td>
                                                
                                            
                                        
                                            
                                                
                                                    <td class="sat">17</td>
                                                
                                                
                                                
                                            
                                        
                                            
                                                
                                                
                                                    <td class="sun">17</td>
                                                
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td>17</td>
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td>17</td>
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td>17</td>
                                                
                                            
                                        
                                    </tr>
                                    <tr>
                                        
                                            
                                                
                                                
                                                
                                                    <td id="RCCnt1115">16</td>
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td id="RCCnt1116">17</td>
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td id="RCCnt1117">17</td>
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td id="RCCnt1118">11</td>
                                                
                                            
                                        
                                            
                                                
                                                    <td class="sat" id="RCCnt1119">1</td>
                                                
                                                
                                                
                                            
                                        
                                            
                                                
                                                
                                                    <td class="sun" id="RCCnt1120">15</td>
                                                
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td id="RCCnt1121">0</td>
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td id="RCCnt1122">0</td>
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td id="RCCnt1123">0</td>
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td id="RCCnt1124">0</td>
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td id="RCCnt1125">0</td>
                                                
                                            
                                        
                                            
                                                
                                                    <td class="sat" id="RCCnt1126">0</td>
                                                
                                                
                                                
                                            
                                        
                                            
                                                
                                                
                                                    <td class="sun" id="RCCnt1127">0</td>
                                                
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td id="RCCnt1128">0</td>
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td id="RCCnt1129">0</td>
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td id="RCCnt1130">0</td>
                                                
                                            
                                        
                                    </tr>
                                    <tr>
                                        
                                            
                                                
                                                
                                                
                                                    <td id="WCnt1115">0</td>
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td id="WCnt1116">0</td>
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td id="WCnt1117">0</td>
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td id="WCnt1118">0</td>
                                                
                                            
                                        
                                            
                                                
                                                    <td class="sat" id="WCnt1119">0</td>
                                                
                                                
                                                
                                            
                                        
                                            
                                                
                                                
                                                    <td class="sun" id="WCnt1120">0</td>
                                                
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td id="WCnt1121">0</td>
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td id="WCnt1122">0</td>
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td id="WCnt1123">0</td>
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td id="WCnt1124">0</td>
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td id="WCnt1125">0</td>
                                                
                                            
                                        
                                            
                                                
                                                    <td class="sat" id="WCnt1126">0</td>
                                                
                                                
                                                
                                            
                                        
                                            
                                                
                                                
                                                    <td class="sun" id="WCnt1127">0</td>
                                                
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td id="WCnt1128">0</td>
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td id="WCnt1129">0</td>
                                                
                                            
                                        
                                            
                                                
                                                
                                                
                                                    <td id="WCnt1130">0</td>
                                                
                                            
                                        
                                    </tr>
                                    </thead>
                                </table>
                            </div>
                            <div class="scroll-body">
                                <table class="table-sticky-body">
                                    <caption>시설명 및 영지 명</caption>
                                    <colgroup>
                                        <col style="width: 130px">
                                        <col style="width: 130px">
                                    </colgroup>
                                    <tbody class="tbody">
                                    
                                    
                                        <tr>
                                            
                                                
                                                <th rowspan="17" scope="row">
                                                <span class="title">
                                                자동차야영장
                                                
                                            </span>
                                                </th>
                                            
                                            <th scope="row">

                                                
                                                    
                                                    
                                                        
                                                        
                                                            <i class="icon-electricity"></i>
                                                        
                                                        
                                                    
                                                

                                                <span class="title">
                                                1
                                                
                                            </span>
                                            </th>
                                        </tr>
                                    
                                        <tr>
                                            
                                            <th scope="row">

                                                
                                                    
                                                    
                                                        
                                                        
                                                            <i class="icon-electricity"></i>
                                                        
                                                        
                                                    
                                                

                                                <span class="title">
                                                2
                                                
                                            </span>
                                            </th>
                                        </tr>
                                    
                                        <tr>
                                            
                                            <th scope="row">

                                                
                                                    
                                                    
                                                        
                                                        
                                                            <i class="icon-electricity"></i>
                                                        
                                                        
                                                    
                                                

                                                <span class="title">
                                                3
                                                
                                            </span>
                                            </th>
                                        </tr>
                                    
                                        <tr>
                                            
                                            <th scope="row">

                                                
                                                    
                                                    
                                                        
                                                        
                                                            <i class="icon-electricity"></i>
                                                        
                                                        
                                                    
                                                

                                                <span class="title">
                                                4
                                                
                                            </span>
                                            </th>
                                        </tr>
                                    
                                        <tr>
                                            
                                            <th scope="row">

                                                
                                                    
                                                    
                                                        
                                                        
                                                            <i class="icon-electricity"></i>
                                                        
                                                        
                                                    
                                                

                                                <span class="title">
                                                5
                                                
                                            </span>
                                            </th>
                                        </tr>
                                    
                                        <tr>
                                            
                                            <th scope="row">

                                                
                                                    
                                                    
                                                        
                                                        
                                                            <i class="icon-electricity"></i>
                                                        
                                                        
                                                    
                                                

                                                <span class="title">
                                                6
                                                
                                            </span>
                                            </th>
                                        </tr>
                                    
                                        <tr>
                                            
                                            <th scope="row">

                                                
                                                    
                                                    
                                                        
                                                        
                                                            <i class="icon-electricity"></i>
                                                        
                                                        
                                                    
                                                

                                                <span class="title">
                                                7
                                                
                                            </span>
                                            </th>
                                        </tr>
                                    
                                        <tr>
                                            
                                            <th scope="row">

                                                
                                                    
                                                    
                                                        
                                                        
                                                            <i class="icon-electricity"></i>
                                                        
                                                        
                                                    
                                                

                                                <span class="title">
                                                8
                                                
                                            </span>
                                            </th>
                                        </tr>
                                    
                                        <tr>
                                            
                                            <th scope="row">

                                                
                                                    
                                                    
                                                        
                                                        
                                                            <i class="icon-electricity"></i>
                                                        
                                                        
                                                    
                                                

                                                <span class="title">
                                                9
                                                
                                            </span>
                                            </th>
                                        </tr>
                                    
                                        <tr>
                                            
                                            <th scope="row">

                                                
                                                    
                                                    
                                                        
                                                        
                                                            <i class="icon-electricity"></i>
                                                        
                                                        
                                                    
                                                

                                                <span class="title">
                                                10
                                                
                                            </span>
                                            </th>
                                        </tr>
                                    
                                        <tr>
                                            
                                            <th scope="row">

                                                
                                                    
                                                    
                                                        
                                                        
                                                            <i class="icon-electricity"></i>
                                                        
                                                        
                                                    
                                                

                                                <span class="title">
                                                11
                                                
                                            </span>
                                            </th>
                                        </tr>
                                    
                                        <tr>
                                            
                                            <th scope="row">

                                                
                                                    
                                                    
                                                        
                                                        
                                                            <i class="icon-electricity"></i>
                                                        
                                                        
                                                    
                                                

                                                <span class="title">
                                                12
                                                
                                            </span>
                                            </th>
                                        </tr>
                                    
                                        <tr>
                                            
                                            <th scope="row">

                                                
                                                    
                                                    
                                                        
                                                        
                                                            <i class="icon-electricity"></i>
                                                        
                                                        
                                                    
                                                

                                                <span class="title">
                                                13
                                                
                                            </span>
                                            </th>
                                        </tr>
                                    
                                        <tr>
                                            
                                            <th scope="row">

                                                
                                                    
                                                    
                                                        
                                                        
                                                            <i class="icon-electricity"></i>
                                                        
                                                        
                                                    
                                                

                                                <span class="title">
                                                14
                                                
                                            </span>
                                            </th>
                                        </tr>
                                    
                                        <tr>
                                            
                                            <th scope="row">

                                                
                                                    
                                                    
                                                        
                                                        
                                                            <i class="icon-electricity"></i>
                                                        
                                                        
                                                    
                                                

                                                <span class="title">
                                                15
                                                
                                            </span>
                                            </th>
                                        </tr>
                                    
                                        <tr>
                                            
                                            <th scope="row">

                                                
                                                    
                                                    
                                                        
                                                        
                                                            <i class="icon-electricity"></i>
                                                        
                                                        
                                                    
                                                

                                                <span class="title">
                                                16
                                                
                                            </span>
                                            </th>
                                        </tr>
                                    
                                        <tr>
                                            
                                            <th scope="row">

                                                
                                                    
                                                    
                                                        
                                                            <i class="icon-barrier-free"></i>
                                                        
                                                        
                                                            <i class="icon-electricity"></i>
                                                        
                                                        
                                                    
                                                

                                                <span class="title">
                                                17(무장애)
                                                
                                            </span>
                                            </th>
                                        </tr>
                                    
                                    </tbody>
                                </table>
                                <table class="table-body">
                                    <caption>시설 예약 현황</caption>
                                    <colgroup>
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                            <col style="width: 45px">
                                        
                                    </colgroup>
                                    <thead style="display:none;">
                                        <tr><th scope="col" colspan="16">시설 예약 현황</th>
                                    </tr></thead>
                                    <tbody class="tbody">
                                    
                                    
                                        <tr>
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td class="start selected">
                                                                    <i class="icon-reservation 20221115_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-1" data-payment-title="자동차야영장 1" data-reser_tp="R" data-prod-id="CB13100101001" data-prod-ctg-id="0201100" data-use_df="20221115" data-ctrt-dow="화" data-sal-amt="13000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'15').text());
                                                                        $('#RCCnt'+'11'+'15').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td class="end selected">
                                                                    <i class="icon-reservation 20221116_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-1" data-payment-title="자동차야영장 1" data-reser_tp="R" data-prod-id="CB13100101001" data-prod-ctg-id="0201100" data-use_df="20221116" data-ctrt-dow="수" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'16').text());
                                                                        $('#RCCnt'+'11'+'16').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221117_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-1" data-payment-title="자동차야영장 1" data-reser_tp="R" data-prod-id="CB13100101001" data-prod-ctg-id="0201100" data-use_df="20221117" data-ctrt-dow="목" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'17').text());
                                                                        $('#RCCnt'+'11'+'17').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                                <td><i class="icon-none-reservation 20221118_C"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                                <td><i class="icon-none-reservation 20221119_C"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221120_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-1" data-payment-title="자동차야영장 1" data-reser_tp="R" data-prod-id="CB13100101001" data-prod-ctg-id="0201100" data-use_df="20221120" data-ctrt-dow="일" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'20').text());
                                                                        $('#RCCnt'+'11'+'20').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221121_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221122_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221123_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221124_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221125_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221126_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221127_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221128_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221129_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221130_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                        </tr>
                                    
                                        <tr>
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221115_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-2" data-payment-title="자동차야영장 2" data-reser_tp="R" data-prod-id="CB13100101002" data-prod-ctg-id="0201100" data-use_df="20221115" data-ctrt-dow="화" data-sal-amt="13000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'15').text());
                                                                        $('#RCCnt'+'11'+'15').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221116_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-2" data-payment-title="자동차야영장 2" data-reser_tp="R" data-prod-id="CB13100101002" data-prod-ctg-id="0201100" data-use_df="20221116" data-ctrt-dow="수" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'16').text());
                                                                        $('#RCCnt'+'11'+'16').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221117_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-2" data-payment-title="자동차야영장 2" data-reser_tp="R" data-prod-id="CB13100101002" data-prod-ctg-id="0201100" data-use_df="20221117" data-ctrt-dow="목" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'17').text());
                                                                        $('#RCCnt'+'11'+'17').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                                <td><i class="icon-none-reservation 20221118_C"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                                <td><i class="icon-none-reservation 20221119_C"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221120_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-2" data-payment-title="자동차야영장 2" data-reser_tp="R" data-prod-id="CB13100101002" data-prod-ctg-id="0201100" data-use_df="20221120" data-ctrt-dow="일" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'20').text());
                                                                        $('#RCCnt'+'11'+'20').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221121_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221122_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221123_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221124_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221125_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221126_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221127_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221128_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221129_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221130_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                        </tr>
                                    
                                        <tr>
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221115_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-3" data-payment-title="자동차야영장 3" data-reser_tp="R" data-prod-id="CB13100101003" data-prod-ctg-id="0201100" data-use_df="20221115" data-ctrt-dow="화" data-sal-amt="13000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'15').text());
                                                                        $('#RCCnt'+'11'+'15').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221116_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-3" data-payment-title="자동차야영장 3" data-reser_tp="R" data-prod-id="CB13100101003" data-prod-ctg-id="0201100" data-use_df="20221116" data-ctrt-dow="수" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'16').text());
                                                                        $('#RCCnt'+'11'+'16').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221117_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-3" data-payment-title="자동차야영장 3" data-reser_tp="R" data-prod-id="CB13100101003" data-prod-ctg-id="0201100" data-use_df="20221117" data-ctrt-dow="목" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'17').text());
                                                                        $('#RCCnt'+'11'+'17').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221118_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-3" data-payment-title="자동차야영장 3" data-reser_tp="R" data-prod-id="CB13100101003" data-prod-ctg-id="0201100" data-use_df="20221118" data-ctrt-dow="금" data-sal-amt="13000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'18').text());
                                                                        $('#RCCnt'+'11'+'18').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                                <td><i class="icon-none-reservation 20221119_C"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221120_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-3" data-payment-title="자동차야영장 3" data-reser_tp="R" data-prod-id="CB13100101003" data-prod-ctg-id="0201100" data-use_df="20221120" data-ctrt-dow="일" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'20').text());
                                                                        $('#RCCnt'+'11'+'20').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221121_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221122_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221123_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221124_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221125_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221126_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221127_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221128_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221129_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221130_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                        </tr>
                                    
                                        <tr>
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221115_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-4" data-payment-title="자동차야영장 4" data-reser_tp="R" data-prod-id="CB13100101004" data-prod-ctg-id="0201100" data-use_df="20221115" data-ctrt-dow="화" data-sal-amt="13000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'15').text());
                                                                        $('#RCCnt'+'11'+'15').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221116_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-4" data-payment-title="자동차야영장 4" data-reser_tp="R" data-prod-id="CB13100101004" data-prod-ctg-id="0201100" data-use_df="20221116" data-ctrt-dow="수" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'16').text());
                                                                        $('#RCCnt'+'11'+'16').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221117_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-4" data-payment-title="자동차야영장 4" data-reser_tp="R" data-prod-id="CB13100101004" data-prod-ctg-id="0201100" data-use_df="20221117" data-ctrt-dow="목" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'17').text());
                                                                        $('#RCCnt'+'11'+'17').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221118_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-4" data-payment-title="자동차야영장 4" data-reser_tp="R" data-prod-id="CB13100101004" data-prod-ctg-id="0201100" data-use_df="20221118" data-ctrt-dow="금" data-sal-amt="13000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'18').text());
                                                                        $('#RCCnt'+'11'+'18').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                                <td><i class="icon-none-reservation 20221119_C"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                                <td><i class="icon-none-reservation 20221120_C"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221121_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221122_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221123_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221124_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221125_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221126_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221127_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221128_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221129_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221130_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                        </tr>
                                    
                                        <tr>
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                                <td><i class="icon-none-reservation 20221115_C"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221116_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-5" data-payment-title="자동차야영장 5" data-reser_tp="R" data-prod-id="CB13100101005" data-prod-ctg-id="0201100" data-use_df="20221116" data-ctrt-dow="수" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'16').text());
                                                                        $('#RCCnt'+'11'+'16').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221117_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-5" data-payment-title="자동차야영장 5" data-reser_tp="R" data-prod-id="CB13100101005" data-prod-ctg-id="0201100" data-use_df="20221117" data-ctrt-dow="목" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'17').text());
                                                                        $('#RCCnt'+'11'+'17').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221118_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-5" data-payment-title="자동차야영장 5" data-reser_tp="R" data-prod-id="CB13100101005" data-prod-ctg-id="0201100" data-use_df="20221118" data-ctrt-dow="금" data-sal-amt="13000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'18').text());
                                                                        $('#RCCnt'+'11'+'18').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                                <td><i class="icon-none-reservation 20221119_C"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221120_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-5" data-payment-title="자동차야영장 5" data-reser_tp="R" data-prod-id="CB13100101005" data-prod-ctg-id="0201100" data-use_df="20221120" data-ctrt-dow="일" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'20').text());
                                                                        $('#RCCnt'+'11'+'20').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221121_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221122_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221123_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221124_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221125_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221126_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221127_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221128_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221129_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221130_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                        </tr>
                                    
                                        <tr>
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221115_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-6" data-payment-title="자동차야영장 6" data-reser_tp="R" data-prod-id="CB13100101006" data-prod-ctg-id="0201100" data-use_df="20221115" data-ctrt-dow="화" data-sal-amt="13000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'15').text());
                                                                        $('#RCCnt'+'11'+'15').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221116_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-6" data-payment-title="자동차야영장 6" data-reser_tp="R" data-prod-id="CB13100101006" data-prod-ctg-id="0201100" data-use_df="20221116" data-ctrt-dow="수" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'16').text());
                                                                        $('#RCCnt'+'11'+'16').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221117_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-6" data-payment-title="자동차야영장 6" data-reser_tp="R" data-prod-id="CB13100101006" data-prod-ctg-id="0201100" data-use_df="20221117" data-ctrt-dow="목" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'17').text());
                                                                        $('#RCCnt'+'11'+'17').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221118_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-6" data-payment-title="자동차야영장 6" data-reser_tp="R" data-prod-id="CB13100101006" data-prod-ctg-id="0201100" data-use_df="20221118" data-ctrt-dow="금" data-sal-amt="13000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'18').text());
                                                                        $('#RCCnt'+'11'+'18').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                                <td><i class="icon-none-reservation 20221119_C"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221120_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-6" data-payment-title="자동차야영장 6" data-reser_tp="R" data-prod-id="CB13100101006" data-prod-ctg-id="0201100" data-use_df="20221120" data-ctrt-dow="일" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'20').text());
                                                                        $('#RCCnt'+'11'+'20').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221121_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221122_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221123_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221124_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221125_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221126_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221127_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221128_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221129_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221130_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                        </tr>
                                    
                                        <tr>
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221115_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-7" data-payment-title="자동차야영장 7" data-reser_tp="R" data-prod-id="CB13100101007" data-prod-ctg-id="0201100" data-use_df="20221115" data-ctrt-dow="화" data-sal-amt="13000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'15').text());
                                                                        $('#RCCnt'+'11'+'15').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221116_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-7" data-payment-title="자동차야영장 7" data-reser_tp="R" data-prod-id="CB13100101007" data-prod-ctg-id="0201100" data-use_df="20221116" data-ctrt-dow="수" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'16').text());
                                                                        $('#RCCnt'+'11'+'16').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221117_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-7" data-payment-title="자동차야영장 7" data-reser_tp="R" data-prod-id="CB13100101007" data-prod-ctg-id="0201100" data-use_df="20221117" data-ctrt-dow="목" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'17').text());
                                                                        $('#RCCnt'+'11'+'17').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221118_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-7" data-payment-title="자동차야영장 7" data-reser_tp="R" data-prod-id="CB13100101007" data-prod-ctg-id="0201100" data-use_df="20221118" data-ctrt-dow="금" data-sal-amt="13000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'18').text());
                                                                        $('#RCCnt'+'11'+'18').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                                <td><i class="icon-none-reservation 20221119_C"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221120_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-7" data-payment-title="자동차야영장 7" data-reser_tp="R" data-prod-id="CB13100101007" data-prod-ctg-id="0201100" data-use_df="20221120" data-ctrt-dow="일" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'20').text());
                                                                        $('#RCCnt'+'11'+'20').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221121_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221122_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221123_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221124_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221125_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221126_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221127_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221128_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221129_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221130_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                        </tr>
                                    
                                        <tr>
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221115_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-8" data-payment-title="자동차야영장 8" data-reser_tp="R" data-prod-id="CB13100101008" data-prod-ctg-id="0201100" data-use_df="20221115" data-ctrt-dow="화" data-sal-amt="13000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'15').text());
                                                                        $('#RCCnt'+'11'+'15').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221116_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-8" data-payment-title="자동차야영장 8" data-reser_tp="R" data-prod-id="CB13100101008" data-prod-ctg-id="0201100" data-use_df="20221116" data-ctrt-dow="수" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'16').text());
                                                                        $('#RCCnt'+'11'+'16').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221117_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-8" data-payment-title="자동차야영장 8" data-reser_tp="R" data-prod-id="CB13100101008" data-prod-ctg-id="0201100" data-use_df="20221117" data-ctrt-dow="목" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'17').text());
                                                                        $('#RCCnt'+'11'+'17').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221118_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-8" data-payment-title="자동차야영장 8" data-reser_tp="R" data-prod-id="CB13100101008" data-prod-ctg-id="0201100" data-use_df="20221118" data-ctrt-dow="금" data-sal-amt="13000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'18').text());
                                                                        $('#RCCnt'+'11'+'18').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                                <td><i class="icon-none-reservation 20221119_C"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                                <td><i class="icon-none-reservation 20221120_C"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221121_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221122_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221123_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221124_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221125_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221126_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221127_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221128_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221129_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221130_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                        </tr>
                                    
                                        <tr>
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221115_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-9" data-payment-title="자동차야영장 9" data-reser_tp="R" data-prod-id="CB13100101009" data-prod-ctg-id="0201100" data-use_df="20221115" data-ctrt-dow="화" data-sal-amt="13000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'15').text());
                                                                        $('#RCCnt'+'11'+'15').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221116_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-9" data-payment-title="자동차야영장 9" data-reser_tp="R" data-prod-id="CB13100101009" data-prod-ctg-id="0201100" data-use_df="20221116" data-ctrt-dow="수" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'16').text());
                                                                        $('#RCCnt'+'11'+'16').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221117_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-9" data-payment-title="자동차야영장 9" data-reser_tp="R" data-prod-id="CB13100101009" data-prod-ctg-id="0201100" data-use_df="20221117" data-ctrt-dow="목" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'17').text());
                                                                        $('#RCCnt'+'11'+'17').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                                <td><i class="icon-none-reservation 20221118_C"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                                <td><i class="icon-none-reservation 20221119_C"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221120_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-9" data-payment-title="자동차야영장 9" data-reser_tp="R" data-prod-id="CB13100101009" data-prod-ctg-id="0201100" data-use_df="20221120" data-ctrt-dow="일" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'20').text());
                                                                        $('#RCCnt'+'11'+'20').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221121_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221122_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221123_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221124_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221125_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221126_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221127_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221128_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221129_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221130_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                        </tr>
                                    
                                        <tr>
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221115_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-10" data-payment-title="자동차야영장 10" data-reser_tp="R" data-prod-id="CB13100101010" data-prod-ctg-id="0201100" data-use_df="20221115" data-ctrt-dow="화" data-sal-amt="13000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'15').text());
                                                                        $('#RCCnt'+'11'+'15').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221116_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-10" data-payment-title="자동차야영장 10" data-reser_tp="R" data-prod-id="CB13100101010" data-prod-ctg-id="0201100" data-use_df="20221116" data-ctrt-dow="수" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'16').text());
                                                                        $('#RCCnt'+'11'+'16').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221117_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-10" data-payment-title="자동차야영장 10" data-reser_tp="R" data-prod-id="CB13100101010" data-prod-ctg-id="0201100" data-use_df="20221117" data-ctrt-dow="목" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'17').text());
                                                                        $('#RCCnt'+'11'+'17').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                                <td><i class="icon-none-reservation 20221118_C"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                                <td><i class="icon-none-reservation 20221119_C"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221120_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-10" data-payment-title="자동차야영장 10" data-reser_tp="R" data-prod-id="CB13100101010" data-prod-ctg-id="0201100" data-use_df="20221120" data-ctrt-dow="일" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'20').text());
                                                                        $('#RCCnt'+'11'+'20').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221121_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221122_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221123_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221124_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221125_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221126_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221127_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221128_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221129_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221130_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                        </tr>
                                    
                                        <tr>
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221115_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-11" data-payment-title="자동차야영장 11" data-reser_tp="R" data-prod-id="CB13100101011" data-prod-ctg-id="0201100" data-use_df="20221115" data-ctrt-dow="화" data-sal-amt="13000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'15').text());
                                                                        $('#RCCnt'+'11'+'15').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221116_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-11" data-payment-title="자동차야영장 11" data-reser_tp="R" data-prod-id="CB13100101011" data-prod-ctg-id="0201100" data-use_df="20221116" data-ctrt-dow="수" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'16').text());
                                                                        $('#RCCnt'+'11'+'16').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221117_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-11" data-payment-title="자동차야영장 11" data-reser_tp="R" data-prod-id="CB13100101011" data-prod-ctg-id="0201100" data-use_df="20221117" data-ctrt-dow="목" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'17').text());
                                                                        $('#RCCnt'+'11'+'17').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221118_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-11" data-payment-title="자동차야영장 11" data-reser_tp="R" data-prod-id="CB13100101011" data-prod-ctg-id="0201100" data-use_df="20221118" data-ctrt-dow="금" data-sal-amt="13000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'18').text());
                                                                        $('#RCCnt'+'11'+'18').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                                <td><i class="icon-none-reservation 20221119_C"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221120_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-11" data-payment-title="자동차야영장 11" data-reser_tp="R" data-prod-id="CB13100101011" data-prod-ctg-id="0201100" data-use_df="20221120" data-ctrt-dow="일" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'20').text());
                                                                        $('#RCCnt'+'11'+'20').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221121_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221122_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221123_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221124_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221125_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221126_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221127_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221128_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221129_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221130_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                        </tr>
                                    
                                        <tr>
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221115_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-12" data-payment-title="자동차야영장 12" data-reser_tp="R" data-prod-id="CB13100101012" data-prod-ctg-id="0201100" data-use_df="20221115" data-ctrt-dow="화" data-sal-amt="13000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'15').text());
                                                                        $('#RCCnt'+'11'+'15').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221116_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-12" data-payment-title="자동차야영장 12" data-reser_tp="R" data-prod-id="CB13100101012" data-prod-ctg-id="0201100" data-use_df="20221116" data-ctrt-dow="수" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'16').text());
                                                                        $('#RCCnt'+'11'+'16').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221117_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-12" data-payment-title="자동차야영장 12" data-reser_tp="R" data-prod-id="CB13100101012" data-prod-ctg-id="0201100" data-use_df="20221117" data-ctrt-dow="목" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'17').text());
                                                                        $('#RCCnt'+'11'+'17').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221118_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-12" data-payment-title="자동차야영장 12" data-reser_tp="R" data-prod-id="CB13100101012" data-prod-ctg-id="0201100" data-use_df="20221118" data-ctrt-dow="금" data-sal-amt="13000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'18').text());
                                                                        $('#RCCnt'+'11'+'18').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                                <td><i class="icon-none-reservation 20221119_C"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221120_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-12" data-payment-title="자동차야영장 12" data-reser_tp="R" data-prod-id="CB13100101012" data-prod-ctg-id="0201100" data-use_df="20221120" data-ctrt-dow="일" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'20').text());
                                                                        $('#RCCnt'+'11'+'20').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221121_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221122_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221123_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221124_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221125_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221126_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221127_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221128_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221129_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221130_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                        </tr>
                                    
                                        <tr>
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221115_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-13" data-payment-title="자동차야영장 13" data-reser_tp="R" data-prod-id="CB13100101013" data-prod-ctg-id="0201100" data-use_df="20221115" data-ctrt-dow="화" data-sal-amt="13000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'15').text());
                                                                        $('#RCCnt'+'11'+'15').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221116_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-13" data-payment-title="자동차야영장 13" data-reser_tp="R" data-prod-id="CB13100101013" data-prod-ctg-id="0201100" data-use_df="20221116" data-ctrt-dow="수" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'16').text());
                                                                        $('#RCCnt'+'11'+'16').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221117_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-13" data-payment-title="자동차야영장 13" data-reser_tp="R" data-prod-id="CB13100101013" data-prod-ctg-id="0201100" data-use_df="20221117" data-ctrt-dow="목" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'17').text());
                                                                        $('#RCCnt'+'11'+'17').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221118_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-13" data-payment-title="자동차야영장 13" data-reser_tp="R" data-prod-id="CB13100101013" data-prod-ctg-id="0201100" data-use_df="20221118" data-ctrt-dow="금" data-sal-amt="13000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'18').text());
                                                                        $('#RCCnt'+'11'+'18').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                                <td><i class="icon-none-reservation 20221119_C"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221120_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-13" data-payment-title="자동차야영장 13" data-reser_tp="R" data-prod-id="CB13100101013" data-prod-ctg-id="0201100" data-use_df="20221120" data-ctrt-dow="일" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'20').text());
                                                                        $('#RCCnt'+'11'+'20').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221121_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221122_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221123_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221124_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221125_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221126_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221127_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221128_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221129_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221130_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                        </tr>
                                    
                                        <tr>
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221115_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-14" data-payment-title="자동차야영장 14" data-reser_tp="R" data-prod-id="CB13100101014" data-prod-ctg-id="0201100" data-use_df="20221115" data-ctrt-dow="화" data-sal-amt="13000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'15').text());
                                                                        $('#RCCnt'+'11'+'15').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221116_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-14" data-payment-title="자동차야영장 14" data-reser_tp="R" data-prod-id="CB13100101014" data-prod-ctg-id="0201100" data-use_df="20221116" data-ctrt-dow="수" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'16').text());
                                                                        $('#RCCnt'+'11'+'16').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221117_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-14" data-payment-title="자동차야영장 14" data-reser_tp="R" data-prod-id="CB13100101014" data-prod-ctg-id="0201100" data-use_df="20221117" data-ctrt-dow="목" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'17').text());
                                                                        $('#RCCnt'+'11'+'17').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221118_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-14" data-payment-title="자동차야영장 14" data-reser_tp="R" data-prod-id="CB13100101014" data-prod-ctg-id="0201100" data-use_df="20221118" data-ctrt-dow="금" data-sal-amt="13000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'18').text());
                                                                        $('#RCCnt'+'11'+'18').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221119_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-14" data-payment-title="자동차야영장 14" data-reser_tp="R" data-prod-id="CB13100101014" data-prod-ctg-id="0201100" data-use_df="20221119" data-ctrt-dow="토" data-sal-amt="13000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'19').text());
                                                                        $('#RCCnt'+'11'+'19').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221120_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-14" data-payment-title="자동차야영장 14" data-reser_tp="R" data-prod-id="CB13100101014" data-prod-ctg-id="0201100" data-use_df="20221120" data-ctrt-dow="일" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'20').text());
                                                                        $('#RCCnt'+'11'+'20').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221121_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221122_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221123_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221124_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221125_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221126_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221127_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221128_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221129_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221130_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                        </tr>
                                    
                                        <tr>
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221115_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-15" data-payment-title="자동차야영장 15" data-reser_tp="R" data-prod-id="CB13100101015" data-prod-ctg-id="0201100" data-use_df="20221115" data-ctrt-dow="화" data-sal-amt="13000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'15').text());
                                                                        $('#RCCnt'+'11'+'15').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221116_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-15" data-payment-title="자동차야영장 15" data-reser_tp="R" data-prod-id="CB13100101015" data-prod-ctg-id="0201100" data-use_df="20221116" data-ctrt-dow="수" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'16').text());
                                                                        $('#RCCnt'+'11'+'16').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221117_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-15" data-payment-title="자동차야영장 15" data-reser_tp="R" data-prod-id="CB13100101015" data-prod-ctg-id="0201100" data-use_df="20221117" data-ctrt-dow="목" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'17').text());
                                                                        $('#RCCnt'+'11'+'17').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221118_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-15" data-payment-title="자동차야영장 15" data-reser_tp="R" data-prod-id="CB13100101015" data-prod-ctg-id="0201100" data-use_df="20221118" data-ctrt-dow="금" data-sal-amt="13000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'18').text());
                                                                        $('#RCCnt'+'11'+'18').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                                <td><i class="icon-none-reservation 20221119_C"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221120_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-15" data-payment-title="자동차야영장 15" data-reser_tp="R" data-prod-id="CB13100101015" data-prod-ctg-id="0201100" data-use_df="20221120" data-ctrt-dow="일" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'20').text());
                                                                        $('#RCCnt'+'11'+'20').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221121_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221122_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221123_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221124_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221125_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221126_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221127_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221128_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221129_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221130_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                        </tr>
                                    
                                        <tr>
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221115_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-16" data-payment-title="자동차야영장 16" data-reser_tp="R" data-prod-id="CB13100101016" data-prod-ctg-id="0201100" data-use_df="20221115" data-ctrt-dow="화" data-sal-amt="13000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'15').text());
                                                                        $('#RCCnt'+'11'+'15').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221116_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-16" data-payment-title="자동차야영장 16" data-reser_tp="R" data-prod-id="CB13100101016" data-prod-ctg-id="0201100" data-use_df="20221116" data-ctrt-dow="수" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'16').text());
                                                                        $('#RCCnt'+'11'+'16').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221117_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-16" data-payment-title="자동차야영장 16" data-reser_tp="R" data-prod-id="CB13100101016" data-prod-ctg-id="0201100" data-use_df="20221117" data-ctrt-dow="목" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'17').text());
                                                                        $('#RCCnt'+'11'+'17').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                                <td><i class="icon-none-reservation 20221118_C"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                                <td><i class="icon-none-reservation 20221119_C"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221120_N" data-brfe-ter-yn="N" data-title="가야산-삼정-자동차야영장-16" data-payment-title="자동차야영장 16" data-reser_tp="R" data-prod-id="CB13100101016" data-prod-ctg-id="0201100" data-use_df="20221120" data-ctrt-dow="일" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'20').text());
                                                                        $('#RCCnt'+'11'+'20').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221121_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221122_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221123_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221124_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221125_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221126_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221127_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221128_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221129_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221130_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                        </tr>
                                    
                                        <tr>
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221115_N" data-brfe-ter-yn="Y" data-title="가야산-삼정-자동차야영장-17(무장애)" data-payment-title="자동차야영장 17(무장애)" data-reser_tp="R" data-prod-id="CB13100101017" data-prod-ctg-id="0201100" data-use_df="20221115" data-ctrt-dow="화" data-sal-amt="13000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'15').text());
                                                                        $('#RCCnt'+'11'+'15').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221116_N" data-brfe-ter-yn="Y" data-title="가야산-삼정-자동차야영장-17(무장애)" data-payment-title="자동차야영장 17(무장애)" data-reser_tp="R" data-prod-id="CB13100101017" data-prod-ctg-id="0201100" data-use_df="20221116" data-ctrt-dow="수" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'16').text());
                                                                        $('#RCCnt'+'11'+'16').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221117_N" data-brfe-ter-yn="Y" data-title="가야산-삼정-자동차야영장-17(무장애)" data-payment-title="자동차야영장 17(무장애)" data-reser_tp="R" data-prod-id="CB13100101017" data-prod-ctg-id="0201100" data-use_df="20221117" data-ctrt-dow="목" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'17').text());
                                                                        $('#RCCnt'+'11'+'17').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                                <td><i class="icon-none-reservation 20221118_C"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                                <td><i class="icon-none-reservation 20221119_C"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                                <td>
                                                                    <i class="icon-reservation 20221120_N" data-brfe-ter-yn="Y" data-title="가야산-삼정-자동차야영장-17(무장애)" data-payment-title="자동차야영장 17(무장애)" data-reser_tp="R" data-prod-id="CB13100101017" data-prod-ctg-id="0201100" data-use_df="20221120" data-ctrt-dow="일" data-sal-amt="11000"></i>
                                                                    <script>
                                                                        var RCCntVal = parseInt($('#RCCnt'+'11'+'20').text());
                                                                        $('#RCCnt'+'11'+'20').html(RCCntVal + 1);
                                                                    </script>
                                                                </td>
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221121_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221122_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221123_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221124_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221125_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221126_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221127_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221128_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221129_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                                
                                                    
                                                        
                                                            
                                                                <td><i class="icon-end 20221130_R"></i></td>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                        
                                                        
                                                    
                                                    
                                                
                                            
                                        </tr>
                                    
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="title-area" id="reservDiv" tabindex="0">
                            <h4 class="title">선택 야영장</h4>
                        </div>
                        <div class="table-row">
                            <div class="item">
                                <em class="label"><i class="icon-camp"></i>야영장</em>
                                <span class="text">가야산-삼정-자동차야영장-1</span>
                            </div>
                            <div class="item">
                                <em class="label"><i class="icon-checkin"></i>입실일자</em>
                                <span class="text">2022-11-15[화]</span>
                            </div>
                            <div class="item">
                                <em class="label"><i class="icon-checkout"></i>퇴실일자</em>
                                <span class="text">2022-11-16[수]</span>
                            </div>
                            <div class="item">
                                <em class="label"><i class="icon-stay"></i>체류기간</em>
                                <div class="stay-row"><span class="length-stay selected" data-check_per="1">1박 2일</span><span class="length-stay" data-check_per="2">2박 3일</span></div>
                            </div>
                        </div>
                        <div class="border-box">
                            <div class="option-wrap">
                                <h5>옵션 추가선택</h5>
                                <ul class="option-list" data-template-id="prd-options-template">
            <li>
        <span class="checkbox-1">
            <input type="checkbox" id="check1-0" name="check1-0" data-opt-id="CO00001" data-opt-nm="전기" value="4000">
            <label for="check1-0">전기 (1박 4000원)</label>
        </span>
            </li>
        </ul>
                                <ul class="mt-10">
                                    <li>※ 옵션은 예약완료 후 마이페이지에서 추가하거나 변경, 부분취소할 수 있습니다.</li>
                                    <li>※ 숙박일수를 선택한 후 이용금액을 확인하고 예약하기 버튼을 누르면 바로 접수가 완료됩니다.</li>
                                    <li>※ 예약완료 후 곧바로 다른 시설 예약이 가능합니다.</li>
                                </ul>
                            </div>
                        </div>

                        <!-- <div class="payment">
                            <dl class="total">
                                <dt>합계 예정 금액</dt>
                                <dd><em>0</em>원</dd>
                            </dl>
                        </div> -->

                        <div class="title-area">
                            <h4 class="title">총 이용금액</h4>
                        </div>

                        <div class="payment" style="">
                            <dl>
                                <dt><em>야영장</em></dt>
                                <dd></dd>
                            </dl>
                            <dl id="campsitePayment"><dt>자동차야영장 1 : 1박 2일</dt><dd>13,000원</dd></dl>
                            <dl class="total">
                                <dt>결제(예정)금액</dt>
                                <dd><em>13,000</em>원</dd>
                            </dl>
                        </div>

                        <div class="payment collapse-wrap open">
                            <button class="btn collapse is-active">꼭 확인해주세요!</button>
                            <div class="a">
                                <ul class="dot-list">
                                    <li>인원을 선택한 후 이용금액을 확인하고 예약하기 버튼을 누르면 바로 접수가 완료됩니다.</li>
                                    <li>예약하기 버튼을 누르고 자동예약 방지문자를 입력한 후 예약이 완료됩니다.</li>
                                    <li>인기 야영장은 이용자가 많아 선택을 하는 도중 조기 마감될 수 있습니다.</li>
                                    <li>선착순 예약시 무장애 영지는 장애인 우선예약으로 운영되며, 미예약 영지는 일반인도 2일전부터 예약가능하도록 전환됩니다. (※본인 확인 불가시
                                        이용 제한)<br>(예시 : 5월 3일 사용예정일 기준 – 4월 30일까지 장애인 우선예약 / 5월 1일부터 일반인 예약 가능</li>
                                    <li id="warrning_msg">경남 합천군 코로나19 현황 주소: <a href="https://www.hc.go.kr/07370/08804.web" target="_blank">https://www.hc.go.kr/07370/08804.web</a></li>
                                    <li id="caravanCamp" style="display: none;"></li>
                                </ul>
                            </div>
                        </div>
                        <div class="board-bottom">
                            <div class="center btn-layer">
                                <a href="javascript:void(0)" class="btn btn-register is-active" onclick="javacript:reservation_before_auth();">예약하기</a>
                            </div>
                        </div>
                    </div>
                </div>
         
         
         
         <!-- 예약안내 레이어팝업 -->
         <div class="modal-popup small" id="automatic-character">
	        <div class="popup-wrap">
	            <div class="popup-head">
	                <strong class="popup-title">자동방지 입력문자</strong>
	                <button type="button" class="btn-close" title="닫기">
	                    <i class="icon-close"></i>
	                </button>
	            </div>
	            <div class="popup-container">
	                <table class="table">
	                    <caption>자동방지 입력문자</caption>
	                    <colgroup>
	                        <col style="width: 140px;">
	                        <col>
	                    </colgroup>
	                    <tbody class="tbody" data-area-name="popup-container-tbody">
	                        <tr>
			                    <th scope="row">예약상품</th>
			                    <td></td>
			                </tr>
			                <tr>
			                    <th scope="row">사용기간</th>
			                    <td></td>
			                </tr>
			                <tr>
			                    <th scope="row">입실날짜</th>
			                    <td></td>
			                </tr>
			                <tr>
			                    <th scope="row">퇴실날짜</th>
			                    <td></td>
			                </tr>
			                <tr>
			                    <th scope="row">옵션추가</th>
			                    <td></td>
			                </tr>
			                <tr>
			                    <th scope="row">결제(예정)금액</th>
			                    <td></td>
			                </tr>
			                <tr data-area-name="brfeTerYn" style="display:none;">
						        <th scope="row">자격구분 <span class="text-info">*</span></th>
						        <td class="form">
						            <ul class="checkbox-1">
						                <li>
						                    <span class="radio-1">
						                        <input type="radio" id="brfe-radio1" name="rsvtDvcdDs" value="14">
						                        <label for="brfe-radio1">장애인(중증, 1~3급)</label>
						                    </span>
						                </li>
						                <li>
						                    <span class="radio-1">
						                        <input type="radio" id="brfe-radio2" name="rsvtDvcdDs" value="11">
						                        <label for="brfe-radio2">장애인(경증, 4~6급)</label>
						                    </span>
						                </li>
						            </ul>
						        </td>
						    </tr>
						    <tr data-area-name="brfeTerYn" style="display:none;">
						        <th scope="row">장애인등록번호(뒤 3자리) <span class="text-info">*</span></th>
						        <td class="form">
						            <ul>
						                <li>
											<label for="dstpRegNo" class="hidden-text">장애인등록번호</label>
											<input type="text" class="input-text" name="dstpRegNo" id="dstpRegNo" maxlength="3" title="장애인등록번호">
										</li>
						            </ul>
						        </td>
						    </tr>
						    <tr data-area-name="brfeTerYn" style="display:none;">
						        <th scope="row">온라인 자격검증</th>
						        <td class="form">
						            <p class="copy">※ 온라인 자격검증을 하지 않을 경우 현장에서 장애인등록증으로 확인합니다. 자격증빙이 없을 경우 입장이 제한될 수 있으니 필히 지참해주세요</p>
						            <span class="btn-input">
						                <button class="btn btn-layer" data-popup="exemption-auth">자격검증</button>
										<label for="exemptionAuthText" class="hidden-text">자격검증</label>
						                <input type="text" class="input-text" placeholder="자격검증 버튼을 눌러주세요." title="자격검증" id="exemptionAuthText" readonly>
						            </span>
						        </td>
						    </tr>
	                    </tbody>
	                </table>
	                <div class="captcha-area">
	                    <span class="label">자동예약 방지문자</span>
	                    <span class="captcha"></span>
						<label for="captchaInput" class="hidden-text">자동예약 방지문자</label>
	                    <input type="text" class="input-text" name="captcha" id="captchaInput" title="자동예약 방지문자" maxlength="4">
	                </div>
	                <p class="copy-notice">※ 예약 완료된 상품에 대해서는 마이페이지 나의예약목록 에서 확인 후 결제 가능합니다.</p>
	                <div class="btn-area">
	                    <button class="btn btn-cancel">취소</button>
	                    <button class="btn btn-confirm is-active" data-button-name="reservation" onclick="javacript:reservation();">확인</button>
	                </div>
	            </div>
	        </div>
	    </div>
     </div>
     <a href="javascript:void(0);" style="display:none" class="btn btn-register is-active btn-layer" data-popup="automatic-character" >예약하기</a>
     
     <button type="button" style="display:none" class="btn btn-layer" data-popup="reservation-information1">예약안내</button>
    <div class="modal-popup small" id="reservation-information1">
        <div class="popup-wrap">
            <div class="popup-head">
                <strong class="popup-title">예약완료안내</strong>
                <button type="button" class="btn-close" title="닫기" onclick="javascript:lastPopClose();">
                    <i class="icon-close"></i>
                </button>
            </div>
            <div class="popup-container">
                <div class="center" data-area-name="reservation-popup-container">
                    <i class="icon-check"></i>
                    <strong class="title-1">예약이 완료되었습니다.</strong>
                    <p class="copy-mid">결제 만기일시는 <em data-popup-information-campsite="sttlmMtDtm"><!-- 2020년 02월 17일 16:00 --></em> 까지 입니다.<br>미 결제시 자동 취소되니 유의 하시기 바랍니다.</p>
                    <p class="copy-sm">마이페이지 나의예약목록 에서 확인 후 결제를 계속 진행해주세요.</p>
                </div>
                
                <div class="center" data-area-name="reservation-popup-container-w">
	                <i class="icon-check"></i>
	                <strong class="title-1">대기신청이 완료되었습니다.</strong>
	                <p class="copy-mid">
	                	대기자에서 예약자로 전환되면 예약 결제 안내 문자가 발송됩니다.<br>
						단, 잘못된 연락처 및 통신사 환경 등에 따라 전송이 실패할 수도 있습니다.<br>
						이에 따른 피해에 대해서는 국립공원공단에서 보상하지 않습니다.<br>
						반드시 '나의 예약 목록'에서 예약상태를 확인하여 주시기 바랍니다.
					</p>
	                <!-- <p class="copy-sm">마이페이지 나의예약목록 에서 확인 후 결제를 계속 진행해주세요.</p> -->
	            </div>
                
                <div class="btn-area">
                    <a href="/mypage/dashBoard.do" class="btn btn-link">나의 예약목록 보기</a>
                </div>
            </div>
        </div>
    </div>
    
    
    <!-- 배치도 -->
    <button type="button" class="btn btn-layer" data-popup="blockplan" style="display:none">배치도</button>
    <div class="modal-popup medium" id="blockplan">
        <div class="popup-wrap">
            <div class="popup-head">
                <strong class="popup-title">배치도</strong>
                <button type="button" class="btn-close btn-img-close" title="닫기" >
                    <i class="icon-close"></i>
                </button>
            </div>
            <div class="popup-container">
                <div class="zoom-container">
                    <div class="zoomable">
                        <img src="../assets/img/@img-deployment.png" alt="배치도" />
                    </div>
                    <button class="btn-move">이미지 이동</button>
                </div>
                <div class="btn-area">
                    <button class="btn btn-confirm is-active btn-img-confirm">확인</button>
                </div>
            </div>
        </div>
    </div>


    






<script>
$(document).ready(function(){

		//다음
		$('.selfAuthModal').click(function(){
		
			var policyVal = $('input[name="policy"]:checked').val();
			if(policyVal  == ''){
				toastrMsg('개인정보 제공 동의를 해주세요.');
				return false;
			}
			
			if($('#usNmId').text() == ''){
				toastrMsg('본인인증을 진행해주세요.');
				return false;
			}

			if($('#usNm').val() == ''){
				toastrMsg('주민등록번호 뒷자리를 입력해주세요.');
				return false;
			}
			
            ajaxCall({
                url : "/common/authGpkiForPay.do",
                data : {
                    "tgtrNm" : $('#usNmId').text(),
                    "trtrNum" : $('#usNumId').text()+""+$('#usNm').val(),
                    "authType" : $('#authTypeId').val()
                },
                success : function(dat){
                    if( $('#authTypeId').val() == 'A'){ //장애인여부확인
                        reductionDisabledDc(dat);
                    }else{
                        naManMeritDc(dat);
                    }
                },
                error : function(){
                    toastrMsg('감면 인증 중 오류가 발생하였습니다. <br/>관리자에게 문의하여 주세요.');
                }
            })
		});

		//취소 감면인증정보 확인 모달 제거
		$('.selfAuthModalCancel').click(function(){
            $('#radio1-1').prop('checked',true);
            closePopup('exemption-auth');
		});
		
});
function reductionDisabledDc(dat){
    var qufyYn = dat.qufyYn;
    var disabledCode = dat.disabledCode;
    let subTitle = '';
    let content = '';
    let type = '';

    if ($('#usNmId').text() == '') {

        if(qufyYn == 'M'){

            subTitle = $('#usNmId').text() + '님은 대상자가 아닙니다.';
            content = '기존 대상자였지만 현재 비대상자로 전환 되었습니다.<br/>확인 후 다시 시도해주세요.';
            type = 'error';
            $('#radio1-1').prop('checked', true);

        }else if(qufyYn == 'Y') {

            if (disabledCode == '00' || disabledCode == '98' || disabledCode == '99') {

                var strMsg = '';
                if (disabledCode == '00') {
                    strMsg = '장애 미해당';
                } else if (disabledCode == '98') {
                    strMsg = '결정보류';
                } else if (disabledCode == '99') {
                    strMsg = '확인불가';
                }

                $('#exemptionAuthText').val('대상자가 아닙니다');
                subTitle = $('#usNmId').text() + '님은 대상자가 아닙니다.';
                content = '현재 '+strMsg+' 상태입니다.<br/>확인 후 다시 시도해주세요.';
                type = 'error';
                $('#radio1-1').prop('checked', true);

            } else {

                if ('10' == disabledCode) {
                    $('#radio1-2').prop('checked', true);
                    $('#certTextId').val('장애인(중증, 1~3급)');
                } else if ('20' == disabledCode) {
                    $('#radio1-3').prop('checked', true);
                    $('#certTextId').val('장애인(경증, 4~6급)');
                }else{
                    $('#radio1-3').prop('checked', true);
                    $('#certTextId').val('장애인 대상자');
                }

                subTitle = $('#usNmId').text() + '님은 감면 대상자입니다.';
                content = '';
                type = '';

                //결제금액 재계산
                recalWithExemption();

            }

        } else {

            subTitle = $('#usNmId').text() + '님은 대상자가 아닙니다.';
            content = '확인 후 다시 시도해주세요.';
            type = 'error';
            $('#radio1-1').prop('checked', true);

        }

    } else {

        subTitle = '예약자 본인이 아니므로 <br>자격확인을 할 수 없습니다.';
        content = '현장 방문 시 증빙을 지참하시고 할인 받으시기 바랍니다.';
        type = 'error';
        $('#radio1-1').prop('checked', true);

    }

    alertPopup({
        title: '알림',
        subTitle: subTitle,
        content: content,
        type: type
    });
    self.close();

}

function naManMeritDc(dat){

    let cnt = dat.cnt;
    let dcTargetYn = dat.dcTargetYn;
    let relCd = dat.relCd;
    let authoriPsnYn = dat.authoriPsnYn;
    let wondClassCd = dat.wondClassCd;
    let subjKbnCd = dat.subjKbnCd;
    let inquRsltCd = dat.inquRsltCd;

    let subTitle = '';
    let content = '';
    let type = '';

    if ($('#usNmId').text() == '') {
        //조회결과가 있을때
        if (cnt > 0) {
            //감면대상일때
            if(dcTargetYn == 'Y') {
                if ('00011' == wondClassCd || '00012' == wondClassCd
                    || '00013' == wondClassCd || '00020' == wondClassCd
                    || '00030' == wondClassCd || '00G01' == wondClassCd
                    || '00G02' == wondClassCd || '00G03' == wondClassCd) { //1~3급

                    $('#radio1-4').prop('checked', true);
                    $('#certTextId').val('국가유공자(1~3급)');
                } else if ('00017' == subjKbnCd || '00018' == subjKbnCd || '00019' == subjKbnCd) { //518 민주화운동자.
                    $('#radio1-5').prop('checked', true);
                    $('#certTextId').val('5.18 민주운동자');
                } else { //그 외
                    $('#radio1-6').prop('checked', true);
                    $('#certTextId').val('국가유공자(4~7급), 등급 외(무공·보훈수훈자, 배우자, 유족 등)');
                }

                //할인금액 재계산
                recalWithExemption();

                subTitle = $('#usNmId').text() + '님은 감면 대상자입니다.';
                content = '';
                type = '';
            } else {
                //조회 결과 (S:성공 이 아닐때 )
                if(inquRsltCd != 'S') {
                    subTitle = $('#usNmId').text() + '님은 대상자가 아닙니다.';
                    content = '조회 결과가 없습니다.<br/>확인 후 다시 시도해주세요.';
                    type = 'error';
                    $('#radio1-1').prop('checked', true);
                } else {
                    //수권자인지 체크
                    if(authoriPsnYn != 'Y') {
                        subTitle = $('#usNmId').text() + '님은 대상자가 아닙니다.';
                        content = '확인 후 다시 시도해주세요.';
                        type = 'error';
                        $('#radio1-1').prop('checked', true);
                    } else {
                        //조회결과가 있고, 수권자인데 본인이 아닌경우
                        if(relCd != 'A') {
                            subTitle = '본인인 경우에만 선할인 가능합니다.';
                            content = '수권자 본인만 할인 가능합니다.<br/>가족 및 배우자이신 경우 증빙을 지참하시고 현장할인 받으시기 바랍니다.';
                            type = 'error';
                            $('#radio1-1').prop('checked', true);
                        } else {
                            //이경우는 없긴한데 일단 처리
                            subTitle = $('#usNmId').text() + '님은 대상자가 아닙니다.';
                            content = '확인 후 다시 시도해주세요.';
                            type = 'error';
                            $('#radio1-1').prop('checked', true);
                        }
                    }//수권자 END

                }//조회결과 END

            }//감면대상 END
        } else {
            //조회결과가 없을때
            subTitle = $('#usNmId').text() + '님은 대상자가 아닙니다.';
            content = '확인 후 다시 시도해주세요.';
            type = 'error';
            $('#radio1-1').prop('checked', true);
        }//조회결과 0개 END

    } else {

        subTitle = '예약자 본인이 아니므로 <br>자격확인을 할 수 없습니다.';
        content = '현장 방문 시 증빙을 지참하시고 할인 받으시기 바랍니다.';
        type = 'error';
        $('#radio1-1').prop('checked', true);

    }

    alertPopup({
        title: '알림',
        subTitle: subTitle,
        content: content,
        type: type
    });
    self.close();

}
//국가유공자 등급확인

//휴대폰 인증
function goAuth(){
	
	$.ajax({
		url:"/pay/checkPlusForPay.do",  
		type: "POST", 
		dataType: "json",
		async : false ,
		data: {},
		success: function(dat) {
			
			//인증요청 암호화 데이터가 없을 경우 오류발생
            if(dat.result.sEncData == ''){
                toastrMsg(dat.result.sRtnMsg);
            }else{
                $("#EncodeData").val(dat.result.sEncData);
                window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
                document.form_chk.target = "popupChk";
                document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
                document.form_chk.submit();
            }
		},
		error: function(e1,e2,e3) {
			
		}
	});
	
}


//아이핀 인증
function goAuthiPin(){
	
	
	$.ajax({
		url:"/pay/iPinForPay.do",  
		type: "POST", 
		dataType: "json",
		async : false ,
		data: {},
		success: function(dat) {
			
			//인증요청 암호화 데이터가 없을 경우 오류발생
            if(dat.result.sEncData == ''){
                toastrMsg(dat.result.sRtnMsg);
            }else{
           	      $("#enc_data").val(dat.result.sEncData);
                  window.open('', 'popupIPIN2', 'width=450, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
                  document.form_ipin.target = "popupIPIN2";
                  document.form_ipin.action = "https://cert.vno.co.kr/ipin.cb";
                  document.form_ipin.submit();
            }
		},
		error: function(e1,e2,e3) {
			
		}
	});
	
}

</script>



<div class="modal-popup small" id="exemption-auth">
	
		<input type="hidden" id="authTypeId" value=""/>
		
        <div class="popup-wrap" style="top: 40px; bottom: 40px;">
            <div class="popup-head">
                <strong class="popup-title">감면자격 인증</strong>
                <button type="button" class="btn-close" title="닫기">
                    <i class="icon-close"></i>
                </button>
            </div>
            <div class="popup-container">
                <strong class="title-2">개인정보 제공 동의</strong>
                <div class="box-content" style="height: 300px">
                    <p>본 포털은 본인확인 및 공공시설 이용요금 감면서비스 대상여부 확인, 감면자자격 정보 저장 만료일 안내를 목적으로 개인정보(이름, 주민번호, 휴대전화 번호)를 수집합니다.</p>
                    <p>개인정보 수집 이용에 동의를 거부할 권리가 있으며, 거부 시 공공시설 이용요금 가면서비스 대상 여부 확인이 제한 될 수 있습니다.</p>
                    <p>수집된된 정보는 공공시설 이용요금 감면서비스 대상 여부 확인 후 즉시 파기됩니다.</p>
                </div>
                <div class="radio-area">
                    <label for="radio2-1">위 내용에 동의하십니까?</label>
                    <span class="radio-1">
                        <input type="radio" id="radio1-1" name="policy" checked="" value="">
                        <label for="radio1-1">동의하지 않음</label>
                    </span>
                    <span class="radio-1">
                        <input type="radio" id="radio2-1" name="policy"  value="T">
                        <label for="radio2-1">동의함</label>
                    </span>
                </div>
                
                <div class="personal-identification mb-20 mt-20">
                    <div class="auth-box phone">
                        <strong>휴대폰 인증</strong>
                        <p>본인 명의 휴대폰으로 인증 후 감면혜택을 받을 수 있습니다.</p>
                        <button class="btn" onclick="goAuth();">휴대폰 인증</button>
                    </div>
                    <div class="auth-box ipin">
                        <strong>아이핀(I-PIN) 인증</strong>
                        <p>본인 명의 아이핀 으로 인증 후 감면혜택을 받을 수 있습니다.</p>
                        <button class="btn" onclick="goAuthiPin();">아이핀 인증</button>
                    </div>
                </div>
                
                <strong class="title-2">개인정보 입력</strong>
                <table class="table">
                    <caption>개인정보 입력</caption>
                    <colgroup>
                        <col style="width: 140px;">
                        <col>
                    </colgroup>
                    <tbody class="tbody">
                        <tr>
                            <th scope="row">이름</th>
                            <td id="usNmId"></td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="usNm" class="hidden-text">주민번호</label></th>
                            <td class="form flex">
                                <span id="usNumId"></span> -
                                <label for="usNm" class="hidden-text">주민번호 뒷자리</label>
                                <input type="password" class="input-text" id="usNm" placeholder="뒷자리를 입력 해주세요." title="주민번호 뒷자리">
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="btn-area">
                    <button class="btn btn-cancel selfAuthModalCancel">취소</button>
                    <button class="btn btn-confirm is-active selfAuthModal">자격확인</button>
                </div>
            </div>
        </div>
    </div>
    
			</div>
			

<%@ include file="../common/footer.jsp" %>


<div class="modal-popup small" id="confirmPop">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title" id="confirmTitle"></strong>
            <button type="button" class="btn-close" title="닫기" onclick="closePopup('confirmPop');">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container">
            <div class="center">
                <i class="icon-error"></i>
                <strong class="title-1" id="confirmSubTitle"></strong>
                <p class="copy-mid" id="confirmContent"></p>
                <p class="copy-sm" id="confirmSubContent"></p>
            </div>
            <div class="btn-area">
                <button class="btn btn-cancel forMypageClass" onclick="closePopup('confirmPop');">취소</button>
                <button class="btn btn-confirm is-active" id="btn-confirm">확인</button>
            </div>
        </div>
    </div>
</div>


<div class="modal-popup small" id="alertPop">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title" id="alertTitle">로그인</strong>
            <button type="button" class="btn-close" title="닫기" onclick="closePopup('alertPop');">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container">
            <div class="center">
                <i class="icon-error"></i>
                <strong class="title-1" id="alertSubTitle"></strong>
                <p class="copy-mid" id="alertContent"></p>
                <p class="copy-sm" id="alertSubContent"></p>
            </div>
            <div class="btn-area">
                <button class="btn btn-confirm is-active" onclick="closePopup('alertPop');">확인</button>
            </div>
        </div>
    </div>
</div>

<div class="modal-popup small" id="loginPopup">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title" id="loginTitle">로그인</strong>
            <button type="button" class="btn-close" title="닫기" onclick="closePopup('loginPopup');">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container" id="loginPopupDiv">
        </div>
    </div>
</div>
<!-- 아이핀 가상주민번호 서비스 팝업 호출 form -->
<form name="form_ipin" id="form_ipin" method="post">
    <!-- 요청모드 (필수 데이터) -->
    <input type="hidden" name="m" value="pubmain">
    <!-- 인증요청 암호화 데이터 -->
    <input type="hidden" name="enc_data" id="enc_data" value="">
</form>
<!-- 본인인증 서비스 팝업을 호출하기 위해서는 다음과 같은 form이 필요합니다. -->
<form name="form_chk" id="form_chk" method="post">
    <!-- 필수 데이타로, 누락하시면 안됩니다. -->
    <input type="hidden" name="m" value="checkplusService">
    <!-- 인증요청 암호화 데이터 -->
    <input type="hidden" name="EncodeData" id="EncodeData" value="">
</form>
	</div>
	<img id="loadingImage" src="/assets/img/preloader.gif" alt="로딩이미지" style="position: absolute; left: 924.5px; top: 539.5px; z-index: 100000; display: none;">
<script>
	$(function(){
		let responseMessage = "";
		if(responseMessage != ""){
			toastrMsg(responseMessage);
		}
		let retChk = "";
		if(retChk == "Y"){
			alert(responseMessage);
			history.back();
		}
	})
</script>
</body>
</html>
