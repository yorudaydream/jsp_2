<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  textarea {width:80%; height:100px;}
  tfoot td{text-align: center;}
  .btn{width:300px; height:50px; background: #000; color:#fff; text-align: center;}
  </style>
</head>
<body>
	<form action="./noticeWriteProcess.jsp">

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
					<td><textarea name="content" value=""></textarea></td>
				</tr>
				<tfoot>
					<tr>
						<td colspan="2"><button class="btn">확인</button></td>
					</tr>
				</tfoot>
			</table>
		</div>
	</form>
</body>
</html>