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
  <link rel="stylesheet" href="../css/common.css">
  <style>
  textarea {width:80%; height:100px;}
  tfoot td{text-align: center;}
  .btn{width:300px; height:50px; background: #000; color:#fff; text-align: center;}
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
			<form action="./noticeWriteProcess.jsp" method="post">
			<div class="form-group">
					<table class="table">
						<tr>
							<th>제목</th>
							<td><input type="text" class="form-control" name="title" value="" placeholder="enter title"></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><input type="text" class="form-control" name="writer" value="" placeholder="enter writer"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea  class="form-control" name="content" value="" placeholder="enter content"></textarea></td>
						</tr>
						<tfoot>
							<tr>
								<td colspan="2"><button class="btn">확인</button></td>
							</tr>
						</tfoot>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>