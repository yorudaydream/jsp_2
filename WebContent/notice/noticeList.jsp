<%@page import="java.sql.SQLException"%>
<%@page import="com.ft.notice.NoticeDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.ft.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   		NoticeDAO nd = new NoticeDAO();
    	int curPage =1; 
    	try{
    		curPage =Integer.parseInt(request.getParameter("curPage"));
    	} catch (Exception e){
    		
    	}
    	
    	int perPage =10;
    	int startRow=(curPage-1)*perPage+1;//curPage*10-9;
    	int lastRow=curPage*perPage;
    	List<NoticeDTO> ar = nd.selectList(startRow, lastRow);
    	
    	//페이징
    	//1.전체 글의 갯수
    	int totalCount = nd.getCount();
    	
    	//2.전체 페이지의 갯수
    	int totalPage = (totalCount/perPage);
    	if(totalCount%10!=0){
    		totalPage = (totalCount/perPage)+1;
    	}
    	
    	//3. 전체 블럭의 갯수
    	int perBlock =5;//블럭당 숫자의 갯수
    	int totalBlock = totalPage/perBlock;
    	if(totalPage%perBlock!=0){
    		//totalBlock = (totalPage/perBlock)+1;
    		totalBlock = totalBlock+1;
    	}
    	
    	//4. curPage의 번호로 curBlock 구하기
    	int curBlock = curPage/perBlock;
    	if(curPage%perBlock !=0){
    		curBlock = curPage/perBlock+1;
    	}
    	
    	//5. curBlock 번호로 startNum, lastNum
    	int startNum = (curPage-1)*perBlock+1;
    	int lastNum = curPage*perBlock;
    	
    	if(curBlock == totalBlock){
    		lastNum = totalPage;
    	}
  	%>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>Bootstrap Theme Company Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="../css/common.css">
  <style>  
  </style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#myPage">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="./notice/noticeList.jsp">NOTICE</a></li>
        <li><a href="#services">SERVICES</a></li>
        <li><a href="#portfolio">PORTFOLIO</a></li>
        <li><a href="#pricing">PRICING</a></li>
        <li><a href="#contact">CONTACT</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container-fluid">
	<div class="row">
			<form action="./noticeList.jsp">
				<table class="noticeList table table-hover">
					<thead>
						<tr>
							<td>번호</td>
							<td>제목</td>
							<td>작성자</td>
							<td>작성일</td>
							<td>조회수</td>
						</tr>
					</thead>
					<% for (NoticeDTO ndt : ar) {%>
					<tbody>
						<tr>
							<td><%= ndt.getNum() %></td>
							<td><a href="./noticeSelectOne?num=<%= ndt.getNum() %>"><%= ndt.getTitle() %></a></td>
							<td><%= ndt.getWriter() %></td>
							<td><%= ndt.getReg_date() %></td>
							<td><%= ndt.getHit() %></td>
						</tr>
					</tbody>
					<% } %>
				</table>
			</form>
		</div>
</div>
<div class="container-fluid">
<div class="row">
		<ul class="pagination">
			<%if(curBlock>1){ %>
			<li><a href="./noticeList.jsp?curPage=<%= 1 %>"><span class="glyphicon  glyphicon-backward"></span></a></li>
			<%} %>
			<%if(curBlock>1){ %>
			<li><a href="./noticeList.jsp?curPage=<%=startNum-1%>"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
			<%} %>
			<% for(int i=startNum; i<=lastNum; i++) {%>
				<li><a href="./noticeList.jsp?curPage=<%=i%>"><%=i%></a></li>
			<% } %>
			<% if(curBlock != totalBlock){ %>
			<li><a href="./noticeList.jsp?curPage=<%=lastNum+1%>"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
			<% } %>
			<% if(curBlock != totalBlock){ %>
			<li><a href="./noticeList.jsp?curPage=<%=totalPage%>"><span class="glyphicon glyphicon-forward"></span></a></li>
			<% } %>
			<!-- <li><a href="./noticeList.jsp?curPage=1">1</a></li> -->
		</ul>
		</div>
	</div>
<div class="container">
	<div class="col-md-1">
		<a href="./noticeWriteForm.jsp" class="btn btn-primary">Write</a>
	</div>
</div>


	<script>
$(document).ready(function(){
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {
    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {
      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
  
  $(window).scroll(function() {
    $(".slideanim").each(function(){
      var pos = $(this).offset().top;

      var winTop = $(window).scrollTop();
        if (pos < winTop + 600) {
          $(this).addClass("slide");
        }
    });
  });
})
</script>
</body>
</html>