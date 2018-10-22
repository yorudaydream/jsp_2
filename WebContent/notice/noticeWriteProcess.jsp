<%@page import="com.ft.notice.NoticeDTO"%>
<%@page import="com.ft.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	NoticeDAO nd = new NoticeDAO();
    	NoticeDTO ndt = new NoticeDTO();
    	
    	ndt.setTitle(request.getParameter("title"));
    	ndt.setWriter((request.getParameter("writer"));
    	ndt.setContent(request.getParameter("content"));
    	
    	int result = nd.insert(ndt);
    	
    	String s = "Write Fail";
    	
    	if(result>0){
    		s ="Write Success";
    	}
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

alert(s);
location.href="./noticeList.jsp";

</script>

</head>
<body>
</body>
</html>