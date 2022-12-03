<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="assets/style/infomations.css">
<script src="../../assets/js/lib/jquery-1.12.4.min.js"></script>
	<script src="assets/js/lib/toastr.min.js"></script>

</head>

<body>
<script type="text/javascript">

function deleted(){
	var msg = confirm('삭제하시겠습니까');
	if(msg = true){
	location.href='adminAttentionDelete?seq=${attention.seq }'
	}
}


</script>

	<%@ include file="../common/headerAdmin.jsp"%>

	<div id="container" style="padding: 20px 31px 100px;"> 
<div class="page-location"><span>홈</span> <span>알림마당</span> <span>공지사항</span></div>
		<div class="notification">
			<h3 class="title">공지사항</h3>
			<div class="board-area view">
            	<div class="view-head">
                <strong class="view-title">${attention.title}</strong>
                <span class="date">${attention.createDate}</span>
                <span class="inquiry">조회수 <span>${attention.hit}</span></span>
            	</div>
            	<div class="view-body">
            		<p>${attention.content}</p>
            	</div>
            	<div class="file-area">
                	<ul class="file-list">
                    	<c:if test="${notice.file != '파일 없음' }">
							<a href="attentionDownload?fileName=${attention.file }">${attention.file }</a>
						</c:if>
                	</ul>
            	</div>
            	<div class="board-bottom">
                	<div class="center">
                	<button type="button" style="width: 300px; margin-right: 10px;" class = "modiA" onclick = "location.href='adminAttentionModify?seq=${attention.seq }'">수정</button>
					<button type="button" style="width: 300px; margin-right: 10px;" id = "toList" class = "modiB" onclick = "deleted()">삭제</button>
                		
                		
                	</div>
            	</div>
        	</div>
				<!-- // view -->
		</div>
	</div>
	
<%@ include file="../common/footer.jsp" %>
</body>
</html>