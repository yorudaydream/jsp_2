<%@page import="com.ft.notice.NoticeDTO"%>
<%@page import="com.ft.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	int num = Integer.parseInt(request.getParameter("num"));
    	NoticeDAO nd = new NoticeDAO();
    	NoticeDTO ndt = nd.selectOne(num);
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>글번호</th>
			<td><input type="number" name="num" value=""></td>
			<th>작성자</th>
			<td><input type="text" name="name" value=""></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" value=""></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><input type="date" name="today" value=""></td>
			<th>조회수</th>
			<td><input type="number" name="hit" value=""></td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<input type="text" name="content" value="">
			</td>
		</tr>
	</table>
	<a href="./noticeList.jsp">LIST</a>
	<a href="./noticeUpdateForm.jsp?num=<%= ndt.getNum() %>">UPDATE</a>
	<a href="./noticeDelete.jsp?num=<%= ndt.getNum() %>">DELETE</a>
</body>
</html>