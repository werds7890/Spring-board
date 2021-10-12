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
    
</head>

<body>
	
	<nav class="navbar navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand">자유게시판</a>
    <form class="d-flex">

    				<c:choose>
						<c:when test="${sessionScope.userid == null }">
							<a href="login"><button type="button" class="btn btn-outline-success">글 작성하기</button></a>
						</c:when>
						
						<c:when test="${sessionScope.userid != null }">
							<a href="bbs_write"><button type="button" class="btn btn-outline-success">글 작성하기</button></a>				
						</c:when>
					</c:choose>
       
    </form>
  </div>
</nav>

<table class="table table-primary table-striped">
  <thead>
    <tr>
      <th scope="col">날짜</th>
      <th scope="col">글제목</th>
      <th scope="col">아이디</th>
      <th scope="col">조회수</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${bbslist }" var="list">
    <tr>
      <td>${list.day }</td>
      <td><a href="bbs_view?vno=${list.no }" style="text-decoration:none">${list.title }</a></td>
      <td>${list.id }</td>
      <td>${list.cnt }</td>
    </tr>
    </c:forEach>
  </tbody>
</table>

<div style="margin-left:500px">
  <ul class="pagination">
    <li class="page-item">
    	<c:if test="${pageVO.prev }">
      		<a href="bbs_free?page=${pageVO.startPage-1}" class="page-link">&laquo;</a>
      	</c:if>
    </li>
    
    <li class="page-item active">
    	<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="idx">
			<a href="bbs_free?page=${idx}" style="padding-left:30px" class="page-item active">${idx}</a>
		</c:forEach>
    </li>
    
    <li class="page-item">
      <c:if test="${pageVO.next }">
      	<a class="page-link" href="bbs_free?page=${pageVO.endPage+1}" style="margin-left:30px">&raquo;</a>
      </c:if>
    </li>
  </ul>
</div>

	
</body>
</html>