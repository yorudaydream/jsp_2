<%@page import="com.ft.notice.NoticeDTO"%>
<%@page import="com.ft.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	NoticeDAO nd = new NoticeDAO();
    	NoticeDTO ndt = new NoticeDTO();
    	
    	ndt.setTitle(request.getParameter("title"));
    	ndt.setName(request.getParameter("name"));
    	ndt.setContent(request.getParameter("content"));
    	
    	int result = 
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>