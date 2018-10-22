<%@page import="com.ft.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    int num = Integer.parseInt(request.getParameter("num"));
    NoticeDAO nd = new NoticeDAO();
    int result = nd.delete(num);
    String s = "Delete Fail";
    if(result>0){
    	s = "Delete Success";
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	if(result>0){
		alert ('Delete Success')
		location.href="./list.jsp";
		history.go(-1);//실패하면 이전페이지로1
	}else {
		alert('Delete Fail');
		history.back();//실패하면 이전페이지로2
	}
</script>

</head>
<body>

</body>
</html>