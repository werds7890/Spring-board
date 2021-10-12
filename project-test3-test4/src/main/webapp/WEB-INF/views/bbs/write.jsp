<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp" %> 
<!doctype html>
<html lang="utf-8">
<head>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<title>테일즈위버</title>
<!-- Optional JavaScript; choose one of the two! -->

<!-- Option 1: Bootstrap Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<!-- Option 2: Separate Popper and Bootstrap JS -->
<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
    
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>TalesWeaver</title>
</head>
	
<body>

					



	<section>
	<form action="real_write" method="post">
		<div class="container">
			<div class="row">
				<div class="col-md-12" style="padding-top:100px">
					<h2>자유게시판</h2>
					<hr style="border:solid 2px black;">
				</div>
				
				<div class="form-group" style="padding-top:25px">
				   <h4>제목</h4>
				   <input type="text" class="form-control" name="title" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="제목을 입력해주세요">
  				</div>
  				
  				<div class="form-group" style="padding-top:40px">
    				<h4>내용</h4>
    				<textarea class="form-control" id="exampleFormControlTextarea1" name="memo" rows="15"></textarea>
 				 </div>
 				 
 				 <div class="col-md-3" style="padding-top:20px">
 					<button type="submit" class="btn btn-primary">등록</button>
 				 </div>
 				 <input type="hidden" name="id" value="${sessionScope.userid}"></input>
			</div>
		</div>
	</form>
	</section>
					
	
</body>
</html>