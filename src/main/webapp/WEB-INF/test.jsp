<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <meta http-equiv="Content-Type" content="text/html";charset="utf-8"/>
  <meta charset="UTF-8">
  <title>Title</title>

 </head>
 <body>

  <input class="btn" type="button" value="버튼1"/>
  <input class="btn" type="button" value="버튼2"/>
  <input class="btn" type="button" value="버튼3"/>  

  <script>

  var button = $(".btn");
	button.click(function(){
		$(this).val("눌렀어~");
	});
  
  </script>
</body>
</html>