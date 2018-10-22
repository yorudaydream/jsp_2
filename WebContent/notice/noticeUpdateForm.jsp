<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="./noticeUpdateProcess.jsp">
	<div class="container">
		<table class="table">
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value=""></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer" value=""></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<input type="text" name="content" value="">
				</td>
			</tr>
		</table>
		</div>
	</form>
</body>
</html>