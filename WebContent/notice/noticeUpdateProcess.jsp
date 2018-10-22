<%@page import="com.ft.notice.NoticeDAO"%>
<%@page import="com.ft.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	NoticeDTO ndt = new NoticeDTO();
	ndt.setNum(Integer.parseInt(request.getParameter("num")));
	ndt.setWriter(request.getParameter("name"));
	ndt.setTitle(request.getParameter("title"));
	ndt.setContent(request.getParameter("content"));
	
	NoticeDAO nd = new NoticeDAO();
	
	int result = nd.update(ndt);
	String str ="Update Fail";
	
	if(result>0){
		str="Update Success";
	}


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		alert('<%= str %>');
		location.href = "./list.jsp";
	</script>
</head>
<body>

</body>
</html>