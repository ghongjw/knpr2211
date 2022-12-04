<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<script src="../../assets/js/lib/jquery-1.12.4.min.js"></script>
	<script src="assets/js/lib/toastr.min.js"></script>
<link rel="stylesheet" href="assets/style/infomations.css">
</head>
<body>
<script type="text/javascript">
function send(data){
	var title = $(".attentionTitle").val()
	var content = $(".content").val()
	
	if(title == '' || content == ''){
		
		alert('제목 혹은 글을 입력 해 주세요');
		return
	}
	else{
		if(data == 'modify'){
		$("#f").attr('action','adminAttentionModifyProc?seq=${attention.seq}').attr('enctype',"multipart/form-data").submit();
		}if(data == 'list'){
		$("#f").attr('action','adminAttentionList?page=0&size=10').submit();
		}if(data == 'delete'){
		$("#f").attr('action','adminAttentionDeleteProc?seq=${attention.seq}').submit();
		}
	}
}
$("#file").on('change',function(){
	  var fileName = $("#file").val();
	  $(".upload-name").val(fileName);
	});
</script>

	<%@ include file="../common/headerAdmin.jsp"%>
	<div id="Attention_Wrap" style = "margin-top:80px;" class="sub">
		<div class="pageLocation">
			<span>홈</span> <span class="loca">알림마당</span> <span class="loca">공지사항</span>
		</div>
		<div class="mypage">
			<h3 class="title">공지 수정하기</h3>
		
			
					<div class="attentionArea">
						<form id="f" method="post">
						<table class="attentionTable">
							<tr>
								<td>분류
									<select name = "category2" class = "input1" style="width: 120px; margin:0;">
										<c:forEach var = "nameOfCat2" items = "${nameCategory2 }" varStatus = "status">
										<option value = "${category2s[status.index] }">${nameOfCat2 }</option>
										</c:forEach>
									</select>
								</td>
								<td>제목
									<input type="text" name="title" class="attentionTitle" value = "${attention.title }">
								</td>
							</tr>
							<tr>
								<td colspan=3>
								<textarea name="content" class="content" rows="10" cols="50">${attention.content }</textarea>
								</td>
							</tr>
							<tr>
							<td colspan=3>
								<div class="filebox" style="width:100%">
								    <input class="upload-name" value="첨부파일" placeholder="첨부파일">
								    <label for="file">파일찾기</label> 
								    <input type="file" id="file" name="fileName">
								</div>
								</td>
							</tr>
<!-- 							<tr> -->
<!-- 								<td colspan = 3> -->
<!-- 									<input type="radio" id = "show" value = true name = "notice" checked> -->
<!-- 									<label for="show">게시하기</label> -->
<!-- 									<input type="radio" id = "hide" value = false name = "notice"> -->
<!-- 									<label for="hide">숨기기</label> -->
<!-- 								</td> -->
<!-- 							</tr> -->
							<tr>
								<td colspan = 3 style="text-align: center"><button type="button" class = "modiA" onclick = "send('modify'); return false;">등록</button>
								<input type =reset class="modiB" onclick= "send('delete'); return false;" value = "삭제">
								<button type="button" id = "toList" class = "modiA" onclick = "send('list'); return false;">리스트로가기</button></td>
							</tr>
						</table>
						</form>
						<form id="f2" ></form>
			</div>
		</div>
	</div>


<%@ include file="../common/footer.jsp"%>
</body>
</html>