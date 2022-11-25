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
let gotoInfo = function(parkDetail){
	
	var parkId = parkDetail.substr(0, 3);
			
	var url = "detailInfo?parkId="+parkId+"&parkDetail="+parkDetail
	location.href=url
}
	 
</script>
	<%@ include file="../common/header.jsp"%>
	<div class="detailInfo">
		<div class="pageLocation">
			<span>홈</span> <span class="loca">마이페이지</span> <span class="loca">즐겨찾기</span>
		</div>
		
			<div class="detailInformation">
				<h3 class="title">즐겨찾기</h3>
			</div>
		
			<div class="tab-content">
				<div class="tab-pane is-active" id="tab1">
					<!-- list -->
					<div class="board-area list">
						<table class="table mem-list" style="width: 70%;">
							<colgroup>
								<col style="width: 30%;">
								<col style="width: 70%; text-align:left;">
								
							</colgroup>
							<thead class="thead">
								<tr>
									<th scope="col">구분</th>
									<th scope="col">장소</th>
								</tr>
							</thead>
							<tbody class="tbody">
								
								<c:forEach var = "favorite" items = "${favorites}" varStatus="status" >
									<tr>
									<td ">${types[status.index]}</td>
									<td style="text-align:left; padding-left: 55px;">
									<a href="#" onclick="gotoInfo('${parkDetails[status.index]}')">
									${favorite }
									</a>
									</td>
									</tr>
								</c:forEach>
							</tbody>
							
				</table>
			</div>
		</div>
	</div>
</div>

	<%@ include file="../common/footer.jsp"%>
</body>
</html>