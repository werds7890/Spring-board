<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
      
    <c:if test="${newregi eq 1}">
	    <script>
	    	alert("가입되었습니다");
	    </script>
	</c:if>
	
	
	
	
	<!-- 아이디 중복체크 -->
	<script>
		function idchk(){
			
			var idd=document.getElementById('reid').value;
			
			if(idd==""){
				alert("아이디를 입력해주세요");
				return 0;
			}else if(idd.length<5){
				alert("아이디는 5글자이상");
				return 0;
			}
			
			$.ajax({
				url:'${pageContext.request.contextPath}/bbs_idchk',
				type:"post",
				dataType:"json",
				data:{'id':$('#reid').val()},
				success:function(data){
					if(data==0){
						alert("사용 가능한 아이디입니다.");
					}else if(data==1){
						alert("이미 사용중인 아이디입니다.");
						reid.value="";
					}				
				}
			});
		}
	</script>
		
		<!-- 유효성검사 -->
		<script>
		function chk(){
			var frm=document.getElementById('regichk');
			var idd=document.getElementById('reid').value;
			var pw1=document.getElementById('pw1').value;
			var pw2=document.getElementById('pw2').value;
			if(idd==""){
				alert("아이디를 입력해주세요");
			}else if(pw1=="" || pw2==""){
				alert("비밀번호를 입력해주세요");
			}else if(pw1!=pw2){
				alert("비밀번호를 동일하게 입력해주세요");
			}else {
				frm.submit();
			}
		}
		</script>
	
	
</head>
	
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container-fluid">
			<a class="navbar-brand" href="home"><img src="resources/img/logo.png" style="width:65%"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarColor01"
				aria-controls="navbarColor01" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link active" href="#">게임소개
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">배경음악</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">다운로드</a></li>
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
						href="#" role="button" aria-haspopup="true" aria-expanded="false">커뮤니티</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="bbs_free">자유게시판</a> 
							<a class="dropdown-item" href="#">공략게시판</a> 
							<a class="dropdown-item" href="#">전용 카페</a>
						</div>
					</li>
				</ul>
				
					<c:choose>
						<c:when test="${sessionScope.userid == null }">
							<a href="login"><button type="button" class="btn btn-light" style=margin-right:20px data-bs-toggle="modal">로그인</button></a>
							<button type="button" class="btn btn-light" style=margin-right:20px data-bs-toggle="modal" data-bs-target="#register-modal">회원가입</button>		
						</c:when>
						
						<c:when test="${sessionScope.userid != null }">
							<h6><a href="logout" class="text-white bg-dark"style="margin-right:20px" style="">Logout</a></h6>
							<h6 class="text-white bg-dark">[username] ${sessionScope.userid} 님</h6>						
						</c:when>
					</c:choose>
					
			</div>
		</div>
	</nav>

<!-- register-modal -->
	
	<div class="modal fade" id="register-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="exampleModalLabel">Register</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
					<form action="member_regi" method="post" id="regichk">
						<div class="mb-3">
							<label for="formGroupExampleInput" class="form-label">ID</label>
							<input type="text" class="form-control"
								id="reid" placeholder="ID" name="id">
						</div>
						<button type="button" class="btn btn-primary" onclick="idchk()">중복확인</button>
						
						<div class="mb-3">
							<label for="formGroupExampleInput2" class="form-label">Password</label>
							<input type="password" class="form-control"
								id="pw1" placeholder="Password" name="pass">
						</div>
						
						<div class="mb-3">
							<label for="formGroupExampleInput2" class="form-label">Repeat-Password</label>
							<input type="password" class="form-control"
								id="pw2" placeholder="Repeat-Password">
						</div>   

						
						<div class="mb-3">
							<label for="formGroupExampleInput2" class="form-label">Name</label>
							<input type="text" class="form-control"
								id="formGroupExampleInput2" placeholder="Name" name="name">
						</div>
						
						<button type="button" onclick="chk()" class="btn btn-primary">회원가입</button>
					</form>
				</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>