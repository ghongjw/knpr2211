<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>


<form method="post">
	<table>
		<tr>
			<td><input type="text" name="f1" value="뭐"></td>
			<td><input type="submit"></td>
		</tr>
	</table>
</form>
<%
	String data = request.getParameter("f1");
%>
<h1>출력: <%= data %></h1>

</body>
</html>